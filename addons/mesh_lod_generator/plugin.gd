@tool
extends EditorPlugin

func _enter_tree():
  add_custom_type("MeshLODGenerator", "Node", preload("mesh_lod_generator.gd"), preload("icon.svg"))

func _exit_tree():
  remove_custom_type("MeshLODGenerator")
