class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, lambda { order(created_at: :desc) }, dependent: :destroy
  #validates(:title, {presence: { message: 'must be given!' }})
  #validates :description, presence: true, length: { minimum: 3}
  #validates :price, numericality: { greater_than_or_equal_to: 0 }
  #validates :sale_price # numericality: { less_than_or_equal_to: :price }

  after_initialize(:set_price)
  # after_initialize(:set_sale_price)
  before_save(:capitalize)
  before_save(:cant_be_something)

  delegate :name, to: :category, prefix: true, allow_nil: true

  def self.search(query)
    where("title ILIKE ? or description ILIKE ?", "%#{query}%", "%#{query}%")
  end


  private

  def set_price
    self.price ||= 0
  end
  #
  # def set_sale_price
  #   self.sale_price ||= self.price
  # end

  def capitalize
    self.title = self.title.capitalize
  end

  def cant_be_something
    errors.add(:title, "Can't be Apple") if self.title == "Apple"
    errors.add(:title, "Can't be Microsoft") if self.title == "Microsoft"
    errors.add(:title, "Can't be Sony") if self.title == "Sony"
  end

  def self.increment(inc)
    self.hit_count = self.hit_count + inc
  end

end
