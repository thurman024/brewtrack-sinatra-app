class Brewery < ActiveRecord::Base
  has_many :beers

  def slug
    self.name.gsub(/[!?,'." "]/, '-').downcase
  end

  def self.find_by_slug(slug_name)
    Brewery.all.detect {|brewery| brewery.slug == slug_name}
  end

end
