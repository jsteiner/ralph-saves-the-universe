class PlayState
  constructor: (game) ->
    @game = game

  preload: =>
    @game.load.spritesheet('ground', 'assets/ground.png', 64, 64)
    @game.load.spritesheet('body', 'assets/ralph-body.png', 34, 80)
    @game.load.spritesheet('gun', 'assets/ralph-gun.png', 28, 16)
    @game.load.spritesheet('wifi', 'assets/ralph-wifi.png', 29, 13)

  create: =>
    @createGround()
    @createPlayer()

    @game.stage.backgroundColor = "#6698FF"

    @game.physics.startSystem(Phaser.Physics.ARCADE)
    @game.physics.arcade.gravity.y = GRAVITY

    @leftKey = @game.input.keyboard.addKey(Phaser.Keyboard.A)
    @rightKey = @game.input.keyboard.addKey(Phaser.Keyboard.D)
    @spacebar = @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)

  update: =>
    @game.physics.arcade.collide(@player, @ground)

    @player.resetMotion()

    if @leftKey.isDown
      @player.moveLeft()
    else if @rightKey.isDown
      @player.moveRight()

    if @spacebar.isDown && @player.body.touching.down
      @player.jump()

  createGround: =>
    @ground = new Ground(@game, 0, @game.world.height - 64, @game.world.width, 64)
    @game.add.existing(@ground)
    @ground.create()

  createPlayer: =>
    @player = new Player(@game)
    @game.add.existing(@player)
    @player.create()
