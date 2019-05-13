require 'cancan/model_adapters/mongoid_adapter'
require 'carrierwave/mongoid'
class Store
    include Mongoid::Document
    attr_accessor :asset_delete, :asset_cache
    mount_uploader :logo, IUploader
    belongs_to :user
    has_many :products, dependent: :destroy
    field :name,    type: String, default:""
    field :website, type: String,  default: ""
    field :logo,    type: String, default: ""
    field :email,   type: String, default: ""

    validates_presence_of :name, :email
    validates_uniqueness_of :email
    validates_uniqueness_of :name
    validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :allow_blank => false, :message => "Address Invalid"
    validates_format_of :website, :with => /https?:\/\/[\S]+/, :allow_blank => true, :message => "Invalid"
end
