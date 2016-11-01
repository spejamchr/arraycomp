class CompArraysController < ApplicationController
  before_action :set_comp_array, only: [:show, :edit, :update, :destroy]

  # GET /comp_arrays
  # GET /comp_arrays.json
  def index
    @comp_arrays = CompArray.all.includes(:customer, :components)
  end

  # GET /comp_arrays/1
  # GET /comp_arrays/1.json
  def show
  end

  # GET /comp_arrays/new
  def new
    @comp_array = CompArray.new
  end

  # GET /comp_arrays/1/edit
  def edit
  end

  # POST /comp_arrays
  # POST /comp_arrays.json
  def create
    @comp_array = CompArray.new(comp_array_params)

    respond_to do |format|
      if @comp_array.save
        format.html { redirect_to @comp_array, notice: 'Array was successfully created.' }
        format.json { render :show, status: :created, location: @comp_array }
      else
        format.html { render :new }
        format.json { render json: @comp_array.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comp_arrays/1
  # PATCH/PUT /comp_arrays/1.json
  def update
    respond_to do |format|
      if @comp_array.update(comp_array_params)
        format.html { redirect_to @comp_array, notice: 'Array was successfully updated.' }
        format.json { render :show, status: :ok, location: @comp_array }
      else
        format.html { render :edit }
        format.json { render json: @comp_array.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comp_arrays/1
  # DELETE /comp_arrays/1.json
  def destroy
    @comp_array.destroy
    respond_to do |format|
      format.html { redirect_to comp_arrays_url, notice: 'Array was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comp_array
      @comp_array = CompArray.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comp_array_params
      params.require(:comp_array).permit(:description, :install_date, :initial_value, :location, :customer_id, :serial_number)
    end
end
