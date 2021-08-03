class AddMissingFieldsToApartaments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartaments, :no_of_bathrooms, :integer
    add_column :apartaments, :no_of_parking, :integer
    add_column :apartaments, :no_of_terraces, :integer
    add_column :apartaments, :age, :string
    add_column :apartaments, :partitioning, :string
  end
end
