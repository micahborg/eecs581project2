// Script attack
// @param tile

function attack(tile)
{

	if (tile.occupied > 0 && tile.hit ==0)
	{
        // Increment the score of the current player
		tile.hit=1;
        if (GameTracker.PlayerPhase == 1) 
		{
			GameTracker.Player1Score++;
        } 
		else 
		{
			GameTracker.Player2Score++;	
		}
    }
}