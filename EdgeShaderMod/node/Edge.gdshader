shader_type canvas_item;


uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;
uniform float diff: hint_range(0.0, 1.0, 0.01);
uniform float diff_div = 1.0;


vec4 get_edge(vec2 screen_uv, vec2 offset) {
    vec2 uv = screen_uv + offset;
    uv = clamp(uv, vec2(0.0), vec2(1.0));
    vec4 tex = texture(screen_texture, uv);
    return tex;
}


void fragment() {
    float scaled_diff = diff / diff_div;
    
    vec4 left_tex = get_edge(SCREEN_UV, vec2(-scaled_diff, 0.0));
    vec4 right_tex = get_edge(SCREEN_UV, vec2(scaled_diff, 0.0));
    vec4 horiz_mix = mix(left_tex, right_tex, 0.5);
    vec4 left_edge = step(right_tex, horiz_mix);
    vec4 right_edge = step(left_tex, horiz_mix);
    
    vec4 top_tex = get_edge(SCREEN_UV, vec2(0.0, -scaled_diff));
    vec4 bot_tex = get_edge(SCREEN_UV, vec2(0.0, scaled_diff));
    vec4 vert_mix = mix(top_tex, bot_tex, 0.5);
    vec4 top_edge = step(bot_tex, vert_mix);
    vec4 bot_edge = step(top_tex, vert_mix);
    
    COLOR = mix(mix(left_edge, right_edge, 0.5), mix(top_edge, bot_edge, 0.5), 0.5);
    COLOR.rgb = vec3(1.0) - COLOR.ggg;
}