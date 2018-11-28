class User < ActiveRecord::Base
  has_secure_password
  # Associations
  has_many :rides
  has_many :attractions, through: :rides
  before_validation :max_happiness_nausea_reached
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :height, presence: true, numericality: { only_integer: false }, unless: :is_admin?
  validates :happiness, presence: true, numericality: { only_integer: true,
                                                        greater_than: 0,
                                                        less_than: 6, }, unless: :is_admin?
  validates :nausea, presence: true, numericality: { only_integer: true,
                                                     greater_than: 0,
                                                     less_than: 6 }, unless: :is_admin?
  validates :tickets, presence: true, numericality: { only_integer: true }, unless: :is_admin?

  def mood
    happiness > nausea ? 'happy' : 'sad'
  end

  private
  def is_admin?
    admin
  end

  def max_happiness_nausea_reached
    # Bypass if admin, Admins are not required to define attributes [nausea, tickets, happiness]
    unless self.admin
      self.happiness = 5 if self.happiness > 5
      self.nausea = 5 if self.nausea > 5
    end
  end
end
