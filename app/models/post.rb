class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :not_click_baity_enough

    def not_click_baity_enough
        unless self.title =~ /(Won't Believe|Secret|Top \d*|Guess)/i
            errors.add(:title, "This isn't click-baity enough")
        end
    end
end
