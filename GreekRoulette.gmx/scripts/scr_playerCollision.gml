///Collision with obstacles
//Horizontal
if (place_meeting(x - movementSpeed, y, obj_wall1)){
    x += movementSpeed;
}

if (place_meeting(x + movementSpeed, y, obj_wall1)){
    x -= movementSpeed;
}

//Vertical

if (place_meeting(x, y - movementSpeed, obj_wall1)){
    y += movementSpeed;
}

if (place_meeting(x, y + movementSpeed, obj_wall1)){
    y -= movementSpeed;
}
