class Booking < ApplicationRecord

  attr_accessor :temp_start, :temp_end


  belongs_to :listing
  belongs_to :user

  validates_presence_of :start_date, :end_date

  validate :end_date_is_after_start_date



	def to_d
		%Q(#{self.start_date.strftime("%b %-d, %Y")} -
		#{self.end_date.strftime("%b %-d, %Y")})
	end


  #######
  private
  #######

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end
end
