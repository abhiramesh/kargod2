class Make < ActiveRecord::Base
   attr_accessible :name

   has_many :models

end
