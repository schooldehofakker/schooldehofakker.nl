class AddDefaultSendToMailing < ActiveRecord::Migration[6.1]
  def change
    change_column_default :mailings, :mailing_send, from: nil, to: false
  end
end
