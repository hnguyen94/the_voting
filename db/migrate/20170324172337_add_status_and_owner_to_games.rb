class AddStatusAndOwnerToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :status, :string
    add_column :games, :owner, :integer
  end
end
