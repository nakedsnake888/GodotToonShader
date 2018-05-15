# GodotToonShader
An implementation of a custom toon shader made with Godot shading language. 

GodotToonShader is my first spatial shader made with Godot Engine. At the current stage it is very simple, but it works. Some customization will come. I hope to help someone out there who was struggling to create shader like me.

Version 1.0 (beta):

Finally it is online! Currently I'm testing the shader so it's still in an early stage, but it is working good. The only thing I need to fix (at the moment) is the normal map functioning, everything else is working good. 

How to use it:

1) Create a new ShaderMaterial;
2) Load my toonProva.shader into the shader box;
3) (TEMPORARY) since it seems that Godot Shading Language has a problem with assigning default values to uniforms (but it should be fixed for release 3.1) you have to Adjust the parameters. 
   The default values are:
   Color -> White (All 1.0)
   Use Texture -> On (Still you need to load a texture in order to see textures, so if you just want to use a color turn it off)
   Use Normal Map -> Off (At the moment it is not working well, at least for me)
   Amount Of Light -> 0.8 (this value indicate to the shader how much "lit" is the surface)
   Amount of Shadow -> 0.2 (this value indicate how much "unlit" is the surface)
   Cut Point -> 0.5 (It is used to fix the position shadow on the surface)
   
   And that's it! In the next days i will try to fix the usage of normalMap, so please stay tuned!
