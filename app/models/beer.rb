class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  belongs_to :user
  # validates :name, presence: true, uniqueness: { case_sensitive: false }

end
