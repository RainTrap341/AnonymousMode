My grammer is poor, I am very sorry if you get confused or annoyed at my interpretation.
# 注意Caution

如果要使得敌人的血条、标志都能正常隐藏，这个模组使用了HidePermanentCockpitRui()函数，可能带来一些视觉上的错误表现。<br>
In order to make the enemy health-bar, name and icon invisible, this mod uses `HidePermanentCockpitRui()`.(This may cause some strange visual performances.)

你可在配置文件中开启对这个函数的启用，它默认是关闭的的。<br>
If you want to get that on, just modify the `HidePermanentCockpitRui` from `true` to `false` in the mod.json. Default value is false.

# 有啥用What this mod brings

将所有玩家包括你的名字和网络名匿名，替换成别的文字。可以用来防止炸弹人。
替换包括计分板，击杀提示，死亡视角，训牛术，以及其他细节。不包括视野中玩家头顶的名称。<br>
This will make the other players’ names look like “Pilot0000” or “\*\*\*\*\*\*” in the scoreboard(the pitch icon was changed with yours) , the obituary, the rodeo and more. Playernames on players in POV are not supported now.

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

同时也支持仅修改网络tag，请查看mod.json。
Network clantag also supported, check the mod.json.

## 如何实现How it works
我修改了很多文件，增加了一些回调。如果你发现模组没有正常工作，请检查是否被其他模组中的文件覆盖。
I modified many scripts, added some callbacks. If this mod doesnt work well, check if it get overwritten by other mods.

## 新的别的函数New Functions

```squirrel
// 返回字符的Ascii码
// Return the ascii code of a char in string. Return -1, if the string.len() != 1
int function Ord(string c)

// 从Ascii码得到字符
// Return the char.
string function Chr(int code)

// 哈希玩家名字，结果不会包括网络名
// Hash playername without clantag
string hashName(string name)

// 哈希玩家名字，包括网络名设置
// Hash playername with clantag
string hashNameWithTag(string name)
```




# Mod.json
配置文件路径在游戏下Northstar\mods\L1Nexus.AnonymousMode\<br>
The config file exists in the Northstar\mods\L1Nexus.AnonymousMode\


配置文件中有许多变量，修改这些变量来控制模组表现。修改后必须重启游戏。<br>
It contains some Convars you can modify. Restart the game after modifing.

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
- CTF, coliseum, ttdm, fd, attr, hunted supports.

## v1.3.2

- bugfix. Death replay works properly now.
