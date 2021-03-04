class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.integer :price
      t.text :description
      t.text :address
      t.date :availability_start_date
      t.date :availability_end_date
      t.string :title
      t.references  :user, foreign_key: true


      t.timestamps
    end
  end
end
