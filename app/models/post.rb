class Post < ApplicationRecord
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :cannot_be_true_facts

	def cannot_be_true_facts
		if self.title == "True Facts"
			errors.add(:title, "That title is invalid")
		end
	end
end
