//Pickup Pistol and change player's sprite
var pistol = instance_place(x, y, obj_pistol); //Check for collision with pistol

if (pistol && !isHoldingPistol && !isHoldingLoadedPistol){
    sprite_index = myArmedSprite;
    isHoldingPistol = true;
    
    //***Play gunPickup sound ****
    
    
    with (pistol){
        instance_destroy();
    }
}

//Shoot the pistol and make click sound
if (isHoldingPistol){
    if (shoot){
        audio_play_sound(sound_click, 1, 0);
        
        //Play animation above player's head
        instance_create(x, y-30, obj_click);
    }
}

//Drop the pistol
if (isHoldingPistol){
    if (throw){
        isHoldingPistol = false; //change isHoldingPistol to false
        sprite_index = myUnarmedSprite;  //change sprite back to original
        
        //Create a pistol instance just to throw it
        var throwedPistol = instance_create(x, y, obj_throwedPistol);
        throwedPistol.direction = image_angle;
        throwedPistol.image_angle = image_angle;
        throwedPistol.speed = 15;

        throwedPistol.whoThrew = self;
    }
}
