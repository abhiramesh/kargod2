class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
    	t.string :name
    	t.string :image
    	t.integer :make_id
      t.timestamps
    end
  end
end
