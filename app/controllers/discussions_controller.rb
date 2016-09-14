class DiscussionsController < ApplicationController
  def create
    @discussion = Discussion.new params.require(:discussion).permit(:title, :description)
    @project = Project.find params[:project_id]
    @discussion.project = @project

    if @discussion.save
      redirect_to project_path(@project)
    else
      flash[:alert] = "Somethings is wrong"
        render "/projects/show"
   end
end
  def destroy
    p = Project.find params[:project_id]
    d = Discussion.find params[:id]
    d.destroy
    redirect_to project_path(p), notice: "answer deleted"

  end
end
