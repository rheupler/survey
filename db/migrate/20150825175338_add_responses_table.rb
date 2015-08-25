class AddResponsesTable < ActiveRecord::Migration
  def change
    create_table(:responses) do |t|
      t.column(:question_id, :integer)
      t.column(:option_id, :integer)
      t.timestamps
    end
  end
end
