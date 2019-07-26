class View

  def mostrar_receitas(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index}: #{recipe.name} #{recipe.description}"
    end
  end

  def get_recipe_name
    puts "Write your recipe name"
    get_recipe_name = gets.chomp
    return get_recipe_name
  end

  def get_recipe_description
    puts "Write your recipe description"
    get_recipe_description = gets.chomp
    return get_recipe_description
  end

  def get_recipe_index
    puts "Write your recipe index"
    get_recipe_index = gets.chomp.to_i
    return get_recipe_index
  end

end

