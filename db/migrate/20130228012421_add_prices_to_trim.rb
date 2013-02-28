class AddPricesToTrim < ActiveRecord::Migration
  def change
  	add_column :trims, :base_msrp, :string
  	add_column :trims, :base_invoice, :string
  	add_column :trims, :tmv, :string
  	add_column :trims, :used_tmv_retail, :string
  	add_column :trims, :used_tmv_pp, :string
  	add_column :trims, :used_tmv_tradein, :string
  end
end
