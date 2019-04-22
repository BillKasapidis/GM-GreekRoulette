///scr_setUpGameRoom(server or client)

var type = argument0;

if (type == "server"){
    //Create server and spawn player
    var serverInstance = instance_create(0,0,obj_server);
    serverInstance.persistent = true;
    room_instance_add(rm_game,120,400,obj_player1);
}else if (type == "client"){ //type = client
    //Create client object
    var clientInstance = instance_create(0,0,obj_client);
    clientInstance.persistent = true;
    room_instance_add(rm_game,856,400,obj_player2);
}

//Change active room 
room_goto(rm_game);


