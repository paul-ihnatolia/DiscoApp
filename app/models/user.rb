class User < ActiveRecord::Base
  attr_accessor :current_password

  validates_presence_of :current_password, if: :password, on: :update
  validates_presence_of :password, if: :current_password, on: :update
  validate  :current_password_validation, on: :update
  validates_presence_of :email

  disable_perishable_token_maintenance(true)

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  enum role: {
    admin: 1
  }

  private
  def current_password_validation
    if password.present? && !valid_password?(current_password)
      errors.add(:current_password, 'is incorrect')
    end
  end
end
