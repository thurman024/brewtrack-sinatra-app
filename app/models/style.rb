class Style < ActiveRecord::Base
  has_many :beers

  def slug
    self.name.gsub(/[!?,'." "]/, '-').downcase
  end

  def self.find_by_slug(slug_name)
    Style.all.detect {|style| style.slug == slug_name}
  end

end
