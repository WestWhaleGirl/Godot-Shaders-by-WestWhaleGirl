shader_type canvas_item;
render_mode unshaded;

uniform float rWeight;
uniform float gWeight;
uniform float bWeight;

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	COLOR = pixelColor;
	float divisorOffset = rWeight + bWeight + gWeight;
	if (UV.x >= 0.0){
		float brightness = (rWeight * pixelColor.r + gWeight * pixelColor.g + bWeight * pixelColor.b) / divisorOffset;
		COLOR = vec4(brightness, brightness, brightness, pixelColor.w);
	}
}