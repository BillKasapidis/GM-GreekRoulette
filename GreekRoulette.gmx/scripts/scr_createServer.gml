///scr_createServer(serverType, port, maxClients)
var port = 6000;
var serverType= network_socket_tcp;
var maxClients = 1;

server = network_create_server_raw(serverType, port, maxClients);
if (server <0){//if the server could not be created
    show_error("The server could not be created!", true);
}

//Buffer which we will use to send data
sendBuffer = buffer_create(256, buffer_fixed, 1);

return server;

