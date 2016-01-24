class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new comments_params
    @comment.user_id = current_user.id if current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js
      end
    else
      render :new
    end
  end


  private

  def comments_params
    params.require(:comment).permit(:content)
  end

  def load_commentable
     klass = [Story].detect { |c| ["#{c.name.underscore}_id"] }
     @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
