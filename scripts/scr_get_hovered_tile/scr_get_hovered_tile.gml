/// @param grid 2D array of tile objects
/// @return Instance of the hovered tile or noone if no tile is hovered

function scr_get_hovered_tile(grid) {
    // Loop through the grid passed as an argument
    for (var i = 0; i < array_length(grid); i++) {
        for (var j = 0; j < array_length(grid[i]); j++) {
            var tile = grid[i][j];
            
            // Check if the mouse is inside the tile's bounding box
            if (point_in_rectangle(mouse_x, mouse_y, tile.bbox_left, tile.bbox_top, tile.bbox_right, tile.bbox_bottom)) {
                return tile;  // Return the hovered tile
            }
        }
    }
    
    return noone;  // Return noone if no tile is being hovered over
}
