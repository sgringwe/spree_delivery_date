Spree::Order.class_eval do
  require 'date'
  require 'spree/order/checkout'

  attr_accessible :delivery_date

  validate :delivery_date, :presence => true, :allow_nil => false
  validate :delivery_date_specific_validation

  # Ensure that a delivery date is set. We don't want to run these validations until it is
  # Only run the delivery date validations if we are on that step or past.
  def delivery_date_specific_validation
    if !delivery_date.blank? && ['payment', 'confirm', 'complete'].include?(state)
      cutoff = Time.zone.now.change(:hour => 17, :min => 00) # Gets 5pm in EST time zone (config.time_zone)

      if [0, 1, 7].include?(delivery_date.wday)
        errors.add(:delivery_date, "cannot be a Sunday or Monday.")
      end

      if cutoff.past? && !(delivery_date > Date.tomorrow)
        errors.add(:delivery_date, ": It is too late for delivery tomorrow. Please specify a date after tomorrow.")
      elsif !cutoff.past? && !(delivery_date > Date.today)
        errors.add(:delivery_date, ": It is too late for delivery today. Please specify a date tomorrow or later.")
      end
    end
  end
end