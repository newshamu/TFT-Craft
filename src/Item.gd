extends Node
class_name Item

var item_name: String
var tier: String
var group: String
var icon: Texture
var components: Array


func _init(_item_name: String, _tier: String, _group: String,
		   _icon_name: String, _components: Array):
	# Assign identifying info
	item_name = _item_name
	tier = _tier
	group = _group
	
	# Load icon
	icon = load("res://assets/images/items/" + tier + "/" + group + "/" + _icon_name)
	
	# Load components
	
