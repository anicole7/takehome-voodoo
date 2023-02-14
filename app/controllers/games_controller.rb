class GamesController < ApplicationController
  def index
    render template: "static/index"
  end

  def search
    render template: "static/search"
  end
end