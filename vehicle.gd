extends RigidBody3D

var occupied_by = null

func _ready():
    pass

func enter(player):
    if occupied_by == null:
        occupied_by = player
        player.set_physics_process(false)

func exit(player):
    if occupied_by == player:
        occupied_by = null
        player.set_physics_process(true)
