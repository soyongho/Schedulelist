class AddFinishDatetimeToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :finish_datetime, :datetime, null: false
  end
end
