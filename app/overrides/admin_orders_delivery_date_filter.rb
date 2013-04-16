Deface::Override.new(:virtual_path => "spree/admin/orders/index",
                     :name => "add_delivery_date_filter_to_orders_index",
                     :insert_after => ".date-range-filter",
                     :partial => "spree/admin/orders/delivery_date_filter",
                     :disabled => false)