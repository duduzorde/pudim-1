extends Node2D
class_name Level

const   _DIALOG_SCREEN: PackedScene = preload("res://Recursos/Action RPG Resources/Dialog/dialog_screen.tscn")
var _dialog_data: Dictionary = {
	0:{
		"faceset": "res://Recursos/Action RPG Resources/Dialog/Images/melinateste.webp",
		"dialog": "eita",
		"title": "Melina"
	},
	
	1:{
		"faceset": "res://icon.svg",
		"dialog": "Quem ousa invadir meu território?!",
		"title": "Monstro"
	},
	
	2:{
		"faceset": "res://Recursos/Action RPG Resources/Dialog/Images/melinateste.webp",
		"dialog": "Eu... eu sou Malina. Estou procurando por algo muito importante.",
		"title": "Melina"
	},
	
	3:{
		"faceset": "res://icon.svg",
		"dialog": "Importante? A única coisa importante aqui é que você será meu jantar!!",
		"title": "Monstro"
	}

}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)
