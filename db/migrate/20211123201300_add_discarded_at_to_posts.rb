class AddDiscardedAtToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :discarded_at, :datetime
    add_index :people, :discarded_at
  end
end
