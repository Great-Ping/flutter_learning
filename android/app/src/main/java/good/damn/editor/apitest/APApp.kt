package good.damn.editor.apitest

import android.app.Application
import android.graphics.Bitmap
import android.os.Handler
import android.os.Looper
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers

class APApp: Application() {

    companion object {
        var width = 0
        var height = 0

        val scope = CoroutineScope(
            Dispatchers.IO
        )

        val bitmapCache = HashMap<String, Bitmap>()

        private val mHandler = Handler(
            Looper.getMainLooper()
        )

        fun ui(
            run: Runnable
        ) = mHandler.post(
            run
        )
    }

    override fun onCreate() {
        super.onCreate()

        resources.displayMetrics.apply {
            width = widthPixels
            height = heightPixels
        }
    }
}