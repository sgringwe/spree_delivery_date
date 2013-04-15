Deface::Override.new(:virtual_path => "spree/checkout/_delivery",
                     :name => "add_delivery_date_to_delivery",
                     :insert_after => "[data-hook='shipping_method_inner']",
                     :partial => "spree/checkout/delivery_date",
                     :disabled => false)