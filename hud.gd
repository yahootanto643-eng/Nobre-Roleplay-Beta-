extends CanvasLayer

onready var chat = $Chat
onready var cellphone = $CellphoneInstance

func _ready():
    cellphone.visible = false

func _input(event):
    if event is InputEventKey and event.pressed and event.scancode == KEY_SLASH:
        chat.visible = true

func toggle_cellphone():
    cellphone.visible = not cellphone.visible

func append_chat(text):
    chat.append_bbcode(text + "\n")
