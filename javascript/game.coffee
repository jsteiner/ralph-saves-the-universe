class Game
  constructor: ->
    @phaserGame = new Phaser.Game(
      window.innerWidth
      window.innerHeight
      Phaser.AUTO
      ''
      { preload: @preload, create: @create, update: @update }
    )

    @level = new Level(@phaserGame)
    @player = new Player(@phaserGame)

  preload: =>
    @level.preload()
    @player.preload()

  create: =>
    @level.create()
    @player.create()

  update: =>
    @level.update()
    @player.update()
