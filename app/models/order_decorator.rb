Spree::Order.class_eval do
  attr_accessible :delivery_date

  validate :delivery_date, :presence => true, :allow_nil => false
  validate :delivery_date_must_be_past_today

  def delivery_date_must_be_past_today
    if !delivery_date.blank? and !(delivery_date > Date.today)
      errors.add(:delivery_date, "can't be in the past")
    end
  end
end