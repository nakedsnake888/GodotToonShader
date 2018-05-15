shader_type spatial;

uniform sampler2D text : hint_albedo;
uniform sampler2D normal_map : hint_normal;
uniform vec4 color : hint_color;
uniform bool useTexture = true;
uniform bool useNormalMap = false;
uniform float amount_of_light : hint_range(0.0,1.0);
uniform float amount_of_shadow : hint_range(0.0,1.0);
uniform float cut_point : hint_range(0.0, 1.0);
uniform float normalMapDepth : hint_range(0.0, 1.0);

void fragment()
{
	if(useTexture)
	{
		vec3 a1 = texture(text, UV).rgb;
		ALBEDO = a1*color.rgb;
	} else
	{
		ALBEDO = color.rgb;
	}
	if(useNormalMap == true)
	{
		NORMALMAP = texture(normal_map, UV).xyz * vec3(2.0,2.0,1.0) - vec3(1.0,1.0,0.0);
		NORMALMAP_DEPTH = normalMapDepth;
	} else
	{
		NORMALMAP_DEPTH = 0.0;
	}
}
float calc_NdotL(vec3 light, vec3 normal)
{
	float NdotL = dot(normalize(light), normal);
	return NdotL;
}
float calc_toonStripes(float NdotL)
{
	if(NdotL > cut_point)
	{
		return amount_of_light;
	} else
	{
		return amount_of_shadow;
	}
}
void light()
{
	float NdotL = calc_NdotL(LIGHT, NORMAL);
	float intensity = calc_toonStripes(NdotL);
	if(useNormalMap == true)
	{
		DIFFUSE_LIGHT = ALBEDO*intensity*4.0*ATTENUATION;
	} else
	{
		DIFFUSE_LIGHT = ALBEDO*intensity*ATTENUATION;
	}
	
}