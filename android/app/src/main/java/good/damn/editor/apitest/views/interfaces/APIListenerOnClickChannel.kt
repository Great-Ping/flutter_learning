package good.damn.editor.apitest.views.interfaces

import android.content.Context
import good.damn.editor.apitest.models.APModelChannel

interface APIListenerOnClickChannel {
    fun onClickChannel(
        model: APModelChannel,
        context: Context
    )
}