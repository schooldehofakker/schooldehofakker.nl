class AddSlugToMailing < ActiveRecord::Migration[6.1]
  def change
    add_column :mailings, :slug, :string
    add_index :mailings, :slug, unique: true
  end
end
