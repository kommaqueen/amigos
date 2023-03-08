class CheckInsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @check_in = Check_in.new
  end

  def create
    @place = Place.find(params[:place_id])
    @check_in = CheckIn.new
    @check_in.place = @place
    @check_in.user = current_user
    respond_to do |format|
      if @check_in.save
        format.html { redirect_to place_path(@place) }
        format.json
      else
        format.html { render "places/show", status: :unprocessable_entity }
        format.json
      end
    end
  end
end
