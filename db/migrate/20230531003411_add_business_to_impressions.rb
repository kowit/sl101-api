class AddBusinessToImpressions < ActiveRecord::Migration[7.0]
  def change
    add_reference :impressions, :business, null: false, foreign_key: true, type: :uuid
  end
end
