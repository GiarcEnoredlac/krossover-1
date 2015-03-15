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
     # grant_on 'users/registrations#create', badge_id: 1, model_name: 'User'
      grant_on 'video_reviews#create', badge_id: 1, to: :user do |video_review|
        video_review.user.video_reviews.count >= 1
      end
      grant_on 'video_reviews#create', badge_id: 2, to: :user do |video_review|
        video_review.user.video_reviews.count >= 5
      end
      # grant_on 'posts#update', badge_id: 10 do |post|
      #   post.videos_reviewed?
      # end
      # grant_on 'users/registrations#update', badge_id: 6, model_name: 'User' do |user|
      #   user.videos_reviewed?
      # end
    end
  end
end
