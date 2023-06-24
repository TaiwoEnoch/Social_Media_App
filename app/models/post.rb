class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_author_posts_counter

  private

  def update_author_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
