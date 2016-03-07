class ArticlesController < ApplicationController
 before_action :check_user_signed_in, except: [:show]

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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(aritcle_params)
      redirect_to root_path
    else
      render :edit
    end 
  end

  def aritcle_params
    params.require(:article).permit(:title, :content)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

end