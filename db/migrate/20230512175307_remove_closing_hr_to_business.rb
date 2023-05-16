class RemoveClosingHrToBusiness < ActiveRecord::Migration[7.0]
  def change
    remove_column :businesses, :closing_hr
  end
end
