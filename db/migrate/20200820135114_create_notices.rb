class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users}
      t.references :reciever, null: false, foreign_key: { to_table: :users }

      t.timestamps

      t.index [:sender_id, :reciever_id], unique: true
    end
  end
end
