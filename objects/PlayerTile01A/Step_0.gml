/// @description: Location/Sprite Control


if(revealed == false)	//revealed is set to false when it is the opposite player's turn
{
	if(occupied == false)	// if there are no ships on the tile
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
		if(sunk == false)
		{
			sprite_index = Sprite_Hit_no_ship_showing;
		}
		else
		{
			if(occupied == 1)
			{
				sprite_index = Sprite_Ship_Single_Hit;
			}
			if(occupied == 2)
			{
				sprite_index = Sprite_Ship_Left_Hit;
			}
			if(occupied == 3)
			{
				sprite_index = Sprite_Ship_Middle_Hit;
			}
			if(occupied == 4)
			{
				sprite_index = Sprite_Ship_Right_Hit;
			}
		}
	}
}
