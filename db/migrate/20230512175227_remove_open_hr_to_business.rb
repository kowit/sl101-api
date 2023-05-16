class RemoveOpenHrToBusiness < ActiveRecord::Migration[7.0]
  def change
    remove_column :businesses, :open_hr
  end
end
