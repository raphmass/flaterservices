class CreateAssignements < ActiveRecord::Migration[5.2]
  def change
    create_table :assignements do |t|
      t.boolean :validated
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
