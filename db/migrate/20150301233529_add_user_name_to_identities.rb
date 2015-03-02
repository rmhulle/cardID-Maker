class AddUserNameToIdentities < ActiveRecord::Migration
  def change
  	add_column :Identities, :user_name, :string
  	change_column :Identities, :enrollment, :date
  end
end
