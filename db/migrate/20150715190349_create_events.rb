class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :source_id
      t.date :event_date

      t.timestamps
    end
  end
end
