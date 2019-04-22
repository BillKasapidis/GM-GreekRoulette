#define scr_serverCreate
///scr_serverCreate(port)

var port = argument0,
server = 0;

server  = network_create_server_raw(network_socket_tcp, port, 20);
clientmap = ds_map_create();
client_id_counter = 0;

send_buffer = buffer_create(256, buffer_fixed, 1);

if (server < 0) show_error("Could not connect to server", true);

return server;

#define scr_serverHandleConnect
///scr_serverHandleConnect(socket_id)

var socket_id = argument0;

serverClient = instance_create(0, 0, obj_serverClient);
serverClient.socket_id = socket_id;
serverClient.client_id = client_id_counter++;

if (client_id_counter >= 65000){
   client_id_counter = 0;
}

clientmap [? string(socket_id)] = serverClient;

#define scr_serverHandleMessage
///scr_serverHandleMessage(socket_id, buffer)
var socket_id = argument0,
buffer = argument1,
client_id_current = clientmap [? string(socket_id)].client_id;

while(true){
    var message_id = buffer_read(buffer, buffer_u8);
    
    switch(message_id){
        case MESSAGE_MOVE:
            //Read X,Y coordinates
            var xx = buffer_read(buffer, buffer_u16);
            var yy = buffer_read(buffer, buffer_u16);
            
            //Send these to all the other clients
            buffer_seek(send_buffer, buffer_seek_start, 0);
            buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE);
            buffer_write(send_buffer, buffer_u16, client_id_current);
            buffer_write(send_buffer, buffer_u16, xx);
            buffer_write(send_buffer, buffer_u16, yy);
            
            with(obj_serverClient){
                if (client_id != client_id_current)
                    network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));                
            
            }
            break;
    }

    if (buffer_tell(buffer) == buffer_get_size(buffer)){
        break;
    }

}

#define scr_serverHandleDisconnect
///scr_serverHandleDisconnect(socket_id)

var socket_id = argument0;

with (clientmap[? string(socket_id)]){
    instance_destroy();
}

ds_map_delete(clientmap, string(socket_id));