class Attraction < ApplicationRecord
  # Validations
  has_many :rides
  has_many :users, through: :rides
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :min_height, presence: true, numericality: { only_integer: false }
  validates :happiness_rating, presence: true, numericality: { only_integer: true,
                                                        greater_than: 0,
                                                        less_than: 6 }
  validates :nausea_rating, presence: true, numericality: { only_integer: true,
                                                     greater_than: 0,
                                                     less_than: 6 }
  validates :tickets, presence: true, numericality: { only_integer: true }

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
    end
    if user.tickets < self.tickets
      msg << "You do not have enough tickets to ride the #{self.name}"
    end
    msg
  end
end
