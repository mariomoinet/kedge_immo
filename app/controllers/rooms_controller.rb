class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update, :usershow]
  before_action :authenticate_user!, except: [:show, :index, :usershow]
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


  def usershow

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
            redirect_to rooms_edit_path(id: @room), notice:"Votre logement a été ajouté"
      else
           render :new # s’il y a une erreur, redirige vers la page de création new

      end
    end

      def update
  @photos = @room.photos
    end

  def annonces
    @rooms = current_user.rooms
  end

  def index
    @q = Room.ransack(params[:q])
    if params[:q].present?
      @school_cont = params[:q][:school_cont]
      @rooms = @q.result
      @rooms = @q.result.page(params[:page]).per(6)
    render 'search'
    end
  end

def search
@room= Room.find_by_sub_domain params[:id]
end


  private

      def set_room
             @room = Room.find(params[:id])
      end

      def room_params

          params.require(:room).permit(:school, :address, :sexe, :room_type, :home_type, :nb_place, :nb_coloc, :price, :start_date, :bail, :apl, :tv, :wifi, :ascenceur, :terasse, :lave_linge, :four, :piscine, :voiture, :seche_linge, :machine_laver, :taille, :salle_bain, :description, :fumeur, :sportif, :fetard, :chill, :worker, :numero, :email, :facebook, :summary, :listing_name, :active, :charges, :age, :langue, :francais, :anglais, :chinois, :allemand, :italien, :espagnol, :arabe, :japonais, :russe, :indien, :caution)
      end

      def require_same_user
          if current_user.id != @room.user_id
             flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
               redirect_to root_path
          end
      end
end
