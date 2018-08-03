class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.references :user
      t.references :volunteer

      t.timestamps
    end

    add_foreign_key :volunteers, :users, column: :volunteer_id, primary_key: :id
    add_foreign_key :volunteers, :users, column: :user_id, primary_key: :id
  end
end
