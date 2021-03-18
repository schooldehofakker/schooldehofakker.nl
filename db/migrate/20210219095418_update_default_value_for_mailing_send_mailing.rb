class UpdateDefaultValueForMailingSendMailing < ActiveRecord::Migration[6.1]
  def change
  execute <<-SQL
  UPDATE mailings
  SET mailing_send = true
  where mailing_send is NULL;
  SQL
  end
end
