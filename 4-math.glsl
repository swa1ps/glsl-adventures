#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

float plot(vec2 st, float pct){
  float size = 0.01;
  return smoothstep(pct-size, pct, st.y) - smoothstep(pct, pct+size, st.y);
}

float PI = 3.14;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution;
  vec3 lineColor = vec3(0.0, 1.0, 0.0);

  float y = st.x;
  // returns the trigonometric sine of angle.
  y = sin(st.x);
  y = sin(PI * st.x);
  // returns the value of x raised to the y power.
  y = pow(st.x, 2.0);
  // returns 1 if arg2 greater then arg1, returns 0 otherwise
  y = step(st.x, 0.5);
  y = step(0.5, st.x);
  //returns the nearest integer that is less than or equal to x.
  y = floor(15.0 * st.x) / 15.0;
  // returns the nearest integer that is greater than or equal to x.
  y = ceil(15.0 * st.x) / 15.0;
  // performs smooth Hermite interpolation between arg1 and arg2
  y = smoothstep(0.2, 0.8, st.x);
  // returns the value of x constrained to the range minVal to maxVal
  y = clamp(st.x, 0.2, 0.8);
  // returns the minimum of the two parameters.
  y = min(st.x, 0.5);
  // returns the maximum of the two parameters.
  y = max(st.x, 0.5);

  float pct = plot(st, y);
  vec3 color = mix(vec3(y), lineColor, pct);

  gl_FragColor = vec4(color,1.0);
}