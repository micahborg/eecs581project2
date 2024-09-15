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
        global.object_grid[i][j] = instance;
    }
}
#endregion

#region //Create Player 2 Grid
//Collumn 1
instance_create_layer((13*TileSizer), (5*TileSizer), "Instances", EnemyTile01A);
instance_create_layer((13*TileSizer), (6*TileSizer), "Instances", EnemyTile01B);
instance_create_layer((13*TileSizer), (7*TileSizer), "Instances", EnemyTile01C);
instance_create_layer((13*TileSizer), (8*TileSizer), "Instances", EnemyTile01D);
instance_create_layer((13*TileSizer), (9*TileSizer), "Instances", EnemyTile01E);
instance_create_layer((13*TileSizer), (10*TileSizer), "Instances", EnemyTile01F);
instance_create_layer((13*TileSizer), (11*TileSizer), "Instances", EnemyTile01G);
instance_create_layer((13*TileSizer), (12*TileSizer), "Instances", EnemyTile01H);
instance_create_layer((13*TileSizer), (13*TileSizer), "Instances", EnemyTile01I);
instance_create_layer((13*TileSizer), (14*TileSizer), "Instances", EnemyTile01J);
//Collumn 2
instance_create_layer((14*TileSizer), (5*TileSizer), "Instances", EnemyTile02A);
instance_create_layer((14*TileSizer), (6*TileSizer), "Instances", EnemyTile02B);
instance_create_layer((14*TileSizer), (7*TileSizer), "Instances", EnemyTile02C);
instance_create_layer((14*TileSizer), (8*TileSizer), "Instances", EnemyTile02D);
instance_create_layer((14*TileSizer), (9*TileSizer), "Instances", EnemyTile02E);
instance_create_layer((14*TileSizer), (10*TileSizer), "Instances", EnemyTile02F);
instance_create_layer((14*TileSizer), (11*TileSizer), "Instances", EnemyTile02G);
instance_create_layer((14*TileSizer), (12*TileSizer), "Instances", EnemyTile02H);
instance_create_layer((14*TileSizer), (13*TileSizer), "Instances", EnemyTile02I);
instance_create_layer((14*TileSizer), (14*TileSizer), "Instances", EnemyTile02J);
//Collumn 3
instance_create_layer((15*TileSizer), (5*TileSizer), "Instances", EnemyTile03A);
instance_create_layer((15*TileSizer), (6*TileSizer), "Instances", EnemyTile03B);
instance_create_layer((15*TileSizer), (7*TileSizer), "Instances", EnemyTile03C);
instance_create_layer((15*TileSizer), (8*TileSizer), "Instances", EnemyTile03D);
instance_create_layer((15*TileSizer), (9*TileSizer), "Instances", EnemyTile03E);
instance_create_layer((15*TileSizer), (10*TileSizer), "Instances", EnemyTile03F);
instance_create_layer((15*TileSizer), (11*TileSizer), "Instances", EnemyTile03G);
instance_create_layer((15*TileSizer), (12*TileSizer), "Instances", EnemyTile03H);
instance_create_layer((15*TileSizer), (13*TileSizer), "Instances", EnemyTile03I);
instance_create_layer((15*TileSizer), (14*TileSizer), "Instances", EnemyTile03J);
//Collumn 4
instance_create_layer((16*TileSizer), (5*TileSizer), "Instances", EnemyTile04A);
instance_create_layer((16*TileSizer), (6*TileSizer), "Instances", EnemyTile04B);
instance_create_layer((16*TileSizer), (7*TileSizer), "Instances", EnemyTile04C);
instance_create_layer((16*TileSizer), (8*TileSizer), "Instances", EnemyTile04D);
instance_create_layer((16*TileSizer), (9*TileSizer), "Instances", EnemyTile04E);
instance_create_layer((16*TileSizer), (10*TileSizer), "Instances", EnemyTile04F);
instance_create_layer((16*TileSizer), (11*TileSizer), "Instances", EnemyTile04G);
instance_create_layer((16*TileSizer), (12*TileSizer), "Instances", EnemyTile04H);
instance_create_layer((16*TileSizer), (13*TileSizer), "Instances", EnemyTile04I);
instance_create_layer((16*TileSizer), (14*TileSizer), "Instances", EnemyTile04J);
//Collumn 5
instance_create_layer((17*TileSizer), (5*TileSizer), "Instances", EnemyTile05A);
instance_create_layer((17*TileSizer), (6*TileSizer), "Instances", EnemyTile05B);
instance_create_layer((17*TileSizer), (7*TileSizer), "Instances", EnemyTile05C);
instance_create_layer((17*TileSizer), (8*TileSizer), "Instances", EnemyTile05D);
instance_create_layer((17*TileSizer), (9*TileSizer), "Instances", EnemyTile05E);
instance_create_layer((17*TileSizer), (10*TileSizer), "Instances", EnemyTile05F);
instance_create_layer((17*TileSizer), (11*TileSizer), "Instances", EnemyTile05G);
instance_create_layer((17*TileSizer), (12*TileSizer), "Instances", EnemyTile05H);
instance_create_layer((17*TileSizer), (13*TileSizer), "Instances", EnemyTile05I);
instance_create_layer((17*TileSizer), (14*TileSizer), "Instances", EnemyTile05J);
//Collumn 6
instance_create_layer((18*TileSizer), (5*TileSizer), "Instances", EnemyTile06A);
instance_create_layer((18*TileSizer), (6*TileSizer), "Instances", EnemyTile06B);
instance_create_layer((18*TileSizer), (7*TileSizer), "Instances", EnemyTile06C);
instance_create_layer((18*TileSizer), (8*TileSizer), "Instances", EnemyTile06D);
instance_create_layer((18*TileSizer), (9*TileSizer), "Instances", EnemyTile06E);
instance_create_layer((18*TileSizer), (10*TileSizer), "Instances", EnemyTile06F);
instance_create_layer((18*TileSizer), (11*TileSizer), "Instances", EnemyTile06G);
instance_create_layer((18*TileSizer), (12*TileSizer), "Instances", EnemyTile06H);
instance_create_layer((18*TileSizer), (13*TileSizer), "Instances", EnemyTile06I);
instance_create_layer((18*TileSizer), (14*TileSizer), "Instances", EnemyTile06J);
//Collumn 7
instance_create_layer((19*TileSizer), (5*TileSizer), "Instances", EnemyTile07A);
instance_create_layer((19*TileSizer), (6*TileSizer), "Instances", EnemyTile07B);
instance_create_layer((19*TileSizer), (7*TileSizer), "Instances", EnemyTile07C);
instance_create_layer((19*TileSizer), (8*TileSizer), "Instances", EnemyTile07D);
instance_create_layer((19*TileSizer), (9*TileSizer), "Instances", EnemyTile07E);
instance_create_layer((19*TileSizer), (10*TileSizer), "Instances", EnemyTile07F);
instance_create_layer((19*TileSizer), (11*TileSizer), "Instances", EnemyTile07G);
instance_create_layer((19*TileSizer), (12*TileSizer), "Instances", EnemyTile07H);
instance_create_layer((19*TileSizer), (13*TileSizer), "Instances", EnemyTile07I);
instance_create_layer((19*TileSizer), (14*TileSizer), "Instances", EnemyTile07J);
//Collumn 8
instance_create_layer((20*TileSizer), (5*TileSizer), "Instances", EnemyTile08A);
instance_create_layer((20*TileSizer), (6*TileSizer), "Instances", EnemyTile08B);
instance_create_layer((20*TileSizer), (7*TileSizer), "Instances", EnemyTile08C);
instance_create_layer((20*TileSizer), (8*TileSizer), "Instances", EnemyTile08D);
instance_create_layer((20*TileSizer), (9*TileSizer), "Instances", EnemyTile08E);
instance_create_layer((20*TileSizer), (10*TileSizer), "Instances", EnemyTile08F);
instance_create_layer((20*TileSizer), (11*TileSizer), "Instances", EnemyTile08G);
instance_create_layer((20*TileSizer), (12*TileSizer), "Instances", EnemyTile08H);
instance_create_layer((20*TileSizer), (13*TileSizer), "Instances", EnemyTile08I);
instance_create_layer((20*TileSizer), (14*TileSizer), "Instances", EnemyTile08J);
//Collumn 9
instance_create_layer((21*TileSizer), (5*TileSizer), "Instances", EnemyTile09A);
instance_create_layer((21*TileSizer), (6*TileSizer), "Instances", EnemyTile09B);
instance_create_layer((21*TileSizer), (7*TileSizer), "Instances", EnemyTile09C);
instance_create_layer((21*TileSizer), (8*TileSizer), "Instances", EnemyTile09D);
instance_create_layer((21*TileSizer), (9*TileSizer), "Instances", EnemyTile09E);
instance_create_layer((21*TileSizer), (10*TileSizer), "Instances", EnemyTile09F);
instance_create_layer((21*TileSizer), (11*TileSizer), "Instances", EnemyTile09G);
instance_create_layer((21*TileSizer), (12*TileSizer), "Instances", EnemyTile09H);
instance_create_layer((21*TileSizer), (13*TileSizer), "Instances", EnemyTile09I);
instance_create_layer((21*TileSizer), (14*TileSizer), "Instances", EnemyTile09J);
//Collumn 10
instance_create_layer((22*TileSizer), (5*TileSizer), "Instances", EnemyTile10A);
instance_create_layer((22*TileSizer), (6*TileSizer), "Instances", EnemyTile10B);
instance_create_layer((22*TileSizer), (7*TileSizer), "Instances", EnemyTile10C);
instance_create_layer((22*TileSizer), (8*TileSizer), "Instances", EnemyTile10D);
instance_create_layer((22*TileSizer), (9*TileSizer), "Instances", EnemyTile10E);
instance_create_layer((22*TileSizer), (10*TileSizer), "Instances", EnemyTile10F);
instance_create_layer((22*TileSizer), (11*TileSizer), "Instances", EnemyTile10G);
instance_create_layer((22*TileSizer), (12*TileSizer), "Instances", EnemyTile10H);
instance_create_layer((22*TileSizer), (13*TileSizer), "Instances", EnemyTile10I);
instance_create_layer((22*TileSizer), (14*TileSizer), "Instances", EnemyTile10J);
#endregion
