class EmployeesController < ApplicationController
 
  include ActionView::Helpers::NumberHelper

  PHONE_PATTERN = /(\d{1,4})(\d{4})(\d{4})$/

  def new
    @employee = Employee.new
  end

  def index
    @employees = Employee.all
  end 

  def show
    @employee = Employee.find(params[:id])
    @phone_number = number_to_phone(@employee.phone_number, pattern: PHONE_PATTERN, area_code: true)
    @salary = number_to_currency(@employee.salary, separator: ',', delimiter: '.')
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'employee was successfully added to the list.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def employee_params
    params.require(:employee).permit(
      :full_name,
      :last_names,
      :phone_number,
      :email,
      :position,
      :salary,
      :department
    )
  end

end
