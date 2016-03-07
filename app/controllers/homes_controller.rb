class HomesController < ApplicationController

  def latest
  	@article = Article.order('created_at DESC').limit(5)
  end
  
end