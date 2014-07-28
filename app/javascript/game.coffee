GRAVITY = 1200

class Game
  constructor: ->
    @phaserGame = new Phaser.Game(
      window.innerWidth
      window.innerHeight
      Phaser.AUTO
    )

    @phaserGame.state.add('menu', MenuState)
    @phaserGame.state.add('play', PlayState)
    @phaserGame.state.add('gameover', GameOverState)

    @phaserGame.state.start('menu')
