class AddAccessEmailToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :access_email, :boolean, default: false
  end
end
