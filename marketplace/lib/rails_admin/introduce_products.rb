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
                if subject.class.name.downcase == "store"
                  one_product = Product.where(:store_id => subject["_id"]).first
                  one_product.nil?
                else
                  false
                end
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
                # Rake::Task['import_products'].invoke([@object])
                response = open(@object.website).read
                products = JSON.parse(response)
                installments = []
                products.each do |item|
                    product = Product.new
                    product.name = item["productName"]
                    product.price = item["items"][0]["sellers"][0]["commertialOffer"]["Price"]
                    product.image = item["items"][0]["images"][0]["imageUrl"]
                    product.url = item["items"][0]["sellers"][0]["addToCartLink"]
                    product.store_id = @object["_id"]
                    product.user_id = @object["user_id"]
                    item["items"][0]["sellers"][0]["commertialOffer"]["Installments"].each do |installment|
                        im = Installment.new
                        im.product_id = product._id
                        im.user_id = @object["user_id"]
                        im.value = installment["Value"]
                        im.interestrate = installment["InterestRate"]
                        im.totalvalueplusinterestrate = installment["TotalValuePlusInterestRate"]
                        im.numberofinstallments = installment["NumberOfInstallments"]
                        im.paymentsystemname = installment["PaymentSystemName"]
                        im.paymentsystemgroupname = installment["PaymentSystemGroupName"]
                        im.name = installment["Name"]
                        installments << im
                    end
                    product.insert
                end
                installments.each do |item|
                    item.insert
                end
                flash[:notice] = "Products Imported | Store #{@object.name}"
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
                if subject.class.name.downcase == "store"
                  one_product = Product.where(:store_id => subject["_id"]).first
                  !one_product.nil?
                else
                  false
                end
            end
            register_instance_option :link_icon do
                'icon-fire'
            end
            register_instance_option :http_methods do
              [:get]
            end
            register_instance_option :controller do
              proc do
                Product.where(:store_id => @object.id).destroy_all
                flash[:notice] = "Expunged Products | Store #{@object.name}"
                redirect_to back_or_index
              end
            end
        end
      end
    end
  end