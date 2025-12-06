shader_type canvas_item;


uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;


void fragment() {
	vec4 tex = textureLod(screen_texture, SCREEN_UV, 0.0);
	COLOR.rgb = vec3((0.299 * tex.r) + (0.587 * tex.g) + (0.114 * tex.b));
	COLOR.a = tex.a;
}