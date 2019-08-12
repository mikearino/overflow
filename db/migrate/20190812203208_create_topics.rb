class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.column(:question, :string)
      t.column(:user_id, :integer)
      t.timestamps()
    end
  end
end
