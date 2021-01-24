class AddLastMailingToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_mailing, :string
  end
end
