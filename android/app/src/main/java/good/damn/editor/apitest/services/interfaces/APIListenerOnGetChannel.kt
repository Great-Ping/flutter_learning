package good.damn.editor.apitest.services.interfaces

import good.damn.editor.apitest.models.APModelChannelDetails

interface APIListenerOnGetChannel {
    fun onGetChannelDetails(
        data: APModelChannelDetails
    )
}