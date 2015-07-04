class CatsController < ApplicationController
  before_filter :check_current_user

  def index
  end
end
