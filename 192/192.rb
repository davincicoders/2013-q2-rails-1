# Given any recipe name, list all the other recipes written by that same author.
require './connect_to_db.rb'

puts "Enter a recipe name (e.g. Brownies):"
recipe_name = readline.chomp

recipe = Recipe.where(recipe_name: recipe_name).first # pull the first object from the Recipes d'base where recipe name reflects what was input by the user.
recipe.author_id      # Provide the author_id for the particular recipe.

authors_recipes = Recipe.where(author_id: recipe.author_id)

for authors_recipe in authors_recipes
  if authors_recipe.recipe_name == recipe_name
  else
    puts authors_recipe.recipe_name
  end
end

# TODO: List the names of the other recipes by this same author.
# Don't include the recipe name that was entered at the beginning.
# If you can't find a recipe by that name, output Unknown recipe.
