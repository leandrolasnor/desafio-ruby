require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
    module Config
      module Actions
        class IntroduceProducts < RailsAdmin::Config::Actions::Base
            RailsAdmin::Config::Actions.register(self)
            register_instance_option :member do
              true
            end
            register_instance_option :visible? do 
                subject = bindings[:object]
                p subject.to_a
                subject.class.name.downcase == "store" && (subject["products"].nil? || subject["products"].length == 0)
            end
            register_instance_option :only do
              Store
            end
            register_instance_option :pjax? do
              true
            end
            register_instance_option :link_icon do
                'icon-hdd'
            end
            register_instance_option :http_methods do
              [:get]
            end
            register_instance_option :controller do
              proc do
                begin
                  response = open('https://www.fossil.com.br/api/catalog_system/pub/products/search').read
                  products = JSON.parse(response)
                  products.each do |item|
                    product = Product.new
                    product.name = item["productName"]
                    product.price = item["items"][0]["sellers"][0]["commertialOffer"]["Price"]
                    product.image = item["items"][0]["images"][0]["imageUrl"]
                    product.url = item["items"][0]["sellers"][0]["addToCartLink"]
                    product.store_id = @object["_id"]
                    product.user_id = @object["user_id"]
                    #product.installments = item["items"][0]["sellers"][0]["commertialOffer"]["Installments"]
                    product.insert
                  end
                  flash[:notice] = "Products Imported | Store #{@object.name}"
                rescue StandardError => e
                  p e.message
                end
                redirect_to back_or_index
              end
            end
        end
        class ExpungeProducts < RailsAdmin::Config::Actions::Base
            RailsAdmin::Config::Actions.register(self)
            register_instance_option :only do
              Store
            end
            register_instance_option :member do
              true
            end
            register_instance_option :visible? do 
                subject = bindings[:object]
                p subject.to_a
                subject.class.name.downcase == "store" && !subject["products"].nil? && subject["products"].length > 0
            end
            register_instance_option :link_icon do
                'icon-fire'
            end
            register_instance_option :http_methods do
              [:get]
            end
            register_instance_option :controller do
              Proc.new do
                Product.where(:store_id => @object.id).destroy_all
                flash[:notice] = "Expunged Products | Store #{@object.name}"
                redirect_to back_or_index
              end
            end
        end
      end
    end
  end