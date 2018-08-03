class AddCustomColToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :date, :date
    add_column :users, :type_u, :string
    add_column :users, :avatar, :string
    add_column :users, :country, :string
    add_column :users, :latitude, :decimal, :precision => 8, :scale => 6
    add_column :users, :longitude, :decimal, :precision => 8, :scale => 6
  end
end
