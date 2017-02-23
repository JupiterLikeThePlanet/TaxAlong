class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.string :expense_type
      t.decimal :cost
      t.references :user

      t.timestamps
    end
  end
end
