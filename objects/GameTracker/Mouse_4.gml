/// @description Insert description here
// You can write your code in this editor
#region // player Turns
if(PlayerPhase == 2)	// check if it is a Turn Phase
{
	var tile = scr_get_hovered_tile(global.object_player_grid)
	attack(tile);
}
#endregion