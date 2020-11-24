class CreateWorkorders < ActiveRecord::Migration[6.0]
  def change
    create_table :workorders do |t|
      t.datetime :time
      t.integer :duration
      t.integer :price

      t.timestamps
    end
  end
end
