class AddUuidToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uuid, :uuid, default: -> { 'uuid_generate_v4()' }, null: false
  end
end
