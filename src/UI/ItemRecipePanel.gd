# ItemRecipePanel.gd
extends PanelContainer
class_name ItemRecipePanel

onready var finished_item: TextureButton = $HBoxContainer/FinishedItem
onready var component_1: TextureRect = $HBoxContainer/Component1
onready var component_2: TextureRect = $HBoxContainer/Component2

var finished: Item
var comp1: Item
var comp2: Item


func set_items(_finished: Item, _comp1: Item, _comp2: Item):
	finished = _finished
	comp1 = _comp1
	comp2 = _comp2
	
	finished_item.texture_normal = finished.icon
	component_1.texture = comp1.icon
	component_2.texture = comp2.icon
