class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :sandbox]

  def home
  end

  def sandbox
  end
end
