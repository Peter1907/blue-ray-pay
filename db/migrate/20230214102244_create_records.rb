class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :invoice, null: false, foreign_key: { to_table: :invoices }

      t.timestamps
    end
  end
end
