class StaticPagesController < ApplicationController
  def home
    @apartaments = Apartament.all
  end

  def help
  end

  def about
  end

  def contact
  end
end
