class Api::GamesController < ActionController::API
  def index
    render json: Game.all
  end

  def create
    render json: Game.create(game_attributes)
  end

  def update
    render json: Game.update(params[:id], game_attributes)
  end

  def destroy
    game = Game.find(params[:id])

    game.destroy

    render json: game
  end

  def search
    game_list = []
    # get non empty fields
    params_check = {name: params[:name], platform: params[:platform]}.compact_blank

    Game.all.each do |g|
      cond = true

      params_check.keys.each do |pck|     
        cond = false if !g.public_send(pck).include?(params_check[pck])
      end

      game_list << g if cond
    end

    render json: game_list.count > 0 ? game_list : Game.all
  end

  private

  def game_attributes
    params.require(:game).permit(
      :publisher_id,
      :name,
      :platform,
      :store_id,
      :bundle_id,
      :app_version,
      :is_published
    )
  end
end