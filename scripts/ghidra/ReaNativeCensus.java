// Whole-image static census used only by scripts/census-native-image.py.
// @category REA
import ghidra.app.script.GhidraScript;
import ghidra.app.cmd.disassemble.DisassembleCommand;
import ghidra.app.cmd.function.CreateFunctionCmd;
import ghidra.app.cmd.function.CreateThunkFunctionCmd;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.framework.Application;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.GZIPOutputStream;
import java.util.zip.GZIPInputStream;
import com.google.gson.*;

/** Streams actual Ghidra records without per-function MCP frame overhead. */
public class ReaNativeCensus extends GhidraScript {
    private record JumpEdge(Address from, Address to) {}
    private Path output;
    private final Gson gson = new GsonBuilder().setPrettyPrinting().create();
    private JsonObject progress = new JsonObject();
    private long checkpointsThisRun = 0;
    private long checkpointLimit = 0;
    private static final String REUSE_FORMAT = "rea-census-monotone-impact-v1";
    private JsonObject predecessor;
    private final AddressSet changedCode = new AddressSet();
    private final Set<Address> affectedEntries = new TreeSet<>();
    private final Set<Address> predecessorEntries = new TreeSet<>();
    private final Set<Address> predecessorDecode = new TreeSet<>();
    private final Set<JumpEdge> predecessorEdges = new LinkedHashSet<>();
    private final Set<Address> predecessorHelpers = new TreeSet<>();
    private boolean incremental = false;
    private long lastCheckpoint = System.nanoTime(), phaseStarted = System.nanoTime();
    private long checkpointIntervalNanos = 30000000000L, maximumUnsavedBatches = 16, unsavedBatches = 0;
    private String timedPhase = "preparation";
    private Path metricsPath;
    private boolean replayedCompleted = false;
    private void recoverObservationalMetrics() throws Exception {
        // Post-save latency is observational. Matching external metrics may be
        // recovered, but no external stage, cursor, queue or reuse decision is.
        Path receiptPath=output.resolve("metrics.json");
        if(Files.isRegularFile(receiptPath))try {
            JsonObject observation=JsonParser.parseString(Files.readString(receiptPath)).getAsJsonObject();
            if(observation.has("metrics")&&observation.has("plan_sha256")&&observation.has("generation")&&observation.get("plan_sha256").equals(progress.get("plan_sha256"))&&observation.get("generation").equals(progress.get("generation")))progress.add("metrics",observation.get("metrics"));
        }catch(RuntimeException invalidObservation){println("REA native census: ignoring invalid observational metrics; saved Program cursor retained");}
    }
    private long nanos() { return System.nanoTime(); }
    private void addMetric(String name, double value) {
        JsonObject metrics=progress.has("metrics")?progress.getAsJsonObject("metrics"):new JsonObject();
        metrics.addProperty(name,(metrics.has(name)?metrics.get(name).getAsDouble():0)+value);progress.add("metrics",metrics);
    }
    private void phase(String name) {
        if(name.equals(timedPhase))return;
        addMetric("phase_"+timedPhase+"_seconds",(nanos()-phaseStarted)/1e9);timedPhase=name;phaseStarted=nanos();
    }
    private void atomicJson(Path path, JsonObject value) throws Exception {
        Path pending=path.resolveSibling(path.getFileName()+".pending");
        Files.writeString(pending,gson.toJson(value)+"\n");
        Files.move(pending,path,StandardCopyOption.REPLACE_EXISTING,StandardCopyOption.ATOMIC_MOVE);
    }
    private void publishMetrics() throws Exception {
        if(metricsPath==null)return;
        JsonObject value=new JsonObject();value.addProperty("format","rea-native-census-metrics-v1");value.addProperty("completed_receipt_reused",replayedCompleted);
        for(String key:List.of("plan_sha256","target_sha256","stage","generation","reuse_mode","reuse_fallback_reason",
            "predecessor_plan_sha256","decode_entries_requested","decode_entries_reused","body_entries_requested",
            "body_entries_reused","body_entries_affected","body_entries_new","body_repairs_executed","seeded_functions_repaired"))
            if(progress.has(key))value.add(key,progress.get(key));
        if(progress.has("metrics"))value.add("metrics",progress.getAsJsonObject("metrics"));
        Path canonical=output.resolve("metrics.json");atomicJson(canonical,value);
        if(!canonical.equals(metricsPath.toAbsolutePath().normalize()))atomicJson(metricsPath,value);
    }
    private JsonArray addresses(Collection<Address> values) {
        JsonArray result=new JsonArray();for(Address value:values)result.add(address(value));return result;
    }
    private void loadAddresses(JsonObject source,String key,Set<Address> destination,AddressSpace space) {
        for(JsonElement element:source.getAsJsonArray(key))destination.add(space.getAddress(Long.parseUnsignedLong(element.getAsString(),16)));
    }
    private JsonArray changedRanges() {
        JsonArray result=new JsonArray();for(AddressRange range:changedCode.getAddressRanges()) {
            JsonArray row=new JsonArray();row.add(address(range.getMinAddress()));row.add(address(range.getMaxAddress()));result.add(row);
        }return result;
    }
    private void saveImpact() {
        if(!incremental)return;
        progress.add("changed_ranges",changedRanges());progress.add("affected_entries",addresses(affectedEntries));
    }
    private void rememberOwner(Address site) {
        if(!incremental)return;Function owner=getFunctionContaining(site);
        if(owner!=null)affectedEntries.add(owner.getEntryPoint());
    }
    private void changed(DisassembleCommand command) {
        if(incremental&&command.getDisassembledAddressSet()!=null)changedCode.add(command.getDisassembledAddressSet());
    }
    private void fallback(String reason) {
        incremental=false;progress.addProperty("reuse_mode","full");progress.addProperty("reuse_fallback_reason",reason);
        progress.addProperty("decode_entries_reused",0);progress.addProperty("body_entries_reused",0);
        progress.addProperty("body_entries_affected",0);progress.addProperty("body_entries_new",count("body_entries_requested"));
    }
    private void prepareReuse(JsonObject plan,List<Address> starts,Set<Address> decode,Set<JumpEdge> edges,AddressSpace space) throws Exception {
        progress.addProperty("decode_entries_requested",decode.size());progress.addProperty("body_entries_requested",starts.size());
        boolean resuming=progress.has("reuse_mode");
        if(resuming&&!progress.get("reuse_mode").getAsString().equals("incremental"))return;
        if(!resuming)fallback("no-completed-compatible-predecessor");
        if(!resuming&&(predecessor==null||!predecessor.has("reuse_state")))return;
        JsonObject commitment=resuming?progress.getAsJsonObject("predecessor_reuse_state"):predecessor.getAsJsonObject("reuse_state");
        Path path=Path.of(commitment.get("path").getAsString()).toRealPath();
        Path runtime=Path.of(System.getenv("REA_CENSUS_RUNTIME_ROOT")).toRealPath();
        if(!path.startsWith(runtime)||Files.size(path)!=commitment.get("bytes").getAsLong()||!digest(path).equals(commitment.get("sha256").getAsString()))throw new IllegalArgumentException("Predecessor reuse state differs");
        JsonObject state;
        try(Reader input=new InputStreamReader(new GZIPInputStream(Files.newInputStream(path)),StandardCharsets.UTF_8)){state=JsonParser.parseReader(input).getAsJsonObject();}
        if(!state.get("format").getAsString().equals(REUSE_FORMAT)||!state.get("target_sha256").equals(plan.get("target_sha256"))||
           !state.get("script_sha256").equals(plan.get("script_sha256"))||!state.get("ghidra_version").getAsString().equals(Application.getApplicationVersion())||
           !state.get("plan_sha256").equals(progress.get("predecessor_plan_sha256"))){
            if(resuming)throw new IllegalArgumentException("Saved predecessor state identity differs");
            fallback("predecessor-algorithm-target-or-provider-differs");return;
        }
        loadAddresses(state,"entries",predecessorEntries,space);loadAddresses(state,"decode",predecessorDecode,space);loadAddresses(state,"helpers",predecessorHelpers,space);
        for(JsonElement element:state.getAsJsonArray("edges")){JsonArray row=element.getAsJsonArray();predecessorEdges.add(new JumpEdge(space.getAddress(Long.parseUnsignedLong(row.get(0).getAsString(),16)),space.getAddress(Long.parseUnsignedLong(row.get(1).getAsString(),16))));}
        if(resuming) {
            incremental=true;
            for(JsonElement item:progress.getAsJsonArray("changed_ranges")) {
                JsonArray row=item.getAsJsonArray();changedCode.add(space.getAddress(Long.parseUnsignedLong(row.get(0).getAsString(),16)),space.getAddress(Long.parseUnsignedLong(row.get(1).getAsString(),16)));
            }
            loadAddresses(progress,"affected_entries",affectedEntries,space);return;
        }
        if(plan.has("incremental_reuse")&&!plan.get("incremental_reuse").getAsBoolean()){fallback("explicit-full-recompute");return;}
        for(String key:List.of("seeds_without_instructions","seeds_without_functions","direct_call_helpers_without_instructions","direct_call_helpers_without_owner","additional_code_seeds_without_instructions"))
            if(!predecessor.has(key)||predecessor.get(key).getAsLong()!=0){fallback("predecessor-has-unresolved-seeds");return;}
        if(!new HashSet<>(starts).containsAll(predecessorEntries)||!decode.containsAll(predecessorDecode)||!edges.containsAll(predecessorEdges)){
            fallback("non-monotone-inputs-require-full-recompute");return;
        }
        // Compatible saved work is usable only while its successful seed records
        // still exist in the authoritative Program, not merely in external JSON.
        for(Address entry:predecessorEntries)if(getFunctionAt(entry)==null||currentProgram.getListing().getInstructionAt(entry)==null){fallback("predecessor-program-record-missing");return;}
        incremental=true;progress.addProperty("reuse_mode","incremental");progress.remove("reuse_fallback_reason");
        for(Address entry:starts)if(!predecessorEntries.contains(entry)){rememberOwner(entry);changedCode.add(entry);affectedEntries.add(entry);}
        for(JumpEdge edge:edges)if(!predecessorEdges.contains(edge)){rememberOwner(edge.from());rememberOwner(edge.to());changedCode.add(edge.from());changedCode.add(edge.to());}
        progress.add("predecessor_reuse_state",commitment);progress.addProperty("decode_entries_reused",predecessorDecode.size());saveImpact();
    }
    private AddressSetView rememberOverlaps(Address entry) throws Exception {
        if(!incremental)return null;
        AddressSetView prospective=CreateFunctionCmd.getFunctionBody(currentProgram,entry,false,monitor);
        Iterator<Function> overlaps=currentProgram.getFunctionManager().getFunctionsOverlapping(prospective);
        while(overlaps.hasNext())affectedEntries.add(overlaps.next().getEntryPoint());
        return prospective;
    }
    private void calculateAffected(List<Address> starts,Listing listing) throws Exception {
        if(!incremental||done("affected_set_finished"))return;phase("affected-set");
        // Follow every current non-call predecessor, including implicit fallthrough.
        // Body repair follows these flows. Calls do not transfer body membership;
        // analyzer/no-return settings are fixed by the shared Program identity.
        AddressSet visited=new AddressSet();ArrayDeque<Address> queue=new ArrayDeque<>();
        InstructionIterator changed=listing.getInstructions(changedCode,true);
        while(changed.hasNext())queue.add(changed.next().getAddress());
        for(AddressRange range:changedCode.getAddressRanges()){Instruction instruction=listing.getInstructionContaining(range.getMinAddress());if(instruction!=null)queue.add(instruction.getAddress());}
        long examined=0;Set<Address> expanded=new HashSet<>();
        while(true) {
            while(!queue.isEmpty()) {
                monitor.checkCancelled();Address site=queue.removeFirst();if(visited.contains(site))continue;visited.add(site);examined++;
                Instruction instruction=listing.getInstructionAt(site);if(instruction==null)continue;rememberOwner(site);
                Function boundary=getFunctionAt(site);
                if(boundary!=null&&!changedCode.contains(site))continue;
                for(Reference reference:currentProgram.getReferenceManager().getReferencesTo(site))
                    if(reference.getReferenceType().isFlow()&&!reference.getReferenceType().isCall())queue.add(reference.getFromAddress());
                Instruction previous=listing.getInstructionBefore(site);
                if(previous!=null&&site.equals(previous.getFallThrough()))queue.add(previous.getAddress());
                if(examined%10000==0)working("affected-set",examined,0);
            }
            // Carving an overlapping body can also free ranges reachable from
            // another old entry. Revisit predecessors through both old and
            // prospective bodies, not only through newly decoded instructions.
            List<Address> pending=new ArrayList<>();for(Address entry:affectedEntries)if(!expanded.contains(entry))pending.add(entry);
            if(pending.isEmpty())break;
            for(Address entry:pending) {
                monitor.checkCancelled();expanded.add(entry);
                AddressSetView prospective=rememberOverlaps(entry);
                InstructionIterator possible=listing.getInstructions(prospective,true);
                while(possible.hasNext())queue.add(possible.next().getAddress());
                Function existing=getFunctionAt(entry);
                if(existing!=null) {
                    InstructionIterator previous=listing.getInstructions(existing.getBody(),true);
                    while(previous.hasNext())queue.add(previous.next().getAddress());
                }
                Address thunk=CreateThunkFunctionCmd.getThunkedAddr(currentProgram,entry);
                if(thunk!=null&&(thunk.equals(Address.NO_ADDRESS)||(thunk.isMemoryAddress()&&getFunctionAt(thunk)==null))) {
                    fallback("unresolved-thunk-boundary-dependency");progress.remove("affected_entries");progress.remove("changed_ranges");return;
                }
            }
            working("affected-overlaps",expanded.size(),affectedEntries.size());
        }
        long oldAffected=0,newEntries=0;
        for(Address entry:starts)if(predecessorEntries.contains(entry)){if(affectedEntries.contains(entry))oldAffected++;}else newEntries++;
        progress.addProperty("affected_flow_instructions_examined",examined);progress.addProperty("body_entries_affected",oldAffected);
        progress.addProperty("body_entries_new",newEntries);progress.addProperty("body_entries_reused",predecessorEntries.size()-oldAffected);
        progress.addProperty("affected_set_finished",true);saveImpact();checkpoint("affected-set-finished",affectedEntries.size(),starts.size());
    }
    private void publishReuseState(JsonObject plan,List<Address> starts,Set<Address> decode,Set<JumpEdge> edges,Set<Address> helpers) throws Exception {
        JsonObject state=new JsonObject();state.addProperty("format",REUSE_FORMAT);
        for(String key:List.of("plan_sha256","target_sha256","script_sha256","ghidra_version"))state.add(key,progress.get(key));
        state.add("entries",addresses(starts));state.add("decode",addresses(decode));state.add("helpers",addresses(helpers));
        JsonArray savedEdges=new JsonArray();for(JumpEdge edge:edges){JsonArray row=new JsonArray();row.add(address(edge.from()));row.add(address(edge.to()));savedEdges.add(row);}state.add("edges",savedEdges);
        Path pending=output.resolve("reuse-state.json.gz.pending"),path=output.resolve("reuse-state.json.gz");
        try(Writer writer=new OutputStreamWriter(new GZIPOutputStream(Files.newOutputStream(pending)),StandardCharsets.UTF_8)){gson.toJson(state,writer);}
        Files.move(pending,path,StandardCopyOption.REPLACE_EXISTING,StandardCopyOption.ATOMIC_MOVE);
        JsonObject commitment=new JsonObject();commitment.addProperty("path",path.toString());commitment.addProperty("sha256",digest(path));commitment.addProperty("bytes",Files.size(path));progress.add("reuse_state",commitment);
    }
    private static final String OPTIONS = "REA Native Census";
    private static class SavedBatchStop extends Exception {}
    private long count(String key) { return progress.has(key) ? progress.get(key).getAsLong() : 0; }
    private boolean done(String key) { return progress.has(key) && progress.get(key).getAsBoolean(); }
    private JsonObject proofProgress() {
        JsonObject proof=progress.deepCopy();proof.remove("metrics");return proof;
    }
    private void publishProgress() throws Exception {
        // Timings never enter hash-bound native evidence. The authoritative
        // Program may retain them, while the public receipt contains proof only.
        atomicJson(output.resolve("progress.json"),proofProgress());
    }
    private void publishCompletedProgress() throws Exception {
        Path path=output.resolve("progress.json");JsonObject proof=proofProgress();
        if(Files.isRegularFile(path)) {
            JsonObject existing=JsonParser.parseString(Files.readString(path)).getAsJsonObject();
            if(existing.has("stage")&&existing.get("stage").getAsString().equals("completed")) {
                if(!existing.equals(proof))throw new IllegalArgumentException("Published completed census receipt differs");
                return; // Preserve exact bytes and mtime, including formatting.
            }
        }
        // Recover publication interrupted after the Program's durable commit.
        atomicJson(path,proof);
    }
    private boolean exported(String name) throws Exception {
        if (!progress.has("files") || !progress.getAsJsonObject("files").has(name)) return false;
        JsonObject file = progress.getAsJsonObject("files").getAsJsonObject(name);
        Path path = output.resolve(name);
        if (!Files.isRegularFile(path) || Files.size(path) != file.get("bytes").getAsLong()
                || !digest(path).equals(file.get("sha256").getAsString()))
            throw new IllegalArgumentException("Saved export differs: " + name);
        return true;
    }
    private void finishExport(String name) throws Exception {
        Path pending = output.resolve(name + ".pending"), path = output.resolve(name);
        Files.move(pending, path, StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
        if (!progress.has("files")) progress.add("files", new JsonObject());
        JsonObject file = new JsonObject();
        file.addProperty("sha256", digest(path)); file.addProperty("bytes", Files.size(path));
        progress.getAsJsonObject("files").add(name, file);
    }
    private void checkpoint(String stage, long complete, long total) throws Exception {
        progress.addProperty("stage", stage);
        progress.addProperty("completed", complete);
        progress.addProperty("total", total);
        progress.addProperty("generation", count("generation") + 1);
        // Analysis mutations and their cursor share the same Program transaction.
        // saveProgram commits, saves the writable database, and starts a new tx.
        saveImpact();
        currentProgram.getOptions(OPTIONS).setString("checkpoint", gson.toJson(progress));
        long saveStarted=nanos();
        saveProgram(currentProgram);
        addMetric("program_save_seconds",(nanos()-saveStarted)/1e9);addMetric("program_saves",1);
        unsavedBatches=0;lastCheckpoint=nanos();publishProgress();publishMetrics();
        println("REA native census: " + stage + " " + complete + "/" + total);
    }
    private void working(String stage, long first, long end) throws Exception {
        JsonObject work = new JsonObject();
        work.addProperty("stage", stage); work.addProperty("first", first); work.addProperty("end", end);
        work.addProperty("target_sha256", currentProgram.getExecutableSHA256());
        Path pending = output.resolve("working.json.pending");
        Files.writeString(pending, gson.toJson(work) + "\n");
        Files.move(pending, output.resolve("working.json"), StandardCopyOption.REPLACE_EXISTING,
                   StandardCopyOption.ATOMIC_MOVE);
    }
    private void batchCheckpoint(String stage, long complete, long total) throws Exception {
        unsavedBatches++;
        if(checkpointLimit==0&&unsavedBatches<maximumUnsavedBatches&&nanos()-lastCheckpoint<checkpointIntervalNanos)return;
        checkpoint(stage, complete, total);
        checkpointsThisRun++;
        if (checkpointLimit > 0 && checkpointsThisRun >= checkpointLimit) throw new SavedBatchStop();
    }
    private BufferedWriter writer(String name) throws Exception {
        return new BufferedWriter(new OutputStreamWriter(new GZIPOutputStream(
            Files.newOutputStream(output.resolve(name + ".pending"), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING), 1048576), StandardCharsets.UTF_8), 1048576);
    }
    private static String address(Address a) { return a == null ? "" : a.toString(); }
    private static String clean(String a) { return a.replace('\t',' ').replace('\n',' ').replace('\r',' '); }
    private static String digest(Path path) throws Exception {
        MessageDigest hash = MessageDigest.getInstance("SHA-256");
        try (InputStream stream = Files.newInputStream(path)) {
            byte[] buffer = new byte[1048576]; int count;
            while ((count=stream.read(buffer))!=-1) hash.update(buffer,0,count);
        }
        return HexFormat.of().formatHex(hash.digest());
    }
    @Override public void run() throws Exception {
        try { collect(); }
        catch (SavedBatchStop stop) {
            end(false); start();
            println("REA census paused after a durable batch; resume the saved Program");
        }
        catch (Exception failure) {
            // Ghidra commits the script transaction on exit, even on exceptions.
            // Roll back the unfinished batch before that final empty commit.
            end(false); start();
            throw failure;
        }
    }
    private void collect() throws Exception {
        String configPath = System.getenv("REA_NATIVE_CENSUS_PLAN");
        if (configPath == null) throw new IllegalArgumentException("Missing census plan");
        JsonObject plan = JsonParser.parseString(Files.readString(Path.of(configPath))).getAsJsonObject();
        if(!digest(Path.of(getSourceFile().getAbsolutePath())).equals(plan.get("script_sha256").getAsString()))
            throw new IllegalArgumentException("Collector source changed after launch");
        output=Path.of(plan.get("output").getAsString()).toRealPath();
        String metrics=System.getenv("REA_STAGE_METRICS_PATH");
        metricsPath=metrics==null||metrics.isBlank()?output.resolve("metrics.json"):Path.of(metrics);
        if (!currentProgram.getExecutableSHA256().equalsIgnoreCase(plan.get("target_sha256").getAsString()))
            throw new IllegalArgumentException("Census target differs");
        var checkpointOptions=currentProgram.getOptions(OPTIONS);
        String stored = checkpointOptions.getString("checkpoint", "");
        String planHash = digest(Path.of(configPath));
        String workspace=System.getenv("REA_CENSUS_WORKSPACE_ID");
        String adoptedPlan=System.getenv("REA_CENSUS_ADOPTED_PLAN_HASH");
        if(workspace!=null&&!workspace.isBlank()){
            String savedWorkspace=checkpointOptions.getString("workspace_id","");
            if(!savedWorkspace.isEmpty()&&!savedWorkspace.equals(workspace))throw new IllegalArgumentException("Shared census Program workspace differs");
            String frozen=checkpointOptions.getString("checkpoint:"+planHash,"");
            if(!frozen.isEmpty()){
                JsonObject receipt=JsonParser.parseString(frozen).getAsJsonObject();
                if(!receipt.get("plan_sha256").getAsString().equals(planHash)||!receipt.get("stage").getAsString().equals("completed"))throw new IllegalArgumentException("Frozen census checkpoint differs");
                progress=receipt;recoverObservationalMetrics();publishCompletedProgress();
                for(String name:List.of("instructions.tsv.gz","bodies.tsv.gz","references.tsv.gz","externals.tsv.gz","direct-call-helpers.tsv.gz"))if(!exported(name))throw new IllegalArgumentException("Frozen shared census export differs: "+name);
                if(progress.has("reuse_state")&&!exported("reuse-state.json.gz"))throw new IllegalArgumentException("Frozen census reuse state differs");
                replayedCompleted=true;publishMetrics();
                println("REA census resumed generation "+count("generation")+" at completed frozen receipt");
                return;
            }
            if(!stored.isEmpty()){
                JsonObject savedPredecessor=JsonParser.parseString(stored).getAsJsonObject();
                String predecessorPlan=savedPredecessor.get("plan_sha256").getAsString();
                if(!predecessorPlan.equals(planHash)){
                    // One evolving decoded Program, with immutable receipts for
                    // completed passes. Do not interleave a new queue over an
                    // unfinished cursor or pretend its seeds were processed.
                    if(!savedPredecessor.has("stage")||!savedPredecessor.get("stage").getAsString().equals("completed"))throw new IllegalArgumentException("Shared census has unfinished work; resume its exact saved plan before requesting another seed/edge queue");
                    if(savedWorkspace.isEmpty()&&!predecessorPlan.equals(adoptedPlan))throw new IllegalArgumentException("Legacy census checkpoint adoption differs");
                    checkpointOptions.setString("checkpoint:"+predecessorPlan,stored);
                    predecessor=savedPredecessor;
                    progress=new JsonObject();
                    progress.addProperty("predecessor_plan_sha256",predecessorPlan);
                    progress.addProperty("predecessor_generation",savedPredecessor.has("generation")?savedPredecessor.get("generation").getAsLong():0);
                    stored="";
                    println("REA native census: extending saved decoded Program with a new verified queue");
                }
            }
            checkpointOptions.setString("workspace_id",workspace);
        }
        if (!stored.isEmpty()) {
            progress = JsonParser.parseString(stored).getAsJsonObject();
            recoverObservationalMetrics();
            if (!progress.get("plan_sha256").getAsString().equals(planHash))
                throw new IllegalArgumentException("Saved Program plan differs");
            if(progress.has("stage")&&progress.get("stage").getAsString().equals("completed"))publishCompletedProgress();
            else publishProgress(); // saved Program supplies the recovery cursor.
            println("REA census resumed generation " + count("generation") + " at " + progress.get("stage"));
        }
        progress.addProperty("plan_sha256", planHash);
        progress.addProperty("persistence_format", "ghidra-program-checkpoint-v1");
        String limit = System.getenv("REA_CENSUS_CHECKPOINT_LIMIT");
        checkpointLimit = limit == null ? 0 : Long.parseLong(limit);
        progress.addProperty("target_sha256", currentProgram.getExecutableSHA256());
        progress.addProperty("ghidra_version", Application.getApplicationVersion());
        progress.addProperty("auto_analysis_enabled", false);
        progress.addProperty("script_sha256", plan.get("script_sha256").getAsString());
        Path startsPath = Path.of(plan.get("starts").getAsString());
        if (!digest(startsPath).equals(plan.get("starts_sha256").getAsString()))
            throw new IllegalArgumentException("Census starts differ");
        if (progress.has("stage") && progress.get("stage").getAsString().equals("completed")) {
            for (String name:List.of("instructions.tsv.gz","bodies.tsv.gz","references.tsv.gz","externals.tsv.gz","direct-call-helpers.tsv.gz"))
                if (!exported(name)) throw new IllegalArgumentException("Completed Program lacks export: " + name);
            if(progress.has("reuse_state")&&!exported("reuse-state.json.gz"))throw new IllegalArgumentException("Completed census reuse state differs");
            replayedCompleted=true;publishMetrics();
            println("REA census already completed; saved Program and export commitments verified");
            return;
        }
        if(plan.has("checkpoint_interval_ms"))checkpointIntervalNanos=plan.get("checkpoint_interval_ms").getAsLong()*1000000L;
        if(plan.has("checkpoint_max_batches"))maximumUnsavedBatches=plan.get("checkpoint_max_batches").getAsLong();
        AddressSpace space=currentProgram.getAddressFactory().getDefaultAddressSpace();
        List<Address> starts=new ArrayList<>();
        for(String line:Files.readAllLines(startsPath)) {
            if(!line.isBlank()) starts.add(space.getAddress(Long.parseUnsignedLong(line.trim(),16)));
        }
        AddressSet executable=new AddressSet();
        for(MemoryBlock block:currentProgram.getMemory().getBlocks())
            if(block.isExecute() && block.isInitialized()) executable.add(block.getStart(),block.getEnd());
        Set<Address> functionStarts=new HashSet<>(starts);
        Set<Address> decodeSet=new TreeSet<>(starts);
        Set<JumpEdge> edges=new LinkedHashSet<>();
        long guardedTables=0;
        if(plan.has("jump_tables") && !plan.get("jump_tables").isJsonNull()) {
            JsonObject specification=plan.getAsJsonObject("jump_tables");
            Path tablesPath=Path.of(specification.get("path").getAsString());
            if(!digest(tablesPath).equals(specification.get("sha256").getAsString()))
                throw new IllegalArgumentException("Guarded table inventory differs");
            JsonObject tables=JsonParser.parseString(Files.readString(tablesPath)).getAsJsonObject();
            if(!tables.getAsJsonObject("target").get("sha256").getAsString().equalsIgnoreCase(currentProgram.getExecutableSHA256()))
                throw new IllegalArgumentException("Guarded table target differs");
            for(JsonElement element:tables.getAsJsonArray("tables")) {
                JsonObject table=element.getAsJsonObject();guardedTables++;
                Address site=space.getAddress(Long.parseUnsignedLong(table.get("site").getAsString().substring(2),16));
                Address dataAddress=space.getAddress(Long.parseUnsignedLong(table.get("table_address").getAsString().substring(2),16));
                byte[] raw=new byte[table.get("byte_count").getAsInt()];
                if(currentProgram.getMemory().getBytes(dataAddress,raw)!=raw.length ||
                    !HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(raw)).equals(table.get("sha256").getAsString()))
                    throw new IllegalArgumentException("Guarded jump table source bytes differ");
                for(JsonElement target:table.getAsJsonArray("case_targets")) {
                    Address destination=space.getAddress(Long.parseUnsignedLong(target.getAsString().substring(2),16));
                    if(!executable.contains(destination))throw new IllegalArgumentException("Non-executable guarded table target");
                    edges.add(new JumpEdge(site,destination));decodeSet.add(destination);
                }
            }
        }
        long diagnosticCodeSeeds=0;
        if(plan.has("diagnostic_leads") && !plan.get("diagnostic_leads").isJsonNull()) {
            JsonObject input=plan.getAsJsonObject("diagnostic_leads");Path path=Path.of(input.get("path").getAsString());
            if(!digest(path).equals(input.get("sha256").getAsString()))throw new IllegalArgumentException("Diagnostic lead inventory differs");
            JsonObject leads=JsonParser.parseString(Files.readString(path)).getAsJsonObject();
            if(!leads.getAsJsonObject("target").get("sha256").getAsString().equalsIgnoreCase(currentProgram.getExecutableSHA256()))throw new IllegalArgumentException("Diagnostic lead target differs");
            for(JsonElement element:leads.getAsJsonArray("code_only_seeds")) {
                JsonObject lead=element.getAsJsonObject();Address site=space.getAddress(Long.parseUnsignedLong(lead.get("site").getAsString().substring(2),16));
                byte[] expected=HexFormat.of().parseHex(lead.get("instruction_bytes").getAsString());byte[] raw=new byte[expected.length];
                if(!executable.contains(site) || currentProgram.getMemory().getBytes(site,raw)!=raw.length || !Arrays.equals(expected,raw))throw new IllegalArgumentException("Diagnostic code bytes differ");
                if(decodeSet.add(site))diagnosticCodeSeeds++;
            }
        }
        progress.addProperty("additional_diagnostic_code_starts",diagnosticCodeSeeds);
        long addressCodeSeeds=0;
        if(plan.has("address_leads") && !plan.get("address_leads").isJsonNull()) {
            JsonObject input=plan.getAsJsonObject("address_leads");Path path=Path.of(input.get("path").getAsString());
            if(!digest(path).equals(input.get("sha256").getAsString()))throw new IllegalArgumentException("Address-code inventory differs");
            JsonObject leads=JsonParser.parseString(Files.readString(path)).getAsJsonObject();
            if(!leads.getAsJsonObject("target").get("sha256").getAsString().equalsIgnoreCase(currentProgram.getExecutableSHA256()))throw new IllegalArgumentException("Address-code target differs");
            for(JsonElement element:leads.getAsJsonArray("code_only_seeds")) {
                JsonObject lead=element.getAsJsonObject();Address site=space.getAddress(Long.parseUnsignedLong(lead.get("site").getAsString().substring(2),16));
                byte[] expected=HexFormat.of().parseHex(lead.get("instruction_bytes").getAsString());byte[] raw=new byte[expected.length];
                if(!executable.contains(site) || currentProgram.getMemory().getBytes(site,raw)!=raw.length || !Arrays.equals(expected,raw))throw new IllegalArgumentException("Address-code bytes differ");
                if(decodeSet.add(site))addressCodeSeeds++;
            }
        }
        progress.addProperty("additional_address_code_starts",addressCodeSeeds);
        // Strong function entries decode first. Additional potential switch/code
        // starts must not preempt independently established entry boundaries.
        List<Address> decodeStarts=new ArrayList<>(starts);
        for(Address candidate:decodeSet)if(!functionStarts.contains(candidate))decodeStarts.add(candidate);
        progress.addProperty("guarded_tables",guardedTables);
        progress.addProperty("guarded_table_edges",edges.size());
        progress.addProperty("additional_code_seed_targets",decodeSet.size()-functionStarts.size());
        Listing listing=currentProgram.getListing();
        prepareReuse(plan,starts,decodeSet,edges,space);
        int batchSize=plan.get("batch_size").getAsInt();
        if (!done("disassembly_finished")) {
        phase("disassembly");
        checkpoint("disassembly",count("decode_cursor"),decodeStarts.size());
        for(int first=(int)count("decode_cursor");first<decodeStarts.size();first+=batchSize) {
            monitor.checkCancelled();
            AddressSet seeds=new AddressSet();
            for(Address start:decodeStarts.subList(first,Math.min(first+batchSize, decodeStarts.size())))
                if((!incremental||!predecessorDecode.contains(start))&&listing.getInstructionAt(start)==null) seeds.add(start);
            working("disassembly", first, Math.min(first+batchSize,decodeStarts.size()));
            if(!seeds.isEmpty()) {
                DisassembleCommand command=new DisassembleCommand(seeds,executable,true);
                command.enableCodeAnalysis(false);
                long decodeStarted=nanos();command.applyTo(currentProgram,monitor);changed(command);addMetric("decode_command_seconds",(nanos()-decodeStarted)/1e9);addMetric("decode_commands",1);
            }
            progress.addProperty("decode_cursor", Math.min(first+batchSize,decodeStarts.size()));
            batchCheckpoint("disassembly",count("decode_cursor"),decodeStarts.size());
        }
        progress.addProperty("disassembly_finished", true);
        checkpoint("disassembly-finished",decodeStarts.size(),decodeStarts.size());
        }
        long missingCodeSeeds=0;
        for(Address address:decodeSet) {
            if(!functionStarts.contains(address) && listing.getInstructionAt(address)==null) missingCodeSeeds++;
        }
        progress.addProperty("additional_code_seeds_without_instructions",missingCodeSeeds);
        phase("guarded-edges");
        long appliedEdges=0;
        for(JumpEdge edge:edges) {
            monitor.checkCancelled();
            Instruction branch=listing.getInstructionAt(edge.from());
            if(branch==null || !branch.getMnemonicString().equalsIgnoreCase("JMP") || !branch.getFlowType().isComputed())
                throw new IllegalArgumentException("Guarded dispatch instruction differs");
            currentProgram.getReferenceManager().addMemoryReference(edge.from(),edge.to(),RefType.COMPUTED_JUMP,SourceType.ANALYSIS,-1);
            appliedEdges++;
        }
        progress.addProperty("guarded_flow_edges_applied",appliedEdges);
        // Direct CALL targets are independent machine-code leads. Unwind and
        // relocation seeds can omit assembly leaf helpers, including secondary
        // entry labels. Decode these to a fixed point and retain actual owners.
        phase("direct-call-helpers");
        Set<Address> helperTargets=new TreeSet<>(predecessorHelpers);
        if(!progress.has("predecessor_helper_targets"))progress.add("predecessor_helper_targets",addresses(predecessorHelpers));
        else loadAddresses(progress,"predecessor_helper_targets",helperTargets,space);
        if (progress.has("helper_targets")) for (JsonElement value:progress.getAsJsonArray("helper_targets"))
            helperTargets.add(space.getAddress(Long.parseUnsignedLong(value.getAsString(),16)));
        long helperFunctions=count("direct_call_helper_functions_created");
        while(!done("helpers_finished")) {
            Set<Address> pending=new TreeSet<>();
            ReferenceIterator iterator=currentProgram.getReferenceManager().getReferenceIterator(space.getMinAddress());
            while(iterator.hasNext()) {
                monitor.checkCancelled();Reference ref=iterator.next();
                if(!ref.getReferenceType().isCall() || !executable.contains(ref.getToAddress()))continue;
                Instruction source=listing.getInstructionAt(ref.getFromAddress());
                if(source==null || !source.getFlowType().isCall() || source.getFlowType().isComputed())continue;
                Address destination=ref.getToAddress();
                if((listing.getInstructionAt(destination)==null || getFunctionContaining(destination)==null) && !helperTargets.contains(destination))pending.add(destination);
            }
            if(pending.isEmpty())break;
            checkpoint("direct-call-helpers",helperTargets.size(),helperTargets.size()+pending.size());
            List<Address> pendingList = new ArrayList<>(pending);
            for (int first=0; first<pendingList.size(); first+=batchSize) {
                List<Address> batch = pendingList.subList(first, Math.min(first+batchSize,pendingList.size()));
                working("direct-call-helpers", first, first+batch.size());
                AddressSet seeds=new AddressSet();
                for(Address target:batch)if(listing.getInstructionAt(target)==null)seeds.add(target);
                if(!seeds.isEmpty()) {
                    DisassembleCommand command=new DisassembleCommand(seeds,executable,true);
                    command.enableCodeAnalysis(false);long decodeStarted=nanos();command.applyTo(currentProgram,monitor);changed(command);addMetric("decode_command_seconds",(nanos()-decodeStarted)/1e9);addMetric("decode_commands",1);
                }
                for(Address target:batch) {
                    monitor.checkCancelled();
                    if(listing.getInstructionAt(target)==null || getFunctionContaining(target)!=null)continue;
                    rememberOwner(target);rememberOverlaps(target);if(incremental)changedCode.add(target);
                    if(incremental) {
                        Address thunk=CreateThunkFunctionCmd.getThunkedAddr(currentProgram,target);
                        if(thunk!=null&&(thunk.equals(Address.NO_ADDRESS)||(thunk.isMemoryAddress()&&getFunctionAt(thunk)==null)))fallback("unresolved-helper-thunk-boundary-dependency");
                    }
                    long createStarted=nanos();Function helper=createFunction(target,null);addMetric("function_creation_seconds",(nanos()-createStarted)/1e9);
                    if(helper!=null){CreateFunctionCmd.fixupFunctionBody(currentProgram,helper,monitor);helperFunctions++;}
                }
                helperTargets.addAll(batch);
                JsonArray savedHelpers = new JsonArray();
                for (Address helper:helperTargets) savedHelpers.add(address(helper));
                progress.add("helper_targets", savedHelpers);
                progress.addProperty("direct_call_helper_functions_created", helperFunctions);
                batchCheckpoint("direct-call-helpers", helperTargets.size(), helperTargets.size()+pendingList.size()-first-batch.size());
            }
        }
        progress.addProperty("helpers_finished",true);
        long missingHelperInstructions=0,missingHelperOwners=0;
        if (!exported("direct-call-helpers.tsv.gz")) {
        try(BufferedWriter out=writer("direct-call-helpers.tsv.gz")) {
            out.write("address\tinstruction_present\tnative_owner\n");
            for(Address target:helperTargets) {
                boolean present=listing.getInstructionAt(target)!=null;Function function=getFunctionContaining(target);
                if(!present)missingHelperInstructions++;if(function==null)missingHelperOwners++;
                out.write(address(target)+"\t"+present+"\t"+(function==null?"":address(function.getEntryPoint()))+"\n");
            }
        }
        progress.addProperty("direct_call_helper_targets",helperTargets.size());
        progress.addProperty("direct_call_helper_functions_created",helperFunctions);
        progress.addProperty("direct_call_helpers_without_instructions",missingHelperInstructions);
        progress.addProperty("direct_call_helpers_without_owner",missingHelperOwners);
        finishExport("direct-call-helpers.tsv.gz");
        checkpoint("helpers-finished", helperTargets.size(), helperTargets.size());
        }
        calculateAffected(starts,listing);
        phase("body-repair");
        long missingInstructions=count("seeds_without_instructions"), missingFunctions=count("seeds_without_functions"), repaired=count("seeded_functions_repaired");
        if (!done("body_repair_finished")) {
        checkpoint("body-repair",count("body_cursor"),starts.size());
        for(int i=starts.size()-1-(int)count("body_cursor");i>=0;i--) {
            monitor.checkCancelled(); Address start=starts.get(i);
            if((starts.size()-1-i)%batchSize==0)working("body-repair",starts.size()-1-i,Math.min(starts.size()-1-i+batchSize,starts.size()));
            if(listing.getInstructionAt(start)==null) missingInstructions++;
            else {
                Function function=getFunctionAt(start);
                if(function==null) {long createStarted=nanos();function=createFunction(start,null);addMetric("function_creation_seconds",(nanos()-createStarted)/1e9);}
                if(function==null) missingFunctions++;
                else {
                    if(!incremental||affectedEntries.contains(start)) {
                        long repairStarted=nanos();CreateFunctionCmd.fixupFunctionBody(currentProgram,function,monitor);
                        addMetric("body_repair_seconds",(nanos()-repairStarted)/1e9);addMetric("body_repairs_executed",1);
                        progress.addProperty("body_repairs_executed",count("body_repairs_executed")+1);
                    }
                    repaired++; // complete current input accounting, including verified reuse
                }
            }
            progress.addProperty("body_cursor",starts.size()-i);
            progress.addProperty("seeds_without_instructions",missingInstructions);
            progress.addProperty("seeds_without_functions",missingFunctions);
            progress.addProperty("seeded_functions_repaired",repaired);
            if((starts.size()-i)%batchSize==0)batchCheckpoint("body-repair",starts.size()-i,starts.size());
        }
        progress.addProperty("body_repair_finished",true);
        checkpoint("body-repair-finished",starts.size(),starts.size());
        }
        phase("instruction-export");
        long instructionCount=0,instructionBytes=0,computedCalls=0,computedJumps=0;
        if (!exported("instructions.tsv.gz")) {
        checkpoint("instruction-export",0,listing.getNumInstructions());
        try(BufferedWriter out=writer("instructions.tsv.gz")) {
            out.write("address\tlength\tbytes\tflow\n");
            InstructionIterator instructions=listing.getInstructions(true);
            while(instructions.hasNext()) {
                monitor.checkCancelled(); Instruction instruction=instructions.next();
                out.write(address(instruction.getAddress())+"\t"+instruction.getLength()+"\t"+
                    HexFormat.of().formatHex(instruction.getBytes())+"\t"+instruction.getFlowType()+"\n");
                instructionCount++; instructionBytes+=instruction.getLength();
                if(instruction.getFlowType().isComputed()) {
                    if(instruction.getFlowType().isCall()) computedCalls++;
                    if(instruction.getFlowType().isJump()) computedJumps++;
                }
                if(instructionCount%250000==0)working("instruction-export",instructionCount,listing.getNumInstructions());
            }
        }
        progress.addProperty("instructions",instructionCount); progress.addProperty("instruction_bytes",instructionBytes);
        progress.addProperty("computed_calls",computedCalls); progress.addProperty("computed_jumps",computedJumps);
        finishExport("instructions.tsv.gz");
        checkpoint("instruction-export-finished",instructionCount,instructionCount);
        }
        phase("body-export");
        long functions=0,bodyRanges=0,externalFunctions=0;
        if (!exported("bodies.tsv.gz")) {
        try(BufferedWriter out=writer("bodies.tsv.gz")) {
            out.write("entry\tname\tstart\tend\texternal\n");
            FunctionIterator iterator=currentProgram.getFunctionManager().getFunctions(true);
            while(iterator.hasNext()) {
                monitor.checkCancelled(); Function function=iterator.next(); functions++;
                if(function.isExternal())externalFunctions++;
                for(AddressRange range:function.getBody().getAddressRanges()) {
                    out.write(address(function.getEntryPoint())+"\t"+clean(function.getName(true))+"\t"+
                        address(range.getMinAddress())+"\t"+address(range.getMaxAddress())+"\t"+function.isExternal()+"\n"); bodyRanges++;
                }
                if(functions%10000==0) working("body-export",functions,currentProgram.getFunctionManager().getFunctionCount());
            }
        }
        progress.addProperty("native_functions",functions); progress.addProperty("body_ranges",bodyRanges);
        finishExport("bodies.tsv.gz");
        checkpoint("body-export-finished",functions,functions);
        }
        phase("reference-export");
        long references=0;
        if (!exported("references.tsv.gz")) {
        try(BufferedWriter out=writer("references.tsv.gz")) {
            out.write("from\tto\ttype\toperand\tprimary\tsource\n");
            ReferenceIterator iterator=currentProgram.getReferenceManager().getReferenceIterator(space.getMinAddress());
            while(iterator.hasNext()) {
                monitor.checkCancelled(); Reference ref=iterator.next();
                out.write(address(ref.getFromAddress())+"\t"+address(ref.getToAddress())+"\t"+
                    ref.getReferenceType()+"\t"+ref.getOperandIndex()+"\t"+ref.isPrimary()+"\t"+ref.getSource()+"\n"); references++;
                if(references%250000==0)working("reference-export",references,0);
            }
        }
        progress.addProperty("references",references);
        finishExport("references.tsv.gz");
        checkpoint("reference-export-finished",references,references);
        }
        phase("external-export");
        long externals=0;
        if (!exported("externals.tsv.gz")) {
        try(BufferedWriter out=writer("externals.tsv.gz")) {
            out.write("address\tname\tlibrary\n");
            for(String library:currentProgram.getExternalManager().getExternalLibraryNames()) {
            ExternalLocationIterator iterator=currentProgram.getExternalManager().getExternalLocations(library);
            while(iterator.hasNext()) {
                ExternalLocation location=iterator.next();externals++;
                out.write(address(location.getExternalSpaceAddress())+"\t"+clean(location.getLabel())+"\t"+clean(location.getLibraryName())+"\n");
            }}
        }
        progress.addProperty("external_locations",externals);
        finishExport("externals.tsv.gz");
        checkpoint("external-export-finished",externals,externals);
        }
        JsonObject files=new JsonObject();
        for(String name:List.of("instructions.tsv.gz","bodies.tsv.gz","references.tsv.gz","externals.tsv.gz","direct-call-helpers.tsv.gz")) {
            JsonObject file=new JsonObject(); file.addProperty("sha256",digest(output.resolve(name)));
            file.addProperty("bytes",Files.size(output.resolve(name)));files.add(name,file);
        }
        progress.add("files",files);
        publishReuseState(plan,starts,decodeSet,edges,helperTargets);
        progress.getAsJsonObject("files").add("reuse-state.json.gz",progress.getAsJsonObject("reuse_state"));
        phase("completed");
        checkpoint("completed",starts.size(),starts.size());
    }
}
