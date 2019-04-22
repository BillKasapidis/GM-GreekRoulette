///scr_playerDeath(whoDied)
if (argument0 == "Player 1"){ //If Player 1 died
    timeline_index = tl_player1death;
    timeline_running = true;

}else{ //if Player 2 died
    timeline_index = tl_player2death;
    timeline_running = true;
}
