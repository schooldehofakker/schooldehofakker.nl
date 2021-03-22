class RemoveLastMailingFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :last_mailing
    remove_column :users, :last_mailing_send_at 
  end
end
