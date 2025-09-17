extends Node

@export var server_port: int = 4242
@export var is_server: bool = false
@export var max_clients: int = 300

var peer: MultiplayerPeerENet
var players = {} # id -> {name, money, job, skin}

func _ready():
    if is_server:
        host()

func host():
    peer = MultiplayerPeerENet.new()
    peer.create_server(server_port, max_clients)
    Multiplayer.multiplayer.peer = peer
    Multiplayer.multiplayer.connect("peer_connected", Callable(self, "_on_peer_connected"))
    Multiplayer.multiplayer.connect("peer_disconnected", Callable(self, "_on_peer_disconnected"))
    print("Servidor iniciado na porta %d (max_clients=%d)" % [server_port, max_clients])

func connect_to_host(ip: String):
    peer = MultiplayerPeerENet.new()
    peer.create_client(ip, server_port)
    Multiplayer.multiplayer.peer = peer
    print("Tentando conectar em %s:%d" % [ip, server_port])

func _on_peer_connected(id):
    players[id] = {"name":"Player_%d"%id, "money":1000, "job":0, "skin":0}
    print("Peer connected: %d" % id)

func _on_peer_disconnected(id):
    players.erase(id)
    print("Peer disconnected: %d" % id)

@rpc("any_peer")
func rpc_request_money_transfer(from_id:int, to_id:int, amount:int):
    if Multiplayer.is_server():
        if not players.has(from_id) or not players.has(to_id):
            return
        if players[from_id]["money"] >= amount and amount>0:
            players[from_id]["money"] -= amount
            players[to_id]["money"] += amount
            rpc_id(0, "rpc_notify_transfer", from_id, to_id, amount)

@rpc("any")
func rpc_notify_transfer(from_id:int, to_id:int, amount:int):
    print("Transfer: %d -> %d : %d" % [from_id, to_id, amount])
