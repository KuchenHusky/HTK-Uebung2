=== GardenQuest ===
{eventDone: -> omiF}
-> omiGutenMorgen

= omiGutenMorgen
Miharu: Guten Morgen Omi
Omi-Onna: Guten Morgen Miharu, gut geschlafen?
* [Ja ^^]
Miharu: etwas warm aber schlafen konnte ich gut. 
-> omiGutenMorgen1
* [Nein ._.] 
Miharu: naah... es könnte besser sein ^^'7.
-> omiGutenMorgen1
= omiGutenMorgen1
Omi-Onna: Ich versteh, hoffe du bist startkla für die Heutige Aufgabe
Miharu: Und ob! ^^.
-> eventDone

= eventDone
Omi-Onna: letzte Nacht hat scheinbar ein Tier den Garten etwas verwüstet.
Würdest du ihn wieder Aufräume
* [Ja ^^] 
Miharu: wird gemacht! ich mach mich gleich am Werk
Omi-Onna: Vergiss aber nicht im Schrein vorbei zuschauen und der Statue zu grüßen
Miharu: keine sorge, das mach ich sofort! ^^
Omi-Onna: aber Warte doch, nimm diesen Schlüssel für den Garten mit dir, sonst kommst du gar nicht hinein.
~ Event("FoxTalk_Activ")
-> omiF

= omiF
Omi: viel spaß ^^
-> END



=== FoxTalk ===
{eventDone: -> FoxF}

FuchsStatue: . . . . . 
+ [Freundlich grüßen]
Miharu: guten Morgen ^^ 
-> FoxTalkTo
+ [Überfreundlich grüßen]
Miharu: Ich grüße euch, meine Fuchsiche Gottheit ^^ Ich hoffe sie sind gut gelaunt.
-> FoxTalkTo

= FoxTalkTo
Miharu: "Du siehst wie die gelbe Fuchstatue leicht zu leuchten beginnt und du beginnst eine freundliche, vertraute Stimme zu hören die zu dir spricht."
FuchsStatue: Es freut mich dich zu hören zukünftige Miku meines Schreins. Munter ans Werk Miharu, Munter ans Werk.
Miharu: "Du schaust etwas verwirrt."

FuchsStatue: Gut das du mich besuchst, ich habe nähmlich eine bitte an dich
* [bitte anzunehmen]
Miharu: es wäre mir eine ehre eure bitte anzunehmen
-> FoxSubQuest

= FoxSubQuest
FuchsStatue: Ich fühlte gestern Nacht, das jemand in meinen Schrein eingedrungen ist. Dieser hat Hinweise hinterlassen.
Suche bitte nach Hinweisen nach dem, der in meinen Schrein Schaden angerichtet hat.
Miharu: ich nehme mich der Sache an.
~ Event("MoshiiClue1")
-> eventDone

= eventDone
Miharu: ...
-> FoxF

= FoxF
Miharu: schöne Statue.
"du betrachtest die Statue und findest sie wunderschön, doch hörst sie schöne stimme kein weiteres Wortsagen.
Dier kommt in den Sinn, nun deine eigentliche Aufgabe im Garten zu beginnen"
-> END




=== FoxTalkEnd ===
{eventDone: -> FoxTalkEndEND}
-> FoxTalkEnd_Abgabe
= FoxTalkEnd_Abgabe
möchtest du den Hinweis übergeben?
+ [Nein, das sind meine]
Miharu: heh? Nein? Ich muss es der Gottheit aber geben òoó
-> FoxTalkEnd_Abgabe
+ [Ja] -> eventDone


= eventDone
Miharu: schaut, ich habe diese Spur gefunden
FuchsStatue: Ich seh, ich danke dir. Ruh dich nun auß, ich fühle das Morgen einweiterer Tag beginnt
Miharu: vielen danke.
-> FoxTalkEndEND
=FoxTalkEndEND
FuchsStatue: . . . .
-> END




=== GardenQuestEnd ===
{eventDone: -> GardenQuestEnde}
-> omiTalkEnd_Abgabe


= omiTalkEnd_Abgabe
Omi-Onna: und wie sieht es aus Miharu ^^
* [bin Fertig.]
-> eventDone
+ [brauch noch etwas.]
Miharu: ich brauch noch etwas, ich suche noch nach etwas
Omi-Onna: dann beeil dich, es wird schon dunkel ^^
-> END
+ [muss noch mit Statue sprechen]
Miharu: Oh mist ich hab vergessen mit der Gottheit zu sprechen oOo
Omi-Onna: dann hop hop ^^.
-> END


= eventDone
Miharu: Ich bin fertig mit der Aufgabe die du mir gestellt hast ^^.
Omi-Onna: Das ist aber schön, ich hoffe Morgen geschicht kein Neues Übel
Miharu: jetzt hast du es gesagt ^^'7
Omi-Onna: ups ^^'7 naja es wird spät.
-> GardenQuestEnde


= GardenQuestEnde
Omi-Onna: Wünsche dir eine Gute Nacht
-> END

