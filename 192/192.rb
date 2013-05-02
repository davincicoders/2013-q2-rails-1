require './connect_to_db.rb'

puts "Enter a recipe name (e.g. Brownies):"
recipe_name = readline.chomp

recipe = Recipe.where(recipe_name: recipe_name).first
unless recipe == nil
	for other_recipes in recipe.author.recipes
		if other_recipes.id != recipe.id
			puts other_recipes.recipe_name
		end
	end

else
	puts "Unknown recipes"
end


# TODO: List the names of the other recipes by this same author.
# Don't include the recipe name that was entered at the beginning.
# If you can't find a recipe by that name, output Unknown recipe.
