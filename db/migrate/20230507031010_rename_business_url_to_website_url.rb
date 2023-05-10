class RenameBusinessUrlToWebsiteUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :businesses, :business_url, :website_url
  end
end
