# ItemRepository.gd
extends Node

var components: Dictionary
var finished: Dictionary

const ITEM_FILE_PATH: String = "res://assets/data/items.json"


func _init():
	# Read item data from file
	var file := File.new()
	file.open(ITEM_FILE_PATH, File.READ)
	var content := file.get_as_text()
	file.close()
	
	# Convert item data to dictionary
	var item_data: Dictionary = JSON.parse(content).result
	
	_generate_components(item_data["items"]["components"])
	_generate_finished(item_data["items"]["finished"])


func _generate_components(item_data: Dictionary):
	var groups: Array = item_data.keys()
	
	for group in groups:
		var items: Array = item_data[group]
		
		for it in items:
			# Pass in item name, tier, group, icon filepath, and list of components (empty in this case)
			var item := Item.new(it["name"], "components", group, it["icon"], [])
			components[item.item_name] = item
	
	print("Loaded " + str(components.keys().size()) + " component items")


func _generate_finished(item_data: Dictionary):
	var groups: Array = item_data.keys()
	
	for group in groups:
		var items: Array = item_data[group]
		
		for it in items:
			# Pass in item name, tier, group, icon filepath, and list of components
			var item := Item.new(it["name"], "finished", group, it["icon"], it["components"])
			finished[item.item_name] = item
	
	print("Loaded " + str(finished.keys().size()) + " finished items")
