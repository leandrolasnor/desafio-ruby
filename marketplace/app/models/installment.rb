class Installment
    include Mongoid::Document

    belongs_to :product

    field :value,                       type: Float,    default: 0.0
    field :interestrate,                 type: Integer,  default: 0   
    field :totalvalueplusinterestrate,   type: Float,    default: 0.0
    field :numberofinstallments,         type: Integer,  default: 1
    field :paymentsystemname,            type: String,   default: ""
    field :paymentsystemgroupname,       type: String,   default: ""
    field :name,                         type: String,   default: ""
end
