//to be applied to a quad Mesh3D with dimensions 2m x 2m
shader_type spatial;
render_mode unshaded;
//samplin time
uniform sampler2D depth_texture : source_color, hint_depth_texture;
uniform sampler2D screen_texture: hint_screen_texture, filter_linear_mipmap;
//uniforms to scale depth by
uniform float zNear = 0.05;
uniform float zFar = 100.0;

varying mat4 CAMERA;

void vertex() {
	//make sure the quad is always on screen
	POSITION = vec4(VERTEX, 1.0);
	CAMERA = INV_VIEW_MATRIX;
}

void fragment(){
	//get original screen texture
	vec4 original = texture(screen_texture, SCREEN_UV);
	//get depth
	float depth = texture(depth_texture, SCREEN_UV).x;
	//normalized device coordinate from -1 to 1
	vec3 ndc = vec3(SCREEN_UV * 2.0 - 1.0, depth);
	//convert to distance to camera
	vec4 view = INV_PROJECTION_MATRIX * vec4(ndc, 1.0);
	view.xyz /= view.w;
	//linearlize depth
	float linear_depth = view.z;
	//scale depth
	float scaled_depth = (zFar * zNear) / (zFar + (linear_depth * (zNear - zFar)));
	//convert to world space (useful for doing something from a specific point in space)
	vec4 world = CAMERA * INV_PROJECTION_MATRIX * vec4(ndc, 1.0);
	vec3 world_position = world.xyz / world.w;
	//set ALBEDO to depth
	ALBEDO = vec3(1.0 - scaled_depth);
}
