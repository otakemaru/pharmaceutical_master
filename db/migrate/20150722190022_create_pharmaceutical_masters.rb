class CreatePharmaceuticalMasters < ActiveRecord::Migration
  def change
    create_table :pharmaceutical_masters do |t|
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :e
      t.string :f
      t.string :g
      t.string :h
      t.string :i
      t.string :j
      t.string :aa
      t.string :ab
      t.string :ac
      t.string :ad
      t.string :ae
      t.string :af
      t.string :ag

      t.timestamps null: false
    end

    add_index :pharmaceutical_masters, [:a]
  end
end
