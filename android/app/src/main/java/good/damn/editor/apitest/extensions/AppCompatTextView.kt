package good.damn.editor.apitest.extensions

import android.util.TypedValue
import androidx.appcompat.widget.AppCompatTextView

fun AppCompatTextView.setTextSizePx(
    v: Float
) {
    setTextSize(
        TypedValue.COMPLEX_UNIT_PX,
        v
    )
}