class DosesController < ApplicationController

  # cocktail_doses_path POST  cocktails/:id/doses
  def create
    logger.debug "**************** in CREATE DOSES ********************************"
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # logger.debug "#{dose_params}"
    @dose.cocktail = @cocktail
    # if @dose.save
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render 'cocktails/show'
    # end
  end

  # dose DELETE doses/:id
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    cocktail = @dose.cocktail
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
