class CommentsController < ApplicationController

# def new
#   @comment = Comment.new
# end

def create
  @comment = Comment.create(comment_params)
  redirect_to :back
end

def destroy
  @comment = Comment.find_by(id: params[:id])
  @entry = @comment.entry
  if session[:user_id] == @comment.user_id || @entry.user_id == session[:user_id]
    @comment.destroy
    redirect_to :back
  else
    redirect_to :back
  end
end

private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :entry_id, :username)
  end

end
