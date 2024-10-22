 shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float fisheye_strength = 1.0; // Control the fisheye effect strength
vec2 fisheye(vec2 uv) {
vec2 d = uv - 0.5;
float r = length(d);
float theta = atan(d.y, d.x);
float rf = pow(r, fisheye_strength) / pow(0.5, fisheye_strength - 1.0);
return vec2(0.5) + rf * normalize(d);
}
void fragment() {
vec2 iResolution = 1.0 / SCREEN_PIXEL_SIZE;
vec2 q = FRAGCOORD.xy / iResolution.xy;

// Apply fisheye distortion
q = fisheye(q);
vec3 col = texture(screen_texture, q).rgb;
COLOR = vec4(col, 1.0);
} 