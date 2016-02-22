class Lead < ActiveRecord::Base
  include ZohoWrapper::ActiveRecord

  belongs_to :company

  validates :name, :length => { :minimum => 3, :maximum => 60}, :presence => true, :allow_blank => false
  validates :last_name, :length => { :minimum => 3, :maximum => 60}, :presence => true, :allow_blank => false
  validates :email, :presence => true, uniqueness: true
  validates :company_id, :presence => true

  def full_name
    [name, last_name].join " "
  end

  def zoho_lead
    {
      :first_name => name,
      :last_name => last_name,
      :title => job_title,
      :email => email
    }
  end

  def zoho_token
    company.zoho_token
  end
end