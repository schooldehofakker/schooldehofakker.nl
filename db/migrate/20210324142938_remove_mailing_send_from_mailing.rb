class RemoveMailingSendFromMailing < ActiveRecord::Migration[6.1]
  def change
    remove_column :mailings, :mailing_send, :boolean
  end
end
