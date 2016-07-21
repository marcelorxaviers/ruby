class User < ActiveRecord::Base

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  enum role: { regular: 'regular', manager: 'manager', admin: 'admin' }

  def current_token
    tokens.keys.last != 'default' ? tokens.keys.last : tokens.keys[-2]
  end

  def jsonify
    self.as_json(only: [:id, :name, :email, :role])
  end


  def parsed_errors
    self.errors.messages.map { |k, v| "#{k}: #{v.join(' and/or ')}" }
  end

end
