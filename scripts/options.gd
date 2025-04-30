class_name Options
extends Control

@onready var close: Button = $MarginContainer/VBoxContainer/Close

signal exit_options

func _ready() -> void:
	close.button_down.connect(on_exit_options)
	set_process(false)
	
func on_exit_options() -> void:
	exit_options.emit()
	set_process(false)
