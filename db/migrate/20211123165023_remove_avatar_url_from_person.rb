class RemoveAvatarUrlFromPerson < ActiveRecord::Migration[7.0]
  def change
    remove_column :people, :avatar_url
  end
end
