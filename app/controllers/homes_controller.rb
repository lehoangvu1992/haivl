class HomesController < ApplicationController
  def home
  	if user_signed_in?
  	 user = User.find(current_user.id)
  	@article = user.articles
  	else
  	@article = Article.order('created_at DESC').limit(5)
  end
  end
end