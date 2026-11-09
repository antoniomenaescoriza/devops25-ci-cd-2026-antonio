# Del 1 – Teoretisk fördjupning

## Reflektionsfrågor

1. Vad är den huvudsakliga skillnaden mellan att testa kod manuellt och att använda
Continuous Integration?

Vid manuellt testning måste utvecklaren själv starta och utföra testerna. Med CI körs tester och kvalitetskontroller automatiskt när kodändringar skickas till repository.

Exempel:

- Manuellt: Utvecklaren startar Pytest själv (lokalt) för att kontrollera koden
- CI: Github Actions startar automatiskt Pytest när utvecklaren pushar kod.

2. Vilka problem kan uppstå om flera utvecklare arbetar med samma kod utan CI?

Fel kan upptäckas för sent, kodändringar kan skapa konflikter och olika delar av applikationen kanske inte fungerar tillsammans och att buggar når produktionen.

Exempel:

- Utvecklare A ändrar inloggningsfunktionen.
- Utvecklare B ändrar användarhanteringen.

Båda ändringar fungerar var för sig, men när de kombineras uppstår ett fel. 

Utan CI -> felet upptäcks när applikationen levereras till kunden.
Med CI kan automatiserade tester upptäcka felet tidigare. 

3. Vad är skillnaden mellan en workflow, ett job och ett step?

- Workflow: Hela det automatiserade arbetsflödet.
- Job: En grupp uppgifter som körs tillsammans på en runner.
- Step: En enskild uppgift inom ett job.

4. Vilken uppgift har en runner?

En runner är en fysisk eller virtuell maskin som utför jobben i GitHub Actions.
Den tillhandahåller miljön där kommandon, tester och andra automatiserade uppgifter körs.

5. Varför är det viktigt att en CI-pipeline ger snabb återkoppling?

För att rätta fel i koden innan problemen sprids vidare.

Det sparar tid, minskar risken för större problem och hjälper teamet att leverera bättre kvalitet till kunden.

Öppna:
.github/workflows/ci.yml
Undersök:
• Vad startar pipelinen?
En händelse (event) som startar en workflow i Github Actions.Händelsen bestäms av inställningarna under `on:` i filen `ci.yml`.

• Vilka steg genomförs?
Checkout repository – hämtar koden från GitHub.
Set up Python – installerar och konfigurerar Python 3.12.
Install dependencies – installerar projektets beroenden från requirements.txt.
Run tests – kör automatiserade tester med Pytest.
Run Ruff – kontrollerar kodkvaliteten med Ruff.

• Vilken miljö används?
CI-pipelinen körs på en GitHub-hosted runner med operativsystemet Ubuntu Linux.

• Vilka tester och kvalitetskontroller utförs? 
Pytest (testar funktionaliteten) och Ruff(kontrollerar kodkvaliteten)