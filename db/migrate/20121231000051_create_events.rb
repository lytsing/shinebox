class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, :null => false
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.text :content

      t.timestamps
    end
  end
end
