shader_type canvas_item;


uniform float progress: hint_range(0.0, 1.0, 0.001) = 1.0f;


void fragment() {
	vec4 c = texture(TEXTURE, UV);
	
	c.a = step(1.0 - progress, UV.y);
	
	COLOR *= c;
}