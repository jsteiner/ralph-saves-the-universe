class GameOverState
  preload: =>
    @game.load.spritesheet('startButton', 'assets/start-button.png', 300, 150)

  create: =>
    @game.stage.backgroundColor = "#FFFFFF"
    @centerX = @game.width / 2
    @centerY = @game.height / 2
    @createHeader()
    @createMessage()
    @createStartButton()

  startClick: =>
    @game.state.start('play')

  createStartButton: =>
    centerX = @game.width / 2
    centerY = @game.height / 2
    @startButton = @game.add.button(centerX, centerY, 'startButton', @startClick)
    @startButton.anchor.setTo(0.5,0.5)

  createHeader: =>
    headerStyle = { font: '65px Times New Roman', fill: '#AAAAAA', align: 'center'}
    gameOverHeader = "Game Over"
    gameOverText = @game.add.text(@centerX, @centerY - 300, gameOverHeader, headerStyle)
    gameOverText.anchor.setTo(0.5, 0.5)

  createMessage: =>
    messageStyle = { font: '65px Times New Roman', fill: '#000000', align: 'center'}
    gameOverMessage = "The Universe is Doomed. Good Job."
    gameOverMessage = @game.add.text(@centerX, @centerY - 200, gameOverMessage, messageStyle)
    gameOverMessage.anchor.setTo(0.5, 0.5)
