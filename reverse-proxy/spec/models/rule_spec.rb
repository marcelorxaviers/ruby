require "rails_helper"

RSpec.describe Rule, type: :model do
  
  describe ".fetch_to_url" do
    let!(:rule) { Rule.create(from_domain: 'http://something.com', to_domain: 'http://somethingelse.com') }
    
    context "exact match" do

      it "returns url" do
        expect(Rule.fetch_to_url(rule.from_domain)).to eq rule.to_domain
      end
    end

    context "partial match" do
      it "returns url" do
        url = "#{rule.from_domain}/lilmore"
        expect(Rule.fetch_to_url(url)).to eq rule.to_domain
      end
    end

    context "regex match" do
      let!(:regex_rule) { Rule.create(from_domain: '\Ahttp:\/\/w+.com\z', to_domain: 'http://regexed.com') }
      it "returns url" do
        expect(Rule.fetch_to_url(regex_rule.from_domain)).to eq regex_rule.to_domain
      end
    end

    context "unmatched" do
      it "returns nil" do
        expect(Rule.fetch_to_url("")).to be nil
      end
    end
  end

end