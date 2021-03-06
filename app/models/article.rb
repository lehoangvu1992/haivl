class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes
  has_attached_file :image , styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def like_count
  	votes.where(value: 1).count
  end
end
