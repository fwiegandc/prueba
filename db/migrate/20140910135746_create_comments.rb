class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :titulo
      t.text :mensaje
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
