Spree::Order.class_eval do
  require 'date'

  attr_accessible :delivery_date

  validate :delivery_date, :presence => true, :allow_nil => false
  validate :delivery_date_specific_validation

  def delivery_date_specific_validation
    # Ensure that a delivery date is set
    if delivery_date.blank?
      errors.add(:delivery_date, "please specify a delivery date.")
    end

    # Check if delivery date is sunday or monday, which are not allowed
    if [0, 1, 7].include?(delivery_date.wday)
      errors.add(:delivery_date, "the delivery date cannot be a Sunday or Monday.")
    end

    cutoff = Time.now.in_time_zone("Eastern Time (US & Canada)")
    cutoff.hour = 16 # 4pm
    cutoff.minute = 30 # 4:30pm
    if now.past?
      # It is past 4:30. Order must be > Date.tomorrow
      if !(delivery_date > Date.tomorrow)
        errors.add(:delivery_date, "it is too late for delivery tomorrow. Please specify a date after tomorrow.")
      end
    else
      if !(delivery_date > Date.today)
        errors.add(:delivery_date, "it is too late for delivery today. Please specify a date tomorrow or later.")
      end
    end
  end
end