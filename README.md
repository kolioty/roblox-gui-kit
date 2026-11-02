<div align="center">

<img src="docs/img/hero.svg" alt="ROBLOX GUI KIT by Pedry" width="100%"/>

<a href="https://github.com/kolioty/roblox-gui-kit">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=22&pause=1200&color=1DCB32&center=true&vCenter=true&width=640&lines=Skill+de+Claude+para+Roblox+Studio;Botones%2C+HUDs%2C+tiendas+y+ventanas;Mismo+estilo.+Mismas+texturas.+Cero+copiar%2Fpegar." alt="Typing SVG" />
</a>

<br/>

![Claude Skill](https://img.shields.io/badge/Claude-Skill-D97757?style=for-the-badge&logo=anthropic&logoColor=white)
![Roblox Studio](https://img.shields.io/badge/Roblox-Studio%20MCP-E2231A?style=for-the-badge&logo=roblox&logoColor=white)
![Luau](https://img.shields.io/badge/Luau-ready-00A2FF?style=for-the-badge&logo=lua&logoColor=white)
![License](https://img.shields.io/badge/uso-libre-1DCB32?style=for-the-badge)
![By Pedry](https://img.shields.io/badge/by-Pedry-BF00FF?style=for-the-badge)

**Hecho por Pedry** 💜

<img src="docs/img/divider.svg" width="100%" alt=""/>

</div>

## ✨ ¿Qué es?

**roblox-gui-kit** es una *skill* para [Claude Code](https://claude.com/claude-code) que le enseña a Claude a construir interfaces de Roblox **con el mismo look** que una librería de ~150 GUIs de ejemplo (`Workspace.guiskills`): mismas fuentes, mismos colores, mismas texturas y mismos tamaños.

No son valores inventados: salen de **medir** la librería real.

<div align="center">

| 📦 Instancias analizadas | 🖼️ ScreenGuis | 🎨 Texturas únicas | 🧩 Packs de estilo |
|:---:|:---:|:---:|:---:|
| **~80.000** | **150** | **1.094** | **3** |

</div>

<div align="center">
<img src="docs/img/divider.svg" width="100%" alt=""/>

## 🖼️ Galería

<img src="docs/img/gallery.svg" alt="Los 3 estilos: Chunky, Glossy y Panel de studs" width="100%"/>

<sub>Ilustración original de los 3 estilos, dibujada a partir de los valores medidos (colores, trazos, capas). No son capturas de Studio.</sub>

<img src="docs/img/divider.svg" width="100%" alt=""/>
</div>

## 🚀 Instalación

> Requiere [Claude Code](https://claude.com/claude-code) y [Git](https://git-scm.com/).

<details open>
<summary><b>🪟 Windows (PowerShell)</b></summary>

```powershell
git clone https://github.com/kolioty/roblox-gui-kit.git "$env:USERPROFILE\.claude\skills\roblox-gui-kit"
```
</details>

<details>
<summary><b>🍎 Mac / 🐧 Linux</b></summary>

```bash
git clone https://github.com/kolioty/roblox-gui-kit.git ~/.claude/skills/roblox-gui-kit
```
</details>

Reinicia Claude Code y listo. La skill se activa sola cuando pidas una GUI, botón, HUD, tienda o ventana de Roblox.

**Actualizar:**
```bash
git -C ~/.claude/skills/roblox-gui-kit pull
```

<div align="center"><img src="docs/img/divider.svg" width="100%" alt=""/></div>

## 🧠 Cómo funciona

```mermaid
flowchart LR
    A([💬 Pides una GUI]) --> B[🔌 Conecta al MCP<br/>de Roblox Studio]
    B --> C{¿Hay un ejemplo<br/>parecido en guiskills?}
    C -- Sí --> D[📋 Clona y adapta]
    C -- No --> E[🛠️ Construye con<br/>gui-builder.luau]
    D --> F[📸 Captura y revisa]
    E --> F
    F -- Falla algo --> E
    F -- Todo bien --> G([✅ GUI lista en tu juego])

    style A fill:#BF00FF,stroke:#161A21,color:#fff
    style G fill:#1DCB32,stroke:#161A21,color:#161A21
    style C fill:#FFAA00,stroke:#161A21,color:#161A21
```

---

## 🎨 Los 3 estilos

```mermaid
mindmap
  root((roblox-gui-kit))
    A · Chunky
      guinew
      HUD y botones de juego
      Gradiente + trazo 4.5
      Bevel + Studs
    B · Glossy
      guipackv4
      Tiendas y botones con brillo
      GlowTexture
      Texto con doble label
    C · Panel de studs
      PACKGUIV7
      Ventanas y settings
      Cabecera con patrón
      Filas de lista
```

| Estilo | Pack | Ideal para | Firma visual |
|---|---|---|---|
| **A · Chunky** *(por defecto)* | `guinew` | HUD, botones de acción | Gradiente vertical + trazo oscuro grueso + bevel |
| **B · Glossy** | `guipackv4` | Tiendas, compras, premios | Textura con brillo y texto con sombra |
| **C · Panel de studs** | `PACKGUIV7` | Ventanas, settings, listas | Fondo de patrón + doble borde |

<div align="center"><img src="docs/img/divider.svg" width="100%" alt=""/></div>

## 🌈 Paleta de gradientes

Parejas reales extraídas de la librería (de oscuro a claro):

| Color | Inicio → Fin | |
|---|---|---|
| Verde | `#1DCB32` → `#A6FF00` | ![](https://img.shields.io/badge/-%20%20%20-1DCB32?style=flat-square) ![](https://img.shields.io/badge/-%20%20%20-A6FF00?style=flat-square) |
| Azul | `#007BFF` → `#00EAFF` | ![](https://img.shields.io/badge/-%20%20%20-007BFF?style=flat-square) ![](https://img.shields.io/badge/-%20%20%20-00EAFF?style=flat-square) |
| Morado | `#BF00FF` → `#FF72FF` | ![](https://img.shields.io/badge/-%20%20%20-BF00FF?style=flat-square) ![](https://img.shields.io/badge/-%20%20%20-FF72FF?style=flat-square) |
| Rojo | `#BC0000` → `#FF6767` | ![](https://img.shields.io/badge/-%20%20%20-BC0000?style=flat-square) ![](https://img.shields.io/badge/-%20%20%20-FF6767?style=flat-square) |
| Naranja | `#FF6900` → `#FFB36B` | ![](https://img.shields.io/badge/-%20%20%20-FF6900?style=flat-square) ![](https://img.shields.io/badge/-%20%20%20-FFB36B?style=flat-square) |
| Oro | `#FFAA00` → `#FFFF00` | ![](https://img.shields.io/badge/-%20%20%20-FFAA00?style=flat-square) ![](https://img.shields.io/badge/-%20%20%20-FFFF00?style=flat-square) |
| Trazo oscuro | `#161A21` | ![](https://img.shields.io/badge/-%20%20%20-161A21?style=flat-square) |
| Ventana (estilo C) | `#323241` | ![](https://img.shields.io/badge/-%20%20%20-323241?style=flat-square) |

---

## 📐 Reglas de oro (medidas, no inventadas)

```mermaid
pie showData title Tamaño en Scale vs Offset (guinew)
    "Scale en X e Y" : 6089
    "Scale solo en X o Y" : 715
    "Offset puro" : 54
```

- 📏 **Todo en Scale** + `UIAspectRatioConstraint` → se ve igual en móvil y PC.
- 🔤 **GothamSSm ExtraBold/Heavy**, `TextScaled`, texto blanco con `UIStroke` oscuro.
- 🎯 **Botón** = fondo blanco + `UIGradient` a −90° + `UIStroke` Border + `Bevel` + `Studs`.
- 🏷️ **Nombres consistentes**: `Title`, `Icon`, `Bevel`, `Studs`, `Outer`, `Close`, `ButtonTweenScale`.

<div align="center"><img src="docs/img/divider.svg" width="100%" alt=""/></div>

## 📁 Contenido del repo

```text
roblox-gui-kit/
├── SKILL.md                         ← flujo de trabajo de la skill
├── docs/img/                        ← hero, galería y divisor (SVG originales)
├── references/
│   ├── design-tokens.md             ← fuentes, colores, trazos, radios, gradientes
│   ├── texture-catalog.md           ← ids de textura por rol (9-slice, tiles, glows, íconos)
│   └── component-recipes.md         ← árbol de botón, ventana, moneda + catálogo de 150 GUIs
└── assets/
    ├── gui-builder.luau             ← helpers para execute_luau
    └── button-tween.client.luau     ← hover / press de botones
```

---

## 🛠️ Ejemplo de uso

Dile a Claude, con Roblox Studio abierto y el MCP conectado:

> *"Hazme una tienda con 3 botones de compra y un botón de cerrar"*
> *"Crea un HUD con dinero y velocidad abajo a la izquierda"*
> *"Copia la ventana de Settings pero con colores azules"*

Y dentro, Claude usa los helpers:

```lua
local GUI = ... -- assets/gui-builder.luau

local sg  = GUI.screen("Shop", game.StarterGui, 10, true)
local win = GUI.panel(sg, { Title = "Shop" })
GUI.button(win, { Text = "Buy", Color = "Green", Icon = GUI.Tex.Cash })
```

---

## ⚠️ Requisitos y límites

- Roblox Studio abierto con el **MCP de Studio** conectado a Claude.
- Para **clonar ejemplos reales**, tu lugar necesita la carpeta `Workspace.guiskills`. Sin ella, la skill usa los tokens y recetas de `references/`.
- El rol de cada textura se dedujo de nombres, ScaleType y uso, no de verlas una a una: revisa siempre la captura.
- Los ids de textura son assets de Roblox y pueden necesitar permisos de uso en tu experiencia.

---

<div align="center">

### Hecho con 💜 por **Pedry**

![Made with Claude](https://img.shields.io/badge/Made%20with-Claude-D97757?style=flat-square&logo=anthropic&logoColor=white)
![Made for Roblox](https://img.shields.io/badge/Made%20for-Roblox-E2231A?style=flat-square&logo=roblox&logoColor=white)

⭐ Si te sirve, dale una estrella al repo.

<img src="docs/img/divider.svg" width="100%" alt=""/>

</div>
