class SkusController < ApplicationController
  def index
    @skus = Sku.all
  end
end
