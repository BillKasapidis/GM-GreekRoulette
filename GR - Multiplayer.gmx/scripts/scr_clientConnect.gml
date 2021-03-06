#define scr_clientConnect
///scr_clientConnect(ip, port)

var ip = argument0,
port = argument1;
socket = network_create_socket(network_socket_tcp);

var connect  = network_connect_raw(socket, ip, port);

send_buffer = buffer_create(256, buffer_fixed, 1);

clientmap = ds_map_create();

if (connect<0) show_error ("Could not connect to server!", true);

#define scr_clientDisconnect
///client_disconnect();
network_destroy(socket);
ds_map_destroy(clientmap);

#define scr_clientHandleMessage
///scr_clientHandleMessage(buffer)

var buffer = argument0;

while(true){
    
    message_id = buffer_read(buffer, buffer_u8);
    
    switch (message_id){
        case MESSAGE_MOVE:
            client = buffer_read(buffer, buffer_u16);
            xx = buffer_read(buffer, buffer_u16);
            yy = buffer_read(buffer, buffer_u16);
            
            //If we received a message from this client before
            if (ds_map_exists(clientmap, string(client))){
                var clientObject = clientmap [? string(client)];
                clientObject.x = xx;
                clientObject.y = yy;
            }else{ //Otherwise, create the client's object
                var clientInst = instance_create(xx,yy,obj_otherClient);
                clientmap[? string(client)] = clientInst;
            }
            
            with(obj_serverClient){
                if (client_id != client_id_current){
                    network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
                }
            }
            
            break;   
    }
    
    if(buffer_tell(buffer) == buffer_get_size(buffer)){
        break;
    } 
}

#define scr_clientSendMovement
///scr_clientSendMovement()

buffer_seek(send_buffer, buffer_seek_start, 0);

buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE);
buffer_write(send_buffer, buffer_u16, round(obj_player.x));
buffer_write(send_buffer, buffer_u16, round(obj_player.y));

network_send_raw(socket, send_buffer, buffer_tell(send_buffer));