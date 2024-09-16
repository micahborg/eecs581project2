/// @description highlighting tiles (currently)
/// @description: Location/Sprite Control
if(PlayerPhase != 5)
{
#region //Score Checker

if(GameTracker.Player1Score == GameTracker.ScoreGoal)
{
	room_goto(WinP1);
}

if(GameTracker.Player2Score == GameTracker.ScoreGoal)
{
	room_goto(WinP2);
}

#endregion

#region //Game Phases:

#region // Player 1's Place Ships screen (needs completion)
if (PlayerPhase == 3) //
{	
	// draw the ships
	for (var i = 0; i < ShipsNumber; i++) // loop through ships
	{
		for (var j = 0; j < i + 1; j++) // loop through sections of the ship
		{
			// get ship section
			var ship = global.Ships[i];
			var ship_section = ship[j];
			
			// sprite for 1x1 ship
			if (i == 0)
			{
				global.object_player_grid[ship_section[0]][ship_section[1]].occupied = 1;
			}
			
			else 
			{
				// left-most side
				if (j == 0) 
				{
					global.object_player_grid[ship_section[0]][ship_section[1]].occupied = 2;
				}
				// right-most side
				else if (j == i) 
				{
					global.object_player_grid[ship_section[0]][ship_section[1]].occupied = 4;
				}
				// middle
				else 
				{
					global.object_player_grid[ship_section[0]][ship_section[1]].occupied = 3;
				}
			}
		}
	}
	
	// if space bar pressed, toggle vertical 
	if (keyboard_check_pressed(vk_space)) 
	{
		// assume shift is valid
		var valid_shift = true;
		
		// get ship
		var ship = global.Ships[global.ShipSelected];
		
		// get new locations for sections
		var new_locations = [ship[0], [], [], [], []];
		var vertical = global.object_player_grid[ship[0][0]][ship[0][1]].vertical;
		for (var i = 1; i < global.ShipSelected + 1; i++)
		{
			// get base location	
			var new_x = ship[0][0];
			var new_y = ship[0][1];
			
			// add shift to base location
			if (vertical) {
				new_x += i;
			}
			else 
			{
				new_y += i;
			}
			
			// save new location
			new_locations[i] = [new_x, new_y];
			
			// check if location is in grid
			if (new_x > 9 || new_x < 0 || new_y > 9 || new_y < 0)
			{
				valid_shift = false;
				break; // stop checking
			}
			
			// check if grid tile is occupied, if so stop 
			var tile = global.object_player_grid[new_x][new_y];
			if (tile.occupied > 0) {
				valid_shift = false;
				break;
			}
		}
		
		// clear and rotate tiles
		if (valid_shift) 
		{
			for (var i = 0; i < global.ShipSelected + 1; i++) 
			{
				// clearold  tile
				var to_clear = ship[i]; // get tile coords
				var tile = global.object_player_grid[to_clear[0]][to_clear[1]] // get tile
				tile.occupied = 0; // set unoccupied
				tile.vertical = false; // reset vertical
			
						
				// shift
				var new_x = new_locations[i][0];
				var new_y = new_locations[i][1];
				ship[i][0] = new_x; 
				ship[i][1] = new_y;
			
				// set new vertical 
				global.object_player_grid[new_x][new_y].vertical = !vertical;
			}
		}
	}
	
	
	// check for change ship selection
	if (keyboard_check_pressed(ord("C")) or keyboard_check_pressed(ord("c"))) 
	{
		global.ShipSelected++; // next ship
		
		// reset to 0 if out of bounds
		if (global.ShipSelected > ShipsNumber - 1) 
		{
			global.ShipSelected = 0;
		}
	}
	
	// check for shift
	var shift = [0, 0];
	if (keyboard_check_pressed(vk_up))
	{
		shift = [0, -1];
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		shift = [0, 1];
	}
	
	if (keyboard_check_pressed(vk_left))
	{
		shift = [-1, 0];
	}
	
	if (keyboard_check_pressed(vk_right))
	{
		shift = [1, 0];
	}
	
	
	// check if player is done placing ships, if so next player can place ships
	if (keyboard_check_pressed(vk_enter))
	{
		// reset ship locations
		var Ship1 = [[0,0]];
		var Ship2 = [[0,1],[1,1]];
		var Ship3 = [[0,2],[1,2],[2,2]];
		var Ship4 = [[0,3],[1,3],[2,3],[3,3]];
		var Ship5 = [[0,4],[1,4],[2,4],[3,4],[4,4]];
		var Ships = [Ship1, Ship2, Ship3, Ship4, Ship5];
		global.Ships = Ships;
		global.ShipSelected = 0;
		
		// change phase
		GameTracker.PlayerPhase = 4;
	}
	
	
	// if there's a shift, shift
	if (shift[0] + shift [1] != 0)
	{
		// assume all new locations are valid (inside grid and not occupied)
		var valid_shift = true;
		
		// get ship
		var ship = global.Ships[global.ShipSelected];
		
		// save old ship orientation
		var vertical = global.object_player_grid[ship[0][0]][ship[0][1]].vertical;
		
		// loop through ship sections
		for (var i = 0; i < global.ShipSelected + 1; i++)
		{
			var section_xy = ship[i];
			
			// if target tile is not in the grid, don't shift
			if (section_xy[1] + shift[1] > 9 || section_xy[1] + shift[1] < 0 || section_xy[0] + shift[0] > 9 || section_xy[0] + shift[0] < 0)
			{
				valid_shift = false;
				break; // stop checking
			}
			
			// if shift inside grid check if tiles occupied
			if (valid_shift)
			{
				// if target tile is occupied, but not by a section of the same ship, don't shift
				var new_tile = global.object_player_grid[section_xy[0] + shift[0]][section_xy[1] + shift[1]];
				
				// check if tile is occupied
				if (new_tile.occupied > 0) 
				{
					valid_shift = false // assume the tile isn't in the ship
				
					// check that tile isn't in ship
					for (var j = 0; j < global.ShipSelected + 1; j++)
					{
						var in_ship = ship[j];
						if (section_xy[0] + shift[0] == in_ship[0] && section_xy[1] + shift[1] == in_ship[1])
						{
							valid_shift = true;
							break;
						}
					}
				}
			}
		}
		
		// update ship, if valid shift
		if (valid_shift)
		{
			for (var i = 0; i < global.ShipSelected + 1; i++) 
			{
				// clear previous tiles
				var to_clear = ship[i]; // get tile coords
				global.object_player_grid[to_clear[0]][to_clear[1]].occupied = 0; // set unoccupied
						
				// shift
				ship[i][0] += shift[0]; // x
				ship[i][1] += shift[1]; // y
				
				// save old vertical
				global.object_player_grid[ship[i][0]][ship[i][1]].vertical = vertical;
			}
		}
		
	}
}	

#endregion

#region // Player 2's Place Ships Screen
if (PlayerPhase == 4) //
{	
	// draw the ships
	for (var i = 0; i < ShipsNumber; i++) // loop through ships
	{
		for (var j = 0; j < i + 1; j++) // loop through sections of the ship
		{
			// get ship section
			var ship = global.Ships[i];
			var ship_section = ship[j];
			
			// sprite for 1x1 ship
			if (i == 0)
			{
				global.object_enemy_grid[ship_section[0]][ship_section[1]].occupied = 1;
			}
			
			else 
			{
				// left-most side
				if (j == 0) 
				{
					global.object_enemy_grid[ship_section[0]][ship_section[1]].occupied = 2;
				}
				// right-most side
				else if (j == i) 
				{
					global.object_enemy_grid[ship_section[0]][ship_section[1]].occupied = 4;
				}
				// middle
				else 
				{
					global.object_enemy_grid[ship_section[0]][ship_section[1]].occupied = 3;
				}
			}
		}
	}
	
	// if space bar pressed, toggle vertical 
	if (keyboard_check_pressed(vk_space)) 
	{
		// assume shift is valid
		var valid_shift = true;
		
		// get ship
		var ship = global.Ships[global.ShipSelected];
		
		// get new locations for sections
		var new_locations = [ship[0], [], [], [], []];
		var vertical = global.object_enemy_grid[ship[0][0]][ship[0][1]].vertical;
		for (var i = 1; i < global.ShipSelected + 1; i++)
		{
			// get base location	
			var new_x = ship[0][0];
			var new_y = ship[0][1];
			
			// add shift to base location
			if (vertical) {
				new_x += i;
			}
			else 
			{
				new_y += i;
			}
			
			// save new location
			new_locations[i] = [new_x, new_y];
			
			// check if location is in grid
			if (new_x > 9 || new_x < 0 || new_y > 9 || new_y < 0)
			{
				valid_shift = false;
				break; // stop checking
			}
			
			// check if grid tile is occupied, if so stop 
			var tile = global.object_enemy_grid[new_x][new_y];
			if (tile.occupied > 0) {
				valid_shift = false;
				break;
			}
		}
		
		// clear and rotate tiles
		if (valid_shift) 
		{
			for (var i = 0; i < global.ShipSelected + 1; i++) 
			{
				// clearold  tile
				var to_clear = ship[i]; // get tile coords
				var tile = global.object_enemy_grid[to_clear[0]][to_clear[1]] // get tile
				tile.occupied = 0; // set unoccupied
				tile.vertical = false; // reset vertical
			
						
				// shift
				var new_x = new_locations[i][0];
				var new_y = new_locations[i][1];
				ship[i][0] = new_x; 
				ship[i][1] = new_y;
			
				// set new vertical 
				global.object_enemy_grid[new_x][new_y].vertical = !vertical;
			}
		}
	}
	
	
	// check for change ship selection
	if (keyboard_check_pressed(ord("C")) or keyboard_check_pressed(ord("c"))) 
	{
		global.ShipSelected++; // next ship
		
		// reset to 0 if out of bounds
		if (global.ShipSelected > ShipsNumber - 1) 
		{
			global.ShipSelected = 0;
		}
	}
	
	// check for shift
	var shift = [0, 0];
	if (keyboard_check_pressed(vk_up))
	{
		shift = [0, -1];
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		shift = [0, 1];
	}
	
	if (keyboard_check_pressed(vk_left))
	{
		shift = [-1, 0];
	}
	
	if (keyboard_check_pressed(vk_right))
	{
		shift = [1, 0];
	}
	
	
	// check if player is done placing ships, if so next player play
	if (keyboard_check_pressed(vk_enter))
	{
		// change phase
		GameTracker.PlayerPhase = 1;
		GameTracker.ShipsPlaced = true;
	}
	
	
	// if there's a shift, shift
	if (shift[0] + shift [1] != 0)
	{
		// assume all new locations are valid (inside grid and not occupied)
		var valid_shift = true;
		
		// get ship
		var ship = global.Ships[global.ShipSelected];
		
		// save old ship orientation
		var vertical = global.object_enemy_grid[ship[0][0]][ship[0][1]].vertical;
		
		// loop through ship sections
		for (var i = 0; i < global.ShipSelected + 1; i++)
		{
			var section_xy = ship[i];
			
			// if target tile is not in the grid, don't shift
			if (section_xy[1] + shift[1] > 9 || section_xy[1] + shift[1] < 0 || section_xy[0] + shift[0] > 9 || section_xy[0] + shift[0] < 0)
			{
				valid_shift = false;
				break; // stop checking
			}
			
			// if shift inside grid check if tiles occupied
			if (valid_shift)
			{
				// if target tile is occupied, but not by a section of the same ship, don't shift
				var new_tile = global.object_enemy_grid[section_xy[0] + shift[0]][section_xy[1] + shift[1]];
				
				// check if tile is occupied
				if (new_tile.occupied > 0) 
				{
					valid_shift = false // assume the tile isn't in the ship
				
					// check that tile isn't in ship
					for (var j = 0; j < global.ShipSelected + 1; j++)
					{
						var in_ship = ship[j];
						if (section_xy[0] + shift[0] == in_ship[0] && section_xy[1] + shift[1] == in_ship[1])
						{
							valid_shift = true;
							break;
						}
					}
				}
			}
		}
		
		// update ship, if valid shift
		if (valid_shift)
		{
			for (var i = 0; i < global.ShipSelected + 1; i++) 
			{
				// clear previous tiles
				var to_clear = ship[i]; // get tile coords
				global.object_enemy_grid[to_clear[0]][to_clear[1]].occupied = 0; // set unoccupied
						
				// shift
				ship[i][0] += shift[0]; // x
				ship[i][1] += shift[1]; // y
				
				// save old vertical
				global.object_enemy_grid[ship[i][0]][ship[i][1]].vertical = vertical;
			}
		}
	}
}	

#endregion


#region // Player 1 Phase Card

if (PlayerPhase == 7) // check if it is player 1's turn
{

	if(keyboard_check_pressed(vk_enter))
	{
		if(GameTracker.ShipsPlaced = false)
		{
		GameTracker.PlayerPhase = 4;
		}
		else
		{
			GameTracker.PlayerPhase = 2;
		}
	}
}	


#endregion

#region // Player 2 Phase Card

if (PlayerPhase == 8) // check if it is player 1's turn
{
		if(keyboard_check_pressed(vk_enter))
		{
			GameTracker.PlayerPhase = 1;
		}
}	
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
}