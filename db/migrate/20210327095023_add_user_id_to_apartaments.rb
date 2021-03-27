class AddUserIdToApartaments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartaments, :user_id, :integer
    add_index  :apartaments, :user_id
  end
end
