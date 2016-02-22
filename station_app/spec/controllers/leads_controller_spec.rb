# spec/controllers/leads_controller_spec.rb

require 'spec_helper'

describe LeadsController do
  user = FactoryGirl.create(:user)
  company = FactoryGirl.create(:company, user: user)
  user.companies << company
  sign_in(user)

  describe "GET #index" do
    it "populates an array of leads" do
      lead = FactoryGirl.create(:lead, company: company)
      get :index
      assigns(:leads).should eq([lead])
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
  	it "assigns the requested lead to @lead" do
      lead = FactoryGirl.create(:lead)
      get :show, id: lead
      assigns(:lead).should eq(lead)
    end
  
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:lead)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "renders the #new view for users that have at least one company" do
      get :new
      response.should render_template :new
    end

    it "do not renders the #new view for users that have no companies" do
      user.companies = Array.new
      get :new
      response.should_not render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new lead" do
        expect{
          post :create, lead: FactoryGirl.attributes_for(:lead)
        }.to change(Lead,:count).by(1)
      end
    
	    it "redirects to the new lead" do
	      post :create, lead: FactoryGirl.attributes_for(:lead)
	      response.should redirect_to Lead.last
	    end
	  end
	  
	  context "with invalid attributes" do
	    it "does not save the new lead" do
	      expect{
	        post :create, lead: FactoryGirl.attributes_for(:invalid_lead)
	      }.to_not change(Lead,:count)
	    end
	    
	    it "re-renders the new method" do
	      post :create, lead: FactoryGirl.attributes_for(:invalid_lead)
	      response.should render_template :new
	    end
	  end 
	end

	describe 'PUT update' do
	  before :each do
	    @lead = FactoryGirl.create(:lead, name: "Marco", last_name: "Xavier")
	  end
	  
	  context "valid attributes" do
	    it "located the requested @lead" do
	      put :update, id: @lead, lead: FactoryGirl.attributes_for(:lead)
	      assigns(:lead).should eq(@lead)      
	    end
	  
	    it "changes @lead's attributes" do
	      put :update, id: @lead, 
	        lead: FactoryGirl.attributes_for(:lead, name: "Marcelo", last_name: "Xavier")
	      @lead.reload
	      @lead.name.should eq("Marcelo")
	      @lead.last_name.should eq("Xavier")
	    end
	  
	    it "redirects to the updated lead" do
	      put :update, id: @lead, lead: FactoryGirl.attributes_for(:lead)
	      response.should redirect_to @lead
	    end
	  end
	  
	  context "invalid attributes" do
	    it "locates the requested @lead" do
	      put :update, id: @lead, lead: FactoryGirl.attributes_for(:invalid_lead)
	      assigns(:lead).should eq(@lead)      
	    end
	    
	    it "does not change @lead's attributes" do
	      put :update, id: @lead, 
	        lead: FactoryGirl.attributes_for(:lead, name: "Marcelo", last_name: nil)
	      @lead.reload
	      @lead.name.should_not eq("Marcelo")
	      @lead.last_name.should eq("Xavier")
	    end
	    
	    it "re-renders the edit method" do
	      put :update, id: @lead, lead: FactoryGirl.attributes_for(:invalid_lead)
	      response.should render_template :edit
	    end
	  end
	end

	describe 'DELETE destroy' do
	  before :each do
	    @lead = FactoryGirl.create(:lead)
	  end
	  
	  it "deletes the lead" do
	    expect{
	      delete :destroy, id: @lead        
	    }.to change(Lead,:count).by(-1)
	  end
	    
	  it "redirects to leads#index" do
	    delete :destroy, id: @lead
	    response.should redirect_to leads_url
	  end
	end
end