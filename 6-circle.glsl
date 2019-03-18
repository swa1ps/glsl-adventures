#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

float circle(in vec2 st, in vec2 center, in float radius) {
    float smooth_border = 0.001;
    float d = distance(st, center);
    return smoothstep(radius, radius + smooth_border, d);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    vec3 color = vec3(
        circle(st, vec2(0.5), 0.4)
    );

    gl_FragColor = vec4(color, 1.0);
}