class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :salon_name
      t.datetime :appointment_date
      t.string :service

      t.timestamps
    end
  end
end
