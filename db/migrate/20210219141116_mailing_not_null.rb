class MailingNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :mailings, :description, false
    change_column_null :mailings, :title, false
    change_column_null :mailings, :slug, false
  end
end
