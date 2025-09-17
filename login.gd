extends Control

func _ready():
    $Panel/Server1.connect("pressed", Callable(self, "_on_server_pressed")).call_deferred(0, 1)
    $Panel/Server2.connect("pressed", Callable(self, "_on_server_pressed")).call_deferred(0, 2)
    $Panel/Server3.connect("pressed", Callable(self, "_on_server_pressed")).call_deferred(0, 3)
    $Panel/GoogleSim.connect("pressed", Callable(self, "_on_google_pressed"))

func _on_server_pressed(idx=1):
    var name = $Panel/NameLine.text
    if name == "":
        name = "Player_" + str(randi()%1000)
    var data = {"server": idx, "name": name, "google": false}
    ProjectSettings.set_setting("application/run/user_data", data)
    print("Selecionado servidor %d como %s" % [idx, name])

func _on_google_pressed():
    var name = $Panel/NameLine.text
    if name == "":
        name = "Player_" + str(randi()%1000)
    var data = {"server": 1, "name": name, "google": true}
    ProjectSettings.set_setting("application/run/user_data", data)
    print("Login com Google simulado: %s" % name)
