# Design tokens (medidos en Workspace.guiskills)

Conteos entre paréntesis = veces que aparece en la librería. Sirven para saber qué es "norma" y qué es excepción.

## Contenido
1. Dimensiones y layout
2. Tipografía
3. Trazos (UIStroke)
4. Radios (UICorner)
5. Gradientes
6. Estilo A · Chunky (guinew)
7. Estilo B · Glossy (guipackv4)
8. Estilo C · Panel de studs (PACKGUIV7)
9. ScreenGui

## 1. Dimensiones y layout
- Tamaño Scale/Scale: guinew 6089 de 6858 · guipackv4 9630/11216 · PACKGUIV7 15408/16847. **Siempre Scale.**
- `UIAspectRatioConstraint`: valor **1** domina (858 / 2148 / 962) → íconos y botones cuadrados. Botones largos: 2.94 (BuyButton), 4.12 (botón grande de acción), 5.06 (barra de monedas), 1.13 (ventana de settings).
- `UIScale` = 1 casi siempre (hijo `ButtonTweenScale` para hover/press, 415 en guinew).
- Listas: `UIListLayout` (1677) y `UIGridLayout` (34), `UIPadding` (278). Alturas fijas en filas: `UISizeConstraint` MinSize Y (p.ej. 144).
- Scroll: `ScrollBarThickness` ~8.

## 2. Tipografía
| Familia (rbxasset://fonts/families/…) | Uso |
|---|---|
| **GothamSSm.json** ExtraBold | A: casi todo el texto (913) |
| **GothamSSm.json** Heavy | B y C: casi todo (4661 / 1654); también A (156) |
| GothamSSm Bold/Medium | texto secundario, descripciones (Medium en Help de settings) |
| ComicNeueAngular Bold/ExtraBold | títulos cómicos puntuales (300 en A) |
| Montserrat ExtraBold, FredokaOne, BuilderSans | acentos |
| LegacyArial / SourceSansPro Regular | **solo** TextButtons contenedores sin texto (`Text = ""`) |
| Font id 12187365977 ExtraBold/Heavy | variante Gotham de números/monedas (Amount, TotalMultiplier) |

- `TextScaled = true` (1808 de 2220 en A, 5224/5962 en B, 3690/4633 en C). `TextSize` 14 (base) y 8 (contenedores).
- `TextColor3`: **#FFFFFF** dominante. Alternos: #1B2A35 (texto sobre claro), #FFC800, #FF9D2C, #55FF5F (premios/valores), #FF7110, #CFD0DF (secundario), #737373/#969696 (deshabilitado).
- `RichText` en ~30% (A) para colorear partes del texto.
- Contorno del texto: **UIStroke hijo del label**, no `TextStrokeTransparency` (solo 4 casos).

## 3. Trazos (UIStroke)
- **A**: Thickness **5** (1202), **4.5** (878), 3, 2; `ApplyStrokeMode` Contextual en texto, **Border** en el borde del botón; `StrokeSizingMode` FixedSize. Colores: #323232 (1174), #000000, **#161A21** (495), blanco (423). Stroke del botón = versión muy oscura del color (p.ej. rojo → #2F0001).
- **B**: grosor **proporcional** (`StrokeSizingMode = ScaledSize`) 0.13 (3293), 0.10 (1646), 3 (667). Color #000000 (5696).
- **C**: ScaledSize 5922 / Fixed 1952. Fijos: **2.98** (borde claro #52526B) + **8.23** (borde oscuro #151515) apilados en ventanas y filas; 4.96/2.98 en texto. Texto negro 2.98.
- `LineJoinMode` Round casi siempre (Miter en ~12% de A).
- Nombre del trazo exterior en A: **`Outer`**.

## 4. Radios (UICorner)
- A: Scale **0.01** (478, casi cuadrado) · 0.1 (97) · **1** (81, píldora/círculo).
- B: **0.075** (669) · 1 (531) · Offset 14 (150) · 0.025 (133).
- C: **1** (941, círculos/píldoras) · Offset 2 (309) · 0.1 (255) · 0.2 (164) · 0.15 · 0.25.
- Círculo/avatar/alerta numerada: `CornerRadius = UDim.new(1,0)` + `UIAspectRatioConstraint 1`.

## 5. Gradientes (UIGradient)
Rotación: **−90** (A 1113, B 2371 → luz arriba/abajo vertical), 90 en C (1981), 0 horizontal, 35 en `GlowTexture`. Se aplican sobre un fondo/texto **blanco**.

Parejas color base→claro (arriba→abajo con rot −90 es `Color0` abajo; en el dump `0.00` es el primer keypoint):
- Verde: `#1DCB32 → #A6FF00` · `#33D54E → #C3FF00` · `#00FF00 → #C8FF61` · `#04FF00 → #AEFF00`
- Azul/cian: `#007BFF → #00EAFF` · `#1AD5FF → #0066FF` · `#00B3E5 → #0050E5`
- Morado/rosa: `#BF00FF → #FF72FF` · `#D900FF → #A200FF` · `#9750EE → #FF21ED`
- Rojo/naranja: `#BC0000 → #FF0000` · `#FF0000 → #FF6767` · `#FF6900 → #FF6100` · `#FF5500 → #FFFF7F`
- Amarillo/oro: `#FFAA00 → #FFFF00` · `#FFE100`
- Gris/neutro: `#969696 → #C6C6C6` · `#BEBEBE → #FFFFFF` · `#79675B → #FFFFFF`
- Texto de monedas: `#1AFF00 → #DDFF00` (dinero), `#FF7878 → #FF0000` (trail rojo).

## 6. Estilo A · Chunky (guinew) — **por defecto**
Capas de un botón (de abajo a arriba por ZIndex):
1. `Studs` (ImageLabel, Tile, ImageTransparency 0.75, ZIndex −1)
2. `Bevel` (ImageLabel, Slice, ImageTransparency 0.25, ZIndex 0)
3. Fondo del botón: blanco + `UIGradient` −90 + `UICorner` 0.01 + `UIStroke Outer` Border 4.5 oscuro
4. `Icon` (Fit, cuadrado) y `Title` (TextScaled blanco + stroke 4.5 #161A21)
5. `UIScale ButtonTweenScale`
Paneles: mismo conjunto con `InnerShine` (Slice, ImageColor negro/rojo oscuro para sombreado interno) y `Shadow` (negro, Stretch).

## 7. Estilo B · Glossy (guipackv4)
- Botón: `ImageButton` con textura base **96838784635213** (Stretch), `UIGradient` −90 de 2–3 keypoints, `UICorner 0.075`, `UIAspectRatio 2.94`.
- Brillo: hijo `GlowTexture` (**90037639296620**, Stretch, ImageTransparency 0.6) con su `UIGradient` rot 35.
- **Texto con sombra por doble label**: label trasero negro (`pos.Y 0.466`) con `UIStroke` 0.13 negro + label delantero blanco (`pos.Y 0.4`) con otro stroke y gradiente −90 (p.ej. `#AAFF00 → #FFFFFF`). Da relieve sin Bevel.
- Badge de alerta: Frame #FF0000, `UICorner 1`, `UIStroke` 0.14 #550000 + 0.21 blanco, número con doble label.
- Candado: `Lock` (**99544278596149**) ImageColor #6E6E78 sobre botón deshabilitado (ImageColor del botón #5A5A5A).

## 8. Estilo C · Panel de studs (PACKGUIV7)
- Ventana: `ImageLabel` fondo **#323241**, imagen `Pattern` **90325592797235** Tile (TileSize 32×32 px) con `ImageTransparency 0.75`, `UIAspectRatio 1.13`, 2 `UIStroke` (2.98 #52526B + 8.23 #151515).
- Cabecera: misma textura, alto 0.131, `UIGradient` horizontal `FFFFFF → 5376AA → FFFFFF`, título Heavy blanco con **Title2Stroke** (copia negra desplazada +0.025 en Y con stroke 4.96 #323241).
- Botón cerrar: cuadrado (AR 1) rojo **#FF1414**, trazo negro 2.98, gradiente 90 `FFFFFF → D3D3D3`, "X" Heavy blanco con stroke #4F0707, anclado en la esquina superior derecha sobresaliendo (`pos 0.901, −0.044`).
- Fila de lista: fondo #34435B + textura Pattern + 2 UIStroke; barra de control #1E2A39; botones de acción verde #70FF18 / gris #444456.
- Scroll: `ScrollingFrame` ocupa 0.9 de alto bajo la cabecera; `UIListLayout` vertical con Padding 0.014 Scale.
- Decoración: `StarDecor` (118070800707365), `Sunburst/Glow` (123171646849062, color #FF7110 para eventos).

## 9. ScreenGui
- `ResetOnSpawn = false` (casi todas), `ZIndexBehavior = Sibling` (Global en una minoría).
- `IgnoreGuiInset = false` + `ScreenInsets = CoreUISafeInsets` para ventanas de PACKGUIV7/guipackv4 (46 y 7 casos); `IgnoreGuiInset = true` + `DeviceSafeInsets` o `None` para HUD/overlays.
- `DisplayOrder`: 0–2 HUD, 7–11 menús, 100–120 overlays/popups.
- Topbar propio: `TopbarStandard`, `TopbarCentered`, y sus variantes `…Clipped` (TopbarSafeInsets) — ya existen en la librería; no los reconstruyas.
