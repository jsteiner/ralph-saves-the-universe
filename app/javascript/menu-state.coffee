class MenuState
  constructor: ->

  preload: =>
    @game.load.spritesheet('startButton', 'assets/start-button.png', 300, 150)

  create: =>
    @game.stage.backgroundColor = "#FFFFFF"
    @createStartButton()

  update: =>

  startClick: =>
    @game.state.start('play')

  createStartButton: =>
    centerX = @game.width / 2
    centerY = @game.height / 2
    @startButton = @game.add.button(centerX, centerY, 'startButton', @startClick)
    @startButton.anchor.setTo(0.5,0.5)
