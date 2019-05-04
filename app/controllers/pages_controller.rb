class PagesController < ApplicationController
  def index
    @employees = Employee.page(params[:page]).per(10)
  end
end
