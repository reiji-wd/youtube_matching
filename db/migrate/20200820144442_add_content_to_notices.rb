class AddContentToNotices < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :content, :string
  end
end
