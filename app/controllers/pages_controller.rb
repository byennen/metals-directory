class PagesController < ApplicationController
  def home
    @company = current_user.companies.last if current_user
  end

  def about
  end

  def media_kit
  end

  def associations
  end

  def contact
  end

  def terms
  end

  def privacy
  end

  def start
    @company = Company.new
  end
end
