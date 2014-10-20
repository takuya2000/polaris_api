module V1
class HonyakusController < ApplicationController
  before_action :set_honyaku, only: [:show, :edit, :update, :destroy]
 # before_action :restrict_access
  
  # GET /honyakus
  # GET /honyakus.json
  def index
    @honyakus = Honyaku.all
    render json: @honyakus
  end

  # GET /honyakus/1
  # GET /honyakus/1.json
  def show
    render json: @honyakus
  end

  # GET /honyakus/new
   def new
    @honyaku = Honyaku.new
   end

  # GET /honyakus/1/edit
  def edit
  end


  def regist
    @reg = ApiKey.new(regist_params)
    if @reg.save
      render json: @reg
    else
      render json: @reg.errors
    end
  end

  # POST /honyakus
  # POST /honyakus.json
  def create
    @honyaku = Honyaku.new(honyaku_params)

    respond_to do |format|
      if @honyaku.save
        format.html { redirect_to @honyaku, notice: 'Honyaku was successfully created.' }
        format.json { render :show, status: :created, location: @honyaku }
      else
        format.html { render :new }
        format.json { render json: @honyaku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /honyakus/1
  # PATCH/PUT /honyakus/1.json
  def update
    respond_to do |format|
      if @honyaku.update(honyaku_params)
        format.html { redirect_to @honyaku, notice: 'Honyaku was successfully updated.' }
        format.json { render :show, status: :ok, location: @honyaku }
      else
        format.html { render :edit }
        format.json { render json: @honyaku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /honyakus/1
  # DELETE /honyakus/1.json
  def destroy
    @honyaku.destroy
    respond_to do |format|
      format.html { redirect_to honyakus_url, notice: 'Honyaku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def restrict_access
      authenticate_or_request_with_http_token do |token,options|
        ApiKey.exists?(access_token: token)
      end
    end


    def set_honyaku
      @honyaku = Honyaku.find(params[:id])
    end

    def regist_params
      params.require(:api_key).permit(:user_name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def honyaku_params
      params.require(:honyaku).permit(:question_body, :name)
    end
end
end
