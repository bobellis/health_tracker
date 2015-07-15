class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :source_type
      t.integer :calories
      t.date :event_date

      t.timestamps
    end
  end
end
