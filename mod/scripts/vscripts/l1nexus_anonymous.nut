global function l1nexusAnonymousInit
global function hashName
global function hashNameWithTag

const int Base = 11
const int MOD = 9997

const int InitialHash = 0


struct{
string mode
string placeholder
string prefix
bool HidePermanentCockpitRui
bool devMode
bool hashObit
bool replaceIcon
string tagMode
string customTag
table<string, string> cache
} file
global struct l1nexusAnonymousGlobals{
   array<void functionref( ObitStringData )> onPrintObituary
   array<string functionref( string )> onPrintObituaryLocalized
   array<array<string> functionref( entity, entity, array<string> )> onObituary
   array<string functionref( string, string )> onPrintObituaryGeneric
}
global l1nexusAnonymousGlobals l1nexusAnonymousGlobal


// Waiting for the end to come. Wishing I had strength to stand.
void function l1nexusAnonymousInit()
{
    // Digital|Fill|Apexlike
    file.mode = GetConVarString("l1nexus_anonymous_mode")
    file.placeholder = GetConVarString("l1nexus_anonymous_placeholder")
    file.prefix = GetConVarString("l1nexus_anonymous_prefix")
    file.HidePermanentCockpitRui = GetConVarString("l1nexus_anonymous_HidePermanentCockpitRui") == "true" ? true : false
    file.hashObit = GetConVarString("l1nexus_anonymous_hashObit") == "true" ? true : false
    file.devMode = GetConVarString("l1nexus_anonymous_devMode") == "true" ? true : false
    file.replaceIcon = GetConVarString("l1nexus_anonymous_replaceIcon") == "true" ? true : false
    file.tagMode = GetConVarString("l1nexus_anonymous_tag_mode")
    file.customTag = GetConVarString("l1nexus_anonymous_custom_tag")



    thread Main()
}

void function Main()
{
    WaitFrame()

    // set the rand seed.
    srand(InitialHash)

    // Add callbacks.
    AddCallback_OnReceivedSayTextMessage(filterChat)
    if (file.hashObit)
    {
        AddCallback_Obituary(replaceObituary)
        AddCallback_PrintObituaryGeneric(replaceObituaryGeneric)
    }

    AddCallback_OnPlayerDisconnected(cleanPlayersFromCache)

    SetScoreboardUpdateCallback(replaceScoreboard)
}

void function cleanPlayersFromCache(entity player) {
    string name = strip(player.GetPlayerName())
    if (player == GetLocalClientPlayer()) {
        file.cache.clear()
        print("[Anonymous] clean all players ")
    }
    else if (name in file.cache)
    {
        delete file.cache[name]
        print("[Anonymous] Remove player " + name + " from cache")
    }
}

string function hashObit(entity ent, string name)
{
    // if (ent == null) {
    //     return name;
    // }
    name = hashName(name)
    // if (ent.IsPlayer()) {
    //     name = hashName(name)
    // }
    // else
    // {
    //     print(name)
    //     array<string> resultSplit = split(name, "'s");
    //     if (resultSplit.len() > 1) {
    //         // print("成功获取玩家名称" + autotitan)
    //         // print(resultSplit[0])
    //         resultSplit[0] = hashName(resultSplit[0])
    //         name = resultSplit[0] + "'s " + resultSplit[1];
    //     }
    // }
    return name;
}


// replace the kills
array<string> function replaceObituary(entity attacker, entity victim, array<string> obit)
{
    obit[0] = hashObit(attacker, obit[0]);
    obit[2] = hashObit(victim, obit[2]);

    return obit
}

// replace the kills
string function replaceObituaryGeneric(string event, string name)
{
    if (strip(name) == "") {
        return name
    }
    return hashName(name)
}

string function hashName(string name)
{
    // print("hashName Origin" + name)
    array<string> resultSplit = split(name, "[]");

    if (resultSplit.len() > 1) {
        name = strip(resultSplit[resultSplit.len() - 1])
        // print("strip resultSplit[resultSplit.len() - 1] " + name)
    }

    if (name in file.cache) {
        return file.cache[name]
    }

    string originalName = name;
    switch(file.mode)
    {
        case "Digital":
            name = _rand(name)
            break
        case "Replace":
            name = file.placeholder
            break
        case "Apexlike":
            name = HashToApexlike(name)
            break
        default:
            break;
    }
    // print("hashName Hashed" + name)

    file.cache[originalName] <- name;

    return strip(name);
}

string function hashNameWithTag(string name)
{
    // print("hashName Origin" + name)
    array<string> resultSplit = split(name, "[]");
    string ctag = "";
    if (resultSplit.len() > 1) {
        name = strip(resultSplit[resultSplit.len() - 1])
        ctag = strip(resultSplit[0])
        // print("strip resultSplit[resultSplit.len() - 1] " + name)
        // print("strip resultSplit[0] " + ctag)
    }

    if (name in file.cache) {
        name = file.cache[name]
    }
    else
    {
        string originalName = name;
        switch(file.mode)
        {
            case "Digital":
                name = _rand(name)
                break
            case "Replace":
                name = file.placeholder
                break
            case "Apexlike":
                name = HashToApexlike(name)
                break
            default:
                break;
        }
        file.cache[originalName] <- name;
    }


    // print("hashName Hashed" + name)

    name = getTag(ctag) + name
    return strip(name);
}

string function getTag(string tag)
{
    switch (file.tagMode) {
        case "ADV":
            tag = "[ADV] ";
            break;
        case "Empty":
            tag = "";
            break;
        case "Custom":
            tag = "[" + file.customTag + "] ";
            break;
        default:
            break;
    }
    return tag
}

// replace the scoreboard
// GetPlayerName() 不会获取到玩家的Ctag
void function replaceScoreboard(entity e, var rui)
{
    // HideFriendlyIndicatorAndCrosshairNames() // Not work
    if(file.HidePermanentCockpitRui)
        HidePermanentCockpitRui(); // Enemy health bar is a permanentcockpitrui.
    if (!e.IsPlayer())
        return;

    entity player = GetLocalClientPlayer();
    player.HideCrosshairNames() // not work
    string name = e.GetPlayerNameWithClanTag();
    string orginalName;
    if (file.devMode)
        orginalName = name;
    name = hashNameWithTag(name);

    if (file.devMode)
        name += " " + orginalName;

    RuiSetString(rui, "playerName", name)
    // Patch
    if (file.replaceIcon)
        RuiSetImage( rui, "playerCard", CallsignIcon_GetSmallImage( PlayerCallsignIcon_GetActive( player ) ) )
}

void function printCache() {
    print("CacheTable:")
    foreach (i, value in file.cache) {
        print(i + " -> " + value)
    }
}

// replace the message sender name
ClClient_MessageStruct function filterChat(ClClient_MessageStruct message)
{
    if (!message.player.IsPlayer())
        return message
    // print(message.playerName)
    message.playerName = hashNameWithTag(message.playerName)
    return message
}

// rand int
string function _rand(string name)
{
    return string(rand())
}

// slice did this.
string function Hash(string name)
{
    int hash = InitialHash

    for(int i=0;i<name.len();i++)
        hash = (hash*Base + Ord(name.slice(i, i+1)))%MOD

    string hashString = string(hash)
    while(hashString.len() < 4)
    {
        hashString = "0" + hashString
    }
    return hashString
}

string function HashToApexlike(string name)
{
    return file.prefix + Hash(name)
}