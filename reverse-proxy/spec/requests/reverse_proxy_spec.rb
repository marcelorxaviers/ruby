require "rails_helper"

RSpec.describe "Reverse Proxy", :type => :request do
  let!(:rule) { Rule.create(from_domain: 'http://writter.rwdev.io/some', to_domain: 'http://ios.rwdev.io/some') }
  let(:expected_response) { "[\"You are at: #{rule.to_domain}\"]" }

  context "from old domain" do
    it "redirects to the new domain" do
      get rule.from_domain

      expect(response).to redirect_to(rule.to_domain)
      follow_redirect!
      expect(response.body).to eq expected_response
    end
  end

  context "from new domain" do
    it "renders age" do
      get rule.to_domain

      expect(response).not_to redirect_to(rule.to_domain)
      expect(response.body).to eq expected_response
    end
  end
end