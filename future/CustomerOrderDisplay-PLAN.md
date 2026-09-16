# Plan: vis CurrentOrder på skærmen

Ingen kode i denne fil. Målet er den **simpleste** visning, en ny Roblox-udvikler kan bygge senere.

## Hvad spilleren skal se

- Der er en ordre: `Ordre: Burger`
- Der er ingen ordre: `Ingen ordre`

Ikke mere. Ingen knapper, timer, ikoner eller animationer i første version.

## Hvad der allerede findes

`scripts/Orders.server.lua` (når det er sat ind i ServerScriptService) laver:

- `Workspace.CurrentOrder` som en `StringValue`
- værdien `Burger` i 15 sekunder, derefter tom streng

Serveren ejer ordren. Skærmen skal **kun læse** den.

## Simpelste mønster

Brug et **LocalScript** i `StarterGui`. LocalScripts kører hos spilleren og må gerne opdatere deres egen skærm.

1. I `StarterGui` opret en `ScreenGui` (fx `OrderGui`).
2. Indeni opret et `TextLabel` (fx `OrderLabel`) øverst på skærmen.
3. Indeni `ScreenGui` (eller `StarterPlayerScripts`) opret et LocalScript.
4. Scriptet finder `Workspace.CurrentOrder`.
5. Det sætter label-teksten ud fra `CurrentOrder.Value`.
6. Det lytter til `CurrentOrder:GetPropertyChangedSignal("Value")`, så teksten skifter af sig selv.

Du behøver **ikke**:

- RemoteEvents (StringValue i Workspace kan clienten allerede se)
- DataStore
- extra server-script
- billeder eller UI-kits

## Hvorfor det er sikkert nok til prototypen

Ordren er ikke en hemmelighed. Alle spillere må gerne se den samme tekst. Når I senere vil have forskellige ordrer pr. spiller, skal I skifte mønster — det er et nyt trin, ikke denne visning.

## Hvad du tester, når koden skrives

1. Play. Label vises med det samme (ikke først efter 20 sekunder).
2. Når Explorer viser `Burger`, viser skærmen `Ordre: Burger`.
3. Når Explorer viser tom værdi, viser skærmen `Ingen ordre`.
4. Output er uden rød tekst, også hvis `CurrentOrder` mangler (så vis `Ingen ordre` og et `warn`).

## Bevidst udskudt

- Pæn skrifttype, farver, ikon af en burger
- Nedtælling (“12 sekunder tilbage”)
- Forskellig ordre pr. spiller
- At skjule UI, når man kører

Først når den ene linje tekst virker.
