class CreateTrims < ActiveRecord::Migration
  def change
    create_table :trims do |t|
    	t.integer :model_id
    	t.string :name
      t.timestamps
    end
  end
end
