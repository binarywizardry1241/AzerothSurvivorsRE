    // BEGIN PROJECT DURABLE QUERY SUPPORT
    private Path durableRoot;
    private SessionDescriptor durableDescriptor;
    private long durableRevision;
    private static final Set<String> DURABLE_MUTATIONS=Set.of("annotate_native_function","set_address_name","set_addresses_names");

    private static String durableHash(String value) throws Exception {
        return bytesHex(MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8)));
    }
    private static JsonElement durableCanonical(JsonElement value) {
        if(value.isJsonArray()) {JsonArray a=new JsonArray();for(JsonElement e:value.getAsJsonArray())a.add(durableCanonical(e));return a;}
        if(value.isJsonObject()) {JsonObject o=new JsonObject();Map<String,JsonElement> sorted=new TreeMap<>();for(var e:value.getAsJsonObject().entrySet())sorted.put(e.getKey(),e.getValue());for(var e:sorted.entrySet())o.add(e.getKey(),durableCanonical(e.getValue()));return o;}
        return value.deepCopy();
    }
    private Path durablePath(Path path) throws Exception {
        path=path.toAbsolutePath().normalize();
        if(path.equals(durableRoot)||!path.startsWith(durableRoot))throw new IOException("Durable sidecar escapes its root");
        Path ancestor=path.getParent();
        while(!Files.exists(ancestor,LinkOption.NOFOLLOW_LINKS))ancestor=ancestor.getParent();
        if(!ancestor.toRealPath().startsWith(durableRoot)||Files.isSymbolicLink(path))throw new IOException("Durable sidecar symlink escapes or redirects its path");
        if(Files.exists(path,LinkOption.NOFOLLOW_LINKS)&&!Files.isRegularFile(path,LinkOption.NOFOLLOW_LINKS))throw new IOException("Durable sidecar is not a regular file");
        return path;
    }
    private JsonObject durableRead(Path path) throws Exception {
        path=durablePath(path);if(!Files.exists(path,LinkOption.NOFOLLOW_LINKS))return null;
        try(var channel=Files.newByteChannel(path,Set.of(StandardOpenOption.READ,LinkOption.NOFOLLOW_LINKS));var input=Channels.newInputStream(channel)){
            return JsonParser.parseString(new String(input.readAllBytes(),StandardCharsets.UTF_8)).getAsJsonObject();
        }
    }
    private void durableWrite(Path path,JsonObject value) throws Exception {
        path=durablePath(path);
        Files.createDirectories(path.getParent());
        path=durablePath(path);
        Path pending=path.resolveSibling(path.getFileName()+"."+java.util.UUID.randomUUID()+".pending");
        Files.writeString(pending,GSON.toJson(value),StandardOpenOption.CREATE_NEW,StandardOpenOption.WRITE);
        // Same-filesystem atomic rename is required; unsupported filesystems fail closed.
        Files.move(pending,path,StandardCopyOption.ATOMIC_MOVE,StandardCopyOption.REPLACE_EXISTING);
    }
    private JsonObject durableIdentity() {
        JsonObject o=new JsonObject();o.addProperty("format","rea-durable-queries-v1");
        o.addProperty("target_sha256",durableDescriptor.targetSha256);o.addProperty("profile_digest",durableDescriptor.profileDigest);
        var options=currentProgram.getOptions("REA Durable Queries");
        o.addProperty("workspace_id",options.getString("workspace_id",""));
        o.addProperty("preparation_sha256",options.getString("preparation_sha256",""));
        o.addProperty("revision",durableRevision);return o;
    }
    private void durableInitialize(SessionDescriptor descriptor) throws Exception {
        String configured=System.getenv("REA_DURABLE_QUERY_SESSION");if(configured==null||configured.isBlank())return;
        durableRoot=Path.of(configured).toRealPath();durableDescriptor=descriptor;
        Path workspace=Path.of("").toRealPath();if(durableRoot.equals(workspace)||!durableRoot.startsWith(workspace))throw new IOException("Durable query root escapes workspace");
        var o=currentProgram.getOptions("REA Durable Queries");
        if(!Boolean.TRUE.equals(getStoredHeadlessValue("REA durable prepared "+descriptor.runId))||!descriptor.runId.equals(o.getString("prepared_run",""))||!descriptor.targetSha256.equals(o.getString("target_sha256",""))||!descriptor.profileDigest.equals(o.getString("profile_digest","")))
            throw new IllegalStateException("Durable Program preparation/profile mismatch");
        durableRevision=o.getLong("revision",0);
        // Startup analysis/extensions may change the Program. Old revision results
        // remain retained, but are never replayed against that changed database.
        if(o.getBoolean("startup_changed",true))durableRevision++;
        int tx=currentProgram.startTransaction("REA durable analyzed readiness");
        try{o.setLong("revision",durableRevision);o.setBoolean("analyzed_ready",!analysisTimeoutOccurred());}
        finally{currentProgram.endTransaction(tx,true);}
        durableSave();
        JsonObject ready=durableIdentity();ready.addProperty("ready",!analysisTimeoutOccurred());
        ready.addProperty("analysis_timed_out",analysisTimeoutOccurred());durableWrite(durableRoot.resolve("ready.json"),ready);
    }
    private void durableSave() throws Exception {
        // run() ended its outer script transaction before serving. saveProgram()
        // starts a tracked transaction afterward; end it so edit handlers retain
        // their own real outer transactions and immediate rollback semantics.
        saveProgram(currentProgram);end(true);
    }
    private JsonElement durableHandleRequest(Request request,SessionDescriptor descriptor) throws Exception {
        if(durableRoot==null||request.method.equals("ping"))return handleRequest(request,descriptor);
        if(currentProgram.getOptions("REA Durable Queries").getBoolean("static_queries_only",false)&&DURABLE_MUTATIONS.contains(request.method))throw new RequestFailure("method_unavailable","This saved Program profile admits static queries only");
        if(analysisTimeoutOccurred())return handleRequest(request,descriptor);
        JsonObject identity=durableIdentity();identity.addProperty("method",request.method);identity.add("params",durableCanonical(request.params));
        String key=durableHash(GSON.toJson(identity));Path resultPath=durableRoot.resolve("operations").resolve(key+".json");
        boolean mutable=DURABLE_MUTATIONS.contains(request.method);
        if(!mutable){JsonObject saved=durableRead(resultPath);if(saved!=null){
            if(!saved.get("key").getAsString().equals(key)||!saved.get("result_sha256").getAsString().equals(durableHash(GSON.toJson(saved.get("result")))))throw new IOException("Durable query result commitment differs");
            return saved.get("result").deepCopy();
        }}
        // Invalidate before a handler that can commit several individual edits.
        // If it later fails/cancels, partial edits cannot reuse an old read cache.
        if(mutable){int tx=currentProgram.startTransaction("REA durable query revision");try{currentProgram.getOptions("REA Durable Queries").setLong("revision",++durableRevision);}finally{currentProgram.endTransaction(tx,true);}durableSave();}
        JsonElement result=handleRequest(request,descriptor);
        durableSave();
        if(!mutable){JsonObject saved=durableIdentity();saved.addProperty("key",key);saved.add("request",identity);saved.add("result",result.deepCopy());saved.addProperty("result_sha256",durableHash(GSON.toJson(result)));durableWrite(resultPath,saved);}
        return result;
    }
    private JsonArray durableSearch(List<InventoryItem> inventory,ValueMatcher matcher,JsonObject params,boolean procedures) throws Exception {
        JsonObject identity=durableIdentity();identity.addProperty("kind",procedures?"procedures":"strings");identity.add("params",durableCanonical(params));
        MessageDigest h=MessageDigest.getInstance("SHA-256");
        for(InventoryItem item:inventory){monitor.checkCancelled();h.update(GSON.toJson(resultItem(item,null)).getBytes(StandardCharsets.UTF_8));h.update((byte)0);}
        identity.addProperty("inventory_sha256",bytesHex(h.digest()));identity.addProperty("inventory_count",inventory.size());
        String key=durableHash(GSON.toJson(identity));Path dir=durableRoot.resolve("searches").resolve(key),cursorPath=dir.resolve("cursor.json");
        JsonObject cursor=durableRead(cursorPath);JsonArray chunks=new JsonArray(),result=new JsonArray();int next=0;
        if(cursor!=null){if(!key.equals(cursor.get("key").getAsString()))throw new IOException("Search journal identity differs");next=cursor.get("next").getAsInt();if(next<0||next>inventory.size())throw new IOException("Search journal cursor invalid");chunks=cursor.getAsJsonArray("chunks");
            int committed=0;
            for(JsonElement element:chunks){JsonObject c=element.getAsJsonObject();String file=c.get("file").getAsString();if(!file.matches("batch-[0-9]+\\.json"))throw new IOException("Search batch path invalid");JsonObject b=durableRead(dir.resolve(file));if(b==null||!c.get("sha256").getAsString().equals(durableHash(GSON.toJson(b))))throw new IOException("Search batch commitment differs");int end=b.get("end").getAsInt();if(b.get("first").getAsInt()!=committed||end<=committed||end>inventory.size()||end-committed>1024||!file.equals("batch-"+end+".json"))throw new IOException("Search batch cursor chain differs");committed=end;for(JsonElement item:b.getAsJsonArray("items"))result.add(item.deepCopy());}
            if(next!=committed)throw new IOException("Search journal advances beyond committed batches");
        }
        while(next<inventory.size()){
            int end=Math.min(next+1024,inventory.size());JsonArray batch=new JsonArray();
            for(int i=next;i<end;i++){monitor.checkCancelled();InventoryItem item=inventory.get(i);if(matcher.matches(item.value)){JsonObject r=resultItem(item,null);batch.add(r);result.add(r.deepCopy());}}
            JsonObject b=new JsonObject();b.addProperty("first",next);b.addProperty("end",end);b.add("items",batch);
            String file="batch-"+end+".json";durableWrite(dir.resolve(file),b);JsonObject c=new JsonObject();c.addProperty("file",file);c.addProperty("sha256",durableHash(GSON.toJson(b)));chunks.add(c);
            cursor=durableIdentity();cursor.addProperty("key",key);cursor.add("identity",identity);cursor.addProperty("next",end);cursor.add("chunks",chunks);durableWrite(cursorPath,cursor);next=end;
        }
        return result;
    }
    // END PROJECT DURABLE QUERY SUPPORT
