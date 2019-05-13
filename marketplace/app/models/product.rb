require 'cancan/model_adapters/mongoid_adapter'
require 'carrierwave/mongoid'
class Product
    include Mongoid::Document
    attr_accessor :asset_delete, :asset_cache
    mount_uploader :image, IUploader
    belongs_to :user
    belongs_to :store
    has_many :installments, dependent: :destroy

    field :name,        type: String, default: ""
    field :price,       type: Float,  default: 0.0
    field :image,       type: String, default: ""
    field :url,         type: String, default: ""

    validates_presence_of :name, :price
    validates_uniqueness_of :name
    validates_format_of :url, :with => /https?:\/\/[\S]+/, :allow_blank => true, :message => "Invalid"
end
