class AddTrelloCreatedAtToPerson < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :trello_created_at, :datetime
  end
end
