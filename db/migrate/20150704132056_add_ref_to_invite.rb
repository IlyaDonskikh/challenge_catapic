class AddRefToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :ref, :string
  end
end
