class_name MainMenu
extends Control

@onready var new_game_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/NewGameButton as Button
@onready var load_game: Button = $MarginContainer/HBoxContainer/VBoxContainer/LoadGame as Button
@onready var options_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Options as Button
@onready var exit: Button = $MarginContainer/HBoxContainer/VBoxContainer/Exit as Button
@onready var margin_container: MarginContainer = $MarginContainer
@onready var options: Options = $Options



@onready var start_new = preload("res://scenes/game.tscn") as PackedScene

func _ready():
	new_game_button.button_down.connect(on_new_game)
	options_button.button_down.connect(on_options)
	exit.button_down.connect(on_exit)
	options.exit_options.connect(on_exit_options)
	
func on_new_game() -> void:
	get_tree().change_scene_to_packed(start_new)

func on_options() -> void:
	margin_container.visible = false
	options.set_process(true)
	options.visible = true

func on_exit() -> void:
	get_tree().quit()
	

func on_exit_options() -> void:
	margin_container.visible = true
	options.visible = false
