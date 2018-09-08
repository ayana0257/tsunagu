class CreateAttendParties < ActiveRecord::Migration[5.2]
  def change
    create_table :attend_parties do |t|

      t.timestamps
    end
  end
end
