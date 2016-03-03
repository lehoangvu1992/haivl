class HomesController < ApplicationController
def index
		User = User.first
  	@article = User.article.order('created_at DESC').limit(5)
  end
end