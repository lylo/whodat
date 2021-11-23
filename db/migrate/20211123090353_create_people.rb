class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :title
      t.string :team
      t.string :avatar_url
      t.string :trello_card_id, null: false

      t.timestamps
    end
  end
end
