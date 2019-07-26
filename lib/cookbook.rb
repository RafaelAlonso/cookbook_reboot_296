require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save
  end

  def load
    CSV.foreach(@csv_file_path, 'r') do |row|
      name = row[0]
      description = row[1]
      recipe = Recipe.new(name, description)
      @recipes << recipe
    end
    # abrir arquivo csv (ler)
    # para cada linha do arquivo criaremos uma nova receita :)
    # inserir receita no repositorio
  end

  def save
    CSV.open(@csv_file_path, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
    # abrir arquivo csv
    # salvar cada uma das receitas <3
  end
end
