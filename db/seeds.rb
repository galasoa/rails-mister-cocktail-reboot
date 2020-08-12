require 'open-uri'

puts 'Destroying ingredients...'
Ingredient.destroy_all if Rails.env.development?

puts 'Destroying cocktails...'
Cocktail.destroy_all if Rails.env.development?

puts 'Creating ingredients...'
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  new_ingredient = ingredient["strIngredient1"]
  Ingredient.create(name: new_ingredient)
  puts "Creating #{new_ingredient}..."
end
