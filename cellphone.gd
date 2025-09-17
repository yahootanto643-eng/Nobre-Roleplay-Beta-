extends Control

onready var bank_btn = $PhonePanel/BankBtn
onready var insta_btn = $PhonePanel/InstaBtn

func _ready():
    bank_btn.connect("pressed", Callable(self, "_on_bank"))
    insta_btn.connect("pressed", Callable(self, "_on_insta"))

func _on_bank():
    get_tree().call_group("players", "open_bank_ui")

func _on_insta():
    get_tree().call_group("players", "open_insta_ui")
