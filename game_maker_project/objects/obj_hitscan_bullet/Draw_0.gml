draw_set_alpha(alpha);
shader_reset();
draw_line_width_color(startX, startY, endX, endY, line_thickness, line_color, line_color);
shader_set(shd_low_health);
draw_set_alpha(1);