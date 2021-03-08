class FlatsController < ApplicationController
   # Not required since everyone can see flats before_action :authenticate_user!
  def index
    @flats = policy_scope(Flat)
  end

  def show
    @flats = Flat.find(params[:id])
    authorize @flats
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat
    @flat.user = current_user
    @flat.save
    redirect_to flats_path
  end

  def edit
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def update
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.update(flat_params)
    redirect_to flats_path
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:price, :description, :address, :user_id, :availability_start_date, :availability_end_date, :title, :city, :zip, :bedroom, :restroom, :bed, photos: [])
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
