class AddCheckToNotices < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :check, :integer
  end
end
