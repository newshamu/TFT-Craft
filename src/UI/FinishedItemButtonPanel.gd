extends PanelContainer

onready var container := $GridContainer

var FIB := preload("res://src/UI/FinishedItemButton.tscn")


func _ready():
	for item in ItemRepository.finished.keys():
		var button: TextureButton = FIB.instance()
		button.texture_normal = ItemRepository.finished[item].icon
		container.add_child(button)
