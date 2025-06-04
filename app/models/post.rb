class Post < ApplicationRecord
    belongs_to :user
    has_many :posts_tags, class_name: 'PostsTags'
    has_many :tags, through: :posts_tags
    validates :content, length: { minimum: 5 }
end
