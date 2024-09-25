class CreateLocates < ActiveRecord::Migration[7.2]
  def change
    create_table :locates do |t|
      t.timestamps
    end
  end
end
