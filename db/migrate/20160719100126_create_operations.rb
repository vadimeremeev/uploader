class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.belongs_to :company
      t.string :invoice_num
      t.date :invoice_date
      t.date :open_date
      t.float :amount
      t.string :reporter
      t.string :text
      t.string :status
      t.timestamps
    end
  end
end
