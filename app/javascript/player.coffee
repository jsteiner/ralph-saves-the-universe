class Player extends Phaser.Sprite
  constructor: (@game, x, y) ->
    Phaser.Sprite.call(@, @game, x, y, 'body')

  create: =>
    @anchor.setTo(.5, 0)
    @game.physics.arcade.enableBody(@)
    @body.collideWorldBounds = true
    @createGunSprite()
    @createWifiSprite()

  createGunSprite: =>
    gunSprite = @game.add.sprite(0, 25, 'gun')
    gunSprite.anchor.setTo(-0.45, 0)

    @addChild(gunSprite)

  createWifiSprite: =>
    wifiSprite = @game.add.sprite(0, -18, 'wifi')
    wifiSprite.anchor.setTo(.5, 0)
    wifiSprite.animations.add('pulse', [0, 1, 2, 3], 1.7, true)
    wifiSprite.animations.play('pulse')

    @addChild(wifiSprite)

  moveRight: =>
    @body.velocity.x = 500
    @scale.x = 1

  moveLeft: =>
    @body.velocity.x = -500
    @scale.x = -1

  jump: =>
    @body.velocity.y = -(GRAVITY * 0.75)

  resetMotion: =>
    @body.velocity.x = 0
