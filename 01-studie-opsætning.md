# Dag 1: En burger, der kan brænde på

## Hvad vi bygger

En enkelt grill, som spilleren kan aktivere. Den bliver først orange, derefter grøn når burgeren er perfekt, og rød med ild hvis den brænder. En perfekt burger giver 10 Cash.

## 1. Opret spillet

1. Åbn Roblox Studio og vælg **Baseplate**.
2. Vælg **View** i topmenuen og sørg for, at **Explorer**, **Properties** og **Output** er slået til.
3. Gem projektet med navnet `Food Truck Empire`.

## 2. Lav en grill

1. Find `Workspace` i Explorer.
2. Klik på plusset ved `Workspace`, vælg **Part**.
3. Omdøb delen til `Grill` (højreklik → Rename).
4. Vælg `Grill` og sæt disse værdier i Properties:
   - `Anchored`: slået til
   - `Size`: `6, 1, 4`
   - `Position`: `0, 1, 0`
   - `Color`: en mørk grå nuance
5. Vælg **Model → Move** og flyt den, hvis den ikke står oven på basepladen.

## 3. Tilføj Cash

1. Find `ServerScriptService` i Explorer.
2. Klik på plusset ved den og vælg **Script**.
3. Omdøb scriptet til `Leaderstats`.
4. Slet standardteksten og indsæt hele indholdet fra `scripts/Leaderstats.server.lua`.

## 4. Gør grillen aktiv

1. Klik på plusset ved din `Grill` i Explorer og vælg **Script**.
2. Omdøb det til `GrillController`.
3. Slet standardteksten og indsæt hele indholdet fra `scripts/Grill.server.lua`.

## 5. Test

1. Tryk **Play**.
2. Gå hen til grillen og hold `E` nede, når knappen vises.
3. Vent ca. 6 sekunder: grillen bliver grøn.
4. Aktivér den igen, mens den er grøn, for at servere burgeren og få 10 Cash.
5. Venter du for længe, bliver den rød og der kommer ild. Hold `E` i 3 sekunder på **Sluk brand** for at rydde den.

## 6. Valgfrit: kundeordre

Når grillen virker, kan du tilføje en simpel ordre:

1. I `ServerScriptService` opret et Script ved navn `Orders`.
2. Indsæt hele indholdet fra `scripts/Orders.server.lua`.
3. Tryk Play og find `CurrentOrder` under Workspace. Værdien skifter mellem `Burger` (15 sekunder) og tom.

## Hvis noget går galt

Åbn **Output**, kopiér den røde fejltekst og send den til mig sammen med et screenshot af Explorer. Ret ikke tilfældige ting i scriptet — vi fejlsøger det sammen.
