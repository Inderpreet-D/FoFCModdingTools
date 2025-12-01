// From here: https://godotshaders.com/shader/edge-detection/

shader_type canvas_item;

// A shader by The Gingerjam, thanks al1-ce for their rgb2hsv and hsv2rgb code: https://godotshaders.com/shader/hsv-adjustment/, the rest is by me
// You can also detect edges by hue or saturation by changing all .z in line 37 and 39 to .x or .y

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float add : hint_range(0.0, 0.002, 0.0001);
uniform float threshold : hint_range(0.0, 1.0, 0.001);
uniform float threshold2 : hint_range(0.0, 1.0, 0.001);
uniform vec4 edgeColour : source_color;
uniform vec4 edgeColour2 : source_color;
uniform vec4 nonEdgeColour : source_color;

vec3 rgb2hsv(vec3 c) {
	vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
	vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
	
	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}


void fragment() {
	vec3 up = rgb2hsv((texture(screen_texture, vec2(SCREEN_UV.x, SCREEN_UV.y + add))).rgb);
	vec3 down = rgb2hsv((texture(screen_texture, vec2(SCREEN_UV.x, SCREEN_UV.y - add))).rgb);
	vec3 left = rgb2hsv((texture(screen_texture, vec2(SCREEN_UV.x - add, SCREEN_UV.y))).rgb);
	vec3 right = rgb2hsv((texture(screen_texture, vec2(SCREEN_UV.x + add, SCREEN_UV.y))).rgb);
	vec3 real = rgb2hsv((texture(screen_texture, SCREEN_UV)).rgb);
	
	if(abs(real.z - up.z) > threshold || abs(real.z - down.z) > threshold || abs(real.z - left.z) > threshold || abs(real.z - right.z) > threshold){
		COLOR.rgb = edgeColour.rgb;
	} else if(abs(real.z - up.z) > threshold2 || abs(real.z - down.z) > threshold2 || abs(real.z - left.z) > threshold2 || abs(real.z - right.z) > threshold2){
		COLOR.rgb = edgeColour2.rgb;
	} else {
		COLOR.rgb = nonEdgeColour.rgb;
	}
}
