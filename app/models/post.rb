class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary,length: {maximum: 250}
  validates :category, inclusion:{in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait

    @@clickbait_terms = ["Won't Believe", "Secret", "Top", "Guess"]

    def is_clickbait
      if self.title
        if @@clickbait_terms.none?  {|term| self.title.include?(term)}
          errors.add(:title, "must be clickbait")
        end
      end
    end
end
