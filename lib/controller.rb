require 'open-uri'
require 'nokogiri'
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
    prep_time = @view.input_time
    recipe = Recipe.new(name, description, prep_time)
    @cookbook.add_recipe(recipe)
  end

  def import_recipe_from_marmiton
    results = []
    # pegar palavra chave do usuario
    ingredient = @view.input_ingredient
    # acessar a url com aquela palavra chave
    url = "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{ingredient}"
    html_doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    # buscar a informação
    ## pega 5 receitas
    recipe_cards = html_doc.search('.recipe-card').first(5)
    recipe_cards.each do |recipe_card|
      name = recipe_card.search('.recipe-card__title').text.strip
      description = recipe_card.search('.recipe-card__description').text.strip
      prep_time = recipe_card.search('.recipe-card__duration__value').text.strip
      results << Recipe.new(name, description, prep_time)
    end

    # mostrar as receitas para o usuário
    @view.mostrar_receitas(results)
    # perguntar qual é o índice da receita que ele quer
    index = @view.input_recipe_index
    # salva a receita no repositório do cookbook
    @cookbook.add_recipe(results[index])
  end

  def destroy
    # listar as receitas
    # selecionar a receita
    # eliminar uma receita do repositorio
    list
    index = @view.input_recipe_index
    @cookbook.remove_recipe(index)
  end

  def mark_as_done
    # listar receitas
    list
    #perguntar qual receita eh escolhida
    marked = @view.input_recipe_index
    #salvar
    @cookbook.check_and_save(marked)
  end
end
