#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;  // size of picture (width, height)
uniform vec2 u_mouse;       // cursor position in px
uniform float u_time;       // ms from start moment

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution;
  vec2 m = u_mouse/u_resolution;

  gl_FragColor = vec4(
    st.y / m.y,
    m.x,
    sin(2.0 * u_time),
    1.0
  );
}