class User < ApplicationRecord
  has_secure_password

  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: true,
                    format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end


  def self.search(query)
    where("first_name ILIKE ? or last_name ILIKE ? or email ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.not_name(name)
    where("first_name NOT LIKE ? or last_name  NOT LIKE ?", "%#{name}%", "%#{name}%")
  end

  private

  def downcase_email
    self.email&.downcase!
  end

end
