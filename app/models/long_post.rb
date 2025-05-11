class LongPost < Post
    validates :content, length: { maximum: 40 }
end
