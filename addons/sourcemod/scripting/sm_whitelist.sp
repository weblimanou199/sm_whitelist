#include <sdkhooks>
#include <sdktools>
#include <sourcemod>
#include <SteamWorks>

#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo = {
	name = "sm_whitelist",
	author = "SeenKid",
	description = "Use the command /wl will open a webpage with the server's whitelist group on steam.",
	version = "1.0.0",
	url = "https://github.com/SeenKid/sm_whitelist"
};

public void OnPluginStart() {
	RegConsoleCmd("sm_wl", Command_Whitelist, "open a webpage with the server's whitelist group on steam.");
}

public Action Command_Whitelist(int client, int args) {
	if (args > 0) {
		ReplyToCommand(client, "[WhiteList] Usage : sm_wl");
		return Plugin_Handled;
	} 
	// FOR CS:S
	ShowMOTDPanel(client, "[Australis] Whitelist Steam Group", "https://steamcommunity.com/groups/AustralisWL", MOTDPANEL_TYPE_URL);
	
	// Since csgo doesn't have MOTDPanel, this will send the link in the chat. You can remove this line if you're on CS:S
	ReplyToCommand(client, "[WhiteList] Whitelist Steam Group: https://steamcommunity.com/groups/AustralisWL");

	return Plugin_Handled;
} 
