class User < ActiveRecord::Base
  validate :email, presence: true, uniqueness: {case_sensitive: false}
  :name, presence: true, uniqueness: {length: <20}

  has_secure_password
end
