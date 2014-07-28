class PlayState
  constructor: (game) ->
    @game = game

  preload: =>
    @game.load.tilemap('tilemap', 'assets/level1.json', null, Phaser.Tilemap.TILED_JSON)
    @game.load.image('tileset', 'assets/tileset.png', 32, 32)
    @game.load.spritesheet('body', 'assets/ralph-body.png', 34, 80)
    @game.load.spritesheet('gun', 'assets/ralph-gun.png', 28, 16)
    @game.load.spritesheet('wifi', 'assets/ralph-wifi.png', 29, 13)

  create: =>
    @createMap()
    @createPlayer()
    @createKeys()

    @game.camera.follow(@player, Phaser.Camera.FOLLOW_PLATFORMER)

    @game.physics.startSystem(Phaser.Physics.ARCADE)
    @game.physics.arcade.gravity.y = GRAVITY

  update: =>
    @game.physics.arcade.collide(@player, @layer)

    @player.resetMotion()

    if @leftKey.isDown
      @player.moveLeft()
    else if @rightKey.isDown
      @player.moveRight()

    if @spacebar.isDown && @player.body.onFloor()
      @player.jump()

  createPlayer: =>
    @player = new Player(@game, 32, @game.world.height - 240)
    @game.add.existing(@player)
    @player.create()

  createMap: =>
    @game.stage.backgroundColor = "#6698FF"
    @map = @game.add.tilemap('tilemap')
    @map.addTilesetImage('Spritesheet', 'tileset')
    @layer = @map.createLayer(0)
    @map.setCollisionByExclusion([])
    @layer.resizeWorld()

  createKeys: =>
    @leftKey = @game.input.keyboard.addKey(Phaser.Keyboard.A)
    @rightKey = @game.input.keyboard.addKey(Phaser.Keyboard.D)
    @spacebar = @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)
