class Rule < ApplicationRecord
  validates :from_domain, presence: true
  validates :to_domain, presence: true

  scope :query, ->(filter) do
    where("from_domain LIKE ? OR to_domain LIKE ?", "%#{filter}%", "%#{filter}%")
  end

  def self.fetch_to_url(from)
    rule = Rule.where(from_domain: from).first
    return rule.to_domain if rule.present?
 
    Rule.select do |rule|
      Regexp.new(rule.from_domain).match?(from)
    end.lazy.first&.to_domain
  end
end
