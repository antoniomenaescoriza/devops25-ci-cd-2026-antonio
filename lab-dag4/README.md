# Kontrollera att du kan förklara

## Fråga 1: Vad skiljer Dockerfile, image och container åt?

1. Dockerfile -> Instruktionerna (Receptet)

Beskriver hur Docker ska bygga din applikation. Vilken Python version, vilken paket som ska installeras, osv.

2. Image -> Den färdiga kakan

Det färdigbyggda paketet som innehåller Python, Uvicorn, beroende och applikation.

3. Container -> Kakan som serveras

En körande instans av imagen. Det är här din applikation faktist startar och kan ta emot anrop från webbläsaren.
Man kan skapa flera containers från samma image som är isolerade varandra.

## Fråga 2 – Varför gick det andra Docker-bygget snabbare?

Docker använder något som kallas build cache (byggcache).

Första gången -> Utför alla steg
Andra gången -> Återanvänder cache där det går.

Docker sparar resultatet från tidigare byggsteg och kan återanvända dem om inget relevant har ändrats.

## Fråga 3 – Vad betyder 8000:8000 och --rm?

våra värddator lyssnar på port 8000 och container på 8000.
--rm -> container raderas ifall detta är stoppad men imagen finns kvar ifall vi vill skapa nya containers.

## Fråga 4 – Varför behöver Dockerfile finnas i GitHub-repositoryt?

Eftersom andra utvecklare behöver instruktionerna för att kunna bygga samma Docker-image på sina egna datorer. Därefter kan de skapa och starta egna containers från imagen.

## Fråga 5 – Vad betyder needs: test-and-lint och varför använder vi ${{ github.sha }}?

`needs: test-and-lint` för tt gå igenom alla tester innan image skapas.

Vi använder `${{ github.sha }}` för att ge varje Docker-image en unik tagg baserad på Git-commitens ID. På så sätt kan vi identifera vilken kodversion imagen byggdes från och enkel spåra eller återgå till tidigare versioner.

- Commit SHA: Identifierar en specifik Git-commit
- Docker tag: Namnger och identifierar vilken kodversion imagen byggdes från.
- Docker image ID: Dockers eget interna ID för imagen.
