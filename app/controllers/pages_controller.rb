# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @employees = Employee.page(params[:page]).per(11)
  end
end
