package good.damn.editor.apitest.adapters

import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import good.damn.editor.apitest.holders.APViewHolderChannel
import good.damn.editor.apitest.models.APModelChannel

class APAdapterChannels(
    private val mChannels: Array<APModelChannel>,
    private val mHolderWidth: Float,
    private val mHolderHeight: Float
): RecyclerView.Adapter<APViewHolderChannel>() {

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ) = APViewHolderChannel.create(
        parent.context,
        mHolderWidth,
        mHolderHeight
    )

    override fun getItemCount() = mChannels.size

    override fun onBindViewHolder(
        holder: APViewHolderChannel,
        position: Int
    ) = holder.onBindViewHolder(
        mChannels[position]
    )

    override fun onViewDetachedFromWindow(
        holder: APViewHolderChannel
    ) {
        holder.onDetach()
    }


}