shader_type spatial;
//Texture for light color
uniform sampler2D light_text : hint_albedo;

//Texture for shadow color (REMEMBER that shadow areas are light_texture multiplied with shadow_texture, basically)
uniform sampler2D shadow_text : hint_albedo;
//this value decides how much "lit" (or "unlit") is the mesh based on NdotL value
uniform float cut_point : hint_range(0.0, 1.0);
//this value set the influence of vertx_color (DEFAULT/IF NOT USED 1)
uniform float adjust_threshold : hint_range (0.0, 1.0);
//this value determine the force of the shadow texture
uniform float shadow_force : hint_range(0.0, 1.0);
//this varying retrieve uv for usage in light pass!
varying vec2 uv;
//this is used for retrieving threshold values from Vector color (REMEMBER that i used channel R(Red) for this)
varying vec4 color;

//vertex pass -> retriev uv from mesh's UV main channel (channel 0 I think) & will retrieve vertex color for thresholding lighting
void vertex()
{
	uv = UV;
	color = COLOR;
}

void fragment()
{
	ALBEDO = texture(light_text, uv).rgb;
}

//This function is used to calculate NdotL
float calc_NdotL(vec3 normal, vec3 light)
{
	float NdotL = dot(light, normal);
	return NdotL;
}

//This function is used for calculate shading
bool calc_shading(float sm)
{
	if(sm > cut_point)
	{
		return true;
	} else
	{
		return false;
	}
}

//light pass -> we get LIGHT vector and normalize it, calculate the NdotL, calculate shading and appy LIGHT
//REMEMBER that we aren't really using LIGHT_COLOUR, so it won't affect the mesh colour!
void light()
{
	vec3 light = normalize(LIGHT);
	vec3 shadow = texture(shadow_text, uv).rgb;
	float NdotL = calc_NdotL(NORMAL, light);
	vec3 col = color.rgb;
	col.g = 1.0;
	col.b = 1.0;
	float sm = smoothstep(0.0, 1.0, NdotL*(col.r*adjust_threshold));
	bool shade = calc_shading(sm);
	if(shade == true)
	{
		DIFFUSE_LIGHT = ALBEDO;
	} else
	{
		DIFFUSE_LIGHT = ALBEDO*shadow*shadow_force;
	}
}