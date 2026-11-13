# Avslutande kontroll – kan du förklara följande?

## Fundera: Varför kan CI vara grön även om en deployment misslyckas? Vad skiljer namnkonflikt från portkonflikt?

CI testar själva funktionalitet av koden genom automatiska tester medan CD kontrollerar att Docker-imagen kan byggas, containern startas och applikationen nås via HTTP, exempelvis genom `health`.

Namnkonflikt: Man får inte skapa två containers som har samma namn

Portkonflikt: Två containrar försöker använda samma host-port.

host portar måste vara unika.

## Fundera: Varför räcker inte /health för att bevisa vilken version som körs?

`/health` kontrollerar att applikationen svarar och fungerar på en grundläggande nivå.

`version` visar vilken Docker-image containern skapades från `devops25-app:v1` exempelvis.

## Varför kan en applikation klara CI men misslyckas vid deployment?

CI kontrollerar att koden fungerar genom automatiserade tester, kodgranskning och att Docker-imagen kan byggas och startas. CD kontrollerar att applikationen kan startas och verifieras i deploymentmiljö.

En deployment kan misslyckas trots godkänd CI om det exempelvis uppstår portkonflikter, felaktig konfiguration eller problem med miljövariabler.

## Hur hittar du om ett fel beror på containernamn, portar eller själva applikationen?

Man kan använda olika Docker-kommandon för att felsöka problemet:

- `docker ps -a`: Kontrollerar om containern körs eller har avslutas.
-`docker logs [container-namn]`: Visar applikationers loggar och eventuella felmeddelanden.
- `docker ps --format "table {{.Names}}\t{{.Ports}}"`: Visar containers namn och portmappningar för att upptäcka portkonflikter.
- `docker inspect [container-namn]`: Visar detaljerad information om containern och dess konfiguration.

## Vilka förutsättningar måste finnas för att rollback ska vara möjlig?

För att rollback ska vara möjligt behöver vi spara en tidigare fungerande Docker-image innan vi uppdaterar applikationen. Exempelvis sparar vi v1 med `docker tag` innan vi bygger v2.

Vi behöver även ett rollback-script som kan ta bort den nuvarande containern och starta en ny container från den sparade v1-imagen. Efter återställningen verifierar vi att applikationen fungerar med hjälp av en health check.

## Vad är skillnaden mellan commit, push, Pull Request och merge?

- Commit: Du sparar en eller flera ändringar i Git lokalt på din dator. En commit fungerar som en sparad kontrollpunkt i projektets historik.
- Push: Du skickar dina lokala commits till ett repository på Github.
- Pull Request (PR): Du ber om att få dina ändringar granskade och eventuellt införda i en annan branch, exempelvis `main` på Github.
- Merge: Ändringarna från din branch slås ihop med målbranchen, exempelvis `main`.

## Vad visar CI-körningens loggar jämfört med artifacts?

CI-loggar visar vad som händer under en CI-körning, exempelvis vilka tester som körs, vilka som passerar och vilka fel som uppstår.

Artifacts är filer som skapas och sparas under CI-körningen och som kan laddas ner och granskas efteråt.

Skillnaden är att loggarna visar vad som hände under körningen, medan artifacts är sparade filer från körningen.

## Varför är en godkänd health check inte samma sak som att rätt version körs?

- `/health` kontrollerar att applikationen svarar som den ska via HTTP.
- `/version` visar vilken version av själva applikationen som körs.
- `docker inspect` kan visa vilken Docker-image och tagg containern skapades från, exempelvis `devops25-app:v1`.

## Varför är den simulerade CD-körningen i kursen inte samma sak som en riktig produktionsdriftsättning? Och varför väntar den inte automatiskt på att CI ska bli godkänd?

### Varför är det inte en riktig produktionsdriftsättning?

I kursen startar CD en tillfälligt container, verifierar att applikationen fungerar och tar sedan bort containern.

I en riktig produktionsdriftsättning skulle containern eller applikationen finnas kvar och vara tillgänglig för användarna.

### Varför väntar inte CD automatiskt på CI?

CI och CD är två separata workflows som kan starta oberoende av varandra.

- CI kan bli röd för att ett Python-test misslyckas.
- CD kan ändå starta och verifiera containern eftersom den inte automatiskt vet att CI misslyckades.
