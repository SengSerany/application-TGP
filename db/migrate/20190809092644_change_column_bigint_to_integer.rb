class ChangeColumnBigintToInteger < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :city_id, :integer
  end
end
