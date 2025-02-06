package good.damn.editor.apitest.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import good.damn.editor.apitest.APApp
import good.damn.editor.apitest.adapters.APAdapterChannels
import good.damn.editor.apitest.decorations.APDecorationMargin
import good.damn.editor.apitest.models.APModelChannel
import good.damn.editor.apitest.services.APServiceChannels
import good.damn.editor.apitest.services.interfaces.APIListenerOnGetChannels

class APActivityMain
: AppCompatActivity(),
APIListenerOnGetChannels {

    override fun onCreate(
        savedInstanceState: Bundle?
    ) {
        super.onCreate(
            savedInstanceState
        )
        APServiceChannels().apply {
            onGetChannels = this@APActivityMain
            getChannelsAsync()
        }
    }

    override fun onGetChannels(
        data: Array<APModelChannel>
    ) =  RecyclerView(
        this
    ).run {
        background = null

        layoutManager = LinearLayoutManager(
            this@APActivityMain,
            LinearLayoutManager.VERTICAL,
            false
        )

        addItemDecoration(
            APDecorationMargin(
                mTop = (APApp.height * 0.05f).toInt()
            )
        )

        adapter = APAdapterChannels(
            data,
            APApp.width.toFloat(),
            APApp.height * 0.2f
        )

        setContentView(
            this
        )
    }

}