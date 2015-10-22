class StaticPagesController < ApplicationController
	
  def index
  end

  def landing_page
  	@Featured_product = Product.first
  end
  
end
