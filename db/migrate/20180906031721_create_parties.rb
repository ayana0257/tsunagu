class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|

      t.string :date
      t.string :place
      t.integer :attend_number
      t.integer :attend_price
      t.text :belongings
      t.string :contact
      t.text :message
      t.timestamps
    end
  end
end
