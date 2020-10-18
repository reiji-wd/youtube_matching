class RemoveColumnFromNotice < ActiveRecord::Migration[6.0]
  def change
    remove_column :notices, :user_id, :integer
  end
end
