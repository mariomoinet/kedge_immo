class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :school
      t.string :address
      t.string :sexe
      t.string :room_type
      t.string :home_type
      t.integer :nb_place
      t.integer :nb_coloc
      t.integer :price
      t.datetime :start_date
      t.string :bail
      t.integer :apl
      t.boolean :tv
      t.boolean :wifi
      t.boolean :ascenceur
      t.boolean :terasse
      t.boolean :lave_linge
      t.boolean :four
      t.boolean :piscine
      t.boolean :voiture
      t.boolean :seche_linge
      t.boolean :machine_laver
      t.integer :taille
      t.integer :salle_bain
      t.text :description
      t.string :fumeur
      t.string :sportif
      t.string :fetard
      t.string :chill
      t.string :worker
      t.string :numero
      t.string :email
      t.string :facebook

      t.timestamps null: false
    end
  end
end
