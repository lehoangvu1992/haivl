class ArticlesController < ApplicationController

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(params.require(:article).permit(:title, :content))
    @article.user = current_user
  	if @article.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end
end