class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    
    validates :name, presence: true, uniqueness: true 
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.sum do |post|
            post.likes
        end
    end

    def most_likes
        self.posts.max_by do |post|
            post.likes
        end
    end
end
