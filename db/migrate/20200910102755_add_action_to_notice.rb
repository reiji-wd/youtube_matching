class AddActionToNotice < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :action, :string
  end
end
