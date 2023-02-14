class GamesController < ApplicationController
  def index
    render template: "static/index"
  end
end