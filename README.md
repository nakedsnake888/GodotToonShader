# GodotToonShader
An implementation of a custom toon shader made with Godot shading language. 

GodotToonShader is my first spatial shader made with Godot Engine. At the current stage it is very simple, but it works. Some customization will come. I hope to help someone out there who was struggling to create shader like me.

Version 1.0:

Finally it is online! Currently I'm testing the shader so it's still in an early stage, but it is working good. Normal maps are working good! I don' know (at the moment) if they are pefect but for the moment they are ok. 

How to use it:

1) Create a new ShaderMaterial;
2) Load my toonProva.shader into the shader box;
3) (TEMPORARY) since it seems that Godot Shading Language has a problem with assigning default values to uniforms (but it should be fixed for release 3.1) you have to Adjust the parameters.
   The default values are:  
   Color -> White (All 1.0)  
   Use Texture -> On (Still you need to load a texture in order to see textures, so if you just want to use a color turn it off)  
   Use Normal Map -> Off (To use a normal map, just sey it to "on" and load a normalMap. Remember to import it in the correct way, or they won't work good)  
   Amount Of Light -> 0.8 (this value indicate to the shader how much "lit" is the surface)  
   Amount of Shadow -> 0.2 (this value indicate how much "unlit" is the surface)  
   Cut Point -> 0.5 (It is used to fix the position shadow on the surface)  
       
And that's it! Feel free to use it anyway you want, i will probably add comments to the code today so you can tune yourself the code if you need it. 

-----------------------------------------------------------------------------------------------------------------------------------

For version 1.1 I'm fixing usage of multiple lights, and I'm building a new shader that's very similar to "Guilty Gear Xrd"'s shader (I hope the title is right ahah) because I wanted to achieve a similar result in my next game. And since Godot is a free and open-source software I'm planning to release all the (interesting) code I'm creating, so a lot of noobs (like me) won't have to learn a shading language without examples ahah. Hope you will enjoy it!
