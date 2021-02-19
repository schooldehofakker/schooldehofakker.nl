class UpdateDefaultValueForMailingSendMailing < ActiveRecord::Migration[6.1]
  def change
  execute <<-SQL
  UPDATE mailings
  SET mailing_send = false
  where mailing_send is NULL;
  SQL
  end
end
