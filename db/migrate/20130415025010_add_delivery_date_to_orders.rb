class AddDeliveryDateToOrders < ActiveRecord::Migration
  def up
    add_column :spree_orders, :delivery_date, :date
  end

  def down
    remove_column :spree_orders, :delivery_date
  end
end
