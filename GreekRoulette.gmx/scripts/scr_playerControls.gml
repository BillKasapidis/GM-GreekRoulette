///Player Controls

if (!isStunned){
    if (moveLeft) x -= movementSpeed;
    if (moveRight) x += movementSpeed;
    if (moveUp) y -= movementSpeed;
    if (moveDown) y += movementSpeed;
    
    //Sprinting
    if (sprint && !isExhausted){
        movementSpeed = 10;
        stamina -= 5;
        isSprinting = true;
    }else{
        movementSpeed = defaultMovementSpeed;
        stamina += staminaRecharge;
        isSprinting = false;
    }
}

//Stun Control
if (isStunned){
    stunDuration -= 1;
    instance_create(x, y - 30, obj_stun);
}

if (stunDuration == 0){
    with (obj_stun){
        instance_destroy();
    }
    isStunned = false;
    stunDuration = defaultStunDuration;
}
    
//Stamina control
if (stamina >100){ //Make sure stamina stays at 100
    stamina = 100;
}

if (stamina <=0){ //Player is exhausted if stamina is at 0
    stamina = 0;    
    isExhausted = true;
}

if (stamina >=50){ //If stamina goes above 30, player is no longer exhausted
    isExhausted = false;
} 

//Stay inside map boundaries
if (x <= sprite_width){
    x = sprite_width;
}

if (x >= room_width - sprite_width){
    x = room_width - sprite_width;
}

if (y <= sprite_height){
    y = sprite_height;
}

if (y >= room_height - sprite_height){
    y = room_height - sprite_height;
}
