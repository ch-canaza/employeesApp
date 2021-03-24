class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :full_name, :string
    add_column :employees, :last_names, :string
    add_column :employees, :phone_number, :string
    add_column :employees, :email, :string
    add_column :employees, :position, :string
    add_column :employees, :salary, :string
    add_column :employees, :department, :string
  end
end
