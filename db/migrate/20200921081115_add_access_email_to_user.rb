class AddAccessEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :access_email, :boolean, default: false
  end
end
