class Session < ActiveRecord::Base
  attr_accessible :user_id, :token, :device, :location
  validates :user_id, :token, :presence => true

  belongs_to(:user,
  :class_name => "User",
  :primary_key => :id,
  :foreign_key => :user_id)

end
