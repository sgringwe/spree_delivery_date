Deface::Override.new(:virtual_path => "spree/admin/shared/_order_tabs",
                     :name => "add_delivery_date_to_admin_order_information",
                     :insert_after => "#order_total",
                     :partial => "spree/admin/shared/admin_order_information_delivery_date",
                     :disabled => false)