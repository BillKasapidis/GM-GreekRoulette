///Handle how the bullet kills players

//Player 1 death
with (obj_bullet){
    if (place_meeting(x, y, obj_player1)){
        timeline_index = tl_player1death;
        timeline_running = true;
        
    }
    
    //Player 2 death
    if (place_meeting(x, y, obj_player2)){
        timeline_index = tl_player2death;
        timeline_running = true;
        
    }
}

