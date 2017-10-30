class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def new
     @room = current_user.rooms.build
  end
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path, :notice => "Votre annonces à bien été supprimée"
end

  def edit
    @photos = @room.photos
  end

  def show
    @photos = @room.photos
  end

  def create
          @room = current_user.rooms.build(room_params)
      if @room.save
        if params[:images]
       params[:images].each do |i|
            @room.photos.create(image: i)
          end
      end
       @photos = @room.photos
            redirect_to room_path(@room), notice:"Votre logement a été ajouté"
      else
           render :new # s’il y a une erreur, redirige vers la page de création new

      end
    end

      def update
        if @room.update(room_params)
            if params[:images]
                params[:images].each do |i|
                @room.photos.create(image: i)
            end
       end
            @photos = @room.photos
            redirect_to edit_room_path(@room), notice:"Modification enregistrée..."

        else
            render :edit
    end
    end

  def annonces
    @rooms = current_user.rooms
  end

  def index
@q = Room.ransack(params[:q])
if params[:q].present?
@school_cont = params[:q][:school_cont]
@rooms = @q.result
render 'search'
end
  end




  private

      def set_room
             @room = Room.find(params[:id])
      end

      def room_params

          params.require(:room).permit(:school, :address, :sexe, :room_type, :home_type, :nb_place, :nb_coloc, :price, :start_date, :bail, :apl, :tv, :wifi, :ascenceur, :terasse, :lave_linge, :four, :piscine, :voiture, :seche_linge, :machine_laver, :taille, :salle_bain, :description, :fumeur, :sportif, :fetard, :chill, :worker, :numero, :email, :facebook, :summary, :listing_name, :active)
      end

      def require_same_user
          if current_user.id != @room.user_id
             flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
               redirect_to root_path
          end
      end
end
