#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    float d = distance(st, vec2(0.5));
    vec3 color = vec3(smoothstep(0.48, 0.481, d));

    gl_FragColor = vec4(color, 1.0);
}