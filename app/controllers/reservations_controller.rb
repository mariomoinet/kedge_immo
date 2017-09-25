class ReservationsController < ApplicationController

before_action :authenticate_user!

def create

      @reservation = current_user.reservations.create(reservation_params)       
      redirect_to @reservation.room, notice: "Votre ajout aux favoris a été accepté"
end

def your_trips
       @trips = current_user.reservations 
end

def your_reservations
      @rooms = current_user.rooms
end
 
private

     def reservation_params         
        params.require(:reservation).permit(:price, :room_id)     
     end 
end