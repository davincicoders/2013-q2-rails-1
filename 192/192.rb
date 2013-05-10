require './connect_to_db.rb'

puts "Enter a recipe name (e.g. Brownies):"
recipe_name = readline.chomp

# TODO: List the names of the other recipes by this same author.
# Don't include the recipe name that was entered at the beginning.
# If you can't find a recipe by that name, output Unknown recipe.

recipe = Recipe.where(recipe_name: recipe_name).first

if recipe != nil
  for other_recipe in recipe.author.recipes
    if other_recipe.id != recipe.id
      puts other_recipe.recipe_name
    end
  end
else
  puts "Unknown recipe."
end