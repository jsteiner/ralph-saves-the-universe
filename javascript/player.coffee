class Player
  constructor: (game) ->
    @game = game

  preload: =>
    @game.load.spritesheet('body', 'assets/ralph-body.png', 34, 80)
    @game.load.spritesheet('gun', 'assets/ralph-gun.png', 28, 16)
    @game.load.spritesheet('wifi', 'assets/ralph-wifi.png', 29, 13)

  create: =>
    @sprites = @game.add.group()

    @createBodySprite()
    @createGunSprite()
    @createWifiSprite()

    @cursors = @game.input.keyboard.createCursorKeys()

  update: =>
    @resetMotion()

    if @cursors.left.isDown
      @moveLeft()
    else if @cursors.right.isDown
      @moveRight()

  createBodySprite: =>
    @bodySprite = @game.add.sprite(32, @game.world.height - 150, 'body')
    @bodySprite.anchor.setTo(.5, 0)
    @game.physics.arcade.enableBody(@bodySprite)

    @sprites.add(@bodySprite)

  createGunSprite: =>
    @gunSprite = @game.add.sprite(32, @game.world.height - 125, 'gun')
    @gunSprite.anchor.setTo(-0.45, 0)
    @game.physics.arcade.enableBody(@gunSprite)

    @sprites.add(@gunSprite)

  createWifiSprite: =>
    @wifiSprite = @game.add.sprite(33, @game.world.height - 168, 'wifi')
    @wifiSprite.anchor.setTo(.5, 0)
    @wifiSprite.animations.add('pulse', [0, 1, 2, 3], 1.7, true)
    @wifiSprite.animations.play('pulse')
    @game.physics.arcade.enableBody(@wifiSprite)

    @sprites.add(@wifiSprite)

  resetMotion: =>
    @sprites.setAll('body.velocity.x', 0)

  moveRight: =>
    @sprites.setAll('body.velocity.x', 250)
    @sprites.setAll('scale.x', 1)

  moveLeft: =>
    @sprites.setAll('body.velocity.x', -250)
    @sprites.setAll('scale.x', -1)
