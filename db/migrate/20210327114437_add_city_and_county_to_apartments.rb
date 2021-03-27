class AddCityAndCountyToApartments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartaments, :county, :string
    add_column :apartaments, :city, :string
    add_index  :apartaments, :county
    add_index  :apartaments, :city
  end
end
