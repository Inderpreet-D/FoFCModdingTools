shader_type canvas_item;


//global uniform float shader_time;


uniform vec4 tone: source_color;
uniform sampler2D noise_1;
uniform vec2 speed_1;


void fragment() {
    //float shader_time = TIME;
    vec2 uv = UV;
    vec4 result = texture(TEXTURE, uv);
    COLOR = result * tone;
}