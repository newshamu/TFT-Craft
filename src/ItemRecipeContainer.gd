# ItemRecipeContainer.gd
extends PanelContainer
class_name ItemRecipeContainer

onready var container: VBoxContainer = $ScrollContainer/VBoxContainer
onready var empty_label: Label

var ItemRecipePanelScene: PackedScene = preload("res://src/UI/ItemRecipePanel.tscn")


func _ready():
	var overlay: CanvasLayer = get_tree().root.get_node("App").get_node("Overlay")
	empty_label = overlay.get_node("EmptyLabel")


func _process(_delta):
	if container.get_children().size() > 0:
		empty_label.visible = false
	else:
		empty_label.visible = true


func add_item(item: Item):
	if item.tier != "finished":
		return
	
	var panel := ItemRecipePanelScene.instance() as ItemRecipePanel
	container.add_child(panel)
	panel.set_item(item)


func _on_finished_item_selected(item: Item):
	add_item(item)
