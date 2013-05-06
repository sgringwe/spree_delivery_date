Spree::Order.class_eval do
  require 'date'
  require 'spree/order/checkout'

  attr_accessible :delivery_date

  validate :delivery_date, :presence => true, :allow_nil => false
  validate :delivery_date_specific_validation

  def delivery_date_specific_validation
    error_occurred = false

    # Ensure that a delivery date is set. We don't want to run these validations until it is
    # Only run the delivery date validations if we are on that step or
    if !delivery_date.blank? && ['payment', 'confirm', 'complete'].include?(state)
      puts '00---------------------------'
      puts 'running validation'
      puts state
      puts '------------------------------'
      # Check if delivery date is sunday or monday, which are not allowed
      if [0, 1, 7].include?(delivery_date.wday)
        errors.add(:delivery_date, "cannot be a Sunday or Monday.")
        error_occurred = true
      end

      cutoff = Time.now.change(:hour => 17, :min => 20).in_time_zone("Eastern Time (US & Canada)")
      puts cutoff
      if cutoff.past?
        # It is past 5:00. Order must be > Date.tomorrow
        if !(delivery_date > Date.tomorrow)
          errors.add(:delivery_date, ": It is too late for delivery tomorrow. Please specify a date after tomorrow.")
          error_occurred = true
        end
      else
        if !(delivery_date > Date.today)
          errors.add(:delivery_date, ": It is too late for delivery today. Please specify a date tomorrow or later.")
          error_occurred = true
        end
      end
    end

    if error_occurred
      self.delivery_date = nil
      self.state = 'delivery'
      save
    end
  end
end