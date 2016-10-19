class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :type
      t.references :shift
      t.decimal :cost

      t.timestamps
    end
  end
end
