class AddVotesToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :votes, :integer, default: 0
  end
end
