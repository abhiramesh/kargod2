class AddYearToModel < ActiveRecord::Migration
  def change
  	add_column :models, :year, :integer
  end
end
