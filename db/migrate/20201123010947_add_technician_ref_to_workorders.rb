class AddTechnicianRefToWorkorders < ActiveRecord::Migration[6.0]
  def change
    add_reference :workorders, :technician, null: false, foreign_key: true
  end
end
