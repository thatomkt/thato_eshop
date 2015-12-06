require 'rails_helper'

describe Product do
  
  before do
    @product = Product.create(:name => "champkidsbicycle")
  end
end