class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.column(:answer, :string)
      t.column(:topic_id, :integer)
      t.timestamp()
    end
  end
end
