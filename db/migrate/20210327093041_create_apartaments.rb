class CreateApartaments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartaments do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :no_of_rooms
      t.integer :surface

      t.timestamps
    end
  end
end
