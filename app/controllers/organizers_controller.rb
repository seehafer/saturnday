class OrganizersController < ApplicationController
  def new
    @organizer = Organizer.new
  end

  def index
    logger.error RGeo
    if params.has_key? :ne_latitude then
      return render json: Organizer.attendable().in_box(params[:ne_latitude], params[:ne_longitude], params[:sw_latitude], params[:sw_longitude])
    end
    render json: Organizer.attendable()
  end

  def create
    @page_title = 'Ring Masters - Register a viewing party'
    @organizer = Organizer.new(organizer_params)
    @organizer.num_attendees = 0 # default number of attendees
    if @organizer.save
      flash[:success] = "Thanks for signing up!"
      redirect_to root_path
    else
      # handle unsuccessful save
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def search
    render json: Organizer.close_to(params[:latitude], params[:longitude], params[:meters])
  end

  private
  def organizer_params
    params.require(:organizer).permit(:name, :email, :club_name, :secondary_name, :secondary_email, :address, :location, :zipcode, :num_scopes, :max_attendees)
  end
end
