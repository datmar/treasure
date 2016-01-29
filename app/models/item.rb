class Item < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {maximum: 1000}
  validates :user_id, presence: true

  belongs_to  :user
  has_many    :given_swipes, foreign_key: :owned_item_id, class_name: "Swipe"
  has_many    :received_swipes, foreign_key: :judged_item_id, class_name: "Swipe"
  has_many    :first_matches, through: :given_swipes, source: :first_match_swipes
  has_many    :second_matches, through: :given_swipes, source: :second_match_swipes

  #TODO: Write method to merge first and second matches
  # def matches
  #   self.first_matches.merge(self.second_matches)
  # end

end
