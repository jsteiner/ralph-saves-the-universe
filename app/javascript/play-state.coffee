class PlayState
  constructor: (game) ->
    @game = game

    @level = new Level(game)
    @player = new Player(game)

  preload: =>
    @level.preload()
    @player.preload()

  create: =>
    @game.stage.backgroundColor = "#6698FF"
    @level.create()
    @player.create()

  update: =>
    @level.update()
    @player.update()
