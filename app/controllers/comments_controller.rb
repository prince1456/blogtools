class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    discussion_id = params[:discussion_id]
    discussion = Discussion.find discussion_id
    # @comment = @discussion.comments.new find_params
    if discussion.comments.create find_params
      redirect_to project_path(discussion.project_id)
    else
      flash[:alert] = "wrong information"
      redirect_to project_path(discussion.project_id)
    end
  end

  def destroy

  end


  private

  def find_params
 params.require(:comment).permit(:body)
  end
end
