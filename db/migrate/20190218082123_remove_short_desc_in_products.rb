class RemoveShortDescInProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :short_description
  end
end
