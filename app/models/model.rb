class Model < ActiveRecord::Base
   attr_accessible :name, :image, :make_id, :year

   belongs_to :make
   has_many :trims

end
