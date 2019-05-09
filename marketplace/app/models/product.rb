class Product
    include Mongoid::Document

    has_many :installment
    belongs_to :store

    field :name,        type: String, default: ""
    field :price,       type: Float,  default: 0.0
    field :image,       type: String, default: ""
    field :url,         type: String, default: ""
end
