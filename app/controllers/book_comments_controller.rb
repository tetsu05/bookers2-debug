class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    #redirect_to book_path(book) 非同期通信化のため削除
  end

  def destroy
    #BookComment.find_by(id: params[:id]).destroy
    @book = Book.find(params[:book_id])
    comment = BookComment.find(params[:id])
    comment.destroy
    #redirect_to book_path(params[:book_id]) 非同期通信化のため削除
  end

  private

  def book_comment_params
    #params.require(:book_comment).permit(:comment)
    params.require(:book_comment). permit(:user_id, :book_id, :comment)
  end
  
  def baria_user
    comment = BookComment.find(params[:id])
  	unless comment.user_id == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
end
