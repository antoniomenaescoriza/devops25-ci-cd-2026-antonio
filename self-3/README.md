# Självstudier 3 – Måndag 9 november

## Del 1 – Teoretisk fördjupning

CI innebär att utvecklare regelbundet integrerar sina kodändringar i ett gemensamt repository. När kod skickas till Github kan Github Actions automatiskt köra tester och kvalitetskontroller.

Continuous Delivery innebär att applikationen automatiskt byggs, testas och förbereds så att det alltid är redo att levereras till produktion.

En människa behöver normalt godkänna själva produktionssättningen.

Exempel: Applikationen har klarat alla tester och byggts till en Docker-image. Den är redo att levereras, men en ansvarig person måste godkänna deployment till produktion.

Continuos Deployment innebär att godkänna kodändringar automatiskt levereras hela vägen till produktion utan ett manuellt godkännande av varje release.

Exempel: En utvecklare pushar kod. CI testar koden, applikationen byggs och om alla kontroller lyckas deployas den automatiskt till produktion.

Reflektionsfrågor

1.  Vad är skillnaden mellan Continuous Integration och Continuous Delivery?

Continuous Integration (CI) fokuserar på att automatiskt integrera, testa och kontrollera kodändringar.

Continuous Delivery (CD) går ett steg längre. Den innebär att applikationen byggs, testas och förbereds så att den alltid är redo att levereras till produktion.

Exempel:

- CI: Github Actions -> kör Pytest och Ruff för att kontrollera koden.
- CD (Delivery) -> Efter godkända tester byggs applikationen till en Docker-image som är redo att deployas till produktion.

2. Vad är skillnaden mellan Continuous Delivery och Continuous Deployment?

Continuos Delivery: Applikationen görs automatiskt redo för produktion, men en person behöver vanligtvis godkänna själva driftsättningen.

Continuous Deployment: Applikationen driftsätts automatiskt till produktion när alla kontroller har godkänts.

Exempel:

- Delivery: Alla tester går igenom. En utvecklare klickar på "Deploy" för att publicera appen.
- Deployment: Alla tester går igenom och appen publiceras automatiskt.

Kort sagt: Delivery kräver vanligtvis ett manuellt godkännande. Deployment sker automatiskt.

3. Varför paketerar man en applikation innan man distribuerar den?

Man paketerar en applikation för att samla programmet och det som behövs för att köra det i ett paket. Då blir det enklare att flytta och installera applikationen i olika miljöer.

Exempel:

Man kan skapa en Docker-image som innehåller applikationen och dess beroenden. Då får man med det som behövs för att köra programmet på en annan server.

Det minskar risken för problem som: ”Det fungerar på min dator, men inte på servern.”

4. Vilka fördelar finns med containerbaserade leveranser?

Containerbaserade leveranser gör det enklare att distribuera applikationer eftersom applikationen och dess beroenden paketeras tillsammans.

5. Varför behöver organisationer kunna rulla tillbaka (rollback) till en tidigare version?

En organisation behöver kunna göra en rollback om en ny version av applikationen orsakar problem.
Då kan man snabbt återgå till en tidigare version som fungerade.

Exempel:

Ett företag uppdaterar sin webbshop. Efter uppdateringen kan kunderna inte genomföra betalningar. Företaget gör då en rollback till den tidigare versionen så att betalningarna fungerar igen.

## Del 2 – Praktisk övning

Vad krävs för att samma Docker-image ska kunna köras i en annan miljö?

- Docker måste finnas installerat på den andra datorn eller servern.
- Rätt portar måste vara öppna och konfigurerade, så att man kan komma åt applikationen.
- Miljövariabler och inställningar måste vara korrekt konfigurerade, såsom databasanlutningar.
- Externa tjänster som applikationen behöver, exempelvis en databas, måste pckså vara tillgängliga.

