shader_type canvas_item;

uniform int arraySize;
uniform vec3 colorArray[128] : source_color;

vec3 getNearest(vec3 color, vec3[128] array){
	
	vec3 closestCol;
	float lowestDist = 1.733;
	for (int i = 0; i < arraySize; i++){
		if (distance(color, array[i]) < lowestDist){
			lowestDist = distance(color, array[i]);
			closestCol = array[i];
		}
	}
	
	return closestCol;
}

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	pixelColor.rgb = getNearest(pixelColor.rgb, colorArray);
	
	COLOR = pixelColor;
}
