class AddBusinessUrlToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :business_url, :string
  end
end
