class CreateOptionsTable < ActiveRecord::Migration
  def change
    create_table(:options) do |t|
      t.column(:name, :string)
      t.column(:question_id, :integer)
      t.timestamps
    end
  end
end
