---
name: roblox-gui-kit
description: Crea GUIs de Roblox (ScreenGui, botones, ventanas, HUDs, tiendas, popups, barras de moneda, inventarios) con el estilo, texturas, fuentes, colores y tamaños extraídos de la librería de ~150 GUIs de ejemplo (carpeta Workspace.guiskills en Place1) vía el MCP de Roblox Studio. Úsala siempre que el usuario pida crear, diseñar, copiar, restilizar o mejorar cualquier interfaz / GUI / UI / menú / botón / HUD / ventana / shop en Roblox o Roblox Studio, aunque no mencione "skill" ni "guiskills".
---

# Roblox GUI Kit

Construye GUIs en Roblox Studio (vía MCP `Roblox_Studio`) con el look de la librería de GUIs del usuario. La librería está **medida**, no inventada: los números de `references/` salen de analizar ~80.000 instancias de `Workspace.guiskills` (3 packs: `guinew`, `guipackv4`, `PACKGUIV7`).

## Por qué esta skill existe
Una GUI "genérica" de Roblox (Frame gris + TextButton plano) se ve amateur al lado de las GUIs del usuario. Lo que las hace verse bien es un conjunto repetido de decisiones: gradiente vertical sobre fondo blanco, trazo oscuro grueso, texto blanco escalado con contorno, textura bevel/studs encima y tamaños en Scale con AspectRatio. Replica esas decisiones y el resultado encaja con el resto del juego.

## Flujo de trabajo

1. **Conecta y elige Studio.** `list_roblox_studios` → varios Studios suelen estar abiertos. La librería vive en el que tiene `Workspace.guiskills` (en la sesión original, "Place1"). Confirma con el usuario antes de modificar su juego. Todas las llamadas llevan `studio_id`.
2. **Busca un ejemplo parecido antes de construir.** Con `search_game_tree` (`path: "Workspace.guiskills"`, `keywords: "shop, settings, inventory..."`) o `execute_luau`, localiza una GUI similar a lo pedido. Si existe, **clónala y adapta** (`:Clone()`, cambia textos/iconos/colores) en vez de reconstruir desde cero: conserva las capas exactas (Bevel, Studs, Glow). Los nombres de ScreenGui por pack están en `references/component-recipes.md`.
3. **Elige un estilo** (no mezcles estilos en una misma pantalla):
   - **A · Chunky (guinew)**: HUD/botones de juego. Gradiente + trazo oscuro 4.5 + Bevel + Studs. *Por defecto.*
   - **B · Glossy (guipackv4)**: botones/tiendas con brillo (`GlowTexture`) y texto con sombra por doble label.
   - **C · Panel de studs (PACKGUIV7)**: ventanas, settings, listas con cabecera y filas de patrón.
   Detalles de cada uno en `references/design-tokens.md`.
4. **Construye con `execute_luau`** (`datamodel_type: "Edit"`). Pega `assets/gui-builder.luau` al inicio del código para usar sus helpers (`GUI.button`, `GUI.panel`, `GUI.label`, `GUI.currency`, …), que ya aplican los tokens. Crea todo en lotes pequeños y parentea al final para no congelar Studio.
5. **Textura/ícono**: toma el id de `references/texture-catalog.md` según el rol (panel, brillo, candado, check, estrella…). Los íconos específicos de juego (`Icon` con 1:1) están listados por frecuencia; si falta uno, usa `search_asset` / `insert_asset` o deja `Image = ""` y avisa al usuario.
6. **Verifica visualmente.** Inicia el viewport con `screen_capture` (o `start_stop_play` + captura de cliente) y revisa: texto cortado, aspect ratio roto, capas z incorrectas. Corrige y repite. Revisa `get_console_output` por errores.
7. **Interactividad** (si se pide): copia el patrón de `assets/button-tween.client.luau` (hover/press sobre `ButtonTweenScale`). Pon los LocalScripts dentro de la ScreenGui o en `StarterPlayerScripts`.

## Reglas de construcción (resumen; el porqué está en design-tokens.md)

- **Tamaño en Scale**: ~97% de los hijos usan Scale en X e Y. Usa `Size = UDim2.fromScale(...)` + `UIAspectRatioConstraint` en cada botón/ícono para que escale igual en móvil y PC. Solo usa Offset para altos fijos en listas (`UISizeConstraint`) o trazos.
- **AnchorPoint (0.5,0.5)** + `Position` en Scale para centrar; ancla (0,1)/(1,1) para esquinas.
- **ScreenGui**: `ResetOnSpawn=false`, `ZIndexBehavior=Sibling`, `IgnoreGuiInset=true` para HUD a pantalla completa o `false` + `ScreenInsets=CoreUISafeInsets` para ventanas; `DisplayOrder` 0–10 (más alto para popups).
- **Fuente**: `GothamSSm` (rbxasset://fonts/families/GothamSSm.json) peso **ExtraBold** (estilo A) o **Heavy** (B y C). `TextScaled=true`, `TextSize=14` (solo es el máximo base), `RichText=true` si hay colores en línea. Texto casi siempre **blanco** con `UIStroke` oscuro.
- **Botones**: `BackgroundColor3` blanco + `UIGradient` Rotation −90 con los colores reales; así el degradado se ve limpio. `AutoButtonColor` queda como está, y el feedback lo da un `UIScale` hijo llamado `ButtonTweenScale`.
- **Nombres consistentes** (los scripts del usuario los buscan): `Title`, `Icon`, `Bevel`, `Studs`, `Outer` (UIStroke exterior), `Close`/`CloseButton`, `ButtonTweenScale`, `GlowTexture`, `Shadow`, `Holder`, `Template`.
- **Lo que no se verificó**: el aspecto visual exacto de cada textura se dedujo de nombres, ScaleType y uso, no de verlas. Tras insertarla, revisa la captura; si una textura no hace lo esperado, cámbiala por la alternativa del catálogo.

## Archivos
- `references/design-tokens.md` — fuentes, tamaños, paleta, trazos, radios, gradientes y z-index medidos, por estilo.
- `references/texture-catalog.md` — ids de textura por rol (9-slice con SliceCenter/SliceScale, tiles con TileSize, brillos, iconos).
- `references/component-recipes.md` — árbol exacto de botón, botón cerrar, moneda, ventana/settings, y listado de las 150 GUIs de ejemplo por pack.
- `assets/gui-builder.luau` — helpers Luau para pegar en `execute_luau`.
- `assets/button-tween.client.luau` — LocalScript de hover/press.
