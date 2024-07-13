
# MeshLodGenerator
[meshLodGenerator logo: a purple sphere with the right side smooth and the left side simplified](./icon.png)

The `MeshLodGenerator` class is a Godot Editor plugin tool designed to generate Levels of Detail (LODs) for `MeshInstance3D` nodes within a scene. This class provides methods to find mesh instances and generate LODs for individual meshes or entire scenes.

## Methods

### `find_mesh_instances(node: Node) -> Array`
Finds all `MeshInstance3D` nodes within the given node's subtree.

**Parameters:**
- `node`: The root node to start the search from.

**Returns:**
- `Array`: An array containing all `MeshInstance3D` nodes found within the subtree.

**Example:**
```gdscript
var mesh_instances = MeshLodGenerator.new().find_mesh_instances(get_tree().root)
```

### `generate_lods_for_mesh(mesh: MeshInstance3D, lod_bias: float = 0.5, normal_merge_angle: float = 25, normal_split_angle: float = 60)`
Generates LODs for a given `MeshInstance3D`.

**Parameters:**
- `mesh`: The `MeshInstance3D` for which to generate LODs.
- `lod_bias`: The LOD bias value. Default is `0.5`.
- `normal_merge_angle`: The normal merge angle for LOD generation. Default is `25`.
- `normal_split_angle`: The normal split angle for LOD generation. Default is `60`.

**Example:**
```gdscript
var mesh = $MeshInstance3D
MeshLodGenerator.new().generate_lods_for_mesh(mesh, 0.5, 25, 60)
```

### `generate_lods_for_scene(scene: Node, lod_bias: float = 0.5, normal_merge_angle: float = 25, normal_split_angle: float = 60)`
Generates LODs for all `MeshInstance3D` nodes within the given scene.

**Parameters:**
- `scene`: The root node of the scene for which to generate LODs.
- `lod_bias`: The LOD bias value for all meshes in the scene. Default is `0.5`.
- `normal_merge_angle`: The normal merge angle for LOD generation. Default is `25`.
- `normal_split_angle`: The normal split angle for LOD generation. Default is `60`.

**Example:**
```gdscript
var scene = get_tree().root
MeshLodGenerator.new().generate_lods_for_scene(scene, 0.5, 25, 60)
```

## Example Usage

Here is an example of how you might use the `MeshLodGenerator` class in a script:

```gdscript
extends Node

func _ready():
    var scene = get_tree().get_root()
    var lod_generator = MeshLodGenerator.new()
    
    # Generate LODs for the entire scene
    lod_generator.generate_lods_for_scene(scene)

    # Find all MeshInstance3D nodes in the scene
    var mesh_instances = lod_generator.find_mesh_instances(scene)
    print(mesh_instances)

    # Generate LODs for a specific mesh instance
    if mesh_instances.size() > 0:
        lod_generator.generate_lods_for_mesh(mesh_instances[0])
```

## Install

Copy the `addons/mesh_lod_generator` folder into your `res://addons` folder and activate the addon in the project settings
