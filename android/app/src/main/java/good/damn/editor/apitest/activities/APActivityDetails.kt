package good.damn.editor.apitest.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatTextView
import good.damn.editor.apitest.models.APModelChannelDetails
import good.damn.editor.apitest.services.APServiceChannels
import good.damn.editor.apitest.services.interfaces.APIListenerOnGetChannel

class APActivityDetails
: AppCompatActivity(),
APIListenerOnGetChannel {

    companion object {
        const val INTENT_ID = "ID"
    }

    override fun onCreate(
        savedInstanceState: Bundle?
    ) {
        super.onCreate(
            savedInstanceState
        )

        intent.getIntExtra(
            INTENT_ID,
            -1
        ).let { channelId ->

            if (channelId == -1) {
                return
            }

            APServiceChannels().apply {
                onGetChannelDetails = this@APActivityDetails
                getChannelDetailsAsync(
                    channelId
                )
            }
        }
    }

    override fun onGetChannelDetails(
        data: APModelChannelDetails
    ) {
        AppCompatTextView(
            this
        ).apply {

            text = data.desc

            setContentView(
                this
            )
        }
    }

}