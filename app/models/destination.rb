class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

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

    def five_most_recent
        most_recent = []
        i = -1
        5.times do 
            if self.posts[i]
                most_recent << self.posts[i]
            end
            i -= 1
        end
        most_recent
    end

    def average_blogger_age
        unique_bloggers = self.bloggers.uniq
        ages_sum = unique_bloggers.sum do |blogger|
            blogger.age
        end
        ages_sum.to_f/unique_bloggers.length.to_f

    end
end
