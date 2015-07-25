class CreateRegulationMasters < ActiveRecord::Migration
  def change
    create_table :regulation_masters do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
