class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :money
      t.string :memo

      t.timestamps
    end
  end
end
