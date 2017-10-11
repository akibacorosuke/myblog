class Post < ApplicationRecord
	has_many :comments #@post.commentsでコメントを持ってくることができる
    validates :title, presence: true
	validates :body, {presence: true, length: {maximum: 20, message: 'Too short to post'}}
end
