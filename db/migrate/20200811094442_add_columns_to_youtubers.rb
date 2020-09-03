class AddColumnsToYoutubers < ActiveRecord::Migration[6.0]
  def change
    add_column :youtubers, :title, :string
    add_column :youtubers, :icon, :string
    add_column :youtubers, :subscribers, :integer
  end
end
