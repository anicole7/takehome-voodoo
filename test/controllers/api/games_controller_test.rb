class ArticlesControllerTest < ActionDispatch::IntegrationTest

  setup do
    Game.delete_all
  end

  GAME_ATTRIBUTES = {
    publisher_id: 'fda4848f-9fe6-4703-8f66-544cc146f1ae',
    name: 'Helix Jump',
    platform: 'ios',
    store_id: '1345968745',
    bundle_id: 'com.h8games.falldown',
    app_version: '2.4.2',
    is_published: true,
  }.freeze

  test "index" do
    game = Game.create(GAME_ATTRIBUTES)

    get api_games_url, xhr: true

    assert_response :success

    assert_equal [game.as_json], JSON.parse(@response.body)
  end

  test "create" do
    assert_difference 'Game.count', 1 do
      post api_games_url, params: { game: GAME_ATTRIBUTES }, xhr: true

      assert_response :success
    end
  end

  test "update" do
    id = Game.create(GAME_ATTRIBUTES).id

    assert_no_difference 'Game.count' do
      put api_game_url(id), params: { id: id, game: { platform: 'android' } }, xhr: true

      assert_response :success

      assert_equal 'android', JSON.parse(@response.body)['platform']
    end
  end

  test "delete" do
    id = Game.create(GAME_ATTRIBUTES).id

    assert_difference 'Game.count', -1 do
      delete api_game_url(id), xhr: true

      assert_response :success
    end
  end
end
