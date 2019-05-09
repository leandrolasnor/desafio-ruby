class Product
    include Mongoid::Document
    belongs_to :store

    field :name,        type: String, default: ""
    field :price,       type: Float,  default: 0.0
    field :image,       type: String, default: ""
    field :url,         type: String, default: ""
end
