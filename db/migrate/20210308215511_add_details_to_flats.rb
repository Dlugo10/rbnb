class AddDetailsToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :city, :string
    add_column :flats, :zip, :integer
    add_column :flats, :bedroom, :integer
    add_column :flats, :restroom, :integer
    add_column :flats, :bed, :integer
  end
end
