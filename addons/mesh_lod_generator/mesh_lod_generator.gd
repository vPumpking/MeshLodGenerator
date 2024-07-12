extends Node

class_name MeshLodGenerator

func find_mesh_instances(node: Node) -> Array:
    var result = []
    if node is MeshInstance3D:
        result.append(node)
    for child in node.get_children():
        result.append_array(find_mesh_instances(child))
    return result

func generate_lods_for_mesh(mesh: MeshInstance3D, lod_bias: float = 0.5, normal_merge_angle: float = 25, normal_split_angle: float = 60):
    var original_mesh = mesh.mesh
    if not original_mesh:
        return
    var importer := ImporterMesh.new()
    var surface_count = original_mesh.get_surface_count()
    for i in range(surface_count):
        var surface_arrays = original_mesh.surface_get_arrays(i)
        if surface_arrays.is_empty():
            continue
        importer.add_surface(Mesh.PRIMITIVE_TRIANGLES, surface_arrays)
        importer.generate_lods(normal_merge_angle, normal_split_angle, Array())
    mesh.mesh = importer.get_mesh()
    mesh.lod_bias = lod_bias

func generate_lods_for_scene(scene: Node, lod_bias: float = 0.5, normal_merge_angle: float = 25, normal_split_angle: float = 60):
    var mesh_instances = find_mesh_instances(scene)
    for mesh_instance in mesh_instances:
        generate_lods_for_mesh(mesh_instance, lod_bias, normal_merge_angle, normal_split_angle)

