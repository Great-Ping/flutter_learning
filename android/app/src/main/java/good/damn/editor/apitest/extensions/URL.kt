package good.damn.editor.apitest.extensions

import androidx.annotation.WorkerThread
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.net.URL
import java.nio.charset.StandardCharsets

@WorkerThread
fun URL.loadJson(): JSONObject {
    val stream = openStream()
    val buffer = ByteArray(1024)
    val out = ByteArrayOutputStream()
    var n: Int

    while (true) {
        n = stream.read(buffer)
        if (n == -1) {
            break
        }
        out.write(buffer, 0, n)
    }

    stream.close()
    val data = out.toByteArray()
    out.close()

    return JSONObject(
        String(
            data,
            StandardCharsets.UTF_8
        )
    )
}