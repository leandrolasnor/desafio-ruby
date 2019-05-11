require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
require 'rest-client'

module RailsAdmin
    module Config
      module Actions
        class IntroduceProducts < RailsAdmin::Config::Actions::Base
            RailsAdmin::Config::Actions.register(self)
            register_instance_option :only do
              Store
            end
            register_instance_option :member do
              true
            end
            register_instance_option :visible? do 
                subject = bindings[:object]
                subject.products.length == 0
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
              Proc.new do
                url = "https://www.fossil.com.br/api/catalog_system/pub/products/search/"
                response = RestClient.get(url, headers={})
                p response
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
                subject.products.length > 0
            end
            register_instance_option :link_icon do
                'icon-fire'
            end
            register_instance_option :http_methods do
              [:get]
            end
            register_instance_option :controller do
              Proc.new do
                flash[:notice] = "Expunge Products | Store #{@object.name}"
                redirect_to back_or_index
              end
            end
        end
      end
    end
  end