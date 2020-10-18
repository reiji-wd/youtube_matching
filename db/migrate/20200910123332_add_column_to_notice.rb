class AddColumnToNotice < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :request_id, :integer
    add_column :notices, :user_id, :integer
    add_column :notices, :post_id, :integer
  end
end
