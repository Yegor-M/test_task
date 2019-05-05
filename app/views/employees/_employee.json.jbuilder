# frozen_string_literal: true

json.extract! employee, :id, :department_id, :name, :active, :created_at, :updated_at
json.url employee_url(employee, format: :json)
