class ChangeSalaryDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :salary, :decimal, presicion: 9, escale: 2
    change_column :employees, :phone_number, :number
  end
end
