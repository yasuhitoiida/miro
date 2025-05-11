class Post < ApplicationRecord
    validates :content, length: { minimum: 5 }
end
