///scr_clientConnect

var socket = network_create_socket(network_socket_tcp);
var url = "127.0.0.1"
var port = 6000;

connection = network_connect_raw(socket, url, port);

//Buffer which we will use to send data
sendBuffer = buffer_create(256, buffer_fixed, 1);

if (connection <0){
    show_error("Could not connect to server!", true);
}
