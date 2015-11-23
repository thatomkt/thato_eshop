class Product < ActiveRecord::Base
  has_many :comments
  has_many :orders
end

#def avarage_rating
 # comments.avarage(:rating).to_f
#end
