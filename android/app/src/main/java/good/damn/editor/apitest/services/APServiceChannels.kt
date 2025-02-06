package good.damn.editor.apitest.services

import android.util.Log
import good.damn.editor.apitest.APApp
import good.damn.editor.apitest.extensions.loadJson
import good.damn.editor.apitest.models.APModelChannel
import good.damn.editor.apitest.models.APModelChannelDetails
import good.damn.editor.apitest.services.interfaces.APIListenerOnGetChannel
import good.damn.editor.apitest.services.interfaces.APIListenerOnGetChannels
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.net.URL
import java.nio.charset.StandardCharsets

class APServiceChannels {

    companion object {
        private const val TAG = "APServiceChannels"
    }

    var onGetChannels: APIListenerOnGetChannels? = null
    var onGetChannelDetails: APIListenerOnGetChannel? = null

    private var mJob: Job? = null
    private var mDetailsJob: Job? = null

    fun getChannelDetailsAsync(
        id: Int
    ) {
        mDetailsJob = APApp.scope.launch {
            val json = URL(
                "https://damntv.ru/api/channels/$id"
            ).loadJson()

            val desc = json.getString(
                "description"
            )

            APApp.ui {
                onGetChannelDetails?.onGetChannelDetails(
                    APModelChannelDetails(
                        desc
                    )
                )
            }
        }
    }

    fun getChannelsAsync() {
        mJob = APApp.scope.launch {
            val jsonObj = URL(
                "https://damntv.ru/api/channels"
            ).loadJson()

            val count = jsonObj.getInt(
                "totalCount"
            )

            val jsonChannels = jsonObj.getJSONArray(
                "channels"
            )

            val arr = Array(count) {
                val jsonChannel = jsonChannels.getJSONObject(it)
                val title = jsonChannel.getString(
                    "name"
                )

                val id = jsonChannel.getInt(
                    "id"
                )

                val imageUrl = jsonChannel.getString(
                    "imageUrl"
                )

                APModelChannel(
                    id,
                    title,
                    imageUrl
                )
            }


            APApp.ui {
                onGetChannels?.onGetChannels(
                    arr
                )
            }
        }
    }

    fun cancel() {
        mJob?.cancel()
        mDetailsJob?.cancel()
    }
}