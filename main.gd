extends Node3D

func _ready():
    # Simples setup: spawn a vehicle and position player at spawn
    var spawn = $SpawnPoints/SpawnFavelaA
    if spawn:
        var player = $Player
        player.global_transform.origin = spawn.global_transform.origin
    # spawn a vehicle
    var vscene = preload("res://scenes/Vehicle.tscn")
    var veh = vscene.instantiate()
    $Vehicles.add_child(veh)
    veh.global_transform.origin = $Vehicles/VehicleSpawner.global_transform.origin
