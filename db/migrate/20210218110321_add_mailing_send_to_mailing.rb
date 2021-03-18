class AddMailingSendToMailing < ActiveRecord::Migration[6.1]
  def change
    add_column :mailings, :send_at, :datetime
    add_column :mailings, :mailing_send, :boolean
  end
end
