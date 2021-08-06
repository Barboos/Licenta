class StaticPagesController < ApplicationController
  def home
    @apartaments = Apartament.all.paginate(per_page: 16, page: params[:page])
  end

  def help
  end

  def about
  end

  def contact
  end
end
