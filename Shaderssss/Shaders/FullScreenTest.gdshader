shader_type canvas_item;
//gets the texture of the screen itself
uniform sampler2D screen_texture: hint_screen_texture, filter_linear_mipmap;

void fragment() {
	//sets pixelColor to whatever pixel is behind the texture on the screen
	//pixelColor can now be modified to affect the whole screen
	vec4 pixelColor = texture(screen_texture, SCREEN_UV);
	COLOR = pixelColor;
}
