class AddPublicationDateToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :published_at, :datetime
  end
end
