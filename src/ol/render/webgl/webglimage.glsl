//! NAMESPACE=ol.render.webgl.imagereplay.shader
//! CLASS=ol.render.webgl.imagereplay.shader.


//! COMMON
varying vec2 v_texCoord;
varying float v_opacity;

//! VERTEX
attribute vec2 a_position;
attribute vec2 a_texCoord;
attribute vec2 a_offsets;
attribute float a_opacity;

uniform mat4 u_projectionMatrix;
uniform mat2 u_sizeMatrix;

void main(void) {
  vec2 offsets = u_sizeMatrix * a_offsets;
  gl_Position = u_projectionMatrix * vec4(a_position, 0., 1.) + vec4(offsets, 0., 0.);
  v_texCoord = a_texCoord;
  v_opacity = a_opacity;
}


//! FRAGMENT
uniform sampler2D u_image;

void main(void) {
  vec4 texColor = texture2D(u_image, v_texCoord);
  gl_FragColor.rgb = texColor.rgb;
  gl_FragColor.a = texColor.a * v_opacity;
}
