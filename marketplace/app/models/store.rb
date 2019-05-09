class Store
    include Mongoid::Document

    field :name,    type: String, default: ""
    field :website, type: String,  default: ""
    field :logo,    type: String, default: ""
    field :email,   type: String, default: ""
    field :users,   type: Array, default: []
end
