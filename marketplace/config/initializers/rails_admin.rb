RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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
    show_in_app do
      except [User, Installment]
    end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
