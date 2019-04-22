//Make things truly random
randomize();

//List with available spawn points
var spawnList;

//1st X, Y
spawnList[0,0] = obj_spawner0.x;
spawnList[0,1] = obj_spawner0.y;

//2nd X, Y
spawnList[1,0] = obj_spawner1.x;
spawnList[1,1] = obj_spawner1.y;

//3rd X, Y
spawnList[2,0] = obj_spawner2.x;
spawnList[2,1] = obj_spawner2.y;

//4th X, Y
spawnList[3,0] = obj_spawner3.x;
spawnList[3,1] = obj_spawner3.y;

//5th X, Y
spawnList[4,0] = obj_spawner4.x;
spawnList[4,1] = obj_spawner4.y;

//6th
spawnList[5,0] = obj_spawner5.x;
spawnList[5,1] = obj_spawner5.y;


var loadedPistolPlace = int64(random(array_height_2d(spawnList))); //random number (0, array height)
//show_message("place: "+string(loadedPistolPlace));


//Place the loaded pistol
instance_create(spawnList[loadedPistolPlace,0], spawnList[loadedPistolPlace,1], obj_loadedPistol);

//Place all the rest
for (var i = 0; i < array_height_2d(spawnList); i++){
    if (i != loadedPistolPlace){ //if the loadedPistol is in that place, place a pistol
        instance_create(spawnList[i,0], spawnList[i,1], obj_pistol);
    }

}
