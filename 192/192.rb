require './connect_to_db.rb'
require 'pry'

puts "Enter a recipe name (e.g. Brownies):"
recipe_name = readline.chomp

# TODO: List the names of the other recipes by this same author.
# Don't include the recipe name that was entered at the beginning.
# If you can't find a recipe by that name, output Unknown recipe.

recipe = Recipe.where(recipe_name: recipe_name).first
author = recipe.author

recipes = author.recipes
for recipe in recipes
  puts recipe.recipe_name if recipe.recipe_name != recipe_name
end
