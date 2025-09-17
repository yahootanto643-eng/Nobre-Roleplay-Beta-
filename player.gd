extends CharacterBody3D

@export var speed: float = 6.0
var money: int = 1000
var job: int = 0
var skin: int = 0

func _ready():
    add_to_group("players")

func open_bank_ui():
    print("Abrindo banco para %s" % name)

func open_insta_ui():
    print("Abrindo Instagram para %s" % name)

func set_job(j:int):
    job = j
    apply_skin_for_job()

func apply_skin_for_job():
    var mesh = $MeshInstance3D
    if mesh:
        var mat = StandardMaterial3D.new()
        match job:
            1:
                mat.albedo_color = Color(0.8,0.2,0.2)
            2:
                mat.albedo_color = Color(0.2,0.8,0.2)
            3:
                mat.albedo_color = Color(0.2,0.2,0.8)
            4:
                mat.albedo_color = Color(1,0.8,0.2)
            5:
                mat.albedo_color = Color(0.6,0.2,0.8)
            6:
                mat.albedo_color = Color(0.4,0.3,0.2)
            _:
                mat.albedo_color = Color(0.9,0.9,0.9)
        mesh.set_surface_override_material(0, mat)
