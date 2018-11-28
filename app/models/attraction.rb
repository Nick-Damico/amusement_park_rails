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

  def can_user_ride(user)
    msg = []
    if user.height < self.min_height
      msg << "You are not tall enough to ride the #{self.name}"
    if user.tickets < self.tickets
      msg << "You do not have enough tickets to ride the #{self.name}"
    end
    msg
  end
end
