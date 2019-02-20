class AddLevelColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :level, :string, limit: 10
  end
end
