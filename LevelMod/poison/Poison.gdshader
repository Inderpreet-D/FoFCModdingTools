shader_type canvas_item;


global uniform float shader_time;


uniform vec4 tone: source_color;
uniform vec2 speed_1;
uniform vec2 speed_2;
uniform float threshold: hint_range(0.0, 1.0, 0.1);
uniform sampler2D noise_1: repeat_enable;
uniform sampler2D noise_2: repeat_enable;


void fragment() {
    vec2 uv = UV;
    vec4 noise_1_sample = texture(noise_1, uv + speed_1 * shader_time);
    vec4 noise_2_sample = texture(noise_2, uv + speed_2 * shader_time);
    vec4 sample = texture(TEXTURE, uv);
    vec4 result = sample + step(noise_1_sample + noise_2_sample, vec4(vec3(threshold), 1.0));
    COLOR = result * tone;
    COLOR.a *= sample.a;
}