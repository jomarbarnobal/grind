class StoriesController < ApplicationController
  def index
    @stories = Story.all.order('created_at desc')
  end

  def show
    @story = Story.friendly.find(params[:id])
    @commentable = @story
    @comments = @commentable.comments
    @comment = Comment.new  
  end
  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build story_params
    @story.save 
    redirect_to @story
  end
  
  private

  def story_params
    params.require(:story).permit(:story_title, :story_body, :story_image, :slug)
  end
end
