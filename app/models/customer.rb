class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name
        p "#{first_name} #{last_name}"
    end

    def favorite_restaurant
        bestreview = reviews.max_by { |r| r.star_rating}
        return bestreview.restaurant
    end

    def add_review(restaurant, rating)
        Review.create(restaurant_id: restaurant.id, star_rating: rating, customer_id: self.id)
    end

    def delete_reviews(restaurant)
        
        reviews = self.reviews.where(restaurant_id: restaurant.id)
        return reviews.destroy_all
    end

end