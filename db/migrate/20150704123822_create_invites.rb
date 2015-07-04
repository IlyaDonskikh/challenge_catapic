class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :user_id
      t.integer :invitee_id

      t.timestamps null: false
    end
  end
end
