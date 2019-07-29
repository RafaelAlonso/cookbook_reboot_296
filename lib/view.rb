class View
  def mostrar_receitas(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done ? "[X]" : "[ ]"
      puts "#{index}. #{done} #{recipe.name} (#{recipe.prep_time})"
      puts "#{recipe.description}\n"
    end
  end

  def input_recipe_name
    puts "Write your recipe name"
    get_recipe_name = gets.chomp
    return get_recipe_name
  end

  def input_recipe_description
    puts "Write your recipe description"
    get_recipe_description = gets.chomp
    return get_recipe_description
  end

  def input_recipe_index
    puts "Write your recipe index"
    get_recipe_index = gets.chomp.to_i
    return get_recipe_index
  end

  def input_ingredient
    puts "What ingredient would you like a recipe for?"
    get_ingredient = gets.chomp
    return get_ingredient
  end

  def input_time
    puts "Write your recipe prep time"
    get_time = gets.chomp
    return get_time
  end
end
