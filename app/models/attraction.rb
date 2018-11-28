class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def take_ride(user)
    user.update_attributes(
      tickets: user.tickets -= tickets,
      nausea: user.nausea += nausea_rating,
      happiness: user.happiness += happiness_rating,
    )
  end
end
