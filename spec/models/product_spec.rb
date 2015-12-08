require 'rails_helper'

describe Product do
  
  context "when the product has comments"
    before do
      @product = Product.create!(:name => "champkidsbicycle")
      @user =User.create!(:email => "thatomkt@me.com", :password => "Mntht@!1" )
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Nice bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Very nice bike!")
    end
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    context "when product has no name" do
      before do
       @product = Product.create(:description => "This is a test")
      end

      it 'is an invalid product' do
        expect(@product).not_to be_valid
      end
    end
end