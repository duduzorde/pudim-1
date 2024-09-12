extends Node2D

var draggable = false
var is_inside_dropable = false	
var body_ref
var offset: Vector2
var initialPos: Vector2
var is_dragging = false

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
				get_tree().change_scene_to_file("res://masmorra_2.tscn")
				## INSERIR AQUI UMA FUNÇÃO get_tree().change_scene_to_file("res://cena com o bau aberto.tscn") PRA QUANDO TIVER A CENA PRONTA
			else:
				tween.tween_property(self,"position",initialPos,0.2).set_ease(Tween.EASE_OUT)



func _on_area_2d_mouse_entered():
	if not is_dragging:
		draggable = true
		scale = scale * Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not is_dragging:
		draggable = false
		scale = scale * Vector2(0.95, 0.95)



func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body_ref = body
	else:
		is_dragging = false
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position",initialPos,0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_body_exited(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
