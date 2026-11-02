// Saves preparation before Ghidra's native analysis transaction and validates reuse.
// @category REA
import ghidra.app.util.headless.HeadlessScript;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.security.MessageDigest;
import java.util.HexFormat;
import ghidra.program.model.symbol.SourceType;

public final class ReaDurableQueryPrepare extends HeadlessScript {
    @Override public void run() throws Exception {
        // Ghidra can continue after a failing pre-script. Admit native analysis
        // only at the very end of a successfully saved checkpoint phase.
        enableHeadlessAnalysis(false);
        try { prepare(); }
        catch(Exception failure){
            setHeadlessContinuationOption(HeadlessContinuationOption.ABORT);
            end(false);start();throw failure;
        }
    }
    private void prepare() throws Exception {
        String[] args=getScriptArgs();
        if(args.length!=2)throw new IllegalArgumentException("Expected durable manifest and phase");
        JsonObject m=JsonParser.parseString(Files.readString(Path.of(args[0]))).getAsJsonObject();
        var o=currentProgram.getOptions("REA Durable Queries");
        String target=m.get("target_sha256").getAsString(),profile=m.get("profile_digest").getAsString(),run=m.get("run_id").getAsString();
        storeHeadlessValue("REA durable prepared "+run,Boolean.FALSE);
        if(!target.equalsIgnoreCase(currentProgram.getExecutableSHA256()))throw new IllegalStateException("Saved Program target hash differs");
        if(!o.getString("target_sha256",target).equals(target))throw new IllegalStateException("Saved Program target differs");
        String workspace=m.get("workspace_id").getAsString(),storedWorkspace=o.getString("workspace_id","");
        if(!storedWorkspace.isEmpty()&&!storedWorkspace.equals(workspace))throw new IllegalStateException("Saved Program workspace differs");
        // Legacy adoption is an explicit commitment, not a blanket acceptance of
        // an arbitrary Program with the same executable. The initial profile is
        // captured before its directory is atomically moved into the pool.
        if(storedWorkspace.isEmpty()){
            String saved=o.getString("profile_digest","");
            String legacy=m.has("legacy_profile_digest")&&!m.get("legacy_profile_digest").isJsonNull()?m.get("legacy_profile_digest").getAsString():"";
            if(!saved.isEmpty()&&!saved.equals(profile)&&!saved.equals(legacy))throw new IllegalStateException("Saved Program legacy profile differs");
        }
        if(args[1].equals("init")){
            boolean ready=o.getBoolean("analyzed_ready",false);
            if(m.get("claimed_ready").getAsBoolean()&&!ready)throw new IllegalStateException("External ready marker is not authoritative");
            validateSeeds(m);
            boolean changed=!ready||m.get("preparation_changed").getAsBoolean();
            o.setString("target_sha256",target);o.setString("profile_digest",profile);
            o.setString("workspace_id",workspace);
            o.setString("preparation_sha256",m.get("preparation_sha256").getAsString());
            o.setBoolean("static_queries_only",m.get("static_queries_only").getAsBoolean());
            o.setString("initialized_run",run);
            o.setBoolean("startup_changed",changed);
            if(changed)o.setBoolean("analyzed_ready",false);
            saveProgram(currentProgram);
        }else if(args[1].equals("checkpoint")){
            if(!run.equals(o.getString("initialized_run","")))throw new IllegalStateException("Durable preparation did not complete");
            o.setString("prepared_run",run);
            saveProgram(currentProgram);
            Path root=Path.of(System.getenv("REA_DURABLE_QUERY_SESSION")).toRealPath(),bootstrap=root.resolve("bootstrap.json");
            if(!Files.exists(bootstrap)){
                JsonObject b=new JsonObject();b.addProperty("format","rea-durable-queries-v1");b.addProperty("target_sha256",target);b.addProperty("profile_digest",profile);b.addProperty("program_name",currentProgram.getName());b.addProperty("phase","imported-and-prepared");
                Path pending=root.resolve("bootstrap."+java.util.UUID.randomUUID()+".pending");Files.writeString(pending,b.toString(),StandardOpenOption.CREATE_NEW,StandardOpenOption.WRITE);Files.move(pending,bootstrap,StandardCopyOption.ATOMIC_MOVE,StandardCopyOption.REPLACE_EXISTING);
            }
            enableHeadlessAnalysis(!o.getBoolean("analyzed_ready",false));
            storeHeadlessValue("REA durable prepared "+run,Boolean.TRUE);
        }else throw new IllegalArgumentException("Unknown durable phase");
    }
    private void conflict(String message) {
        throw new IllegalStateException("Shared Program seed conflict: "+message+". Preserve this Program; use an explicit REA_PROGRAM_VARIANT for the incompatible boundary experiment.");
    }
    private void validateSeeds(JsonObject manifest) throws Exception {
        if(!manifest.has("seed_snapshot_path")||manifest.get("seed_snapshot_path").isJsonNull())return;
        Path path=Path.of(manifest.get("seed_snapshot_path").getAsString());
        byte[] raw=Files.readAllBytes(path);
        String expected=manifest.getAsJsonObject("seeds").get("sha256").getAsString();
        if(!HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(raw)).equals(expected))throw new IllegalStateException("Shared seed snapshot differs");
        var space=currentProgram.getAddressFactory().getDefaultAddressSpace();
        for(String line:new String(raw,java.nio.charset.StandardCharsets.UTF_8).split("\\n")){
            monitor.checkCancelled();if(line.isEmpty())continue;String[] fields=line.split("\\t",-1);
            if(fields.length<2||fields.length>3)throw new IllegalArgumentException("Invalid shared seed record");
            var address=space.getAddress(Long.parseUnsignedLong(fields[0].substring(2),16));
            if(!fields[1].equals("label")){
                var instruction=currentProgram.getListing().getInstructionContaining(address);
                if(instruction!=null&&!instruction.getAddress().equals(address))conflict(address+" lies inside an established instruction");
                if(currentProgram.getListing().getDefinedDataContaining(address)!=null)conflict(address+" overlaps established data");
            }
            if(fields[1].equals("function")){
                var owner=currentProgram.getFunctionManager().getFunctionContaining(address);
                if(owner!=null&&!owner.getEntryPoint().equals(address))conflict(address+" lies inside function "+owner.getEntryPoint());
            }
            if(fields.length==3){
                var primary=currentProgram.getSymbolTable().getPrimarySymbol(address);
                if(primary!=null&&primary.getSource()==SourceType.USER_DEFINED&&!primary.getName().equals(fields[2]))conflict(address+" has an established caller-defined name");
            }
        }
    }
}
