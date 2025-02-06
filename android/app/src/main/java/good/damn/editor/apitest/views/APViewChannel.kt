package good.damn.editor.apitest.views

import android.content.Context
import android.view.MotionEvent
import androidx.cardview.widget.CardView
import good.damn.editor.apitest.models.APModelChannel
import good.damn.editor.apitest.views.interfaces.APIListenerOnClickChannel

class APViewChannel(
    context: Context
): CardView(
    context
) {
    var model: APModelChannel? = null
    var onClickChannel: APIListenerOnClickChannel? = null

    override fun onTouchEvent(
        event: MotionEvent?
    ): Boolean {
        if (event == null) {
            return false
        }

        when (
            event.action
        ) {
            MotionEvent.ACTION_UP -> {
                val x = event.x
                val y = event.y

                if (x < 0 ||
                    x > width ||
                    y < 0 ||
                    y > height
                ) {
                    return true
                }

                model?.apply {
                    onClickChannel?.onClickChannel(
                        this,
                        context
                    )
                }
            }
        }

        return true
    }
}