///scr_bulletControls(player, bullet)

bullet = argument1;
if (obj_player1.id == argument0){
    show_message("PLAYER 1 HAS SHOT");
    
    show_message("BULLET X: "+string(bullet.x));
    //player 1 has shot the gun, check for collision with player 2
    if (place_meeting(bullet.x, bullet.y, obj_player2)){
        show_message("PLAYER 2 HIT");
        timeline_index = tl_player2death;
        timeline_running = true;
    }
}
