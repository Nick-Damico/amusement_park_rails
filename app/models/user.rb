class User < ActiveRecord::Base
  has_secure_password
  # Associations
  has_many :rides
  has_many :attractions, through: :rides
  # Validations
    validates :name, presence: true,
                     uniqueness: true
    validates :height, presence: true,
                       numericality: { only_integer: false }, unless: :is_admin?
    validates :happiness, presence: true,
                          numericality: { only_integer: true,
                                          greater_than: 0,
                                          less_than: 6,
                                        }, unless: :is_admin?
    validates :nausea, presence: true,
                       numericality: { only_integer: true,
                                       greater_than: 0,
                                       less_than: 6
                                     }, unless: :is_admin?
    validates :tickets, presence: true,
                        numericality: { only_integer: true }, unless: :is_admin?

  def is_admin?
    self.admin
  end

  def mood
    happiness > nausea ? 'happy' : 'sad'
  end
end
