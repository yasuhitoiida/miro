class ShortPost < Post
    validates :content, length: { maximum: 20 }
end
