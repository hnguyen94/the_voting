class AddMoreOmniauthtoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_index :users, :image
  end
end
