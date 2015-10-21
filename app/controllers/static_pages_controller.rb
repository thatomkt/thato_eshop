class StaticPagesController < ApplicationController
  def index
  end
end

class StaticPagesController < ApplicationController

  def landing_page
  	@Featured_product = Product.first
  end
  
end
