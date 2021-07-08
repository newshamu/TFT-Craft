extends PanelContainer

onready var container := $GridContainer
var item_recipe_container: ItemRecipeContainer

var FIB := preload("res://src/UI/FinishedItemButton.tscn")


func _ready():
	item_recipe_container = get_tree().root.get_node("App").get_node("ItemRecipeContainer")
	
	for item in ItemRepository.finished.keys():
		var button: FinishedItemButton = FIB.instance()
		button.texture_normal = ItemRepository.finished[item].icon
		button.item = ItemRepository.finished[item]
		button.connect("finished_item_selected", item_recipe_container, "_on_finished_item_selected")
		container.add_child(button)
