Spree Delivery Date
=================

Requires user to enter a delivery date during checkout (delivery section). The delivery date must be tomorrow or later.

* Uses validation to ensure the user specifies a date tomorrow or later.
* Shows delivery date during checkout confirmation.
* Shows delivery date when viewing or editing order as admin.
* Allows admin to filter orders by delivery date (date range).
* Allows admin to sort orders by delivery date.
* Adds delivery date column to orders index page table.

Installing
=======

Add the gem to your Gemfile

    $ gem 'spree_delivery_date', :git => 'git@github.com:sgringwe/spree_delivery_date.git'

bundle with
  
    $ bundle update

and run

    $ rails g spree_delivery_date:install

to install and (be asken to) run the migrations. This migration simply adds the delivery_date field to Spree::Order.

Remaining Features
==================

The only remaining feature I can think to implement is an option for users to specify their own custom validation method
for validating the delivery date. With this option, users of this plugin could specify custom rules such as no deliveries
on weekends, require 3 days for preperation (instead of 1 day as of current), etc.
