///Check which controls the player uses and check for those
//Keyboard Movement
if (obj_game.player2controls == "keyboard"){
    moveLeft = keyboard_check(ord('A'));
    moveRight = keyboard_check(ord('D'));
    moveUp = keyboard_check(ord('W'));
    moveDown = keyboard_check(ord('S'));

    sprint = keyboard_check(vk_lshift);
    
    shoot = mouse_check_button_pressed(mb_left);
    throw = mouse_check_button_pressed(mb_right);
    
    //Direction - Look at the cursor
    obj_player2cross.x = mouse_x;
    obj_player2cross.y = mouse_y;
    image_angle = point_direction(x, y, obj_player2cross.x, obj_player2cross.y);
}else{
    //Gamepad controls
    moveLeft = gamepad_button_check(0, gp_padl);
    moveRight = gamepad_button_check(0, gp_padr);
    moveUp = gamepad_button_check(0, gp_padu);
    moveDown = gamepad_button_check(0, gp_padd);
    
    sprint = gamepad_button_check(0, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderrb);
    
    shoot = gamepad_button_check_pressed(0, gp_shoulderr)
    throw = gamepad_button_check_pressed(0, gp_shoulderl)
    
    //Move the cursor
    haxis = gamepad_axis_value(0, gp_axisrh)
    vaxis = gamepad_axis_value(0, gp_axisrv)
    
    obj_player2cross.x += haxis * 10;
    obj_player2cross.y += vaxis * 10;    
    
    image_angle = point_direction(x, y, obj_player2cross.x, obj_player2cross.y);
}
