class User < ActiveRecord::Base

  has_many :meals, -> { order "day DESC" }, foreign_key: "user_id", class_name: "Meal", dependent: :destroy

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  validates :expected_calories, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }

  include DeviseTokenAuth::Concerns::User

  enum role: { regular: 'regular', manager: 'manager', admin: 'admin' }

  def current_token
    tokens.keys.last != 'default' ? tokens.keys.last : tokens.keys[-2]
  end

  def jsonify
    self.as_json(only: [:id, :name, :email, :role, :expected_calories])
  end

  def parsed_errors
    self.errors.messages.map { |k, v| "#{k}: #{v.join(' and/or ')}" }
  end

end
