# frozen_string_literal: true

require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e = employees(:one)
  end

  test 'should get index' do
    get employees_url
    assert_response :success
  end

  test 'should get new' do
    get new_employee_url
    assert_response :success
  end

  test 'should create employee' do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { active: @e.active, department_id: @e.department_id, name: @e.name } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test 'should show employee' do
    get employee_url(@e)
    assert_response :success
  end

  test 'should get edit' do
    get edit_employee_url(@e)
    assert_response :success
  end

  test 'should update employee' do
    patch employee_url(@e), params: { employee: { active: @e.active, department_id: @e.department_id, name: @e.name } }
    assert_redirected_to employee_url(@e)
  end

  test 'should destroy employee' do
    assert_difference('Employee.count', -1) do
      delete employee_url(@e)
    end

    assert_redirected_to employees_url
  end
end
