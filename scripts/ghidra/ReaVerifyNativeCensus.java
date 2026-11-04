import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import ghidra.app.script.GhidraScript;
import ghidra.framework.Application;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.HexFormat;

/** Verify a published census against its saved Program without modifying either. */
public class ReaVerifyNativeCensus extends GhidraScript {
    @Override
    protected void run() throws Exception {
        Path path = Path.of(System.getenv("REA_NATIVE_CENSUS_PLAN"));
        byte[] planBytes = Files.readAllBytes(path);
        String planHash = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(planBytes));
        JsonObject plan = JsonParser.parseString(new String(planBytes, StandardCharsets.UTF_8)).getAsJsonObject();
        if (!currentProgram.getExecutableSHA256().equalsIgnoreCase(plan.get("target_sha256").getAsString()))
            throw new IllegalArgumentException("Saved Program target differs");
        var options = currentProgram.getOptions("REA Native Census");
        String workspace = System.getenv("REA_CENSUS_WORKSPACE_ID");
        String savedWorkspace = options.getString("workspace_id", "");
        boolean adopted = savedWorkspace.isEmpty() && planHash.equals(System.getenv("REA_CENSUS_ADOPTED_PLAN_HASH"));
        if (workspace != null && !workspace.equals(savedWorkspace) && !adopted)
            throw new IllegalArgumentException("Saved Program workspace differs");
        String saved = options.getString("checkpoint:" + planHash, "");
        if (saved.isEmpty()) saved = options.getString("checkpoint", "");
        JsonObject checkpoint = JsonParser.parseString(saved).getAsJsonObject();
        checkpoint.remove("metrics");
        JsonObject published = JsonParser.parseString(Files.readString(
            Path.of(plan.get("output").getAsString()).resolve("progress.json"))).getAsJsonObject();
        if (!"completed".equals(checkpoint.get("stage").getAsString())
                || !planHash.equals(checkpoint.get("plan_sha256").getAsString())
                || !plan.get("script_sha256").equals(checkpoint.get("script_sha256"))
                || !Application.getApplicationVersion().equals(checkpoint.get("ghidra_version").getAsString())
                || !checkpoint.equals(published))
            throw new IllegalArgumentException("Published census differs from the completed saved checkpoint");
        println("REA census read-only checkpoint verified");
    }
}
