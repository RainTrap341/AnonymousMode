My grammer is poor, I am very sorry if you get confused or annoyed at my interpretation.
# 注意Caution

为了使得敌人的血条、标志都能正常隐藏，这个模组使用了HidePermanentCockpitRui()函数，可能带来一些视觉上的错误表现。<br>
In order to make the enemy health-bar, name and icon invisible, this mod uses `HidePermanentCockpitRui()`.(This may cause some strange visual performances.)

你可在配置文件中开启对这个函数的启用，它默认是关闭的的。<br>
If you want to get that on, just modify the `HidePermanentCockpitRui` from `true` to `false` in the mod.json. Default value is false.

# 有啥用What this mod brings


将所有玩家包括你的名字和网络名匿名，替换成别的文字。可以用来防止炸弹人。
替换只包括计分板和击杀提示。<br>
This will make the other players’ names look like “Pilot0000” or “\*\*\*\*\*\*” in the scoreboard(the pitch icon was changed with yours) and the obituary.

所有设置都在配置文件，每次修改需要重启游戏。<br>
You can configure the performance in the mod.json.

## 提供的修改模式Modes

3种：将名字替换为纯数字的Digital、将名字替换为指定字符串的Replace、将名字替换为铁御1234的Apexlike。例子见下：<br>
It offers 3 modes: Digital | Replace | Apexlike. They may look like "28791512", "APLACEHOLDER", "Pilot1234". Examples below:

- Digital
  This will make the names as random numbers. And these numbers change dynamically.<br>
  29813<br>
  241215<br>

- Replace
  Turn the names into a placeholder.<br>
  Player<br>
  Player<br>

- Apexlike
  Names are hashed into some numbers with a custom prefix ahead.<br>
  Pilot111<br>
  Pilot222<br>

## 一些回调New callbacks

如果你不是开发者，略过这里。<br>
Ignore this part if you dont want to develop.

我修改了下面这个文件，增加了三个回调函数。<br>
`cl_obituary.gnut` was modified. 3 callbcacks added.

### `AddCallback_Obituary( array<string> functionref( entity, entity, array<string> ) callbackFunc )`

Added with `Obituary( entity attacker, string attackerClass, entity victim, int scriptDamageType, int damageSourceId, bool isHeadShot, bool victimIsOwnedTitan = false, bool forceDisplay = false )`

Obituary is created in that function.

这是用来修改击杀信息中人名的。<br>
This mod use this to modify the attacker/victim names.

```squirrel
void function AddCallback_Obituary( array<string> functionref( entity, entity, array<string> ) callbackFunc )
```

### `AddCallback_PrintObituary( void functionref( ObitStringData ) callbackFunc )`

Added with void function `Obituary_Print( string attackerDisplayName, string weaponDisplayName, string victimDisplayName, vector attackerColor, vector weaponColor, vector victimColor, weaponIcon = null, string attackerPetDisplayName = "", string victimPetDisplayName = "" )`

我不知道干嘛的，但是寻思可以这样写。<br>
Actually I don’t know what this function used for. If you wanna modify the obituary, don’t use this.

```squirrel
void function AddCallback_PrintObituary( void functionref( ObitStringData ) callbackFunc )
```

### `AddCallback_PrintObituaryLocalized( string functionref( string ) callbackFunc )`

Added with void function `Obituary_Print_Localized( string localizedPrint, vector altColor1 = <255, 255, 255>, vector altColor2 = <255, 255, 255>, vector altColor3 = <255, 255, 255>, vector backgroundColor = <255, 255, 255>, float backgroundAlpha = 0.0 )`

The Obituary(...) will call Obituary_Print_Localized(...). The obituary string will be localized here.

可以用来修改击杀信息中的武器名称。<br>
If you wanna modify the weapon names in obituary, may you can use this.

```squirrel
void function AddCallback_PrintObituaryLocalized( string functionref( string ) callbackFunc )
```

## 新的别的函数New Functions
我不知道为什么，它们有时候会报错。但我认为玩家名称中应该不具有ASCII表外的字符，又或者我写错了那张表？<br>
I dont know why these func sometimes get error. There should be only ascii chars in the names. Did I get wront with this?


```squirrel
// 返回字符的Ascii码
// Return the ascii code of a char in string. Return -1, if the string.len() != 1
int function Ord(string c)

// 从Ascii码得到字符
// Return the char.
string function Chr(int code)
```




# Mod.json
配置文件路径在游戏下Northstar\mods\L1Nexus.AnonymousMode\<br>
The config file exists in the Northstar\mods\L1Nexus.AnonymousMode\


修改这些变量来控制模组表现。修改后必须重启游戏。<br>
It contains some Convars you can modify. Restart the game after modifing.

## Convars

```squirrel
	"ConVars": [
		// 对玩家名的操作
		// mode for players' names
		{
			"Name": "l1nexus_anonymous_mode",
			// Digital/Replace/Apexlike/Ignore
			"DefaultValue": "Apexlike"
		},
		// 替换所有玩家的名字的占位符
		// used as all players names in Replace mode
		{
			"Name": "l1nexus_anonymous_placeholder",
			"DefaultValue": "******"
		},
		// 是否对击杀记录处理?
		// hash the obituary?
		{
			"Name": "l1nexus_anonymous_hashObit",
			"DefaultValue": "true"
		},
		// Apexlike 模式下的前缀
		// used for prefix in Apexlike mode
		{
			"Name": "l1nexus_anonymous_prefix",
			"DefaultValue": "Pilot"
		},
		{
			"Name": "l1nexus_anonymous_HidePermanentCockpitRui",
			"DefaultValue": "true"
		},
		// 方便开发用的变量，不需要设置为true
		// devMode, show player's complete name behind the modified
		{
			"Name": "l1nexus_anonymous_devMode",
			"DefaultValue": "false"
		},
		// 网路tag替换为空、不更改和改动[ADV]或自定义
		// Only hide the network or, ignore this, or replaced to [ADV], or custom
		{
			"Name": "l1nexus_anonymous_tag_mode",
			// Empty/Ignore/ADV/Custom
			"DefaultValue": "ADV"
		},
		// 自定义的网络名称
		// Clantag used for all players
		{
			"Name": "l1nexus_anonymous_custom_tag",
			// Empty/Ignore/ADV/Custom
			"DefaultValue": "VDA"
		}
	]
```


# 远望Further updates

- Find a way to modify the enemy health-bar, name and icon(Maybe we don’t have access to it?)

#  Update log

## v0.3.3

- Update hash functions

- Change the functions and callbacks names

## v0.4.0

- Correct hash function. It should work properly now.
- Add `ascii_table.nut`.

## v1.0.0

- Update ConVars.
- Update hash function.

## v1.1.0

- Clantag modify.
- fix more bugs.

## v1.2.0

- Bug fix. You should not be kicked out to main menu if there is a char not available in hash func.
- Autotitan support. It should replace players' name in autotitan obituary. (<- wrong, just upgrade it to 1.3.0)

## v1.3.0

- Obituary now get supports fully (in theory). Players' entrance/quit supports. And it works well on autotitan, spectre & turret.
- FrontierDefense modified. Turret repair should works well. I dont test it carefully. If you get crash with it, just delete `\scripts\vscripts\gamemodes`
- Disable chat filter. It causes crash if you try use it on official server. If you use it on NS servers, enable it in scripts.//

## v1.3.1

- Callsign(Titanfall, megakill, kill replay etc..) event supports.
- TitanSelection(TTDM, TTS..) supports.
- Voicechat hint(right up), kill hint(below crosshair) supports.
- CTF, coliseum anouncements.
