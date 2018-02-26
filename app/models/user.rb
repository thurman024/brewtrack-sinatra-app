class User < ActiveRecord::Base
  has_many :beers

  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }

end
