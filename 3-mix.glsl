#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution;
  
  vec3 color1 = vec3(0.0, 1.0, 0.0);
  vec3 color2 = vec3(1.0, 0.0, 0.0);

  vec3 color3 = mix(color1, color2, st.x);

  gl_FragColor = vec4(color3, 1.0);
}