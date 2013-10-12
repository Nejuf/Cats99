class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex, :owner_id
  validates :age, numericality: true
  validates :name, presence: true
  validates :sex, inclusion: { in: ["M", "F"] }
  validates :color, inclusion: { in: ["black", "brown", "white", "grey"] }
  has_many(:cat_rental_requests,
  :class_name => "CatRentalRequest",
  :primary_key => :id,
  :foreign_key => :cat_id,
  dependent: :destroy)
  belongs_to(:owner,
  :class_name => "User",
  :primary_key => :id,
  :foreign_key => :owner_id)
end
