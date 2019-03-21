class ChangeColumnmessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :room_id, :integer
    remove_column :messages, :receiver, :integer

  end
end
