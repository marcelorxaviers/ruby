require "rails_helper"

RSpec.describe "Rule", :type => :request do
  let!(:rule) { Rule.create(from_domain: 'old', to_domain: 'new') }
  let!(:another_rule) { Rule.create(from_domain: 'filter me', to_domain: 'blah') }

  context "index" do
    context "without filters" do
      it "lists all rules" do
        get '/rules.json'

        rules = JSON.parse(response.body)
        expect(rules.size).to eq 2
      end
    end
  end

  context "with filters" do
    let!(:another_rule) { Rule.create(from_domain: 'filter me', to_domain: 'blah') }
    it "lists all rules that match the filter" do
      get "/rules.json?query=#{another_rule.to_domain}"

      rules = JSON.parse(response.body)
      expect(rules.size).to eq 1
      expect(rules.first['id']).to eq another_rule.id
    end
  end
end