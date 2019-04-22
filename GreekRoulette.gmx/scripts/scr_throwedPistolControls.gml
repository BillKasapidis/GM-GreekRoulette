///scr_throwedPistolControls(whoThrew)

if (argument0 == obj_player1.id){ //if player 1 threw pistol, stun 
    //player 2 if pistol its him
    if (place_meeting(x,y,obj_player2)){
        obj_player2.isStunned = true;
        instance_destroy();
    }                            
}

if (argument0 == obj_player2.id){ //if player 2 threw pistol, stun 
    //player 1 if pistol its him
    if (place_meeting(x,y,obj_player1)){
        obj_player1.isStunned = true;   
        instance_destroy();
    }                            
}
