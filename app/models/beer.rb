class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  belongs_to :user

  def slug
    self.name.gsub(/[!?,'." "]/, '-').downcase
  end

  def self.find_by_slug(slug_name)
    Beer.all.detect {|beer| beer.slug == slug_name}
  end

end
