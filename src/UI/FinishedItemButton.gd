# FinishedItemButton.gd
extends TextureButton
class_name FinishedItemButton

var item: Item

signal finished_item_selected(item)


func _on_FinishedItemButton_pressed():
	print(item.item_name + " clicked")
	emit_signal("finished_item_selected", item)
