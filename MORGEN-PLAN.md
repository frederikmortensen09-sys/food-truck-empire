# I morgen: Food Truck Empire, dag 1

## Dagens eneste mål

Få én grill til at fungere fra start til slut: aktivér → vent → servér perfekt burger → få Cash.

Det er nok for én første session. Stop, når det virker, selv om det ser simpelt ud.

## Tjekliste

- [ ] Åbn Baseplate i Roblox Studio.
- [ ] Slå Explorer, Properties og Output til via View-fanen.
- [ ] Gem spillet som `Food Truck Empire`.
- [ ] Opret en Part i Workspace og omdøb den til `Grill`.
- [ ] Sæt Grill til Anchored, størrelse `6, 1, 4` og mørkegrå farve.
- [ ] Opret Scriptet `Leaderstats` i ServerScriptService og indsæt `Leaderstats.server.lua`.
- [ ] Opret Scriptet `GrillController` inde i Grill og indsæt `Grill.server.lua`.
- [ ] Tryk Play.
- [ ] Test: hold E → orange → vent ca. 6 sekunder → grøn → hold E → Cash stiger med 10.
- [ ] Test også: vent yderligere ca. 4 sekunder → rød + ild → hold E i 3 sekunder på "Sluk brand" → tom grill.

## Når dag 1 virker (valgfrit)

- [ ] Opret Scriptet `Orders` i ServerScriptService og indsæt `Orders.server.lua`.
- [ ] Tjek at `Workspace.CurrentOrder` skifter mellem `Burger` og tom.

## Hvornår du skal stoppe og spørge mig

Stop og send et screenshot af Explorer plus Output, hvis:

- der ikke vises en E-knap ved grillen;
- grillen ikke skifter farve;
- der ikke kommer ild, når burgeren brænder;
- Cash ikke dukker op på spillerlisten;
- Output viser rød tekst.

## Reglen for resten af projektet

Vi tilføjer kun én ny feature, når den nuværende er testet. Dag 1 er grillen. `Orders` kommer bagefter.
