/// @description Draw Title
// 
draw_self();
draw_set_font(Font_Title);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(#FFFF00)
draw_text_transformed(x, y, "Choose how many ships you want:", .25, .25, 0);
// Draw text at position (100, 100) with 45 degrees of rotation, no scaling
