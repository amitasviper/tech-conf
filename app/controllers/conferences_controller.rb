class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]

  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = Conference.get_all
  end

  def search
    @conferences = Conference.text_search(params)
    respond_to do |format|
      format.html { render 'search' }
      format.json { render json: @conferences, :except => [:created_at, :updated_at, :id, :user_id] }
    end
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
  end


  # GET /conferences/1/edit
  def edit
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = current_user.conferences.create(conference_params)
    respond_to do |format|
      if @conference.valid?
        format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
        format.json { render :show, status: :created, location: @conference }
      else
        format.html { render :new }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
  def update
    respond_to do |format|
      if @conference.update(conference_params)
        format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
        format.json { render :show, status: :ok, location: @conference }
      else
        format.html { render :edit }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to conferences_url, notice: 'Conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conference
    @conference = Conference.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def conference_params
    filtered_params = params.require(:conference).permit(:title, :location, :description, :url, :start_date, :end_date)
    filtered_params[:start_date] = filtered_params[:start_date].to_date
    filtered_params[:end_date] = filtered_params[:end_date].to_date
    filtered_params
  end
end
