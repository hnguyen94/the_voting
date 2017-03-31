class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def up
    change_column :games, :status, :string, default: 'open'
  end

  def down
    change_column :games, :status, :string, default: nil
  end
end
