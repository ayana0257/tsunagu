class CreateAttendParties < ActiveRecord::Migration[5.2]
  def change
    create_table :attend_parties do |t|
      t.references :user, null:false
      t.references :party, null:false
      t.timestamps
    end
  end
end
