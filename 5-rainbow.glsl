#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

float plot(vec2 st, float pct){
  float size = 0.01;
  return smoothstep(pct-size, pct, st.y) - smoothstep(pct, pct+size, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    float r = 1.3 - sin(st.x * 3.0) * 1.3;
    float g = sin(st.x * 5.0 - 0.3);
    float b = sin(st.x * 4.8 - 2.0);

    vec3 color = vec3(r, g, b);
    color = color + plot(st, r) * vec3(1.0, 0.0, 0.0);
    color = color + plot(st, g) * vec3(0.0, 1.0, 0.0);
    color = color + plot(st, b) * vec3(0.0, 0.0, 1.0);

    gl_FragColor = vec4(color,1.0);
}