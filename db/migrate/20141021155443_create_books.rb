class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :control
      t.string :author
      t.string :title
      t.integer :loans

      t.timestamps
    end
  end
end
