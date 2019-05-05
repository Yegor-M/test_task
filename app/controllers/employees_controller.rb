# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  # GET /employees
  # GET /employees.json
  def index
    @departments = []
    Department.all.each do |department|
      @departments << [department.name, department.id]
    end
    search_for_employees(params[:name], params[:active], params[:department_id])
  end

  def search_for_employees(name, active, department_id)
    if name.nil?
      @employee = Employee.all
    else
      @employee = Employee.where(name: name)
      @employee = if active
                    @employee.where(active: true)
                  else
                    @employee.where(active: false)
                  end
      @employee = @employee.where(department_id: department_id) if department_id
    end
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to root_path, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:department_id, :name, :active)
  end
end
