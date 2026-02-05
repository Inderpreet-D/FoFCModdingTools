shader_type canvas_item;


uniform vec2 speed_1;
uniform float x_mul = 20.0;
uniform float y_mul = 20.0;
uniform float x_threshold: hint_range(0.0, 1.0, 0.01);
uniform float y_threshold: hint_range(0.0, 1.0, 0.01);
uniform sampler2D noise_1: repeat_enable;


global uniform float shader_time;


bool is_eq(float a, float b) {
	return abs(a - b) < 0.0001;
}


void fragment() {
	//float shader_time = TIME;
	
	if (is_eq(COLOR.r, 1.0) && is_eq(COLOR.g, 0.0) && is_eq(COLOR.b, 0.0)) {
		vec2 speed = speed_1;
		float mid_y_val = (sin(UV.y * y_mul * PI) + 1.0) / 2.0;
		float mid_x_val = (cos(UV.x * x_mul * PI) + 1.0) / 2.0;
		
		if (mid_y_val <= y_threshold) {
			speed.y *= -1.0;
		}
		
		if (mid_x_val <= x_threshold) {
			speed.x *= -1.0;
		}
		
		COLOR.rgb *= texture(noise_1, UV + speed * shader_time).rgb;
	}
}