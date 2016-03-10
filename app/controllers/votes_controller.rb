class VotesController < ApplicationController
  before_action :check_user_signed_in

	def create
		article = Article.find(params[:article_id])
		vote = Vote.where(user_id: current_user.id, article_id: article.id).first
		if vote == nil
			vote = Vote.new(params.require(:vote).permit(:value))
			vote.user = current_user
			vote.article = article
			vote.save!
		end
		redirect_to article_path(article)
	end
end
