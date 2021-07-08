# FinishedItemButton.gd
extends TextureButton
class_name FinishedItemButton

var item: Item

signal finished_item_selected(item)


func _on_FinishedItemButton_pressed():
	print(item.item_name + " clicked")
	emit_signal("finished_item_selected", item)


func scale_image():
	print(texture_normal.get_size())
	if texture_normal.get_size() == Vector2(128, 128):
		var image: Image = texture_normal.get_data()
		image.resize(64, 64)
		print(image)
		var itex: ImageTexture = ImageTexture.new()
		itex.create_from_image(image)
		texture_normal = itex
