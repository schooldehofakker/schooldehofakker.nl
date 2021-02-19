class DropMailinglists < ActiveRecord::Migration[6.1]
  def change
    drop_table :mailinglists
  end
end
