# ItemRecipeContainer.gd
extends PanelContainer
class_name ItemRecipeContainer

onready var container: VBoxContainer = $VBoxContainer

var ItemRecipePanelScene: PackedScene = preload("res://src/UI/ItemRecipePanel.tscn")


func add_item(item: Item):
	if item.tier != "finished":
		return
	
	var panel := ItemRecipePanelScene.instance() as ItemRecipePanel
	container.add_child(panel)
	panel.set_item(item)


func _on_finished_item_selected(item: Item):
	add_item(item)
