class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :content
      t.datetime :start_datetime, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
