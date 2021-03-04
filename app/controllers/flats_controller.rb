class FlatsController < ApplicationController
   # Not required since everyone can see flats before_action :authenticate_user!
    def index
      @flats = Flat.all
    end
  
    def show
      @flats = Flat.find(params[:id])
    end
  
    def new
      @flat = Flat.new
    end
  
    def create
      @flats = Flat.new(flat_params)
      @flats.save
  
      redirect_to flats_path
    end
  
    def edit
      @flat = Flat.find(params[:id])
    end
  
    def update
      @flat = Flat.find(params[:id])
      @flat.update(flat_params)
  
      redirect_to flats_path(@flat.id)
    end
  
    def destroy
      @flat = Flat.find(params[:id])
      @flat.destroy
  
      redirect_to flats_path
    end
  
    private
  
    def flat_params
      params.require(:flat).permit(:price, :description, :adress, :availability_start_date, :availability_end_date, :title)
    end
end


# create_table "flats", force: :cascade do |t|
#     t.integer "price"
#     t.text "description"
#     t.text "address"
#     t.date "availability_start_date"
#     t.date "availability_end_date"
#     t.string "title"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end