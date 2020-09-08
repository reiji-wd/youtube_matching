class ChangeDataCheckToNotice < ActiveRecord::Migration[6.0]
  def change
    change_column :notices, :check, :string
  end
end
