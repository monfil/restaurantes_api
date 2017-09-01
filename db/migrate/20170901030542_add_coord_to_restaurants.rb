class AddCoordToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :coord, :st_point, geographic: true
  end
end
