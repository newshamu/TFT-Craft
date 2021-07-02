# ItemRecipePanel.gd
extends PanelContainer
class_name ItemRecipePanel

onready var finished_item: TextureButton = $HBoxContainer/FinishedItem
onready var finished_item_label: Label = $HBoxContainer/FinishedItemLabel
onready var component_1: TextureRect = $HBoxContainer/Component1
onready var component_2: TextureRect = $HBoxContainer/Component2

var finished: Item
var comp1: Item
var comp2: Item


func set_item(_finished: Item):
	finished = _finished
	print(finished.components)
	comp1 = ItemRepository.components[finished.components[0]]
	comp2 = ItemRepository.components[finished.components[1]]
	
	print(finished_item)
	finished_item.texture_normal = finished.icon
	finished_item_label.text = _finished.item_name
	component_1.texture = comp1.icon
	component_2.texture = comp2.icon


func _on_FinishedItem_pressed():
	queue_free()
