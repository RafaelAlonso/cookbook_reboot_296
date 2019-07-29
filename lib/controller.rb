require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    list = @cookbook.all
    @view.mostrar_receitas(list)
  end

  def create
    # criar uma nova receita
    # guardar esse receita
    name = @view.input_recipe_name
    description = @view.input_recipe_description
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # listar as receitas
    # selecionar a receita
    # eliminar uma receita do repositorio
    list
    index = @view.input_recipe_index
    @cookbook.remove_recipe(index)
  end
end
