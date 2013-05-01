# John

require './connect_to_db.rb'

puts "Enter a recipe name (e.g. Brownies):"
recipe_name = readline.capitalize.chomp

# first lookup recipe.
recipe = Recipe.where(recipe_name: recipe_name).first

if recipe == nil # if recipe not known - Unknown recipe.
  puts "Unknown recipe."
else # lookup author and other recipes.
  author = recipe.author
  recipes = author.recipes
    for recipe in recipes # loop through their recipes.
      if recipe.recipe_name != recipe_name # not the recipe entered.
        puts recipe.recipe_name # puts other recipes.
      end
    end
end

# TODO: List the names of the other recipes by this same author.
# Don't include the recipe name that was entered at the beginning.
# If you can't find a recipe by that name, output Unknown recipe.
