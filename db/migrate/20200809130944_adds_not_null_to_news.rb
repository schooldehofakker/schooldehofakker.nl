class AddsNotNullToNews < ActiveRecord::Migration[6.0]
  def change
    change_column :news, :slug, :string, null: false
    change_column :news, :status, :string, null: false
    change_column :news, :title, :string, null: false
    change_column :news, :published_at, :datetime, null: false
  end
end
