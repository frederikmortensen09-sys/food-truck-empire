# Roadmap: fra grill-prototype til første food truck

Dette er en rækkefølge, ikke en to-do du skal nå på én aften. **Én feature ad gangen.** Test, før du går videre.

Du rører ikke filerne i `scripts/` herfra. Nye idéer ligger i `future/`.

## Hvad “første testbare food truck-version” betyder

Spilleren kan:

1. starte ved en garage,
2. køre til ét sted,
3. lave én burger på grillen,
4. se om der er en ordre,
5. tjene Cash, hvis timing og ordre passer.

Hvis det føles godt, er dagene med prototypen lykkedes. Grafik, flere menuer og PvP kommer senere.

## Afhængigheder i korte træk

```
Grill + Cash
    → Brand (ild + sluk)
        → Kundeordre (CurrentOrder)
            → Vis ordre på skærmen
                → Cash kun ved rigtig ordre
                    → Simpel bil
                        → Greybox-kort (garage + 4 zoner)
                            → Første testbare version
```

Spring ikke over et trin, der står over det, du vil bygge.

---

## Trin 0 — Bekræft prototypen

**Feature:** Den eksisterende grill virker (tom → orange → grøn → rød).

**Kræver:** `scripts/Leaderstats.server.lua` og `scripts/Grill.server.lua` i Roblox Studio, som beskrevet i `MORGEN-PLAN.md`.

**Test:** Play. Servér en perfekt burger (10 Cash). Lad en burger brænde og ryd grillen. Stop her, hvis noget fejler.

---

## Trin 1 — Brand på grillen

**Feature:** Når burgeren brænder, kommer der ild. Spilleren slukker med et 3-sekunders “Sluk brand”-prompt.

**Kræver:** Trin 0. Kladden ligger i `future/FireSystem.server.lua`. Den erstatter grill-scriptet senere — kør ikke begge på samme Part.

**Test:** Lad burgeren brænde. Tjek ild. Hold E i 3 sekunder. Ilden skal forsvinde, grillen skal blive tom. Perfekt burger skal stadig give Cash.

---

## Trin 2 — Enkel kundeordre

**Feature:** `Workspace.CurrentOrder` er `Burger` i 15 sekunder og derefter tom.

**Kræver:** Trin 0. Scriptet `scripts/Orders.server.lua` er allerede skrevet. Brand (trin 1) er ikke nødvendigt for selve ordren, men test brand først, så du ikke blander to nye ting.

**Test:** Play. Find `CurrentOrder` i Explorer. Den skal skifte uden fejl i Output.

---

## Trin 3 — Vis ordren på skærmen

**Feature:** Spilleren kan læse ordren uden at åbne Explorer.

**Kræver:** Trin 2. Planen ligger i `future/CustomerOrderDisplay-PLAN.md`. Ingen kode i dette trin, før planen er forstået.

**Test:** Teksten viser “Ordre: Burger” og “Ingen ordre” i takt med `CurrentOrder`. Ingen nye knapper, ingen RemoteEvents.

---

## Trin 4 — Cash kun ved rigtig ordre

**Feature:** Perfekt burger giver kun Cash, hvis `CurrentOrder` er `Burger`. Derefter tømmes ordren.

**Kræver:** Trin 2 og 3 (så du kan se, hvorfor du fik eller ikke fik Cash).

**Test:** Servér mens der er ordre → Cash stiger, ordren bliver tom. Servér uden ordre → ingen Cash. Brændt burger giver stadig 0 Cash.

---

## Trin 5 — En kasse på hjul

**Feature:** En simpel bil (et par Parts + et Seat), spilleren kan køre frem og tilbage.

**Kræver:** Trin 0. Ingen afhængighed af grill-logik, men vent til trin 4, så maden virker, før du tilføjer kørsel.

**Test:** Sæt dig. Kør 10 sekunder. Stig af. Grillen skal stadig virke bagefter.

---

## Trin 6 — Greybox-kort

**Feature:** Garage i midten plus Suburb, Beach, Downtown og Food Wars. Kun Parts og veje.

**Kræver:** Trin 5. Planen ligger i `future/MapGreybox-PLAN.md`.

**Test:** Kør fra garage til hvert sted. Turen skal føles som **10–18 sekunder**, ikke 3 og ikke 40. Du tester afstand, ikke pæne bygninger.

---

## Trin 7 — Grill i trucken (første testbare version)

**Feature:** Grillen sidder på (eller ved) food trucken. Spilleren kører til ét sted, laver burgeren der, tjekker ordren, får Cash.

**Kræver:** Trin 4, 5 og 6.

**Test (hele løkken):**

1. Spawn ved garagen.
2. Se ordren på skærmen.
3. Kør til ét sted (ca. 10–18 sekunder).
4. Lav en perfekt burger.
5. Få Cash, hvis ordren var `Burger`.
6. Kør tilbage til garagen.

Når den løkke virker uden rød tekst i Output, har du den første testbare food truck-version.

---

## Bevidst ikke i denne version

- Flere retter end burger
- Ægte UI-butik eller upgrades
- DataStore / gemt fremgang
- RemoteEvents mellem client og server (ud over det Roblox gør automatisk)
- PvP i Food Wars
- Detaljeret grafik

Én af de ting ad gangen, og først efter trin 7.
