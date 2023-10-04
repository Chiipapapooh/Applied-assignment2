class PostCommentsController < ApplicationController
    
  def create
    book = Book.find(params[:id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    coment.save
    redirect_to book_path(book)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end 
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end 
  
end
