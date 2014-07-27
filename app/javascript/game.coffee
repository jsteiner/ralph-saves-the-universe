class Game
  constructor: ->
    @phaserGame = new Phaser.Game(
      window.innerWidth
      window.innerHeight
      Phaser.AUTO
    )

    @phaserGame.state.add('menu', MenuState)
    @phaserGame.state.add('play', PlayState)

    @phaserGame.state.start('menu')
