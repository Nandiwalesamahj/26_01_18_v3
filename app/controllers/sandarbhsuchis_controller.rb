class SandarbhsuchisController < ApplicationController
  before_action :set_sandarbhsuchi, only: [:show, :edit, :update, :destroy]

  # GET /sandarbhsuchis
  # GET /sandarbhsuchis.json
  def index
    @ads = Advertise.where(:on_page => "sandarbhsuchi_page")
    @summary =  Summary.new
    @summary_exists = Summary.all
    for summary_exist in @summary_exists
      if summary_exist.sandarbhsuchi_summary != nil
        @summary_exist = summary_exist
        break
      end
    end
    @sandarbhsuchis = Sandarbhsuchi.all.order("created_at DESC").page(params[:page]).per_page(10)
  end


  # GET /sandarbhsuchis/new
  def new
    @sandarbhsuchi = Sandarbhsuchi.new
  end

  # GET /sandarbhsuchis/1/edit
  def edit
  end

  # POST /sandarbhsuchis
  # POST /sandarbhsuchis.json
  def create
    @sandarbhsuchi = Sandarbhsuchi.new(sandarbhsuchi_params)
      if @sandarbhsuchi.save
        redirect_to sandarbhsuchis_path
      end
  end

  # PATCH/PUT /sandarbhsuchis/1
  # PATCH/PUT /sandarbhsuchis/1.json
  def update
  
      if @sandarbhsuchi.update(sandarbhsuchi_params)
      redirect_to sandarbhsuchis_path  
    end
  end

  # DELETE /sandarbhsuchis/1
  # DELETE /sandarbhsuchis/1.json
  def destroy
    if @sandarbhsuchi.destroy
    redirect_to sandarbhsuchis_path
    end
  end
  def download_file_sandarbhsuchi
    
        @document = Sandarbhsuchi.find(params[:id])
          send_file(@document.attachment.path,
                  :disposition => 'attachment',
                  :url_based_filename => false)
         
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sandarbhsuchi
      @sandarbhsuchi = Sandarbhsuchi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sandarbhsuchi_params
      params.require(:sandarbhsuchi).permit(:title, :description, :link, :attachment)
    end
end
