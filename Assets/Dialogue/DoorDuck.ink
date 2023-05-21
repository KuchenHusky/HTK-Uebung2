=== doorduck ===
{eventDone: -> already_talkedTo}
-> doorquest

= doorquest
DoorDuck: Jo Türne weg verschwinden lassen? 
* [sure, ill do it] -> eventDone
*i rather not.
DoorDuck: dann bleibt sie zu >:c
-> END

= eventDone
DoorDuck: !!! ònó VERSCHWINDIBUSSS!!
~ Event("door_hide")
-> already_talkedTo


= already_talkedTo
DoorDuck: ....

-> END