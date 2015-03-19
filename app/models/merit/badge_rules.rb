# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize

      grant_on 'reviews#create', badge_id: 1, level: 1, to: :user do |review|
        review.user.reviews.count == 1
      end
      
      grant_on 'reviews#create', badge_id: 2, level: 2, to: :user do |review|
        review.user.reviews.count == 5
      end

      grant_on 'reviews#create', badge_id: 3, level: 3, to: :user do |review|
        review.user.reviews.count == 10
      end
      
      grant_on 'reviews#create', badge_id: 4, level: 4, to: :user do |review|
        review.user.reviews.count == 15
      end

      grant_on 'reviews#create', badge_id: 5, level: 5, to: :user do |review|
        review.user.reviews.count == 20
      end
      
      grant_on 'reviews#create', badge_id: 6, level: 6, to: :user do |review|
        review.user.reviews.count == 25
      end

      grant_on 'reviews#create', badge_id: 7, level: 7, to: :user do |review|
        review.user.reviews.count == 30
      end
      
      grant_on 'reviews#create', badge_id: 8, level: 8, to: :user do |review|
        review.user.reviews.count == 35
      end

      grant_on 'reviews#create', badge_id: 9, level: 9, to: :user do |review|
        review.user.reviews.count == 40
      end
      
      grant_on 'reviews#create', badge_id: 10, level: 10, to: :user do |review|
        review.user.reviews.count == 100
      end

    end
  end
end
















