class AddCheckToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :check, :integer
  end
end
