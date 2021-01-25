class AddLastMailingSendAtToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_mailing_send_at, :datetime
  end
end
