class_name Options
extends Control

@onready var close: Button = $MarginContainer/VBoxContainer/Close as Button

signal exit_options

func _ready() -> void:
	close.pressed.connect(on_exit)
	set_process(false)
	
func on_exit() -> void:
	exit_options.emit()
	set_process(false)
