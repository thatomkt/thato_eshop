require 'rails_helper'

  describe StaticPagesController, :type => :controller do
    context "GET #index" do 
      before do 
        get :index
      end

      it "responds successfully with an http 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        expect(response).to render_template("index")
      end
    end
  end