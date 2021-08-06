class AddZoneToApartaments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartaments, :zone, :string
  end
end
