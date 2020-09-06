class ChangeDataCheckToMessage < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :check, :string
  end
end
