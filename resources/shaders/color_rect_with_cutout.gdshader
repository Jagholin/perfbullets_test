shader_type canvas_item;

uniform vec2 hole_position;
uniform vec2 hole_size;

void fragment() {
	vec2 loc = FRAGCOORD.xy;
	vec2 fp = step(hole_position, loc) * (vec2(1.0) - step(hole_position + hole_size, loc));
	COLOR.a = 1.0 - fp.x * fp.y;
}
