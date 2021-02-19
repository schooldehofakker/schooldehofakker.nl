class AddSenderToMailing < ActiveRecord::Migration[6.1]
  def change
    add_column :mailings, :sender, :string
  end
end
