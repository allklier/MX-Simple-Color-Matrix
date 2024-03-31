// Colour matrix shader for Matchbox
// based on lewis@lewissaunders.com, adapted by jan@janklier.com

#extension GL_NV_non_square_matrices : enable

uniform sampler2D input1;
uniform float adsk_result_w, adsk_result_h;
uniform float r2r, r2g, r2b, g2r, g2g, g2b, b2r, b2g, b2b;

void main() {
	vec2 coords = gl_FragCoord.xy / vec2(adsk_result_w, adsk_result_h);

	vec4 i = vec4(texture2D(input1, coords).rgb,1.0);
	mat4x4 m = mat4x4(r2r, r2g, r2b, 0.0,  
		    	  g2r, g2g, g2b, 0.0,  
		    	  b2r, b2g, b2b, 0.0,
		    	  0.0, 0.0, 0.0, 1.0);

	gl_FragColor = vec4(i * m);
}
