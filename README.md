# AutoBuilder+ Client 0.4.0 (source)

Client-side Fabric mod for Minecraft 1.21.11 / Java 21. It is a standalone mod with its own ClickGUI; it does not require Meteor or ALICE.

## Current implemented pieces
- ClickGUI category layout includes Combat, Movement, Player, Render, Builder, Misc and Configs; Builder is immediately after Render.
- Right Shift opens the GUI.
- Sponge Schematic v2/v3 gzip NBT reader (palette + varint block data).
- Deterministic bottom-up build queue and inventory shortage calculation.
- Fast Place repeats the normal block interaction while Use is held; server-side rate limits still apply.
- AutoSprint while forward is held.
- Nearby loaded chest/barrel locator (discovery only).
- Dependency-free A* grid path planner (`GridPathfinder`) with bounded search.
- Dependency-free chest transfer calculator (`RestockPlanner`); it calculates amounts but does not operate container screens.
- Build cursor persistence helper (`BuildProgress`) for matching schematic/queue sizes.

## Not yet integrated / not complete
The path planner, restock transfer calculator and progress persistence are core helpers only. They are not yet wired into Minecraft movement, container click handling, or an automatic placement loop. Therefore Auto Walk, Auto Restock, automatic Schematic placement and fully automatic Resume Build are **not complete** in this version. The GUI must not be interpreted as proof those behaviors work.

## Build
Requires Gradle 8.x, Java 21 and network access to Fabric/Maven repositories:

```bash
gradle clean build
```

The JAR should appear under `build/libs/`. This environment did not have Gradle installed or cached Minecraft/Fabric dependencies, so a complete mod build and in-game test could not be performed here.

## Schematic input
Place a Sponge `.schem` file at:
`config/autobuilderplus/schematics/blueprint.schem`

## Core smoke tests
The planning helpers can be checked without Minecraft dependencies by compiling `GridPathfinder.java`, `RestockPlanner.java` and `CoreSmokeTest.java` with Java 21 and running with assertions enabled.
