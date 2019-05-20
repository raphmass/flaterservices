class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :action
      t.date :date
      t.string :status
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
