# VRChat2DSpriteAvatar
2D Sprite Based VRChat avatar.

**Includes**
- Template Scene of the VRChat avatar
- 2K Sprite Sheet(Idle and Walk animation in 8 Directions - 48 sprites in total)
- Custom 2D ShaderGraph asset
- Custon 2D Shader Code

**Note**
- This shader will _NOT_ work as a Quest Standalone Avatar, since Quest Standalone does not support custom shaders.
- The shader has an issue that shows the error message:
  `invalid subscript 'VertexTangent`
  which can be ignored when compiling the avatar for VRChat, BUT will have to locate the shader under,
  `Shaders/Failed To Compile/Custom Shader` OR `.../Shadergraphs`
- While you may use this shader as both profit AND non-profit projects, DO consider supporting ![My Commissions,](https://vgen.co/UberTheMeh) which includes additional features not present in this project.
- If there are any issues importing the assets into your project, please let me know in ![Issues.](https://github.com/UberTheMeh/VRChat2DSpriteAvatar/issues)

## Shader Graphs
If you wish to create the shader in your project without importing the assets, please take reference of the images below
You can import ShaderGraph into your VRChat project through ![THIS](https://github.com/z3y/ShaderGraph) repository.

### Main ShaderGraph
![alt text](https://github.com/UberTheMeh/VRChat2DSpriteAvatar/blob/main/Screenshots/2D%20Shader.PNG)

### "Is in Mirror" Subgraph
![alt text](https://github.com/UberTheMeh/VRChat2DSpriteAvatar/blob/main/Screenshots/is%20in%20mirror.PNG)
