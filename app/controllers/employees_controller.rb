# frozen_string_literal: true

# defines methods for CRUD, import and export data in csv format
class EmployeesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  before_action :set_employee, only: %i[show index]
  before_action :set_phone_and_salary, only: %i[show index]

  PHONE_PATTERN = /(\d{1,4})(\d{4})(\d{4})$/

  def new
    @employee = Employee.new
  end

  def index
    @employees = Employee.all

    respond_to do |format|
      format.html
      format.csv { send_data @employees.to_csv }
    end
  end

  def show; end

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

  def import
    if Employee.import(params[:file])
      redirect_to employees_path, notice: 'data was just imported!'
    else
      redirect_to employees_path, alert: 'Sorry, No file chosen, Action can not be performed' 
    end
  end

  private

  def set_phone_and_salary
    @phone_number = number_to_phone(@employee.phone_number, pattern: PHONE_PATTERN, area_code: true)
    @salary = number_to_currency(@employee.salary, separator: ',', delimiter: '.')
  end

  def set_employee
    @employee = Employee.find_by(params[:id])
  end

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
