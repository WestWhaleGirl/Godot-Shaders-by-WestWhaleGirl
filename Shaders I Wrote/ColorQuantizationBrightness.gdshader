shader_type canvas_item;

uniform int numberOfColors;
uniform vec3 colorArray[100] : source_color;

//gets average of rgb (approximates brightness)
float getAvg(vec3 color) {
	float avg;
	avg = (color.r + color.g + color.b) / 3.0;
	return avg;
}

//based on the brightness assigns quantizedValue to a number between 0 to n-1
int quantizeToN(float brightness, float n){
	int quantizedValue = int(floor(brightness * (n-1.0) + 0.5));
	return quantizedValue;
}

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	float average = getAvg(pixelColor.rgb);
	int quantization = quantizeToN(average, float(numberOfColors));
	pixelColor.rgb = vec3(colorArray[quantization]);
	
	COLOR = pixelColor;
}
