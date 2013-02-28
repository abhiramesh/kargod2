class Trim < ActiveRecord::Base
   attr_accessible :name, :model_id, :base_msrp, :base_invoice, :tmv, :used_tmv_retail, :used_tmv_pp, :used_tmv_tradein
   
   belongs_to :model
end
