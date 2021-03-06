class CreateCourseOrderFulfillments < ActiveRecord::Migration
  def change
    create_table :course_order_fulfillments do |t|
      t.integer :order_id, null: true
      t.string :tracking_number, limit: 64

      t.timestamps
    end
  end
end
