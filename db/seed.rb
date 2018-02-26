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

beers = [ {name: "Yuengling", style_id: 1, brewery_id: 3, user_id: 2},
  {name: "Founders Bfast Stout", style_id: 3, brewery_id: 2, user_id: 2},
  {name: "Sierra Nevada Pale Ale", style_id: 2, brewery_id: 1, user_id: 1}]
