package good.damn.editor.apitest.services.interfaces

import good.damn.editor.apitest.models.APModelChannel

interface APIListenerOnGetChannels {

    fun onGetChannels(
        data: Array<APModelChannel>
    )

}