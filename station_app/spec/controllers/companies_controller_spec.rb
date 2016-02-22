# spec/controllers/companies_controller_spec.rb

require 'spec_helper'

describe CompaniesController do
  user = FactoryGirl.create(:user)
  sign_in(user)

  describe "GET #index" do
    it "populates an array of companies" do
  		company = FactoryGirl.create(:company, user: user)
  		user.companies << company
      get :index
      assigns(:companies).should eq([company])
    end

    it "returns an empty array if the user has no companies" do
      get :index
      assigns(:companies).should eq([])
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
  	it "assigns the requested company to @company" do
      company = FactoryGirl.create(:company)
      get :show, id: company
      assigns(:company).should eq(company)
    end
  
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:company)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "renders the #new view" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new company" do
        expect{
          post :create, company: FactoryGirl.attributes_for(:company)
        }.to change(Company,:count).by(1)
      end
    
	    it "redirects to the new company" do
	      post :create, company: FactoryGirl.attributes_for(:company)
	      response.should redirect_to Company.last
	    end
	  end
	  
	  context "with invalid attributes" do
	    it "does not save the new company" do
	      expect{
	        post :create, company: FactoryGirl.attributes_for(:invalid_company)
	      }.to_not change(Company,:count)
	    end
	    
	    it "re-renders the new method" do
	      post :create, company: FactoryGirl.attributes_for(:invalid_company)
	      response.should render_template :new
	    end
	  end 
	end

	describe 'PUT update' do
	  before :each do
	    @company = FactoryGirl.create(:company, name: "Cia SA")
	    @token = @company.zoho_token.dup
	  end
	  
	  context "valid attributes" do
	    it "located the requested @company" do
	      put :update, id: @company, company: FactoryGirl.attributes_for(:company)
	      assigns(:company).should eq(@company)      
	    end
	  
	    it "changes @company's attributes" do
	      put :update, id: @company, 
	        company: FactoryGirl.attributes_for(:company, name: "Boa Cia ltda", zoho_token: @token)
	      @company.reload
	      @company.name.should eq("Boa Cia ltda")
	      @company.zoho_token.should eq(@token)
	    end
	  
	    it "redirects to the updated company" do
	      put :update, id: @company, company: FactoryGirl.attributes_for(:company)
	      response.should redirect_to @company
	    end
	  end
	  
	  context "invalid attributes" do
	    it "locates the requested @company" do
	      put :update, id: @company, company: FactoryGirl.attributes_for(:invalid_company)
	      assigns(:company).should eq(@company)      
	    end
	    
	    it "does not change @company's attributes" do
	      put :update, id: @company, 
	        company: FactoryGirl.attributes_for(:company, name: "Boa Cia ltda", zoho_token: nil)
	      @company.reload
	      @company.name.should_not eq("Boa Cia ltda")
	      @company.zoho_token.should eq(@token)
	    end
	    
	    it "re-renders the edit method" do
	      put :update, id: @company, company: FactoryGirl.attributes_for(:invalid_company)
	      response.should render_template :edit
	    end
	  end
	end

	describe 'DELETE destroy' do
	  before :each do
	    @company = FactoryGirl.create(:company)
	  end
	  
	  it "deletes the company" do
	    expect{
	      delete :destroy, id: @company        
	    }.to change(Company,:count).by(-1)
	  end
	    
	  it "redirects to companies#index" do
	    delete :destroy, id: @company
	    response.should redirect_to companies_url
	  end
	end
end