class CreateMailinglists < ActiveRecord::Migration[6.1]
  def change
    create_table :mailinglists do |t|
      t.string :slug
      t.string :sender
      t.boolean :mailinglist_send, default: false
      t.datetime :send_at

      t.timestamps
    end
  end
end
