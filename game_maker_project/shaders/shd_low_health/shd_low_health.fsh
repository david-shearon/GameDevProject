//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float health; // 1 is full, 0 is empty

void main()
{
	float border_size = 100.0*(1.0-health);
	vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (border_size != 0.0) {
		float xDist = min(gl_FragCoord.x, 1804.0 - gl_FragCoord.x);
		float yDist = min(gl_FragCoord.y, 1804.0 - gl_FragCoord.y);
		float dist = min(xDist, yDist);
		float redness = min(border_size, dist)/border_size;
	
		gl_FragColor = mix(vec4(1.0, 0.0, 0.0, 1.0), color, redness);
	} else {
		gl_FragColor = color;
	}
}
