class Api::GamesController < ActionController::API
  require 'uri'
  require 'net/http'

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
    params_check = {name: params[:name].gsub(/\s+/, ""), platform: params[:platform]}.compact_blank

    Game.all.each do |g|
      cond = true

      params_check.keys.each do |pck|     
        cond = false if !g.public_send(pck).include?(params_check[pck])
      end

      game_list << g if cond
    end

    render json: game_list.count > 0 ? game_list : Game.all
  end

  def populate 
    urls = [
      "https://interview-marketing-eng-dev.s3.eu-west-1.amazonaws.com/ios.top100.json",
      "https://interview-marketing-eng-dev.s3.eu-west-1.amazonaws.com/android.top100.json"
    ]

    begin
      urls.each do |url|
        content = JSON.parse(Net::HTTP.get(URI.parse(url)))
        content.each do |c|
          Game.create(
            publisher_id: c[0]['publisher_id'].to_s,
            # encode to prevent bug when reading json later
            name: c[0]['name'].force_encoding("ISO-8859-1").encode("UTF-8"),
            platform: c[0]['os'].force_encoding("ISO-8859-1").encode("UTF-8"),
            store_id: nil,
            bundle_id: c[0]['bundle_id'],
            app_version: c[0]['version'],
            is_published: true
          )
        end
      end
      render json: Game.all

    rescue => error
      render json: error
    end
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