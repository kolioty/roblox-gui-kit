# Catálogo de texturas

La librería usa **1.094 imágenes únicas**. Aquí van las ~100 más usadas, agrupadas por rol. El rol se dedujo del **nombre de la instancia, ScaleType y tamaño real**, no de ver la imagen: confirma con captura al usarlas.
Formato: `id` — rol · ScaleType · usos. Todos se usan como `rbxassetid://<id>`.

## Contenido
1. 9-slice (Slice): fondos de botón/panel y sombras
2. Tiles: patrones de fondo
3. Brillos, rayos y glow
4. Decoración
5. Estados y UI funcional (check, candado, X, anillos)
6. Íconos de moneda y de juego
7. Cómo configurar cada tipo

## 1. 9-slice (`ScaleType = Slice`)
| id | Rol | SliceCenter | SliceScale | Notas |
|---|---|---|---|---|
| 136393561370347 | **Bevel** de botón/panel (estilo A) | Rect(200,200,220,220) para botones; Rect(40,40,380,380) en variantes | 0.1 (176), 0.075 (31) | ImageTransparency 0.25, ZIndex 0 |
| 136517247509877 | **InnerShine** (brillo interno) | Rect(200,200,220,220) | 1, 0.05 | ImageColor blanco/negro/#AC0000 |
| 96735047582734 | Glow / **DropShadow** suave | Rect(256,256,256,256) | 0.27–0.40 | detrás de ventanas |
| 74603642649742 | **BevelEffect** | Rect(13,13,129,129) | 0.25–0.30 | sobre barras |
| 73214197551985 | **TextButton** base | Rect(64,64,64,64) | 0.11–0.20 | AspectRatio ~2.84, es ImageButton |
| rbxasset://textures/ui/Keyboard/key_selection_9slice.png | selección de teclado (nativa) | Rect(12,12,52,52) | 0.75 | |

## 2. Tiles (`ScaleType = Tile`)
| id | Rol | TileSize | Uso |
|---|---|---|---|
| 90325592797235 | **Pattern / Studs** de ventana y fila (estilo C), 1.336 usos | (0,32),(0,32) | ImageTransparency 0.75 sobre fondo #323241 |
| 116016239612262 | **Studs** (estilo A) | (0,40),(0,40) | ImageTransparency 0.75 |
| 96154824437669 | **Studs** banda ancha (Claim) | (0.4,0),(1.75,0) | botones grandes |
| 103855926983380 | InletTexture | — | hueco/relieve interior |
| 126381637116507 / 105766691154659 | Layer (capa de textura) | — | bandas de fondo |
| 116097226720002 | studs | — | variante |
| 131176354845909 | Pattern | — | fondo |

## 3. Brillos, rayos y glow (todos ImageLabel, fondo transparente)
| id | Rol | ScaleType |
|---|---|---|
| 90037639296620 | **GlowTexture** de botón glossy (estilo B), ImageTransparency 0.6 | Stretch |
| 97490342186132 | GlowTexture alternativo | Stretch |
| 123171646849062 | **Glow / Sunburst** de eventos (también teñido #FF7110, #FFE66B) | Fit |
| 109516122757226 | Glow | Stretch |
| 73316087447285 | Ray (rayos) | Stretch |
| 85018308464934 | RayImage | Stretch |
| 73050300064652 / 76963081135721 / 128094943388135 | Sunray (rayos detrás de ítem) | Fit/Stretch |
| 85140562903667 | Sunburst | Fit |
| 82191997299224 | GlowTexture ancho | Crop |
| 79741099154334 / 12386386944 | Shine / Star | Fit |
| 15308188543 | Glow / Rays / Trail | Fit |
| 126841495627073 / 133166910181065 | Shadow / Glow | Fit |
| 98981360538955 | Stroke / Sheen (borde brillante de cabecera) | Stretch |
| 89372974673819 | **Shadow** (sombra negra, estilo A) | Stretch |
| 72956912290362 | Shadow muy ancha (AR ~22) | Stretch |
| 119275771957836 | Pulse | Fit |

## 4. Decoración
| id | Rol |
|---|---|
| 118070800707365 | StarDecor (508 usos en PACKGUIV7) |
| 135117938988824 | BGDecor (teñido #1F0B00/#000000) |
| 88489598468298 | DecorText (adorno bajo título, AR ~4) |
| 100155632293857 | HeaderDecor (AR ~5.8) |
| 124403449190149 | Sprinkle / ExtraLeft / ExtraRight |
| 120247862293628 | Stars |
| 102818560362667 | Cloud3 / Cloud4 |
| 119927289534890 / 101735945284296 | LeftTopTube / RightTopTube |
| 133317113716137 / 135710519060397 / 78112074157775 | Left / Middle / RightLaser |
| 85969424425903 | RainbowBurst / RainbowAura |
| 138480418143653 / 81805981574903 | CompletionBack / Ring (anillo de progreso) |

## 5. Estados y UI funcional
| id | Rol | Notas |
|---|---|---|
| 104873662023098 | **Checkmark / CompletedCheckmark** | Fit |
| 99544278596149 | **Lock** (candado) | color #6E6E78 bloqueado, #000000 sombra |
| 94968338747469 | LockedIcon | Fit |
| 103629884938513 | **X** (cerrar) | Fit |
| 97594566651393 | **CloseButton** / botones de día (Day1..) | ImageButton Stretch |
| 96838784635213 | **BuyButton / BuyAllButton / Status** base glossy | ImageButton Stretch, AR 2.94 |
| 116178868745533 | Arrow | Fit |
| 15011943540 | Ready / Head / Waiting (estado jugador) | Stretch |
| rbxasset://textures/ui/GuiImagePlaceholder.png | placeholder nativo | |

## 6. Íconos
Íconos de moneda (`CurrencyIcon`/`Icon`, Fit, AR 1): **100451594632335** (cash/dinero, 106 usos) · **79732991925872** (speed, 104) · **98590124059468** (100) · 97962283521603 · 119210375463488 · 98847011195862 · 128553703605728 · 112785428441728 (candy) · 132191334373959 (essence) · 82857133407630 (trophy) · 117730487511862.
Íconos de ítem/recompensa (`ItemIcon`, `RewardIcon`, `OutputEgg`, Fit/Stretch, AR ~1.1): 110772977168910 (349 usos) · 91260564167870 · 79133579432887 · 84787104764975 · 78137530993637 · 119640363267627 · 97151049410727 (AnimalDisplay).
Íconos genéricos (`Icon`, Stretch, AR 1) frecuentes: 133000747888663, 126313578396790, 95095521936614, 136412043059869, 112882057182762, 92820504131022, 106998913980785, 135365625044243, 116947907915616, 132921024609805, 92118186515134, 89793143094217.
Avatares: `rbxthumb://type=AvatarHeadShot&id=<userId>&w=150&h=150` (Slice con UICorner 1 para círculo).
Rol real de cada ícono genérico: míralo en el árbol (`Icon` hijo de qué GUI) con `inspect_instance` antes de reutilizarlo.

## 7. Cómo configurar cada tipo
```lua
-- 9-slice
img.ScaleType = Enum.ScaleType.Slice
img.SliceCenter = Rect.new(200, 200, 220, 220)
img.SliceScale = 0.1
-- Tile
img.ScaleType = Enum.ScaleType.Tile
img.TileSize = UDim2.fromOffset(32, 32)
img.ImageTransparency = 0.75
-- Ícono
img.ScaleType = Enum.ScaleType.Fit   -- + UIAspectRatioConstraint 1
-- Glow
img.ScaleType = Enum.ScaleType.Stretch
img.ImageTransparency = 0.6
```
Los glows y sombras no reciben clicks: `Active = false` (ImageLabel ya lo es) y `ZIndex` por debajo/encima del contenido según el caso.
