class MailingUniqueConstraints < ActiveRecord::Migration[6.1]
  def change
    add_index :mailings, :title, unique: true
  end
end
