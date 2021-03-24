class ChangePhoneDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :phone_number, :string
  end
end
