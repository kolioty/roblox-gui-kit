# roblox-gui-kit

Skill de Claude para crear GUIs de Roblox con el estilo, texturas, fuentes, colores y tamaños de una librería de ~150 GUIs de ejemplo (`Workspace.guiskills`), usando el MCP de Roblox Studio.

## Instalar (Claude Code)

**Windows (PowerShell):**
```powershell
git clone https://github.com/kolioty/roblox-gui-kit.git "$env:USERPROFILE\.claude\skills\roblox-gui-kit"
```

**Mac / Linux:**
```bash
git clone https://github.com/kolioty/roblox-gui-kit.git ~/.claude/skills/roblox-gui-kit
```

Reinicia Claude Code. La skill se activa sola cuando pidas crear una GUI, botón, HUD, tienda o ventana en Roblox.

## Requisitos
- Roblox Studio abierto con el MCP de Studio conectado a Claude.
- Para clonar ejemplos reales, el lugar de Studio debe tener la carpeta `Workspace.guiskills`. Sin ella, la skill usa los tokens y recetas guardados en `references/`.

## Contenido
- `SKILL.md` — flujo de trabajo.
- `references/design-tokens.md` — fuentes, colores, trazos, radios, gradientes por estilo.
- `references/texture-catalog.md` — ids de textura por rol.
- `references/component-recipes.md` — árbol de botón, ventana, moneda y catálogo de GUIs.
- `assets/gui-builder.luau` — helpers para `execute_luau`.
- `assets/button-tween.client.luau` — animación hover/press.

Los ids de textura son assets de Roblox: pueden requerir permisos de uso en tu experiencia.
