class AddUserIdToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :user_id, :integer
  end
end
