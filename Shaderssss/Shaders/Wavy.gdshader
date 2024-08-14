shader_type canvas_item;
uniform float frequency;
uniform float offset;
uniform float amplitude;

void fragment() {
	vec2 pixelUV = UV;
	pixelUV.x += sin(UV.y * frequency + offset) * amplitude;
	vec4 pixelColor = texture(TEXTURE, pixelUV);
	COLOR = pixelColor;
}
