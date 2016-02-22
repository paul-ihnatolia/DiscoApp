class UserSession < Authlogic::Session::Base
  attr_accessor :email, :password
end