shader_type canvas_item;
uniform float xOffset;
uniform float yOffset;

void fragment() {
	vec2 newUV = UV;
	newUV *= 2.0;
	newUV.x += xOffset;
	newUV.y += yOffset;
	vec4 pixelColor = texture(TEXTURE,newUV);
	COLOR = pixelColor;
}
