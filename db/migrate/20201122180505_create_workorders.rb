class CreateWorkorders < ActiveRecord::Migration[6.0]
  def change
    create_table :workorders do |t|
      t.date :date
      t.time :time
      t.integer :duration
      t.integer :price

      t.timestamps
    end
  end
end
