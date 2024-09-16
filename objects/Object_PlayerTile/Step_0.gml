/// @description: Location/Sprite Control

#region // player 2's turn (Completed)
if(GameTracker.PlayerPhase == 2 || GameTracker.PlayerPhase == 4)	// check if it is player 2's turn
{
	if(occupied == 0)	// if there are no ships on the tile
	{
		if(hit == false)		// if the tile has not been hit (shot at)
		{
			sprite_index = Sprite_Marker_Empty; // set the tile to the empty sprite
		}
		else					//otherwise
		{
			sprite_index = Sprite_Miss;			// set the sprite to the miss sprite
		}
	}
	else					// otherwise (there are ships set to this tile)
	{		
		if(hit == false)		// if the tile has not been hit (shot at)
		{
			sprite_index = Sprite_Marker_Empty; // set the tile to the empty sprite
		}
		else					//otherwise
		{
			sprite_index = Sprite_Hit_no_ship_showing;			// set the sprite to the miss sprite
		}
	}
}
#endregion

#region // Player 1's turn (Completed)
else if (GameTracker.PlayerPhase == 1 || GameTracker.PlayerPhase == 3) // check if it is player 1's turn
{
	if (occupied == 0)
	{
			sprite_index = Sprite_Marker_Empty;
	}
	else
	{
		if (occupied == 1)
		{
			if (hit == 0)
			{
				sprite_index = Sprite_Ship_Single;
			}
			else
			{
				sprite_index = Sprite_Ship_Single_Hit;
			}
		}
		else 
		{
			if (occupied == 2) 
			{
				if (hit == 0)
				{
					sprite_index = Sprite_Ship_Left;
				}
				else
				{
					sprite_index = Sprite_Ship_Left_Hit;
				}
			}
			if (occupied == 3) 
			{
				if (hit == 0)
				{
					sprite_index = Sprite_Ship_Middle;
				}
				else
				{
					sprite_index = Sprite_Ship_Middle_Hit;
				}
			}
			if (occupied == 4) 
			{
				if (hit == 0)
				{
					sprite_index = Sprite_Ship_Right;
				}
				else
				{
					sprite_index = Sprite_Ship_Right_Hit;
				}
			}
		}
	}
}	
#endregion

#region // all other phases (Choose Game Size, Pause Menu?, Phase Cards for player turns)
if((GameTracker.PlayerPhase == 7) || (GameTracker.PlayerPhase == 8))
{
sprite_index = Sprite_Marker_Empty; // set all tiles to empty for all other phases
}


#endregion
if(vertical == true)
{
	image_angle = 270;
}
else
{
	image_angle = 0;
}