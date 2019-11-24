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
    #logger.debug "in create"
    @cocktail = Cocktail.new(cocktail_params)
    #@cocktail.url = '~/code/ndrean/rails-mister-cocktail/app/assets/images/'+@cocktail.url
    if @cocktail.save
      # we go to show
      redirect_to cocktail_path(@cocktail)
    else
      render :show
    end
  end

  # if create OK, we go to show

  # cocktail_path, GET cocktails/:id (view: show, _partial empty)
  def show
    logger.debug "in show"
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all.order(:name)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'show'
    end
  end

  # from root, we can edit
  # the view edit, same as  show, with _partial been updated)

  # edit_cocktail_path, PATCH cocktails/:id
  def edit
    raise
    @cocktail = Cocktail.find(cocktail_params)
    @dose = @cocktail.doses
    @ingredients = Ingredient.all.order(:name)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


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


