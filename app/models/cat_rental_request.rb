class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :start_date, :end_date, :status

  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :cat_id, presence: true
  validate :overlapping_requests
  belongs_to(:cat,
  :class_name => "Cat",
  :primary_key => :id,
  :foreign_key => :cat_id)

  before_validation(on: :create) do
    self.status ||= "PENDING"
  end

  def overlapping_requests
    requests = CatRentalRequest.where("cat_id = ? AND status = 'APPROVED'", cat_id)
    overlapping_approved_requests(requests)
  end

  def overlapping_approved_requests(requests)
    return if requests.empty?
    requests.each do |request|
      errors.add(:start_date, "cannot overlap with another request") if ((self.start_date - request.start_date) * (request.end_date - self.end_date) >= 0)
    end
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save!
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  # def overlapping_pending_requests
  #
  # end

end
