class CreateMailings < ActiveRecord::Migration[6.1]
  def change
    create_table :mailings do |t|
      t.string :title
      t.string :description
      t.datetime :published_at

      t.timestamps
    end
  end
end
