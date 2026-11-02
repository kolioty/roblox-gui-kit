# Recetas de componentes y catálogo de GUIs

Recetas copiadas de instancias reales (valores literales). `sz`/`pos` están en {Scale, Offset}.

## Contenido
1. Botón chunky (estilo A, `guinew.MainGUI.Drop`)
2. Botón glossy (estilo B, `BuyButton`)
3. Botón cerrar (A/B/C)
4. Píldora de moneda (`guinew.MainGUI.Currencies`)
5. Ventana + cabecera + filas (estilo C, `PACKGUIV7.Settings`)
6. Badge de alerta
7. Catálogo de las 150 GUIs de ejemplo por pack

## 1. Botón chunky (A)
```
Drop <TextButton> sz={0.214,0},{0.089,0} pos={0.5,0},{0.955,-10} ap=(0.5,0.5) bg=#FFFFFF Text=""
  UIGradient rot=-90  #FF0000 → #FF6767           (el color del botón)
  Outer <UIStroke> th=4.5 c=#2F0001 mode=Border FixedSize   (versión oscura del color)
  UICorner r=(0.01,0)
  UIAspectRatioConstraint ar=4.12
  Icon <ImageLabel> sz={0.925,0},{0.925,0} pos={0.046,0},{0.487,0} ap=(0,0.5) Fit  + UIAspectRatio 1
  Title <TextLabel> sz={0.611,0},{0.8,0} pos={0.575,0},{0.481,0} ap=(0.5,0.5) GothamSSm ExtraBold TextScaled white
    Outer <UIStroke> th=4.5 c=#161A21 Contextual FixedSize
  Bevel <ImageLabel> 136393561370347 Slice Rect(40,40,380,380) SliceScale=0.1 ImageTransparency=0.25 ZIndex=0 sz={1,0},{1,0}
  Studs <ImageLabel> 96154824437669 Tile ImageTransparency=0.75 ZIndex=-1 sz={1,0},{1,0}
  ButtonTweenScale <UIScale> 1
```
Contenedor: el `TextButton` tiene `Text=""`, fuente LegacyArial/8 (valores por defecto sin importancia).

## 2. Botón glossy (B)
```
BuyButton <ImageButton> 96838784635213 Stretch sz={0.261,0},{0.433,0} ap=(0.5,0.5) AutoButtonColor=true
  UIAspectRatioConstraint 2.94
  UIGradient rot=-90  0:#00FF00 → 0.51:#AAFF00 → 1:#C8FF61
  UICorner (0.075,0)
  Label <TextLabel> (negro, sombra) sz={0.898,0},{0.418,0} pos={0.5,0},{0.466,0} Heavy TextScaled #000000 + UIStroke 0.13 ScaledSize #000000
    Label <TextLabel> (blanco) sz={1,0},{1,0} pos={0.5,0},{0.4,0} #FFFFFF + UIStroke 0.13 #000000 + UIGradient -90 (AAFF00 → FFFFFF → FFFFFF)
  GlowTexture <ImageLabel> 90037639296620 Stretch ImageTransparency=0.6 sz={1,0},{1,0} + UIGradient rot=35
```
Variantes de color: cambia solo los keypoints del `UIGradient` del botón (azul `1AD5FF→0066FF`, morado `EC1AFF→8800FF`, rojo `FF0000→FF8859`, naranja `FFAA00→FFFFFF`, gris deshabilitado `ImageColor3 #5A5A5A`).

## 3. Botón cerrar
- **Glossy (B)**: mismo `ImageButton` 96838784635213 que BuyButton, texto "OK"/"X", gradiente `00FF00→FFFF00`, `AspectRatio 2.94`. Variante de icono: `CloseButton` 97594566651393 Stretch.
- **Panel (C)**: cuadrado AR 1, `BackgroundColor3 #FF1414`, `Image=""`, `UIStroke 2.98 #000000`, `UIGradient rot=90 FFFFFF→D3D3D3`, hijo `TextLabel "X"` Heavy blanco (sz 0.8) con `UIStroke 2.98 #4F0707`. Posición `{0.901,0},{-0.044,0}` ap (0,0), tamaño `{0.084,0},{0.095,0}`.

## 4. Píldora de moneda
```
Currencies <Frame> sz={0.158,0},{0.0527,0} pos={0.01,0},{0.99,0} ap=(0,1)  + UIListLayout Vertical (va=Bottom) + UIAspectRatio 5.06
  Cash <Frame> sz={1.31,0},{1.31,0}
    Icon <ImageLabel> 100451594632335 Fit sz={1,0},{1,0} ap=(0,0.5) pos={0,0},{0.5,0}  + UIAspectRatio 1
    Amount <TextLabel> sz={0.7,0},{0.8,0} pos={0.231,0},{0.5,0} ap=(0,0.5) font id 12187365977 Heavy, TextXAlignment=Left
      Outer <UIStroke> 4.5 #323232 Contextual FixedSize
      UIGradient rot=-90  #04FF00 → #AEFF00
    Gain <TextLabel> (+$70B/s) igual con GothamSSm Heavy centrado y gradiente 1AFF00→DDFF00
```
Para Speed: icono 79732991925872, gradiente `FF7878→FF0000`, stroke #161A21. El multiplicador `(x4K)` en verde #3BFF3B.

## 5. Ventana + cabecera + filas (C)
```
Settings <ScreenGui> IgnoreGuiInset=false ScreenInsets=CoreUISafeInsets ResetOnSpawn=false
  Frame <ImageLabel> sz={0.456,0},{0.734,0} pos={0.492,0},{0.527,0} ap=(0.5,0.5) bg=#323241 img=90325592797235 Tile iT=0.75
    UIAspectRatio 1.13 · UIStroke 2.98 #52526B · UIStroke 8.23 #151515
    Close (ver §3)
    Header <ImageLabel> sz={1,0},{0.131,0} pos={0.5,0},{0.004,0} img=90325592797235 Tile iT=0.75
      UIStroke 2.98 #52526B · UIStroke 8.23 #151515 · UIGradient 0:FFFFFF → 0.53:5376AA → 1:FFFFFF (rot 0)
      Title  sz={0.303,0},{0.728,0} pos={0.021,0},{0.124,0} ap=(0,0) Heavy white + UIStroke 2.98 #000000
      Title2Stroke (mismo texto negro, pos.Y +0.025) + UIStroke 4.96 #323241
      Stroke <ImageLabel> 98981360538955 Stretch sz={0.44,0},{0.992,0} pos={0.555,0},{0.5,0}   (brillo en la cabecera)
    ScrollingFrame sz={1,0},{0.9,0} pos={0.5,0},{0.541,0} ScrollBarThickness=8
      UIListLayout Vertical Padding=(0.014,0)
      <Fila> <ImageLabel> sz={0.943,0},{0.072,0} bg=#34435B Pattern Tile iT=0.75 + UIStroke 2.98 #52526B + UIStroke 8.23 #151515
        Title (blanco) + Title2Stroke (negro) sz={0.397,0},{0.53,0} pos={0.016,0},{0.132,0}
        Description  Heavy/Medium, tamaño {0.418,0},{0.282,0}
        ControlBar <Frame> bg=#1E2A39 sz={0.175,0},{0.475,0} pos={0.882,0},{0.496,0}   (toggle / slider)
      MenuNavigation <Frame> bg=#323241 sz={0.943,0},{0,144} + UICorner (0,3) + UIStroke 4.96 #151515 Border + UIStroke 1.98 #727287 Border
        Botones "Buttons"/"Cursor": sz={0.5,-18},{0,44} · activo #70FF18 · inactivo #444456
```

## 6. Badge de alerta (B)
`Frame` #FF0000, `UICorner (1,0)`, `UIAspectRatio 1`, `UIStroke 0.14 #550000` + `UIStroke 0.21 #FFFFFF`, hijo `Label` doble (negro + blanco) con el número. Posición típica `{0.931,0},{0.164,0}` en la esquina superior derecha del botón, sz `{0.137,0},{0.404,0}`.

## 7. Catálogo de las 150 GUIs de ejemplo
Úsalo para buscar un clon de partida. Los números son descendientes (complejidad).

**guinew** (13, estilo A + eventos Halloween): HalloweenEventUI, HalloweenTransition, HalloweenWorldEffects, TopbarCenteredClipped/StandardClipped/Standard/Centered, Cinematic UI, **MainGUI** (8119: LeftHUD, RightHUD, Currencies, Notifications, Messages, Drop, AutoSwing, SpeedPurchase, PotionInfo, BossDialogue, EggBossDamage, GlobalAnnouncements, HotBar…), Scatchel (HotBarUi, AnimalInfo), JumpscareUI, SciFi UI (SciFiTradeInMain/Inventory), AnimalCashPopups. SurfaceGuis: Leaderboard_Money/Speed/Playtime, UpgradeBoardGui, UpgradeBoardUnlockGui, TreadmillBoardGui.

**guipackv4** (26, estilo B): Cmdr, MobileButtons, ColorPicker, InGame, PartyHUD, Transition, RaceHUD, RaceResults, PauseMenu, HerdEvents, Poll, StoreTooltip, CustomHotBar, Dialogue, Tutorials, EditZoo, HUD, Notifications, Windows (23317: UpgradeFrame, …), Lasso, TutorialOverlay, AnimalHoverUI, Topbar*. BillboardGui: CustomPrompt. SurfaceGui: DistanceLeaderboard, MoneyLeaderboard, ZooValueLeaderboard.

**PACKGUIV7** (111, estilo C): ActivePets, AdEggBoostPopupUI, ApplyStarPopupConfirmationScreen, AreaGui, AutoSell, BackpackGui, BeanstalkEventUI, BossFightUI, BossMastery, BossShop, BossSpawningCountdown, BottomUI, ButterflyMachine, CaptureTheEggUI, ActionPrompts, ContentCreatorsAdminPanel, CountdownGui, CrateOpeningPopUpFrame, CutsceneUI, DrScramble*, DragonEggEventUI, DropHeldEgg, EventCountdownGui, Fade, FreeGift, GenericRewardScreen2 (con ConfettiCannon), GetMoreSpeedOnHit, GreatBloomBanner, GrowWispProgressUI, GrowingEggs, HUD, Index, LightVsDarknessUI, LimitedTimePopupsUI, Message, MonsterChargeUI/ChestRewards/EventTutorialFrame/EventUI, MountRace*, Notifications, OfflineMoneyInPlot, Overlay, PendingPurchase, PetFuse, PhoneVideoUI, PopupPrompt, RacePowerUpUI, RaceRallyUI, RecoveryVignette, RedLightGreenLight*, RescueDragonFTUEQuest, RiftTradeIn, RollbackRewardUI, SakuraCrystalCounter/EggCharge/EventTutorialFrame, SammyEventUI, ScrambleBossMastery/BossUI, SellPrompt, **Settings**, ShiftLockButton, ShootingStarUI, SpeedGainAnimation, SpeedShop, StolenVaultEventUI, TrailShop, TrexRun*, TutorialClick/Instructions, WispCompanion, FishingUI, HalloweenDimensionUI, RobuxShop, PetWheel, SoulsTradeInMachine, RobuxShopHalloween, DogsMemoriesFrame, ReturnPumpkinsHUDTimer, CursedIslandWarsUI, HeadlessHorsemanBattlepass, TheHollowEventUI, Cmdr, ProximityPrompts, TrainEventJourney.
Scripts de referencia incluidos (para animaciones/lógica): GenericRewardScreen2.RewardController, ConfettiDriver, Overlay.OverlayDisplay/Renderer/Codec, ShiftLockButton, PendingPurchaseHandler, RescueDragonUIAnimator, DRScrambleAnim.

Cómo clonar un ejemplo:
```lua
local src = workspace.guiskills.PACKGUIV7.Settings
local copy = src:Clone()
copy.Name = "MiSettings"
copy.Parent = game:GetService("StarterGui")
```
Los LocalScripts clonados pueden depender de módulos o remotes del juego original; revisa sus `require` antes de dejarlos activos.
