class AddCoordinatesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :latitude, :float
    add_column :tasks, :longitude, :float
  end
end
