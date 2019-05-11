require Rails.root.join('lib', 'rails_admin', 'custom_actions.rb')
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
      fields :name, :website, :email
      field :user_id, :hidden do
        default_value do
          binding[:view]._current_user.id
        end
      end
      field :logo do
        thumb_method :thumb
        delete_method :asset_delete
        cache_method :asset_cache
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
      fields :store, :name, :price, :url
      field :user_id, :hidden do
        default_value do
          binding[:view]._current_user.id
        end
      end
      field :image do
        thumb_method :thumb
        delete_method :asset_delete
        cache_method :asset_cache
      end
    end
    update do
      fields :store, :name, :price, :url, :image
    end
    list do
      fields :store, :name, :price, :url, :image
    end
    show do
      fields :store, :name, :price, :url, :image
    end
  end

  config.actions do
    dashboard do
      except [User, Installment]
    end
    index do
      except [User, Installment]
    end
    new do
      except [User, Installment]
    end
    export do
      except [User, Installment]
    end
    bulk_delete do
      except [User, Installment]
    end
    show do
      except [User, Installment]
    end
    edit do
      except [User, Installment]
    end
    delete do
      except [User, Installment]
    end
    introduce_products
    expunge_products
    show_in_app do
      except [User, Installment]
    end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
