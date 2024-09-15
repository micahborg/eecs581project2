/// @description Draw Title
// 
draw_self();
draw_set_font(Font_Title);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(#FFFF00)
draw_text(x,y, "BattleShip");
// Draw text at position (100, 100) with 45 degrees of rotation, no scaling
var angle = 20; // in degrees
draw_set_color(#FFFFFF)
// Use draw_text_transformed() to draw text at an angle
draw_text_transformed(1250, 250, "Created by Team 21!", .15, .15, angle);
