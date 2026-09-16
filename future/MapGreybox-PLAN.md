# Plan: greybox af map 2

Ingen modeller, meshes eller teksturer. Kun **Parts**, så du kan mærke køreafstanden.

Målet er **10–18 sekunders kørsel** fra garagen til et sted — ikke et pænt kort.

## Antagelse om fart

Regn med en simpel truck på cirka **50 studs i sekundet**.

| Ønsket køretid | Afstand fra garage |
| --- | --- |
| 10 sekunder | ca. 500 studs |
| 14 sekunder | ca. 700 studs |
| 18 sekunder | ca. 900 studs |

Læg zonerne i en ring, så **ingen tur er kortere end 500** og **ingen er længere end 900**.

## Overblik

Tænk et plus med garagen i midten:

```
              Suburb (nord)
                   |
Food Wars —     GARAGE     — Beach
  (vest)           |         (øst)
                   |
              Downtown (syd)
```

Fire veje ud fra garagen. Ét sted for enden af hver vej.

## 1. Garage (centrum)

**Hvor:** omkring `0, 0, 0` (Y er højden).

**Parts:**

- Gulv: Part `GarageFloor`, størrelse ca. `80, 1, 80`, Anchored, lys grå.
- Tre vægge: Parts `6` studs høje, så det føles som et skur med åben front.
- Spawn: en lille Part `Spawn` på gulvet, eller Studio SpawnLocation.
- Valgfrit: en Part `TruckPark` (`20, 1, 12`) der viser, hvor bilen står.

Hold garagen kedelig. Den skal kun svare på: “her starter jeg.”

## 2. Veje

Én vej til hvert sted. Samme opskrift fire gange.

- Part, Anchored, mørkegrå.
- Bredde **24** studs (to “baner”, nem at ramme).
- Højde **1**.
- Længde **600–800** studs.
- Lig dem fladt på basepladen (`Position.Y` ca. `0.5`).

Navngiv dem efter målet:

- `Road_Suburb`
- `Road_Beach`
- `Road_Downtown`
- `Road_FoodWars`

Sæt et lille farvet Part som **skilt** ved starten af hver vej (2×8×2), så du kan se forskel i Play:

| Vej | Skiltfarve |
| --- | --- |
| Suburb | grøn |
| Beach | lyseblå |
| Downtown | mørkegrå |
| Food Wars | rød |

Ingen kurver i v1. Lige veje er nemmere at måle tid på.

## 3. De fire zoner

Hver zone er en **flad plads** plus 2–4 kasser, der forestiller huse eller boder. Ingen døre, ingen interiør.

Fælles for alle:

- Plads: Part ca. `120, 1, 120`, Anchored.
- 2–4 kasser: Parts ca. `16, 20, 16` som “bygninger”.
- Ét stand-punkt: Part `GrillSpot` (`8, 1, 8`), hvor trucken må holde, og hvor grillen senere kan stå.

### Suburb (nord)

- Centrum ca. `0, 0, -700`
- Farve på pladsen: svag grøn
- Bygninger: spredt, lave kasser (højde 12–16)

### Beach (øst)

- Centrum ca. `700, 0, 0`
- Farve: sandgul plads, én ekstra flad Part foran som “vand” (blå, `200, 1, 80`) — kun så du kender stedet
- Bygninger: få kasser langs kanten, ikke ude i det blå

### Downtown (syd)

- Centrum ca. `0, 0, 700`
- Farve: mørkere grå
- Bygninger: 4 høje kasser (højde 30–40) tættere på hinanden

### Food Wars (vest)

- Centrum ca. `-700, 0, 0`
- Farve: svag rød
- Bygninger: to identiske kasser over for hinanden (to “boder”)
- Ingen kamp-logik. Bare et sted, der ser anderledes ud.

700 studs ≈ 14 sekunder. Flyt zonerne ind eller ud, når du har kørt turen.

## 4. Sådan tester du kortet

1. Sæt trucken i garagen.
2. Kør til Suburb. Stop, når `GrillSpot` er nået. Notér sekunder.
3. Gentag Beach, Downtown, Food Wars.
4. Juster **kun** vejens længde / zonens Position, indtil hver tur er 10–18 sekunder.
5. Test at du kan køre tilbage til garagen uden at falde af vejen (bredde 24).

Hvis én tur er 6 sekunder, er zonen for tæt på. Hvis én er 25, er den for langt væk.

## Bevidst udskudt

- Rigtige huse, palmer, skilte-meshes
- Bakker, broer, trafiklys
- NPC-kunder
- Collision på hver bygning ud over de store kasser
- Teleports — spilleren skal køre

Greybox er færdig, når de fire ture føles rigtige, ikke når kortet ser godt ud.
