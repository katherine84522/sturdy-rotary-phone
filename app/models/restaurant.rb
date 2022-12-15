class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews


    def Restaurant.fanciest
        Restaurant.all.max_by {|r| r.price}
    end

    def all_reviews
        return reviews.map { |r| r.full_review}
    end


end