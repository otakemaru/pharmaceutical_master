class CreateEfficacyMasters < ActiveRecord::Migration
  def change
    create_table :efficacy_masters do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end

    add_index :efficacy_masters, [:code]
  end
end
