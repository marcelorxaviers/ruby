class Company < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :users
  has_many :leads, dependent: :destroy
  accepts_nested_attributes_for :leads

  validates :name, uniqueness: true, :length => { :minimum => 3, :maximum => 30 }, :allow_blank => false
  validates_length_of :zoho_token, :minimum => 30, :maximum => 35, :allow_blank => false
  end
