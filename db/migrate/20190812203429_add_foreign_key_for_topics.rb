class AddForeignKeyForTopics < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :topics, :users 
  end
end
