class FiliksController < ApplicationController
  before_action :set_filik, only: [:show, :edit, :update, :destroy]

  # GET /filiks
  # GET /filiks.json
  def index
    @filiks = Dir.entries("#{Rails.root}/public/filiks")-['.', '..']#Filik.all
  end

  # GET /filiks/1
  # GET /filiks/1.json
  def show
  end

  # GET /filiks/new
  def new
    # @filik = Filik.new
  end

  # GET /filiks/1/edit
  def edit
  end

  # POST /filiks
  # POST /filiks.json
  def create
    # @filik = Filik.new(filik_params)
    if params[:filik][:old_name].present?
      File.rename("#{Rails.root}/public/filiks/#{params[:filik][:old_name]}", "#{Rails.root}/public/filiks/#{params[:filik][:name]}")
      redirect_to filiks_path, notice: 'Filik was successfully updated.'
    else
      name = params[:filik][:name].original_filename
      directory = "public/filiks"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:filik][:name].read) }
      redirect_to filiks_path, notice: 'Filik was successfully created.'
    end
  end

  # PATCH/PUT /filiks/1
  # PATCH/PUT /filiks/1.json
  def update
    File.rename
    respond_to do |format|
      if @filik.update(filik_params)
        format.html { redirect_to @filik, notice: 'Filik was successfully updated.' }
        format.json { render :show, status: :ok, location: @filik }
      else
        format.html { render :edit }
        format.json { render json: @filik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filiks/1
  # DELETE /filiks/1.json
  def destroy
    path = File.delete("#{Rails.root}/public/filiks/#{params[:filename]}")
    redirect_to filiks_url, notice: 'Filik was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filik
      # @filik = Filik.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filik_params
      params.require(:filik).permit(:name, :size)
    end
end
