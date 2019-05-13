require Rails.root.join('lib', 'rails_admin', 'introduce_products.rb')
require 'open-uri' 
RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan
  config.current_user_method(&:current_user)
  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.model Store do
    create do
      fields :name, :website, :email, :logo
      field :user, :hidden do
        default_value do
          binding[:view]._current_user.id
        end
      end
    end
    update do
      fields :name, :website, :logo, :email
    end
    list do
      fields :name, :website, :logo, :email
    end
    show do
      fields :name, :website, :logo, :email
    end
  end

  config.model Product do
    create do
      fields :store, :name, :image, :price, :url
      field :user, :hidden do
        default_value do
          binding[:view]._current_user.id
        end
      end
    end
    update do
      fields :store, :name, :image, :price, :url, :image
    end
    list do
      fields :store, :name, :price, :url, :image
    end
    show do
      fields :store, :name, :price, :url, :image, :installments
    end
  end

  config.model Installment do
    create do
      field :user, :hidden do
        default_value do
          binding[:view]._current_user
        end
      end
      field :numberofinstallments, :enum do
        enum do
          (1..48).to_a
        end
      end
      fields :product, :name, :value, :interestrate, :totalvalueplusinterestrate, :paymentsystemname, :paymentsystemgroupname
    end
    update do
      field :numberofinstallments, :enum do
        enum do
          (1..48).to_a
        end
      end
      fields :product, :name, :value, :interestrate, :totalvalueplusinterestrate, :paymentsystemname, :paymentsystemgroupname
    end
    list do
      fields :product, :name, :value, :interestrate, :totalvalueplusinterestrate, :paymentsystemname, :paymentsystemgroupname, :numberofinstallments
    end
    show do
      fields :product, :name, :value, :interestrate, :totalvalueplusinterestrate, :paymentsystemname, :paymentsystemgroupname, :numberofinstallments
    end
  end

  config.actions do
    dashboard do
      except ['User']
    end
    index do
      except ['User']
    end
    new do
      except ['User']
    end
    export do
      except ['User']
    end
    bulk_delete do
      except ['User']
    end
    show do
      except ['User']
    end
    edit do
      except ['User']
    end
    delete do
      except ['User']
    end
    introduce_products do
      only ['Store']
    end
    expunge_products do
      only ['Store']
    end
    show_in_app do
      except [User]
    end
  end
end
