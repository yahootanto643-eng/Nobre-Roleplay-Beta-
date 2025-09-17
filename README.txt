Projeto 4 v2 - Mini-RPG urbano (base) with requested features

Features added in v2:
- Login UI with server selection (simulated Google login). After login, player name saved in ProjectSettings (for demo).
- Cellphone UI toggled via HUD: Banco (opens bank UI stub) and Instagram (opens insta stub).
- Bank RPC implemented on server: rpc_request_money_transfer(from, to, amount). Server validates and broadcasts rpc_notify_transfer.
- SpawnPoints: two favela spawn markers (FavelaA and FavelaB).
- Zones placeholders: FavelaA, FavelaB, Police, Hospital (HP), Exército, Jornal.
- Vehicle scene and simple spawner; vehicles can be entered/exited (stubs).
- Player jobs (cargos) and skin coloring for each job (1..6) implemented via player.set_job(job_index).
- Network max_clients set to 300 in scripts/network.gd.

How to test:
1. Open project in Godot 4.
2. Open Login.tscn to simulate selecting a server and name.
3. Open Main.tscn to run the scene; use the HUD to toggle cellphone (call hud.toggle_cellphone()).
4. For multiplayer testing, set Network node is_server true on one instance and connect others to it.

Notes and limitations:
- This is a functional skeleton: many systems are stubs (UI, vehicle control, auth). They are designed to be replaced/expanded.
- Google login is simulated for now; real OAuth requires server and Google APIs.
- For 300 players in production, implement interest management, state compression, and a robust server (VPS) with bandwidth.
