/// @description highlighting tiles (currently)
/// @description: Location/Sprite Control
#region Game Phases:

#region // player 2's turn (Incomplete)
if(GameTracker.PlayerPhase == 2)	// check if it is player 2's turn
{

}
#endregion

#region // Player 1's turn (Incomplete)
else if (GameTracker.PlayerPhase == 1) // check if it is player 1's turn
{
	
}	
#endregion

#region // Player 1's Place Ships screen (needs completion)

#endregion

#region // Player 2's Place Ships Screen (needs completion)

#endregion

#region // Choose Game Size Screen (needs completion)

#endregion

#region // pause menu (needs Completion)

#endregion

#endregion

#region // Tile highlighting
// Variables to store the currently hovered tiles
var hovered_player_tile = noone;
var hovered_enemy_tile = noone;

// Loop through Player 1's grid
for (var i = 0; i < array_length(global.object_player_grid); i++) 
{
    for (var j = 0; j < array_length(global.object_player_grid[i]); j++) 
	{
        var tile = global.object_player_grid[i][j];
        
        // Check if the mouse is inside the tile's bounding box
        if (point_in_rectangle(mouse_x, mouse_y, tile.bbox_left, tile.bbox_top, tile.bbox_right, tile.bbox_bottom)) 
		{
            hovered_player_tile = tile;
        } 
		else 
		{
            // Reset the tile's appearance if not hovered
            tile.image_blend = c_white;
        }
    }
}

// Loop through Player 2's grid
for (var i = 0; i < array_length(global.object_enemy_grid); i++) 
{
    for (var j = 0; j < array_length(global.object_enemy_grid[i]); j++) 
	{
        var tile = global.object_enemy_grid[i][j];
        
        // Check if the mouse is inside the tile's bounding box
        if (point_in_rectangle(mouse_x, mouse_y, tile.bbox_left, tile.bbox_top, tile.bbox_right, tile.bbox_bottom)) 
		{
            hovered_enemy_tile = tile;
        } 
		else 
		{
            // Reset the tile's appearance if not hovered
            tile.image_blend = c_white;
        }
    }
}

// Highlight the currently hovered Player 1 tile (if any)
if (hovered_player_tile != noone) 
{
    hovered_player_tile.image_blend = c_yellow;  // Change the color to yellow
}

// Highlight the currently hovered Player 2 tile (if any)
if (hovered_enemy_tile != noone) 
{
    hovered_enemy_tile.image_blend = c_yellow;  //  Change the color to yellow
}
#endregion