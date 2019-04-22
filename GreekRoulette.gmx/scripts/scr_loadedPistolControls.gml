//Pickup Loaded Pistol and change player's sprite
var pistol = instance_place(x, y, obj_loadedPistol); //Check for collision with pistol

if (pistol && !isHoldingLoadedPistol && !isHoldingPistol){
    sprite_index = myArmedSprite;
    isHoldingLoadedPistol = true;
    canFire = true; //player can shoot pistol, turns false if he has shot once before
    
    //***Play gunPickup sound ****
    
    
    with (pistol){
        instance_destroy();
    }
}

//Shoot the pistol
if (isHoldingLoadedPistol){
    if (canFire){
        if (shoot){
            //Play gunshot sound
            
            //Create the bullet
            bullet = instance_create(x, y, obj_bullet);
            bullet.whoShot = self; //tell the bullet who shot it
            bullet.direction = image_angle;
            canFire = false; //the player has shot his bullet, cannot fire anymore
            
        }
    }else{ //if the pistol is empty
        if (shoot){
            audio_play_sound(sound_click, 1, 0);    

            //Play animation above player's head
            instance_create(x, y-30, obj_click);        
        }
    }
}

//Drop the pistol
if (isHoldingLoadedPistol){
    if (throw){
        isHoldingLoadedPistol = false; //change isHoldingLoadedPistol to false
        sprite_index = myUnarmedSprite;  //change sprite back to original
        
        //if the player held the loadedPistol but didn't fire, set canFire to false
        if (canFire){
            canFire = false;
        }
        
        //Create a pistol instance just to throw it
        var throwedPistol = instance_create(x, y, obj_throwedPistol);
        throwedPistol.direction = image_angle;
        throwedPistol.image_angle = image_angle;
        throwedPistol.speed = 15;
        
        throwedPistol.whoThrew = self;
    }
}


