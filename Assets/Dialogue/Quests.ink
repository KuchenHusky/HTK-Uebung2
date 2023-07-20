=== 01Quest ===
//GartenQuest Jahu

//______Omi-Onna Dialogue______


= morgen
Miharu: Guten Morgen, Omi.
Omi-Onna: Guten Morgen, Miharu. Gut geschlafen?
* [Ja ^^]
Miharu: Etwas warm aber schlafen konnteich gut. 
-> Start
* [Nein ._.] 
Miharu: Naah... es könnte besser sein ^^'7.
-> Start

= Start
Omi-Onna: Ich verstehe, aber ich hoffe du bist dennoch bereit für die heutige Aufgabe.
Miharu: Und ob! ^^.
Omi-Onna: Letzte Nacht hat scheinbar ein Tier den Garten etwas verwüstet.
    Würdest du ihn wieder aufräumen?
* [Ja ^^] 
Miharu: Wird gemacht! Ich mach mich gleich ans Werk!
Omi-Onna: Vergiss aber nicht im Schrein vorbei zuschauen und der Statue zu grüßen
Miharu: keine sorge, das mach ich sofort! ^^
Omi-Onna: aber Warte doch!
    Nimm! Diesen Schlüssel für den Garten mit dir, sonst kommst du gar nicht erst hinein.
~ Event("01Quest_acceped")
-> END



= Run
Omi-Onna: Nah Miharu, wieso kommst du so zu mir geschlichen.^^
+ [Wo ist der Garten noch mal?]
Omi-Onna: Der Garten ist nicht weit von uns, schau doch mal zu deiner linken du dummerschen ^^.
-> DONE
+ [Wo ist der Schrein noch mal?]
Omi-Onna: Der Schrein ist direkt hinter dir.
    drehe dich um und laufe die Gesteinstreppe hinauf, Miharu.-> DONE
+ [Ach nur so ^^]
Miharu: Ich Wollte nur noch mal schauen wie es dir geht Omi. ^^
Omi-Onna: Ach Miharu, mir geht es sehr gut an diesen Montag. ^^ -> DONE
+ [muss weiter]
Miharu: Wollte nur mal schnell schauen!
    muss schnell weiteres!
Omi-Onna: Sei vosichtig Miharu.^^
-> DONE



= Deliver
Omi-Omma: Oh Miharu, kann es sein das du fertig bist?^^
+ [Ja]
Miharu: So ist es, ich bin mit der Aufgabe im Garten fertig.^^
Omi-Omma: das freut mich aber sehr.
    Das hast du wirklich gut gemacht.^^ 
    -> deliver_Yes

+ [Nein]
Miharu: Doch nicht aber bald.^^
Omi-Omma: Vergiss nicht bei unserem lieben Kami vorbei zu schauen.^^ -> END

= deliver_Yes
Omi-Omma: Warst du denn eigentlich schon beim Schrein?
+ [Ja]
Miharu: Das war ich.^^
Omi-Onna: Dann ist ja schön, dann ruhe dich doch für heute aus.
    Es war ein langer Tag.
 ~ Event("01Quest_end")
 -> END
+ [Nein]
Omi: Dann besuche doch noch mal unserem Kami.^^
-> END



= Finished
Omi-Onna: Ich wünsche dir eine gute Nacht Miharu. ^^
-> END


//______FuchsDialog______


= Start_fox
{eventDone: -> SideQ_Abfrage}
* [weg gehen] -> DONE
* [Verbeugen] 
Miharu: Ich grüße euch, Kami dieses Schreins, mein Name ist Miharu.
"Du siehst wie die gelbe Fuchstatue leicht zu leuchten beginnt und du beginnst eine freundliche, vertraute Stimme zu hören die zu dir spricht."
Fuchs-Geist: Es freut mich dich zu hören zukünftige Miku meines Schreins. Munter ans Werk Miharu, Munter ans Werk.
Miharu: ...
"Du schwiegst und schautest die Startue an"
Fuchs-Geist: Was fürt dich zu mir kleine Miharu.
Miharu: Ich wollte nach dem rechten schauen ob hier jemand war.
    Nämlich hat, Jemand oder Etwas, unseren Garten verwüstet.
Fuchs-Geist: Ich versteh,
    Ich danke dir für deine Mühe hier rauf zu kommen und nach meinem Befinden zu schauen.
    Ich spreche dir meinen Dank aus aber...
Miharu: Ehrenwürdige Kami?
-> eventDone
= eventDone
Fuchs-Geist: Ich habe eine Bitte an dich.
    Ich spüre das im Garten, sich ein Überbleibzel des Jenigen versteckt, dass für deine Mühe verantwortlich ist.
    Würdest du es für mich Finden und zu mir bringen?
-> SideQ_Abfrage
= SideQ_Abfrage
Fuchs-Geist: Nimmst du meine Bitte an?
+ [Bitte Annehmen]
Miharu: Es ist mir eine Ehre eure Bitte anzunehmen
Fuchs-Geist: Ich danke dir, kleine Miharu.
~ Event("01SideQ_acceped")
-> DONE
+ [Bitte erstmal sein lassen]
Fuchs-Geist: Komme zu mir falls du dich doch, entscheidest mir zu helfen. -> DONE



= Run_Fox
Fuchs-Geist: ...
"Du betrachtest die Statue und stellst fest."
"sie ist wirklich schön"
-> END



= Deliver_fox
* [Hinweis überreichen]
"als du der Statue den Hinweis überreichst. Fühlst du wie eine Presents in diesen Raum erscheint"
Fuchs-Geist: Die kleine Miharu, wie ich sehe hast du mir etwas gebracht.
    Ahh, der Hinweis nach dem ich gefragt habe. Ich danke dir, damit werden wir einen schritt näher kommen um was es sich hier bei Handelt.
Miharu: es freut mich euch geholfen zu haben.
"die Presents verschwand nun so schnell wie sie kam"
~ Event("01SideQ_end")
-> Finished_fox
* [Hinweis nicht überreichen]
Miharu: Heh? Wieso hab ich dran gedacht den Hinweis nicht zu überreichen?
    kommisch... -> Deliver_fox
    
    
    
= Finished_fox
"Du betrachtest die Statue und stellst fest."
"sie ist wirklich schön"
-> END


//______Other Dialgue______


= fens
* [Schüssel benutzen.]
~ Event("hide_fens")
-> END
+ [Schlüssel nicht benuten.] -> END



=== 02Quest ===
//Temizuya YEEHAAARR
= morgen
Miharu: Guten Morgen, Omi.
Omi-Onna: Guten Morgen, Miharu. Gut geschlafen?
* [Besser als Gestern ^^]
Miharu: Viel besser als Gestern.^^
Omi-Onna: Das hört man doch gern.^^
-> Start
* [schlechter als Gestern u u]
Miharu: Leider nicht so gut. u u 
Omi-Onna: Das tut mir leid zu hören. u u
-> Start

= Start
Omi-Onna: Ist dir aufgefallen, das diese Gestrige Nacht, recht unrig war?
Miharu: Nein, das ist sie mir nicht. :O
Miharu: Was ist den passiert?
Omi-Onna: Letzte Nacht gab es etwas, was für Krach im Schrein gesorgt hat.
    Ich hörte wie etwas zu Boden fiel und dann das Geräusch von Wasser.
Miharu: Im Schrein? Etwas viel zu Boden? Geräusche von Wasser?
    Das klingt alles so als wäre etwas beim Kami geschen!
Omi-Onna: Würdest du bitte nachschauen Miharu, du bist nämlich schneller oben beim Kami als Ich. u u
Miharu: Ich bin sofort unterwegs!
~ Event("02Quest_acceped")
-> END

