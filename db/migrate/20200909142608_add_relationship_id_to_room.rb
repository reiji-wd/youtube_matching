class AddRelationshipIdToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :relationship_id, :integer
  end
end
