class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants, id: false do |t|
      t.text :id, null: false
      t.integer :rating
      t.text :name
      t.text :site
      t.text :email
      t.text :phone
      t.text :street
      t.text :city
      t.text :state
      t.float :lat
      t.float :lng

      t.timestamps
    end

    add_index :restaurants, :id, unique: true
  end
end
