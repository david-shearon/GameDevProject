// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vector2(_x, _y) constructor {
	x = _x;
	y = _y;
	
	static equals = function(_vec2)
    {
        return x == _vec2.x && y == _vec2.y;
    }
}