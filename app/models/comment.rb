class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.update(commentscounter: post.comments.count)
  end
end
