/// @description Set Tiles and Variables
var TileSizer = 64;
//Now that you have the object instances stored in a 2D array, you can access them easily using their grid coordinates.

//For example, to access the object at position (2, 3):

// var my_instance = global.object_grid[2][3];

// Do something with the instance
//my_instance.speed = 5;
//my_instance.image_index = 1;
//Explanation:
//instance_create_layer(x, y, layer, obj_type): Creates an instance of an object at position (x, y) on the specified layer.
//global.object_grid: A 2D array that stores references to each object created in the grid.
//You can now access each instance uniquely by its coordinates in the array.
//This allows you to manage individual instances after they've been created, such as modifying their properties or calling their functions.
#region //Create Player 1 Grid
// Define grid size and object type
var grid_width = 10;
var grid_height = 10;
var obj_type = Object_PlayerTile;

// Create an array to store the object instances
global.object_player_grid = array_create(grid_width, []);

// Loop through the grid and create objects
for (var i = 0; i < grid_width; i++) {
    global.object_player_grid[i] = array_create(grid_height);
    for (var j = 0; j < grid_height; j++) {
        // Create object at the desired position
        var instance = instance_create_layer(i * TileSizer + TileSizer, j * TileSizer + (TileSizer * 5), "Instances", obj_type);
        
        // Store the instance in the array
        global.object_player_grid[i][j] = instance;
    }
}
#endregion

#region //Create Player 2 Grid
var obj_type = Object_EnemyTile;

// Create an array to store the object instances
global.object_enemy_grid = array_create(grid_width, []);

// Loop through the grid and create objects
for (var i = 0; i < grid_width; i++) {
    global.object_enemy_grid[i] = array_create(grid_height);
    for (var j = 0; j < grid_height; j++) {
        // Create object at the desired position
        var instance = instance_create_layer(i * TileSizer + TileSizer + (TileSizer *12), j * TileSizer + (TileSizer * 5), "Instances", obj_type);
        
        // Store the instance in the array
        global.object_enemy_grid[i][j] = instance;
    }
}
#endregion
room_goto(GameSize);

#region // Ship Locations

var Ship1 = [[0,0]];
var Ship2 = [[0,1],[1,1]];
var Ship3 = [[0,2],[1,2],[2,2]];
var Ship4 = [[0,3],[1,3],[2,3],[3,3]];
var Ship5 = [[0,4],[1,4],[2,4],[3,4],[4,4]];
var Ships = [Ship1, Ship2, Ship3, Ship4, Ship5];
global.Ships = Ships;
global.ShipSelected = 0;

#endregion