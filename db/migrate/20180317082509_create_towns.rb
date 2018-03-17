class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :town_name
      t.string :postcode
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
