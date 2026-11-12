# Reflektion och avstämning

##  Vad är skillnaden mellan att en container körs och att applikationen fungerar?

En container kan vara igång även om applikationen har problem eller inte fungerar som förväntat. Därför måste vi kontrollera både containers status och applikationens funktion, exempelvis genom att testa `/health`.

## Varför använder vi både automatiserade tester och en /health-kontroll?

Vi använder automatiserade tester för att kontrollera att koden och funktionerna fungerar korrekt. Vi använder `/health` för att kontrollera att applikationen är igång och kan ta emot förfrågningar.

Automatiserade tester kontrollerar att funktionerna i vår Python-applikation fungerar korrekt. Funktion som adderar två tal exempelvis.

Health-kontroll kontrollerar att applikationen är igång och kan svara på HTTP-förfrågningar:
`curl http://localhost:8000/health`

## Varför räknas vår GitHub-körning som simulerad driftsättning, inte produktionsdriftsättning?

Vår Github-körning räknas som simulerad driftsättning eftersom applikationen bara startas tillfälligt på Githubs runner för att kontrollera att den fungerar. När workflowet är klart tas container bort. Vid en riktigt produktionsdriftsättning publiceras applikationen på en permanent server eller molntjänst så att användare kan komma åt den.

## Vad kan hända när CI och CD startar oberoende av varandra?

När CI och CD startar oberoende av varandra kan CD starta en container även om CI-testerna misslyckas. Det kan leda till att en applikation med felaktig kod driftsätts. Därför är det viktigt att CD väntar på att CI ska lyckas innan driftsättningen genomförs.
