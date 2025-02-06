package good.damn.editor.apitest.holders

import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.view.Gravity
import android.view.View
import android.widget.LinearLayout
import androidx.appcompat.widget.AppCompatImageView
import androidx.appcompat.widget.AppCompatTextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import good.damn.editor.apitest.APApp
import good.damn.editor.apitest.activities.APActivityDetails
import good.damn.editor.apitest.extensions.bounds
import good.damn.editor.apitest.extensions.boundsFrame
import good.damn.editor.apitest.extensions.boundsLinear
import good.damn.editor.apitest.extensions.setTextSizePx
import good.damn.editor.apitest.models.APModelChannel
import good.damn.editor.apitest.views.APViewChannel
import good.damn.editor.apitest.views.interfaces.APIListenerOnClickChannel
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch
import java.net.URL

class APViewHolderChannel(
    private val mImageViewPreview: AppCompatImageView,
    private val mTextViewName: AppCompatTextView,
    private val mViewChannel: APViewChannel
): RecyclerView.ViewHolder(
    mViewChannel
) {
    private var mJob: Job? = null

    fun onBindViewHolder(
        data: APModelChannel
    ) {
        mViewChannel.model = data
        mTextViewName.text = data.title

        val cachedBitmap = APApp.bitmapCache[
            data.imageUrl
        ]

        if (cachedBitmap != null) {
            mImageViewPreview.setImageBitmap(
                cachedBitmap
            )
            return
        }

        mJob = APApp.scope.launch {
            val inp = URL(
                data.imageUrl
            ).openStream()

            val bitmap = BitmapFactory.decodeStream(
                inp
            )

            APApp.bitmapCache[
                data.imageUrl
            ] = bitmap

            inp.close()

            APApp.ui {
                mImageViewPreview.setImageBitmap(
                    bitmap
                )
            }
        }
    }

    fun onDetach() {
        mJob?.cancel()
    }

    companion object {
        fun create(
            context: Context,
            holderWidth: Float,
            holderHeight: Float
        ): APViewHolderChannel {
            val layout = APViewChannel(
                context
            ).apply {
                radius = holderHeight * 0.2f

                cardElevation = holderHeight * 0.05f

                onClickChannel = object: APIListenerOnClickChannel {
                    override fun onClickChannel(
                        model: APModelChannel,
                        context: Context
                    ) {

                        val intent = Intent(
                            context,
                            APActivityDetails::class.java
                        ).apply {
                            putExtra(
                                APActivityDetails.INTENT_ID,
                                model.id
                            )
                        }

                        context.startActivity(
                            intent
                        )
                    }
                }

                bounds(
                    holderWidth,
                    holderHeight
                )
            }

            val imageViewPreview = AppCompatImageView(
                context
            ).apply {

                background = null
                val s = holderHeight * 0.5f
                boundsFrame(
                    gravity = Gravity.CENTER_VERTICAL,
                    width = s,
                    height = s,
                    start = s * 0.5f
                )

                layout.addView(
                    this
                )
            }


            val textViewName = AppCompatTextView(
                context
            ).apply {
                background = null

                setTextSizePx(
                    holderHeight * 0.11f
                )

                gravity = Gravity.CENTER_VERTICAL

                boundsFrame(
                    width = holderWidth-holderHeight,
                    height = holderHeight,
                    start = holderHeight
                )

                layout.addView(
                    this
                )
            }

            return APViewHolderChannel(
                imageViewPreview,
                textViewName,
                layout
            )
        }
    }

}