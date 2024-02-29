global function Ord
global function Chr
global function InitializeASCIITable

struct {
    table<string, int> asciiTable
} file


// Initialize the table
void function InitializeASCIITable()
{
    file.asciiTable["NUL"] <- 0;
    file.asciiTable["SOH"] <- 1;
    file.asciiTable["STX"] <- 2;
    file.asciiTable["ETX"] <- 3;
    file.asciiTable["EOT"] <- 4;
    file.asciiTable["ENQ"] <- 5;
    file.asciiTable["ACK"] <- 6;
    file.asciiTable["BEL"] <- 7;
    file.asciiTable[" BS"] <- 8;
    file.asciiTable[" HT"] <- 9;
    file.asciiTable[" LF"] <- 10;
    file.asciiTable[" VT"] <- 11;
    file.asciiTable[" FF"] <- 12;
    file.asciiTable[" CR"] <- 13;
    file.asciiTable[" SO"] <- 14;
    file.asciiTable[" SI"] <- 15;
    file.asciiTable["DLE"] <- 16;
    file.asciiTable["DC1"] <- 17;
    file.asciiTable["DC2"] <- 18;
    file.asciiTable["DC3"] <- 19;
    file.asciiTable["DC4"] <- 20;
    file.asciiTable["NAK"] <- 21;
    file.asciiTable["SYN"] <- 22;
    file.asciiTable["ETB"] <- 23;
    file.asciiTable["CAN"] <- 24;
    file.asciiTable[" EM"] <- 25;
    file.asciiTable["SUB"] <- 26;
    file.asciiTable["ESC"] <- 27;
    file.asciiTable[" FS"] <- 28;
    file.asciiTable[" GS"] <- 29;
    file.asciiTable[" RS"] <- 30;
    file.asciiTable[" US"] <- 31;
    file.asciiTable[" "] <- 32;
    file.asciiTable["!"] <- 33;
    // file.asciiTable["\""] <- 34;
    file.asciiTable["#"] <- 35;
    file.asciiTable["$"] <- 36;
    file.asciiTable["%"] <- 37;
    file.asciiTable["&"] <- 38;
    file.asciiTable["'"] <- 39;
    file.asciiTable["("] <- 40;
    file.asciiTable[")"] <- 41;
    file.asciiTable["*"] <- 42;
    file.asciiTable["+"] <- 43;
    file.asciiTable[","] <- 44;
    file.asciiTable["-"] <- 45;
    file.asciiTable["."] <- 46;
    file.asciiTable["/"] <- 47;
    file.asciiTable["0"] <- 48;
    file.asciiTable["1"] <- 49;
    file.asciiTable["2"] <- 50;
    file.asciiTable["3"] <- 51;
    file.asciiTable["4"] <- 52;
    file.asciiTable["5"] <- 53;
    file.asciiTable["6"] <- 54;
    file.asciiTable["7"] <- 55;
    file.asciiTable["8"] <- 56;
    file.asciiTable["9"] <- 57;
    file.asciiTable[":"] <- 58;
    file.asciiTable[";"] <- 59;
    file.asciiTable["<"] <- 60;
    file.asciiTable["="] <- 61;
    file.asciiTable[">"] <- 62;
    file.asciiTable["?"] <- 63;
    file.asciiTable["@"] <- 64;
    file.asciiTable["A"] <- 65;
    file.asciiTable["B"] <- 66;
    file.asciiTable["C"] <- 67;
    file.asciiTable["D"] <- 68;
    file.asciiTable["E"] <- 69;
    file.asciiTable["F"] <- 70;
    file.asciiTable["G"] <- 71;
    file.asciiTable["H"] <- 72;
    file.asciiTable["I"] <- 73;
    file.asciiTable["J"] <- 74;
    file.asciiTable["K"] <- 75;
    file.asciiTable["L"] <- 76;
    file.asciiTable["M"] <- 77;
    file.asciiTable["N"] <- 78;
    file.asciiTable["O"] <- 79;
    file.asciiTable["P"] <- 80;
    file.asciiTable["Q"] <- 81;
    file.asciiTable["R"] <- 82;
    file.asciiTable["S"] <- 83;
    file.asciiTable["T"] <- 84;
    file.asciiTable["U"] <- 85;
    file.asciiTable["V"] <- 86;
    file.asciiTable["W"] <- 87;
    file.asciiTable["X"] <- 88;
    file.asciiTable["Y"] <- 89;
    file.asciiTable["Z"] <- 90;
    file.asciiTable["["] <- 91;
    file.asciiTable["\\"] <- 92;
    file.asciiTable["]"] <- 93;
    file.asciiTable["^"] <- 94;
    file.asciiTable["_"] <- 95;
    file.asciiTable["`"] <- 96;
    file.asciiTable["a"] <- 97;
    file.asciiTable["b"] <- 98;
    file.asciiTable["c"] <- 99;
    file.asciiTable["d"] <- 100;
    file.asciiTable["e"] <- 101;
    file.asciiTable["f"] <- 102;
    file.asciiTable["g"] <- 103;
    file.asciiTable["h"] <- 104;
    file.asciiTable["i"] <- 105;
    file.asciiTable["j"] <- 106;
    file.asciiTable["k"] <- 107;
    file.asciiTable["l"] <- 108;
    file.asciiTable["m"] <- 109;
    file.asciiTable["n"] <- 110;
    file.asciiTable["o"] <- 111;
    file.asciiTable["p"] <- 112;
    file.asciiTable["q"] <- 113;
    file.asciiTable["r"] <- 114;
    file.asciiTable["s"] <- 115;
    file.asciiTable["t"] <- 116;
    file.asciiTable["u"] <- 117;
    file.asciiTable["v"] <- 118;
    file.asciiTable["w"] <- 119;
    file.asciiTable["/x"] <- 120;
    file.asciiTable["/y"] <- 121; // SERVER SCRIPT COMPILE ERROR Can only set vector components of local variables; instead, assign an entire vector
    file.asciiTable["/z"] <- 122; // wtf
    file.asciiTable["{"] <- 123;
    file.asciiTable["|"] <- 124;
    file.asciiTable["}"] <- 125;
    file.asciiTable["~"] <- 126;
    file.asciiTable[" "] <- 127;
    file.asciiTable["€"] <- 128;
    file.asciiTable[" "] <- 129;
    file.asciiTable["‚"] <- 130;
    file.asciiTable["ƒ"] <- 131;
    file.asciiTable["„"] <- 132;
    file.asciiTable["…"] <- 133;
    file.asciiTable["†"] <- 134;
    file.asciiTable["‡"] <- 135;
    file.asciiTable["ˆ"] <- 136;
    file.asciiTable["‰"] <- 137;
    file.asciiTable["Š"] <- 138;
    file.asciiTable["‹"] <- 139;
    file.asciiTable["Œ"] <- 140;
    file.asciiTable[" "] <- 141;
    file.asciiTable["Ž"] <- 142;
    file.asciiTable[" "] <- 143;
    file.asciiTable[" "] <- 144;
    file.asciiTable["‘"] <- 145;
    file.asciiTable["’"] <- 146;
    file.asciiTable["“"] <- 147;
    file.asciiTable["”"] <- 148;
    file.asciiTable["•"] <- 149;
    file.asciiTable["–"] <- 150;
    file.asciiTable["—"] <- 151;
    file.asciiTable["˜"] <- 152;
    file.asciiTable["™"] <- 153;
    file.asciiTable["š"] <- 154;
    file.asciiTable["›"] <- 155;
    file.asciiTable["œ"] <- 156;
    file.asciiTable[" "] <- 157;
    file.asciiTable["ž"] <- 158;
    file.asciiTable["Ÿ"] <- 159;
    file.asciiTable[" "] <- 160;
    file.asciiTable["¡"] <- 161;
    file.asciiTable["¢"] <- 162;
    file.asciiTable["£"] <- 163;
    file.asciiTable["¤"] <- 164;
    file.asciiTable["¥"] <- 165;
    file.asciiTable["¦"] <- 166;
    file.asciiTable["§"] <- 167;
    file.asciiTable["¨"] <- 168;
    file.asciiTable["©"] <- 169;
    file.asciiTable["ª"] <- 170;
    file.asciiTable["«"] <- 171;
    file.asciiTable["¬"] <- 172;
    file.asciiTable["­"] <- 173;
    file.asciiTable["®"] <- 174;
    file.asciiTable["¯"] <- 175;
    file.asciiTable["°"] <- 176;
    file.asciiTable["±"] <- 177;
    file.asciiTable["²"] <- 178;
    file.asciiTable["³"] <- 179;
    file.asciiTable["´"] <- 180;
    file.asciiTable["µ"] <- 181;
    file.asciiTable["¶"] <- 182;
    file.asciiTable["·"] <- 183;
    file.asciiTable["¸"] <- 184;
    file.asciiTable["¹"] <- 185;
    file.asciiTable["º"] <- 186;
    file.asciiTable["»"] <- 187;
    file.asciiTable["¼"] <- 188;
    file.asciiTable["½"] <- 189;
    file.asciiTable["¾"] <- 190;
    file.asciiTable["¿"] <- 191;
    file.asciiTable["À"] <- 192;
    file.asciiTable["Á"] <- 193;
    file.asciiTable["Â"] <- 194;
    file.asciiTable["Ã"] <- 195;
    file.asciiTable["Ä"] <- 196;
    file.asciiTable["Å"] <- 197;
    file.asciiTable["Æ"] <- 198;
    file.asciiTable["Ç"] <- 199;
    file.asciiTable["È"] <- 200;
    file.asciiTable["É"] <- 201;
    file.asciiTable["Ê"] <- 202;
    file.asciiTable["Ë"] <- 203;
    file.asciiTable["Ì"] <- 204;
    file.asciiTable["Í"] <- 205;
    file.asciiTable["Î"] <- 206;
    file.asciiTable["Ï"] <- 207;
    file.asciiTable["Ð"] <- 208;
    file.asciiTable["Ñ"] <- 209;
    file.asciiTable["Ò"] <- 210;
    file.asciiTable["Ó"] <- 211;
    file.asciiTable["Ô"] <- 212;
    file.asciiTable["Õ"] <- 213;
    file.asciiTable["Ö"] <- 214;
    file.asciiTable["×"] <- 215;
    file.asciiTable["Ø"] <- 216;
    file.asciiTable["Ù"] <- 217;
    file.asciiTable["Ú"] <- 218;
    file.asciiTable["Û"] <- 219;
    file.asciiTable["Ü"] <- 220;
    file.asciiTable["Ý"] <- 221;
    file.asciiTable["Þ"] <- 222;
    file.asciiTable["ß"] <- 223;
    file.asciiTable["à"] <- 224;
    file.asciiTable["á"] <- 225;
    file.asciiTable["â"] <- 226;
    file.asciiTable["ã"] <- 227;
    file.asciiTable["ä"] <- 228;
    file.asciiTable["å"] <- 229;
    file.asciiTable["æ"] <- 230;
    file.asciiTable["ç"] <- 231;
    file.asciiTable["è"] <- 232;
    file.asciiTable["é"] <- 233;
    file.asciiTable["ê"] <- 234;
    file.asciiTable["ë"] <- 235;
    file.asciiTable["ì"] <- 236;
    file.asciiTable["í"] <- 237;
    file.asciiTable["î"] <- 238;
    file.asciiTable["ï"] <- 239;
    file.asciiTable["ð"] <- 240;
    file.asciiTable["ñ"] <- 241;
    file.asciiTable["ò"] <- 242;
    file.asciiTable["ó"] <- 243;
    file.asciiTable["ô"] <- 244;
    file.asciiTable["õ"] <- 245;
    file.asciiTable["ö"] <- 246;
    file.asciiTable["÷"] <- 247;
    file.asciiTable["ø"] <- 248;
    file.asciiTable["ù"] <- 249;
    file.asciiTable["ú"] <- 250;
    file.asciiTable["û"] <- 251;
    file.asciiTable["ü"] <- 252;
    file.asciiTable["ý"] <- 253;
    file.asciiTable["þ"] <- 254;
    file.asciiTable["ÿ"] <- 255;
}


// Return the ascii code of a char in string. Return -1, if the string.len() != 1
int function Ord(string c)
{
    if (c.len() != 1)
        return -1

    int result = 127;
    // promise that the c key is in the table
    if (c in file.asciiTable) {
        if (c == "x" || c == "y" || c == "z")
        result = (file.asciiTable[c.toupper()]) - 32;
    else
        result = file.asciiTable[c];
    }
    return result;
}

// Return the char.
string function Chr(int code)
{
    return code.tochar()
}