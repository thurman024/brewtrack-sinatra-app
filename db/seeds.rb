Beer.destroy_all
Brewery.destroy_all
Style.destroy_all
User.destroy_all

users = [ {username: "SamAdams", password: "brews"},
  {username: "brewmaster", password: "beer23"}]

styles = [ {name: "lager"}, {name: "pale ale"}, {name: "stout"}]

breweries = [ {name: "Sierra Nevada", location: "California"},
  {name: "Founders", location: "Michigan"},
  {name: "Anheiser Busch", location: "Missouri"}]

users.each do |user|
  User.create(user)
end
u=User.last.id
styles.each do |style|
  Style.create(style)
end
s=Style.last.id
breweries.each do |brewery|
  Brewery.create(brewery)
end
b=Brewery.last.id
beers = [ {name: "Yuengling", style_id: (s-2), brewery_id: b, user_id: u},
  {name: "Founders Bfast Stout", style_id: s, brewery_id: (b-1), user_id: u},
  {name: "Sierra Nevada Pale Ale", style_id: (s-1), brewery_id: (b-2), user_id: (u-1)}]

beers.each do |beer|
  Beer.create(beer)
end
