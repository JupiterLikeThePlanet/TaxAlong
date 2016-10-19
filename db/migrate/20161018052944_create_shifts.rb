class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.integer :start_mileage
      t.string :end_mileage
      t.datetime :date
      t.decimal :earnings
      t.references :user

      t.timestamps
    end
  end
end
