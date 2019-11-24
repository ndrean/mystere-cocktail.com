class CocktailsController < ApplicationController
  # root_path, GET /
  def index
    @cocktails = Cocktail.all
  end

  # new_cocktail_path, GET cocktails/new (view: new)
  def new
    @cocktail = Cocktail.new
  end

  # from new, on submit we go to create (no view)

  # cocktail, POST cocktails/:id
  def create
    logger.debug "******************** IN CREATE -x-x-x-x-x-x-xx-x-x-x-x"
    @cocktail = Cocktail.new(cocktail_params)
    logger.debug "#{cocktail_params} ==================================="
    #base_url = '~/code/ndrean/rails-mister-cocktail/app/assets/images/'
    # @cocktail.url = base_url+@cocktail.url
    if @cocktail.save
      # we go to show
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/new'
    end
  end

  # if create OK, we go to show

  # cocktail_path, GET cocktails/:id (view: show, _partial empty)
  def show
    logger.debug "******************* IN SHOW  ----------------------"
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all.order(:name)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'show'
    end
  end

  # cocktail DELETE cocktails/:ind
  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :url)
  end
end


