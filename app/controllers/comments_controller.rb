class CommentsController < ApplicationController

  def create

    @article = Article.find(params[:article_id])
    @comment = Comment.new(params.require(:comment).permit(:content))
    @comment.user = current_user
    @comment.article = @article
    @comment = Comment.order('created_at DESC').limit(5)
    if @comment.save
      redirect_to article_path(@article) 
    else
      redirect_to article_path(@article), alert: 'Binh luan khong hop le'

    end

  end
end