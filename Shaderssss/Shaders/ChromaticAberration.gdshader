shader_type canvas_item;

uniform vec2 rOffset;
uniform vec2 gOffset;
uniform vec2 bOffset;

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	//calculates distance from the center UV = 0.5, 0.5
	
	vec2 dfc = vec2(UV.x - 0.5, UV.y - 0.5);
	
	float r = texture(TEXTURE, UV - rOffset * dfc).r;
	float g = texture(TEXTURE, UV - gOffset * dfc).g;
	float b = texture(TEXTURE, UV - bOffset * dfc).b;
	
	COLOR = vec4(r, g, b, pixelColor.a);
}
