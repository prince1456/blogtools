class ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :edit, :update, :destroy]

    def index
        @project = Project.all
    end

    def show
        @project = Project.find params[:id]
        @discussion = Discussion.new
        @discussions = @project.discussions

        # @dis = Discussion.find params[]
        @comment = Comment.new
    end

    def edit
        @project = Project.find params[:id]
    end

    def update
        @project = Project.find params[:id]
        if @project.update project_params

            redirect_to project_path
        else
            flash[:alert] = 'wront information'
            render :edit
        end
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new project_params
        if @project.save
            redirect_to projects_path, notice: ' successfull'

        else
            flash[:alert] = ' wrong information'
            render :new
        end
    end

    def destroy
      @project = Project.find params[:id]
      @project.destroy
        redirect_to projects_path, notice: " Project successfully deleted"
    end

    private
    def find_project
      @project = Project.find params[:id]
    end
    def project_params
        params.require(:project).permit(:title, :description, :bootsy_image_gallery_id)
    end
end
