package good.damn.editor.apitest.extensions

import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.LinearLayout

fun View.paramsWidth() = layoutParams.width
fun View.paramsHeight() = layoutParams.height

fun View.bounds(
    width: Float = 2f,
    height: Float = 2f
) {
    layoutParams = ViewGroup.LayoutParams(
        width.toInt(),
        height.toInt()
    )
}

fun View.boundsLinear(
    width: Float = -2f,
    height: Float = -2f,
    gravity: Int = Gravity.START,
    start: Float = 0f,
    end: Float = 0f,
    top: Float = 0f,
    bottom: Float = 0f
) {
    layoutParams = LinearLayout.LayoutParams(
        width.toInt(),
        height.toInt()
    ).apply {
        this.gravity = gravity
        topMargin = top.toInt()
        bottomMargin = bottom.toInt()
        leftMargin = start.toInt()
        rightMargin = end.toInt()
    }
}

fun View.boundsFrame(
    width: Float = -2f,
    height: Float = -2f,
    gravity: Int = Gravity.START,
    start: Float = 0f,
    end: Float = 0f,
    top: Float = 0f,
    bottom: Float = 0f
) {
    layoutParams = FrameLayout.LayoutParams(
        width.toInt(),
        height.toInt()
    ).apply {
        this.gravity = gravity
        topMargin = top.toInt()
        bottomMargin = bottom.toInt()
        leftMargin = start.toInt()
        rightMargin = end.toInt()
    }
}