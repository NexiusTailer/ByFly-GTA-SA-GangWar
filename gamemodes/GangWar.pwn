/*==============================================================================
			----------------------------------------------------------
								ByFly GTA: SA GangWar
							A TDM gamemode for SA-MP 0.3.7
			----------------------------------------------------------

								Original: Lethal

								Modified by Nexius
										r16

==============================================================================*/

#include <a_samp>
#include <GetVehicleColor>
#include <mxINI>

#undef MAX_PLAYERS
#define MAX_PLAYERS		100

#define COLOR_BLACK				0x000000AA
#define COLOR_DARKBROWN			0x80400096
#define COLOR_DARKRED			0x660000AA
#define COLOR_BORDO				0xB00000AA
#define COLOR_RED				0xFF0000AA
#define COLOR_PURPLE			0x800080AA
#define COLOR_PINK				0xFC0FC0FF
#define COLOR_DARKORANGE		0xFF5300AA
#define COLOR_ORANGE			0xFF9900AA
#define COLOR_YELLOW			0xFFFF00AA
#define COLOR_YELLOW_2			0xFFFF00FF
#define COLOR_SALMON			0xFA8072FF
#define COLOR_BLUE				0x004DFFAA
#define COLOR_CYAN				0x00FFFFFF
#define COLOR_LIGHTBLUE			0x33CCFFAA
#define COLOR_GREEN				0x33AA33AA
#define COLOR_SPRINGGREEN		0x00FF7FAA
#define COLOR_LIME				0x10F441AA
#define COLOR_LIME_2			0x00FF00FF
#define COLOR_GRAY				0xAFAFAFAA
#define COLOR_WHITE				0xFFFFFFAA

#define COLOR_RED_RACE			0xE60000FF
#define COLOR_GREEN_RACE		0x9FFF00FF
#define COLOR_RED_GANG			0xFF0000FF
#define COLOR_LIME_GANG			0xCCFF00FF
#define COLOR_BLUE_TEAM			0x0000BBAA

#define COLOR_MINE_1			0xFF0F0FAA
#define COLOR_MINE_2			0xFA421BAA
#define COLOR_MINE_3			0xFA6F1BAA
#define COLOR_MINE_4			0xFBA71AAA
#define COLOR_MINE_5			0xFCCE18AA
#define COLOR_MINE_6			0xFCEB18AA
#define COLOR_MINE_7			0xDAF900AA
#define COLOR_MINE_8			0xBAF801AA
#define COLOR_MINE_9			0x64F801AA
#define COLOR_MINE_10			0x00F900AA

#define COLOR_ELEVATOR			0x00FFFFCC

#define DIALOG_REGISTRATION				1
#define DIALOG_LOGIN					2
#define DIALOG_RULES					3
#define DIALOG_GLASSES					4
#define DIALOG_DRINK					5
#define DIALOG_RADIO					6
#define DIALOG_PVP						7
#define DIALOG_TP						8
#define DIALOG_TPLS						9
#define DIALOG_TPSF						10
#define DIALOG_TPLV						11
#define DIALOG_TP_OTHER					12
#define DIALOG_STATS					13
#define DIALOG_HELP						14
#define DIALOG_ABOUT					15
#define DIALOG_ACTIONS					16
#define DIALOG_SPEC_ACTIONS				17
#define DIALOG_FIGHTING_STYLES			18
#define DIALOG_ANIMATION				19
#define DIALOG_ICOMMANDS				20
#define DIALOG_PLAYER_INFO				21
#define DIALOG_PLAYER_MENU				22
#define DIALOG_DMPOINTS					23
#define DIALOG_DMPOINTS_EXCHANGE		24
#define DIALOG_DMPOINTS_EXCHANGE_2		25
#define DIALOG_DMPOINTS_GIVE			26
#define DIALOG_DMPOINTS_GIVE_2			27
#define DIALOG_PM						28
#define DIALOG_GIVE_MONEY				29
#define DIALOG_REPORT					30
#define DIALOG_PVP_INVITE_1				31
#define DIALOG_PVP_INVITE_2				32
#define DIALOG_PVP_INVITE_3				33
#define DIALOG_PVP_INVITE_4				34
#define DIALOG_TUNING					35
#define DIALOG_TUNING_COLOR				36
#define DIALOG_TUNING_COLOR_2			37
#define DIALOG_TUNING_WHEELS			38
#define DIALOG_TUNING_PAINTJOB_1		39
#define DIALOG_TUNING_PAINTJOB_2		40
#define DIALOG_TUNING_PAINTJOB_3		41
#define DIALOG_TUNING_PAINTJOB_4		42
#define DIALOG_TUNING_PAINTJOB_5		43
#define DIALOG_TUNING_COMPONENTS		44
#define DIALOG_TUNING_SPOILERS_1		45
#define DIALOG_TUNING_SPOILERS_2		46
#define DIALOG_TUNING_LIGHTS			47
#define DIALOG_TUNING_VENTS				48
#define DIALOG_ELEVATOR					49
#define DIALOG_RACE						50
#define DIALOG_VEHICLE					51
#define	DIALOG_GANG						52
#define	DIALOG_GANG_CREATE				53
#define DIALOG_GANG_CREATED				54
#define	DIALOG_GANG_SKIN				55
#define	DIALOG_GANG_INVITE				56
#define	DIALOG_GANG_EXIT				57
#define	DIALOG_GANG_SPAWN				58
#define	DIALOG_GANG_LEVEL_ID			59
#define	DIALOG_GANG_LEVEL				60
#define DIALOG_GANG_STOCK				61
#define DIALOG_GANG_STOCK_AMOUNT		62
#define DIALOG_GANG_STOCK_GIVE			63
#define DIALOG_GANG_STOCK_TAKE			64
#define DIALOG_GANG_STOCK_GIVE_POINTS	65
#define DIALOG_GANG_STOCK_TAKE_POINTS	66
#define	DIALOG_GANG_KICK				67
#define	DIALOG_GANG_COLOR				68
#define	DIALOG_GANG_NAME				69
#define	DIALOG_GANG_NAME_CHANGED		70
#define	DIALOG_GANG_SKIN_LEVEL			71
#define	DIALOG_GANG_INV_ACCEPT			72
#define	DIALOG_GANG_CREATE_COLOR		73
#define DIALOG_GANGS					74
#define DIALOG_GANGS_MENU				75
#define DIALOG_GANG_ONLINE				76
#define DIALOG_GANG_BATTLE				77
#define DIALOG_GANG_BATTLE_ACCEPT		78
#define DIALOG_ADMINS					79
#define	DIALOG_AVTO						80
#define DIALOG_PVP_ABOUT				81
#define	DIALOG_CHANGE_NUMBER			82
#define	DIALOG_NEON						83
#define DIALOG_RACES					84
#define DIALOG_RACE_TOP					85
#define DIALOG_RACE_CREATE				86
#define DIALOG_RACE_CREATE_1			87
#define DIALOG_RACE_CREATE_1_ERROR		88
#define DIALOG_RACE_CREATE_2			89
#define DIALOG_RACE_CREATE_2_ERROR		90
#define DIALOG_RACE_CREATE_3			91
#define DIALOG_RACE_CREATE_4			92
#define DIALOG_RACE_CREATE_DONE			93

#define TEAM_GROVE		0
#define TEAM_BALLAS		1
#define TEAM_AZTEC		2
#define TEAM_NANG		3
#define TEAM_VAGOS		4
#define TEAM_COPS		5
#define TEAM_MAFIA		6
#define TEAM_BIKER		7
#define TEAM_TRIAD		8
#define	TEAM_ADMIN		9
#define TEAM_ARMY		10
#define TEAM_BANDIT		11

#define MAX_GANGS				512
#define MAX_PASSWORD_LENGTH		32

#define PVP_WORLD				1000

#define MAX_CONNECTIONS_FROM_IP		3
#define MAX_PASSWORD_ATTEMPTS		3
#define MAX_TEAMKILLS				3

#define KILLS_FOR_REOWN_TURF		4
#define KILLS_FOR_GANGAREA_TAKE		4
#define KILLS_FOR_GANGAREA_WARNING	2

#define MAX_RACES					100
#define MAX_RACE_CP_EACH_RACE		124
#define COUNTDOWN_TILL_RACE_START	30
#define MAX_RACE_TIME				300
#define RACE_CP_SIZE				12.0

#define ELEVATOR_SPEED			5.0
#define DOORS_SPEED				5.0
#define ELEVATOR_WAIT_TIME		5000

#define FERRIS_WHEEL_SPEED		0.005
#define FERRIS_WHEEL_WAIT_TIME	3000

#define SPAWN_KILL_JAIL_TIME	5

#define ConvertTime(%0,%1,%2,%3,%4) \
	new Float:%0 = floatdiv(%1, 60000.0); \
	%2 = floatround(%0, floatround_tozero); \
	%3 = floatround(floatmul(%0 - %2, 60.0), floatround_tozero); \
	%4 = floatround(floatmul(floatmul(%0 - %2, 60.0) - %3, 1000.0), floatround_tozero)

#define fpublic%0(%1) forward %0(%1); public %0(%1)
#define Kick2(%0) SetTimerEx("OnPlayerKick", 150, 0, "i", %0)
#define Ban2(%0) SetTimerEx("OnPlayerBan", 150, 0, "i", %0)

#define IsOdd(%1) ((%1) & 1)

new const DisReasons[][] =
{
	"�����",
	"�����",
	"������ ���� �������"
},

Ranks[][][] =
{
	{"��������", 50},
	{"�������", 100},
	{"�����", 150},
	{"�������", 200},
	{"������", 250},
	{"������", 500},
	{"������", 750},
	{"�������", 1000},
	{"���������", 2000},
	{"�����", 3000},
	{"���������", 4000},
	{"������� 5 ���", 5000},
	{"������� 6 ���", 6000},
	{"������� 7 ���", 7000},
	{"������� 8 ���", 8000},
	{"������� 9 ���", 9000},
	{"������� 10 ���", 10000}
},

DefaultGangNames[][] =
{
	"����",
	"������",
	"������",
	"Nang",
	"�����",
	"����",
	"�����",
	"�������",
	"������",
	"������",
	"�����",
	"Bandit"
},

RulesMsg[][] =
{
	"{FF00FF}��������!!! �������� ������ ������ � �� ������� �� ������ �� ����������� ��� �� ��������������� � ��������� ���� ����\n",
	"�����, �������� �� ������, ������������� ����������� � ������������������ ��������� � ��������� �� ���������\n\n",
	"{00FFFF}1. ������� �������:\n",
	"{FFFF00}1.1 ��������� ����� ����� ����������� ������� (����), � ��� ����� ���������������\n",
	"1.2 ����������� ����� ����������� ��������� ����� � ����������� ������ �������\n",
	"1.3 ����������� � �����-���� ������� �������, ��������� ��������� � �������������� ����\n",
	"1.4 ����������� ����� ��� ����� � ����� ����\n",
	"1.5 ����������� ���������� ������������� �������� �������� �.�. Caps Lock\n",
	"1.6 ��������� ������� � ����� � ����������: �������� �� ������� ��������� � GTA ByFly ��������, ����� ������ � �.�.\n",
	"1.7 ����������� ������������� ����� ���������� ����� ��� ��������� ��������� �� ������������ ����� ��� ��������� �� ������ ���� � ����\n",
	"1.8 ����������� �������� ������� �������� � ������ ���� ������� �� ����, �����������, ������������� ����� � �.�.\n",
	"1.9 ����������� ����� ���������� �������� ������������� � ����� ����.\n",
	"��� ��������� ������ ��������� �������������� � ������ ��������� /pm ��� � ��������������� ���� �� ������\n",
	"{00FFFF}2. ������� ����\n",
	"{FFFF00}2.1 ��������� ������������� �����-���� ��������, ���-����� � �������� ��� ��������� ����� ������\n",
	"2.3 ��������� ������������ ����, ����, ������, �����������, � ��� �� ����� �� ���������� � ����. � ��� �����:\n",
	"* �������� ��������� �������� �� ������ ������������ ������������� ����������\n",
	"* ��� ����� 10 ����� (���������� �� ������� ����� 10 ����� ��� ������� � ������� ��������)\n",
	"* �������� (��) - �������� � ����� �������� �� ��������� ��� ������ �����������\n",
	"* ���� �� ������/������, ����������� ����� � ������\n",
	"2.4 ��������� �������� �� ���������� ����� �� � ����� ������, ���� ����� ���������� ������ ����������\n",
	"2.5 ��������� ����� ������ �� ���������. ��� ������ ������� ��������, ��� �������� �� ������ ��� �������� ���\n",
	"2.6 ��������� �����, �������� �/� ����. ����� � �������� 24/7, � ������ ��� � ����� � ������ �������\n",
	"2.7 ��������� �������� ���������������\n",
	"{00FFFF}3. ������� �����������������:\n",
	"{FFFF00}3.1 �������������� ������� ��������� ��� ���� ������������� �������\n",
	"3.5 ��������� ����������� �����, ���� ��������� ���������������, ��������� �������� ���� �� ��������������� ����\n",
	"3.7 {FF0000}������� �������������� ������ ������ �� ������� � �� ������\n",
	"{00FFFF}4. ����� �������\n",
	"{FFFF00}4.1 �� ������ ����� ��������� � ���� ������ ������ ������������� � /pm id_���������� ��������� ��� /report id_���������� ���������\n\n",
	"{33AA33}�������� �� ��� �����: {964B00}forum.gameplanet.by\n"
},

RaceAboutMsg[][] =
{
	"��� ���� ����� ������ ��������� ����� (��� �������), ��������: /buildrace\n",
	"����� ���������������� ����������� ����������� ����\n",
	"�������� ����������� �����: /toprace [��� �����]\n",
	"����� ������� ����� (��� �������), ��������: /delrace [��� �����]\n",
	"����� �������� ���������� ����� (��� �������), ��������: /deltoprace [��� �����]\n",
	"����� ��������� ����� ��������: /startrace [��� �����]\n",
	"���������� ����� ����� ������ �����\n",
	"�������������� � �����: /joinrace\n",
	"����� �� �����: /exitrace\n",
	"���������� ������ ��������� �����: /listrace\n",
	"������������ ���������� ���������� ��� �������� ����� ����� - 124\n",
	"������������ ���������� ����� - 100\n",
	"������������ ����� ����� - 5 �����\n",
	"����� ���, ��� ���� ��� ����� �����, ���������� ������ ������������ �����\n",
	"����� � ���������� - 1, 3, 66, bb, aaa � �.�. ����� �������\n",
	"���������� ��������� ����� �������� � ���\n",
	"�� ���������� ����� � ����������� ����������\n",
	"���������� ����� �������� �������� �����"
},

AvtoAboutMsg[][] =
{
	"{FFFFFF}��������� / ���������� ��������� - {FFE4C4}/engine\n",
	"{FFFFFF}������� / ������� ����� - {FFE4C4}/bonnet {00FF00}(Num 4)\n",
	"{FFFFFF}������� / ������� �������� - {FFE4C4}/boot {00FF00}(Num 6)\n",
	"{FFFFFF}������� / ������� ����� - {FFE4C4}/lock /unlock\n",
	"{FFFFFF}�������� / ��������� ���� - {FFE4C4}/lights {00FF00}(Num +)\n",
	"{FFFFFF}�������� / ��������� ������������ - {FFE4C4}/alarm\n",
	"{FFFFFF}������� ����� ���� (�� ����� 32 ��������) - {FFE4C4}/nomer\n",
	"{FFFFFF}���������� / ������ �������� ���������� - {FFE4C4}������� ���\n",
	"{FFFFFF}���������� / ������ ��������� ��� ���� (������ ��������) - {FFE4C4}/objective\n",
	"{00FF7F}����������: ����� �������� ����� - �������� ��������������� ������� ��� �����\n",
	"����� ��������� ����� - �������� ��������������� ������� ��� ����� ��� ���\n\n",
	"{FFFFFF}��� ������� �������� ��� � ���� ����������� ���� ({FFE4C4}/avto{FFFFFF})\n",
	"��� � ������ ��� ������� �������\n",
	"����� ����������� ���� �� ���������� ����������: {FFE4C4}/avto"
},

PvpAboutMsg[][] =
{
	"��� ����, ����� ��������� ��� � ������ �������, ���� ������ �������\n",
	"/pvp [id ������] [id ������] [1/0 ������� �����] [1-5 �����] [$1-10000 ������]\n\n",
	"[id ������] - Desert Eagle-24 | Shotgun-25 | SMG (MP5)-29\n",
	"M4-31 | Sniper Rifle-34 | Grenades-16\n",
	"[1/0 armour] - ���� 1, �� ��� ����� ��������� � ������\n",
	"[place 1/6] - ����� ��� �� ������ �� �����\n",
	"place 1 - East Los Santos\n",
	"place 2 - Ocean Docks\n",
	"place 3 - LV\n",
	"place 4 - Liberty City Bar\n",
	"place 5 - LV Pirs\n",
	"Place 6 - Covering\n",
	"��� ������� � PVP ������ ������ ���������� ��� ����������\n\n",
	"��� ���������� ����������� ���������� ��� �� PVP �������� /nopvp\n",
	"��� ��������� ����������� ����������� ��� �� PVP �������� /nopvp ��� ���"
},

CmdsMsg[][] =
{
	"/stats - �������� ���� ����������\n",
	"/stats [id] - �������� ���������� ������\n\
	/rules - ������� �������\n",
	"/help - ������\n",
	"/givemoney [id] [summa] - �������� ������ ������\n",
	"/kill - ������������\n",
	"/report [id] [�������] - �������� ������ �� ������\n",
	"/tune - ���� �������\n",
	"/���� - ���� ������ �����\n",
	"/avto - ����-����\n",
	"/skin [id �����] - �������� ���� ����\n",
	"/noskin - ���������� �� ����������� �����\n",
	"/drink - ���� �������\n",
	"/skydive - �������� � ���������\n",
	"/count [1-5] - ��������� ������\n",
	"/vip - ����������������� �� vip-������\n",
	"/mine - ���������� ����\n",
	"/actions - ���� ����������� ��������\n",
	"/pm [id] [���������] - ��������� PM\n",
	"/ky - ���������������� ����\n",
	"/hi [id] - ���������������� ������\n",
	"/bb - ����������� �� �����\n",
	"/by [id] - ����������� � �������\n",
	"/porvu - ������� ���� �������\n",
	"/radio - ������ ������������\n",
	"/changepass [������] - �������� ������\n",
	"/resetstats - �������� ���� ����������\n",
	"/dance [1-4] - ���������\n",
	"/dmpoints - ���� DM-�����\n",
	"/gang - ���� �����\n",
	"/����� - ������ ����"
},

AvtoMsg[][] =
{
	"{00FF7F}��������� �����\n",
	"{00FF7F}������� �����\tNum 4\n",
	"{00FF7F}������� ��������\tNum 6\n",
	"{00FF7F}�������� ����\tNum +\n",
	"{00FF7F}�������� ������������\n",
	"{00FF7F}������� �����\n",
	"{FA8072}������� �����\tNum 4\n",
	"{FA8072}������� ��������\tNum 6\n",
	"{FA8072}��������� ����\tNum +\n",
	"{FA8072}��������� ������������\n",
	"{FA8072}������� �����\n",
	"{FA8072}��������� �����\n",
	"{FF0000}�{004DFF}�{10F441}�{FFFF00}�\n",
	"{33CCFF}������� �����"
},

RegularCarStr[][] =
{
	"�������\n�����\n�����\n����������\n������� ����\n����",
	"�������\n�����\n����������\n������� ����\n����",
	"�������\n�����\n�����\n����������\n����",
	"�������\n�����\n����������\n������� ����\n����",
	"�������\n�����\n������� ����\n����",
	"�������\n����������\n������� ����\n����",
	"�������\n�����\n�����\n������� ����",
	"�������\n�����\n�����\n����",
	"�������\n�����\n������� ����",
	"�������\n����������\n������� ����",
	"�������\n�����\n������� ����",
	"�������\n�����",
	"�������\n����������",
	"�������\n������� ����"
},

RaceCreate3Msg[][] =
{
	"���� 3:\n",
	"********\n",
	"�� ����� ���������! ������ ��������� � ����� ������, ��� ������ ������ ������ � ������ ����������.\n",
	"����������: ����� ������� '��' �� ������ ��������. ����������� 'KEY_FIRE', ����� ���������� ������ � ������ �������.\n",
	"����������: ����� ����, ��� �� �������� ��� �������, �� ������������� ������� ���������� ���� ��� ����������� ���������.\n\n",
	">> ������� '��', ����� ������� ��������� ���� ��������. '�����', ����� ���-�� ��������."
},

RaceCreate4Msg[][] =
{
	"���� 4:\n",
	"********\n",
	"����� ���������� � ��������� ����. � ���� ����� �� ������ ���������� ���������; ��� ��� ���� �� �������� '��', �� ������� ������������� ���������.\n",
	"�� ������ ������������� ��������� �������� 'KEY_FIRE'. ������ ������������� �������� �����������.\n",
	"������� ������� 'ENTER', ����� �� ��������� �� ����. ����� ����� ���� ����� ����� ��������!\n\n",
	">> ������� '��', ����� ������� ��������� ���� ��������. '�����', ����� ���-�� ��������."
},

RandMsg1[][] =
{
	"������������ � ��������� ���� �� ������ http://forum.gameplanet.by/",
	"��������!!! �� ������ ������ ������ � �� ������� �� ������ �� ����������� ��� �� ��������������� � ��������� ���� ����.",
	"�����, �������� �� ������, ������������� ����������� � �������������� ��������� � ��������� �� ���������."
},

RandMsg2[][] =
{
	"�������� �� ��� ������ ������� http://86.57.151.20/Gang/",
	"��� �� ������� �������� ���� ���, ������, ��������� ���������� ������ ������,",
	"� ����� ��� ����� ���� ������� !!!"
},

RandMsg3[][] =
{
	"�������� /help ����� ������ ��� ��������� ������� �������"
},

RandMsg4[][] =
{
	"����/����/��������� ������ � cleo ���� (���������: kick/ban)",
	"������������� �������/�����/����/ (���������: kick/ban)",
	"��������������/��������� �������� ������, ������/��������, �����������, ����������� ����� � �.�. (���������: ban)"
},

RandMsg5[][] =
{
	"����������� ������� /skydive ����� ��������� ������ � ���������"
},

RandMsg6[][] =
{
	"                               �������� ����!!!"
},

RandMsg7[][] =
{
	"�� �������� ����������� ������� �����������, �������� /count [time], ����� ��������� ������, ����� ���������� � ��������.",
	"����������� ��� ������� ��� ������ ������� �� ����� ����� ��� �����. �� ������������� ������� ���� ��������� - ���."
},

RandMsg8[][] =
{
	"��� ������� �������, ������ ����� GangWar ������� � TeamSpeak3 GamePlanet.by",
	"����� ��: 86.57.151.20 ����:9987",
	"��������� ������� !!!"
},

RandMsg9[][] =
{
	"�� ��������� �������� ��� ����� http://forum.gameplanet.by/index.php?showforum=821",
	"��� �� ���� ��� ������ � IRC �� ������ #gta.gangwar"
},

RandMsg10[][] =
{
	"�������� /lock ����� ������� ����� ������ ���������� � /unlock ��� ���� ��� �� �� �������."
},

RandMsg11[][] =
{
	"����������� ������� /givemoney id summa ��� �������� �����"
},

RandMsg12[][] =
{
	"��� ����� ������ �������� �������� /changepass"
},

RandMsg13[][] =
{
	"� ������� ������ ������� /report id_������ ������� ��� � /pm... ������ � ����� ��� ��������������� �� �����!!!"
},

RandMsg14[][] =
{
	"� ������ ������ �� ������� �������� ������� �������� ������ �� ������������� Micro SMG, Sawn off Shotgun, TEC9.",
	"��� ������� ������ ������ �����������, ���� ����� �� ��������� ������ ��������."
},

BadWords[][] =
{
	"���", "�����", "����", "���", "���", "����",
	"����", "���", "����", "����", "���"
},

ColorsArray[] =
{
	1, 0, 6, 2, 79, 149, 151, 3, 34
},

WheelsArray[] =
{
	1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080,
	1081, 1082, 1083, 1084, 1085, 1096, 1097, 1098
},

SpoilersArray[] =
{
	1000, 1001, 1002, 1003, 1014, 1015, 1016, 1023
},

HoodsArray[] =
{
	1004, 1005, 1011, 1012
},

LampsArray[] =
{
	1013, 1024
},

TeamSkins[] =
{
	105, 106, 107, 193,
	102, 103, 104, 192,
	173, 174, 12, 233,
	121, 122, 123, 211,
	108, 109, 110, 263,
	280, 282, 283,
	124, 125, 127, 216,
	100, 247, 248,
	117, 118, 120,
	217,
	287,
	66, 240
},

Float:TeamSpawns[][] =
{
	{2459.511, -1690.4795, 13.5441},
	{2221.282, -1173.97, 25.7265},
	{1828.7595, -1682.1378, 13.5469},
	{1208.0321, -1746.3037, 13.5933},
	{2810.3608, -1177.2137, 25.3201},
	{1580.174, -1634.742, 13.5616},
	{2141.195, -2267.252, 13.2954},
	{1787.853, -1365.913, 15.7578},
	{863.4913, -1638.3412, 14.9521},
	{1116.4141, -2022.5947, 74.4297},
	{2793.918, -2456.878, 13.6321},
	{311.5885, -1512.816, 24.9219}
},

Float:PvpSpawns[][][] =
{
	{{2619.8452, -1356.8669, 56.2303}, {2619.1208, -1384.7225, 56.2303}},
	{{-807.5502, 503.6819, 1360.2152}, {-833.0216, 501.4549, 1358.3253}},
	{{2790.0715, -2516.4939, 13.6305}, {2789.3181, -2547.0769, 13.6346}},
	{{1885.6149, 1423.462, 72.6059}, {1906.1252, 1424.4448, 72.6059}},
	{{2360.3142, 576.7172, 7.7813}, {2307.114, 576.566, 7.7813}}
},

Float:SniperDmSpawns[][] =
{
	{2692.3186, 2783.5881, 59.0212},
	{2718.2961, 2773.7371, 77.3594},
	{2727.9055, 2685.8982, 59.0234},
	{2632.6953, 2832.3433, 127.5781},
	{2506.5005, 2690.4067, 77.8438},
	{2593.4302, 2638.3591, 114.0313}
},

Float:FloorZOffsets[] =
{
	0.0, 8.5479, 13.9994, 19.451, 24.9025,
	30.3541, 35.8056, 41.2572, 46.7087,
	52.1603, 57.6118, 63.0634, 68.5149,
	73.9665, 79.418, 84.8696, 90.3211,
	95.7727, 101.2242, 106.6758, 112.1273
},

Float:gFerrisCageOffsets[][] =
{
	{0.0699, 0.06, -11.75},
	{-6.91, -0.0899, -9.5},
	{11.16, 0.0, -3.63},
	{-11.16, -0.0399, 3.6499},
	{-6.91, -0.0899, 9.4799},
	{0.0699, 0.06, 11.75},
	{6.9599, 0.01, -9.5},
	{-11.16, -0.0399, -3.63},
	{11.16, 0.0, 3.6499},
	{7.0399, -0.02, 9.36}
},

FloorNames[][] =
{
	"Ground Floor\n", "First Floor\n", "Second Floor\n", "Third Floor\n",
	"Fourth Floor\n", "Fifth Floor\n", "Sixth Floor\n", "Seventh Floor\n",
	"Eighth Floor\n", "Ninth Floor\n", "Tenth Floor\n", "Eleventh Floor\n",
	"Twelfth Floor\n", "Thirteenth Floor\n", "Fourteenth Floor\n",
	"Fifteenth Floor\n", "Sixteenth Floor\n", "Seventeenth Floor\n",
	"Eighteenth Floor\n", "Nineteenth Floor\n", "Penthouse"
},

VehicleNames[][] =
{
	"Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus", "Voodoo",
	"Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto",
	"Taxi", "Washington", "Bobcat", "Mr Whoopee", "BF Injection", "Hunter", "Premier",
	"Enforcer", "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks",
	"Hotknife", "Trailer 1", "Previon", "Coach", "Cabbie", "Stallion", "Rumpo",
	"RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
	"Pizzaboy", "Tram", "Trailer 2", "Turismo", "Speeder", "Reefer", "Tropic",
	"Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van", "Skimmer", "PCJ-600",
	"Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic", "Sanchez",
	"Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler",
	"ZR-350", "Walton", "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis",
	"Baggage", "Dozer", "Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo",
	"Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
	"Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B",
	"Bloodring Banger", "Rancher", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike",
	"Beagle", "Cropdust", "Stunt", "Tanker", "Roadtrain", "Nebula", "Majestic",
	"Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck",
	"Tow Truck", "Fortune", "Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor",
	"Combine", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Streak",
	"Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck LA", "Hustler",
	"Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada",
	"Yosemite", "Windsor", "Monster A", "Monster B", "Uranus", "Jester", "Sultan",
	"Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna",
	"Bandito", "Freight Flat", "Streak Carriage", "Kart", "Mower", "Duneride",
	"Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford",
	"BF-400", "Newsvan", "Tug", "Trailer 3", "Emperor", "Wayfarer", "Euros", "Hotdog",
	"Club", "Freight Carriage", "Trailer 3", "Andromada", "Dodo", "RC Cam", "Launch",
	"Police Car (LSPD)", "Police Car (SFPD)", "Police Car (LVPD)", "Police Ranger",
	"Picador", "S.W.A.T. Van", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage Trailer A",
	"Luggage Trailer B", "Stair Trailer", "Boxville", "Farm Plow", "Utility Trailer"
};

enum pInfo
{
	pTeam,
	pMoney,
	pClass,
	Float:pArmour,
	pName[MAX_PLAYER_NAME + 1],
	pPass[MAX_PASSWORD_LENGTH],
	pTempAdmin,
	pAdmin,
	pKills,
	pDeaths,
	pDmPoints,
	pPoints,
	pSkin,
	pLastSkin,
	pConnectCount,
	pFightStyle,
	pDialog,
	pWarns,
	pTeamKills,
	pTurfBackCount,
	pGangKillCount,
	pFloodCount,
	pFloodTime,
	pPvpCreate,
	pPvpCount,
	pPvpWeapon,
	pPvpMoney,
	pPvpArmour,
	pPvpPlace,
	pPassCount,
	pBattleId,
	pClickedId,
	pAFKTime,
	pBanTime,
	pSeconds,
	pTempGang,
	pGangId,
	pSpec,
	pId,
	pDmZone,
	pGang,
	pGangLvl,
	pGangSkin,
	pMineCount,
	pGangCheck,
	Text3D:pMineLabel,
	PlayerText:pVehSpeed,
	PlayerText:pRaceInfo,
	PlayerText:pMutedTime,
	pRacePos,
	pPointsId,
	pSpikesObj,
	pMineObj[2],
	pNeonObj[12],
	pMinePick,
	pMineStatus,
	pCreatedRaceVeh,
	pRaceCPProgess,
	pMuteTime,
	pJailTime,
	pPunishTime,
	pPromiseTmr,
	pMineTmr,
	pInfoTmr,
	pAntiSKTmr,
	pPayDayTmr,
	pGiveMoneyTmr,
	pCountPvpTmr,
	bool:pInPvp,
	bool:pInRace,
	bool:pLoopingAnim,
	bool:pAlPreLoaded,
	bool:pNeonStatus,
	bool:pPvpAccept,
	bool:pGodMode,
	bool:pLogged,
	bool:pBan,
	bool:pCap,
	bool:pCaps,
	bool:pShield,
	bool:pGiveMoney,
	bool:pPromise,
	bool:pMute,
	bool:pPunish,
	bool:pJail
};

new
	PlayerInfo[MAX_PLAYERS][pInfo],

	GroveGz,
	BallasGz,
	AztecGz,
	NangGz,
	VagosGz,
	CopsGz,
	MafiaGz,
	BikerGz,
	TriadGz,
	AdminGz,
	ArmyGz,
	BanditGz,

	Text:TDLogo,
	Text:TDLogo2,
	Text:TDTime,
	Text:TDAnimHelper,

	TimeStr[32],
	gHour,
	gMinute,
	gSecond,

	iGateObj,
	iGate2Obj,
	iGate3Obj,
	iGate4Obj,
	VipGatesObj,

	DumperVeh,
	Hydra1Veh,
	Hydra2Veh,
	PanzerVeh,
	TunVehs[22],

	TpLSPick,
	TpSFPick,
	TpLVPick,
	TpChinaPick,

	CountTmr,
	rCounterTmr,
	ElevatorBoostTmr,

	bool:PvpPlaceVisit[5],

	bool:Gang[MAX_GANGS],
	GangPick[MAX_GANGS],
	Text3D:GangLabel[MAX_GANGS],
	GangTempName[MAX_PLAYERS][32],
	GangName[MAX_GANGS][32],
	GangCheck[MAX_GANGS],
	GangColor[MAX_GANGS][10],
	Float:GangSpawn[MAX_GANGS][3],
	GangSpawnInt[MAX_GANGS],
	bool:GangTag[MAX_GANGS],
	GangSkin[MAX_GANGS][7],
	GangDmPoints[MAX_GANGS],
	GangMoney[MAX_GANGS],
	GangKills[MAX_GANGS],

	BuildRace,
	BuildRaceType,
	BuildVehicle,
	BuildModeVID,
	BuildName[30],
	bool:BuildTakeVehPos,
	BuildVehPosCount,
	bool:BuildTakeCPs,
	BuildCPCount,
	bool:RaceBusy,
	RaceName[30],
	RaceVehicle,
	RaceType,
	TotalRaceCP,
	Float:RaceVehCoords[2][4],
	Float:RaceCPCoords[MAX_RACE_CP_EACH_RACE][4],
	RacePlayersCount[2],
	RaceCountAmount,
	RaceTick,
	bool:RaceStarted,
	bool:RaceChecked,
	RaceFinishCount,
	RaceJoinCount,
	RaceTime,
	RaceNames[MAX_RACES][64],
	TotalRaces,
	bool:AutomaticRace,
	RaceTimeProgress,

	ElevatorObj,
	ElevatorDoorsObj[2],
	FloorDoorsObj[21][2],
	Text3D:ElevatorLabel,
	Text3D:FloorsLabel[21],
	ElevatorState,
	ElevatorFloor,
	ElevatorQueue[21],
	FloorRequestedBy[21],

	FerrisWheelObj[12],
	Float:FerrisWheelAngle,
	bool:FerrisWheelAlternate,

	FireObj,
	Fire1Obj,
	BalloonObj,
	BalloonStage,
	bool:BalloonIsStarted,
	Text3D:BalloonLabel,

	CountCmd,
	bool:CountStarted,

	MaxPing = 300,
	AveragePing,

	FlasherObj[MAX_VEHICLES],

	RulesStr[2800],
	RaceCreate3Str[457],
	RaceCreate4Str[456],
	RaceAboutStr[951],
	AvtoAboutStr[967],
	PvpAboutStr[690],
	CmdsStr[1000],
	AvtoStr[412],

	bool:EarsIsEnabled;

Float:GetElevatorZCoordForFloor(floorid) return (14.5114 + FloorZOffsets[floorid] + 0.0595);

Float:GetDoorsZCoordForFloor(floorid) return (14.5114 + FloorZOffsets[floorid]);

gw_ShowPlayerDialog(playerid, dialogid, type, header[], text[], button1[], button2[])
{
	PlayerInfo[playerid][pDialog] = dialogid;
	return ShowPlayerDialog(playerid, dialogid, type, header, text, button1, button2);
}

#if defined _ALS_ShowPlayerDialog
	#undef ShowPlayerDialog
#else
	#define _ALS_ShowPlayerDialog
#endif
#define ShowPlayerDialog gw_ShowPlayerDialog

gw_SetPlayerVirtualWorld(playerid, worldid)
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) SetPlayerVirtualWorld(i, worldid);
	}
	return SetPlayerVirtualWorld(playerid, worldid);
}

#if defined _ALS_SetPlayerVirtualWorld
	#undef SetPlayerVirtualWorld
#else
	#define _ALS_SetPlayerVirtualWorld
#endif
#define SetPlayerVirtualWorld gw_SetPlayerVirtualWorld

main(){}

public OnGameModeInit()
{
	SetWeather(2);
	SetWorldTime(11);
	SetGameModeText("GangWar v3.9");
	SetNameTagDrawDistance(40.0);
	ShowPlayerMarkers(1);
	UsePlayerPedAnims();

	new i;
	GangLoad();
	ResetElevatorQueue();
	ElevatorInitialize();
	for( ; i < sizeof RaceCreate3Msg; i++) strcat(RaceCreate3Str, RaceCreate3Msg[i]);
	for(i = 0; i < sizeof RaceCreate4Msg; i++) strcat(RaceCreate4Str, RaceCreate4Msg[i]);
	for(i = 0; i < sizeof RaceAboutMsg; i++) strcat(RaceAboutStr, RaceAboutMsg[i]);
	for(i = 0; i < sizeof AvtoAboutMsg; i++) strcat(AvtoAboutStr, AvtoAboutMsg[i]);
	for(i = 0; i < sizeof PvpAboutMsg; i++) strcat(PvpAboutStr, PvpAboutMsg[i]);
	for(i = 0; i < sizeof RulesMsg; i++) strcat(RulesStr, RulesMsg[i]);
	for(i = 0; i < sizeof CmdsMsg; i++) strcat(CmdsStr, CmdsMsg[i]);
	for(i = 0; i < sizeof AvtoMsg; i++) strcat(AvtoStr, AvtoMsg[i]);

	TDLogo = TextDrawCreate(499.0, 104.0, "gameplanet.by");
	TextDrawBackgroundColor(TDLogo, 255);
	TextDrawFont(TDLogo, 3);
	TextDrawLetterSize(TDLogo, 0.3, 1.0);
	TextDrawColor(TDLogo, COLOR_RED);
	TextDrawSetOutline(TDLogo, 1);

	TDLogo2 = TextDrawCreate(314.0, 387.0, "Gang War~n~www.gameplanet.by");
	TextDrawAlignment(TDLogo2, 2);
	TextDrawBackgroundColor(TDLogo2, 65380);
	TextDrawLetterSize(TDLogo2, 1.02, 2.2);
	TextDrawColor(TDLogo2, -65281);
	TextDrawSetShadow(TDLogo2, 3);
	TextDrawUseBox(TDLogo2, 1);
	TextDrawBoxColor(TDLogo2, 65350);
	TextDrawTextSize(TDLogo2, 0.0, 400.0);

	gettime(gHour, gMinute, gSecond);
	format(TimeStr, sizeof TimeStr, "%02d:%02d:%02d", gHour, gMinute, gSecond);
	TDTime = TextDrawCreate(499.0, 118.0, TimeStr);
	TextDrawLetterSize(TDTime, 0.3, 1.0);
	TextDrawBackgroundColor(TDTime, 255);
	TextDrawSetOutline(TDTime, 1);
	TextDrawColor(TDTime, -1);
	TextDrawFont(TDTime, 3);

	TDAnimHelper = TextDrawCreate(610.0, 400.0, "~r~~k~~PED_SPRINT~ ~w~to stop the animation");
	TextDrawFont(TDAnimHelper, 2);
	TextDrawSetShadow(TDAnimHelper, 0);
	TextDrawSetOutline(TDAnimHelper, 1);
	TextDrawBackgroundColor(TDAnimHelper, 255);
	TextDrawColor(TDAnimHelper, -1);
	TextDrawAlignment(TDAnimHelper, 3);

	GroveGz = GangZoneCreate(2220.01, -1950.308, 2634.519, -1437.102);
	BallasGz = GangZoneCreate(2010.854, -1448.945, 2509.025, -951.5297);
	AztecGz = GangZoneCreate(1807.184, -1926.622, 2193.39, -1397.625);
	NangGz = GangZoneCreate(1075.356, -1934.517, 1424.182, -1369.99);
	VagosGz = GangZoneCreate(2566.068, -1673.966, 2927.337, -1058.119);
	MafiaGz = GangZoneCreate(2079.305, -2357.429, 2547.053, -1950.308);
	CopsGz = GangZoneCreate(1424.182, -1926.622, 1807.184, -1437.102);
	BikerGz = GangZoneCreate(1547.446, -1432.222, 1869.935, -1044.718);
	TriadGz = GangZoneCreate(428.8739, -1942.413, 911.8341, -1504.214);
	AdminGz = GangZoneCreate(968.8766, -2349.03, 1390.991, -1906.883);
	ArmyGz = GangZoneCreate(2374.551, -2677.546, 2820.865, -2357.429);
	BanditGz = GangZoneCreate(15.6778, -1931.883, 480.8265, -1348.956);

	AddPlayerClassEx(TEAM_GROVE, TeamSkins[0], TeamSpawns[TEAM_GROVE][0], TeamSpawns[TEAM_GROVE][1], TeamSpawns[TEAM_GROVE][2], 357.5, 24, 50, 25, 100, 29, 500);
	AddPlayerClassEx(TEAM_GROVE, TeamSkins[1], TeamSpawns[TEAM_GROVE][0], TeamSpawns[TEAM_GROVE][1], TeamSpawns[TEAM_GROVE][2], 357.5, 24, 50, 25, 100, 29, 500);
	AddPlayerClassEx(TEAM_GROVE, TeamSkins[2], TeamSpawns[TEAM_GROVE][0], TeamSpawns[TEAM_GROVE][1], TeamSpawns[TEAM_GROVE][2], 357.5, 24, 50, 25, 100, 29, 500);
	AddPlayerClassEx(TEAM_GROVE, TeamSkins[3], TeamSpawns[TEAM_GROVE][0], TeamSpawns[TEAM_GROVE][1], TeamSpawns[TEAM_GROVE][2], 357.5, 24, 50, 25, 100, 29, 500);

	AddPlayerClassEx(TEAM_BALLAS, TeamSkins[4], TeamSpawns[TEAM_BALLAS][0], TeamSpawns[TEAM_BALLAS][1], TeamSpawns[TEAM_BALLAS][2], 0.0, 0, 0, 24, 50, 31, 150);
	AddPlayerClassEx(TEAM_BALLAS, TeamSkins[5], TeamSpawns[TEAM_BALLAS][0], TeamSpawns[TEAM_BALLAS][1], TeamSpawns[TEAM_BALLAS][2], 0.0, 0, 0, 24, 50, 31, 150);
	AddPlayerClassEx(TEAM_BALLAS, TeamSkins[6], TeamSpawns[TEAM_BALLAS][0], TeamSpawns[TEAM_BALLAS][1], TeamSpawns[TEAM_BALLAS][2], 0.0, 0, 0, 24, 50, 31, 150);
	AddPlayerClassEx(TEAM_BALLAS, TeamSkins[7], TeamSpawns[TEAM_BALLAS][0], TeamSpawns[TEAM_BALLAS][1], TeamSpawns[TEAM_BALLAS][2], 0.0, 0, 0, 24, 50, 31, 150);

	AddPlayerClassEx(TEAM_AZTEC, TeamSkins[8], TeamSpawns[TEAM_AZTEC][0], TeamSpawns[TEAM_AZTEC][1], TeamSpawns[TEAM_AZTEC][2], 88.0, 24, 50, 25, 100, 29, 500);
	AddPlayerClassEx(TEAM_AZTEC, TeamSkins[9], TeamSpawns[TEAM_AZTEC][0], TeamSpawns[TEAM_AZTEC][1], TeamSpawns[TEAM_AZTEC][2], 88.0, 24, 50, 25, 100, 29, 500);
	AddPlayerClassEx(TEAM_AZTEC, TeamSkins[10], TeamSpawns[TEAM_AZTEC][0], TeamSpawns[TEAM_AZTEC][1], TeamSpawns[TEAM_AZTEC][2], 88.0, 24, 50, 25, 100, 29, 500);
	AddPlayerClassEx(TEAM_AZTEC, TeamSkins[11], TeamSpawns[TEAM_AZTEC][0], TeamSpawns[TEAM_AZTEC][1], TeamSpawns[TEAM_AZTEC][2], 88.0, 24, 50, 25, 100, 29, 500);

	AddPlayerClassEx(TEAM_NANG, TeamSkins[12], TeamSpawns[TEAM_NANG][0], TeamSpawns[TEAM_NANG][1], TeamSpawns[TEAM_NANG][2], 38.473, 24, 50, 25, 100, 31, 150);
	AddPlayerClassEx(TEAM_NANG, TeamSkins[13], TeamSpawns[TEAM_NANG][0], TeamSpawns[TEAM_NANG][1], TeamSpawns[TEAM_NANG][2], 38.473, 24, 50, 25, 100, 31, 150);
	AddPlayerClassEx(TEAM_NANG, TeamSkins[14], TeamSpawns[TEAM_NANG][0], TeamSpawns[TEAM_NANG][1], TeamSpawns[TEAM_NANG][2], 38.473, 24, 50, 25, 100, 31, 150);
	AddPlayerClassEx(TEAM_NANG, TeamSkins[15], TeamSpawns[TEAM_NANG][0], TeamSpawns[TEAM_NANG][1], TeamSpawns[TEAM_NANG][2], 38.473, 24, 50, 25, 100, 31, 150);

	AddPlayerClassEx(TEAM_VAGOS, TeamSkins[16], TeamSpawns[TEAM_VAGOS][0], TeamSpawns[TEAM_VAGOS][1], TeamSpawns[TEAM_VAGOS][2], 172.5518, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_VAGOS, TeamSkins[17], TeamSpawns[TEAM_VAGOS][0], TeamSpawns[TEAM_VAGOS][1], TeamSpawns[TEAM_VAGOS][2], 172.5518, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_VAGOS, TeamSkins[18], TeamSpawns[TEAM_VAGOS][0], TeamSpawns[TEAM_VAGOS][1], TeamSpawns[TEAM_VAGOS][2], 172.5518, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_VAGOS, TeamSkins[19], TeamSpawns[TEAM_VAGOS][0], TeamSpawns[TEAM_VAGOS][1], TeamSpawns[TEAM_VAGOS][2], 172.5518, 0, 0, 24, 50, 29, 500);

	AddPlayerClassEx(TEAM_COPS, TeamSkins[20], TeamSpawns[TEAM_COPS][0], TeamSpawns[TEAM_COPS][1], TeamSpawns[TEAM_COPS][2], 95.1108, 24, 50, 25, 100, 31, 150);
	AddPlayerClassEx(TEAM_COPS, TeamSkins[21], TeamSpawns[TEAM_COPS][0], TeamSpawns[TEAM_COPS][1], TeamSpawns[TEAM_COPS][2], 95.1108, 24, 50, 25, 100, 31, 150);
	AddPlayerClassEx(TEAM_COPS, TeamSkins[22], TeamSpawns[TEAM_COPS][0], TeamSpawns[TEAM_COPS][1], TeamSpawns[TEAM_COPS][2], 95.1108, 24, 50, 25, 100, 31, 150);

	AddPlayerClassEx(TEAM_MAFIA, TeamSkins[23], TeamSpawns[TEAM_MAFIA][0], TeamSpawns[TEAM_MAFIA][1], TeamSpawns[TEAM_MAFIA][2], 317.9167, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_MAFIA, TeamSkins[24], TeamSpawns[TEAM_MAFIA][0], TeamSpawns[TEAM_MAFIA][1], TeamSpawns[TEAM_MAFIA][2], 317.9167, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_MAFIA, TeamSkins[25], TeamSpawns[TEAM_MAFIA][0], TeamSpawns[TEAM_MAFIA][1], TeamSpawns[TEAM_MAFIA][2], 317.9167, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_MAFIA, TeamSkins[26], TeamSpawns[TEAM_MAFIA][0], TeamSpawns[TEAM_MAFIA][1], TeamSpawns[TEAM_MAFIA][2], 317.9167, 0, 0, 24, 50, 29, 500);

	AddPlayerClassEx(TEAM_BIKER, TeamSkins[27], TeamSpawns[TEAM_BIKER][0], TeamSpawns[TEAM_BIKER][1], TeamSpawns[TEAM_BIKER][2], 90.0, 0, 0, 24, 50, 31, 150);
	AddPlayerClassEx(TEAM_BIKER, TeamSkins[28], TeamSpawns[TEAM_BIKER][0], TeamSpawns[TEAM_BIKER][1], TeamSpawns[TEAM_BIKER][2], 90.0, 0, 0, 24, 50, 31, 150);
	AddPlayerClassEx(TEAM_BIKER, TeamSkins[29], TeamSpawns[TEAM_BIKER][0], TeamSpawns[TEAM_BIKER][1], TeamSpawns[TEAM_BIKER][2], 90.0, 0, 0, 24, 50, 31, 150);

	AddPlayerClassEx(TEAM_TRIAD, TeamSkins[30], TeamSpawns[TEAM_TRIAD][0], TeamSpawns[TEAM_TRIAD][1], TeamSpawns[TEAM_TRIAD][2], 176.9822, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_TRIAD, TeamSkins[31], TeamSpawns[TEAM_TRIAD][0], TeamSpawns[TEAM_TRIAD][1], TeamSpawns[TEAM_TRIAD][2], 176.9822, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_TRIAD, TeamSkins[32], TeamSpawns[TEAM_TRIAD][0], TeamSpawns[TEAM_TRIAD][1], TeamSpawns[TEAM_TRIAD][2], 176.9822, 0, 0, 24, 50, 29, 500);

	AddPlayerClassEx(TEAM_ADMIN, TeamSkins[33], TeamSpawns[TEAM_ADMIN][0], TeamSpawns[TEAM_ADMIN][1], TeamSpawns[TEAM_ADMIN][2], 272.0852, 24, 50, 25, 100, 29, 500);

	AddPlayerClassEx(TEAM_ARMY, TeamSkins[34], TeamSpawns[TEAM_ARMY][0], TeamSpawns[TEAM_ARMY][1], TeamSpawns[TEAM_ARMY][2], 90.0, 24, 50, 31, 150, 16, 7);

	AddPlayerClassEx(TEAM_BANDIT, TeamSkins[35], TeamSpawns[TEAM_BANDIT][0], TeamSpawns[TEAM_BANDIT][1], TeamSpawns[TEAM_BANDIT][2], 59.6, 4, 1, 24, 50, 31, 250);
	AddPlayerClassEx(TEAM_BANDIT, TeamSkins[36], TeamSpawns[TEAM_BANDIT][0], TeamSpawns[TEAM_BANDIT][1], TeamSpawns[TEAM_BANDIT][2], 59.6, 4, 1, 24, 50, 31, 250);

	BalloonLabel = Create3DTextLabel("��� ������� ���������� ����\n������� /start", COLOR_ELEVATOR, 836.1572, -2000.5112, 14.7462, 15.0, 0, 0);
	Create3DTextLabel("��������", COLOR_BORDO, 1969.2941, -2186.8699, 13.5469, 15.0, 0, 1);
	Create3DTextLabel("��������", COLOR_BORDO, -1552.7843, -427.2818, 6.0163, 15.0, 0, 1);
	Create3DTextLabel("��������", COLOR_BORDO, 1705.9359, 1599.4969, 10.115, 15.0, 0, 1);
	Create3DTextLabel("�����", COLOR_BORDO, 1026.668, -1310.2712, -21.0671, 10.0, 0, 1);

	TpLSPick = CreatePickup(1559, 2, 1969.2941, -2186.8699, 13.5469, -1);
	TpSFPick = CreatePickup(1559, 2, -1552.7843, -427.2818, 6.0163, -1);
	TpLVPick = CreatePickup(1559, 2, 1705.9359, 1599.4969, 10.115, -1);
	TpChinaPick = CreatePickup(1559, 2, 1026.668, -1310.2712, -21.0671, -1);

	AddStaticPickup(1242, 2, 1125.1913, -2017.7397, 69.0078);
	AddStaticPickup(1242, 2, 2362.7263, -1120.1473, 1050.8826);
	AddStaticPickup(1242, 2, 2743.199, -2453.34, 13.8622);
	AddStaticPickup(1242, 2, 2208.4814, -1101.2257, 31.5547);
	AddStaticPickup(1242, 2, 2530.4893, -2089.6323, 13.5469);
	AddStaticPickup(1242, 3, 1805.9583, -1590.4363, 14.0469);
	AddStaticPickup(1242, 3, 1057.9862, -1692.7179, 14.3672);
	AddStaticPickup(1242, 3, 2688.4221, -2114.6604, 13.5488);
	AddStaticPickup(1242, 3, 2821.4761, -1214.6162, 25.8815);
	AddStaticPickup(1242, 3, 2345.9807, -1247.1226, 22.5);
	AddStaticPickup(1242, 3, 1783.1991, -1427.9604, 16.9682);
	AddStaticPickup(1242, 3, 810.0639, -1161.3955, 16.9766);
	AddStaticPickup(1242, 2, 2560.5601, -1133.0898, 63.7093);
	AddStaticPickup(1242, 3, 969.4689, -1634.9146, 13.5377);
	AddStaticPickup(1242, 3, 726.0289, -1276.3831, 13.6484);
	AddStaticPickup(1242, 3, 2684.4497, -1539.2809, 26.4236);
	AddStaticPickup(1240, 2, 1124.7144, -2025.2495, 69.0078);
	AddStaticPickup(1240, 2, 2362.8071, -1122.3463, 1051.5746);
	AddStaticPickup(1240, 3, 1031.2074, -1360.5779, 13.5743);
	AddStaticPickup(370, 15, 1209.1556, -1999.2952, 69.0078);
	AddStaticPickup(370, 15, 1094.641, -2036.9629, 82.756);
	AddStaticPickup(360, 1, 1177.468, -2079.1792, 69.0078);
	AddStaticPickup(358, 2, 2359.0845, -1134.7241, 1050.875);
	AddStaticPickup(358, 2, 490.7365, -74.6712, 998.7578);
	AddStaticPickup(358, 3, 1141.6779, -2077.2529, 69.0078);
	AddStaticPickup(358, 2, 2491.052, -1579.474, 23.2411);
	AddStaticPickup(357, 3, 1908.8861, -1583.2286, 29.05);
	AddStaticPickup(357, 2, 2560.1357, -913.4852, 83.775);
	AddStaticPickup(357, 3, 2815.0115, -1230.3339, 42.6525);
	AddStaticPickup(357, 3, 916.2736, -1271.3247, 19.0859);
	AddStaticPickup(356, 2, 2065.918, -1585.4769, 13.4842);
	AddStaticPickup(356, 2, 1173.056, -2036.3949, 69.1413);
	AddStaticPickup(356, 2, 509.2573, -78.4974, 998.9609);
	AddStaticPickup(356, 2, 2362.1113, -1124.9391, 1050.875);
	AddStaticPickup(356, 2, 2364.4895, -1122.5969, 1050.875);
	AddStaticPickup(356, 2, 2208.2939, -1186.8585, 33.5313);
	AddStaticPickup(356, 2, 1679.1064, -1964.0129, 21.9609);
	AddStaticPickup(356, 3, 2327.1057, -1248.8105, 22.5);
	AddStaticPickup(355, 2, 2468.4485, -1772.1685, 13.5581);
	AddStaticPickup(355, 3, 1853.5994, -1587.0889, 29.0469);
	AddStaticPickup(355, 3, 983.053, -1641.6554, 13.5234);
	AddStaticPickup(355, 3, 2809.082, -1113.095, 30.7188);
	AddStaticPickup(355, 3, 1794.0187, -1420.2145, 16.9609);
	AddStaticPickup(353, 2, 2330.4641, -1700.3735, 13.5437);
	AddStaticPickup(353, 2, 509.0056, -73.0312, 998.7578);
	AddStaticPickup(353, 2, 2690.627, -1331.5509, 44.2716);
	AddStaticPickup(353, 2, 2543.4729, -1120.7712, 61.9031);
	AddStaticPickup(353, 3, 1126.0757, -2062.0164, 69.0078);
	AddStaticPickup(353, 3, 1973.9126, -1223.6384, 20.0234);
	AddStaticPickup(353, 3, 1809.8407, -1384.8335, 14.9219);
	AddStaticPickup(353, 3, 1198.929, -1734.1022, 13.5738);
	AddStaticPickup(351, 2, 2835.7402, -2390.6587, 14.6081);
	AddStaticPickup(349, 2, 2751.6565, -1181.8479, 69.4006);
	AddStaticPickup(349, 2, 2077.144, -2087.8467, 16.0759);
	AddStaticPickup(349, 2, 1124.8156, -2010.0177, 69.0078);
	AddStaticPickup(349, 2, 2372.7598, -1135.0522, 1050.875);
	AddStaticPickup(349, 2, 489.2635, -81.8902, 998.7578);
	AddStaticPickup(348, 3, 1125.5182, -2055.9568, 69.0078);
	AddStaticPickup(348, 2, 508.1598, -84.6235, 998.9609);
	AddStaticPickup(348, 2, 2765.1885, -2182.5457, 11.0888);
	AddStaticPickup(347, 2, 2659.9661, -1444.5132, 16.25);
	AddStaticPickup(337, 2, 2455.0811, -1708.045, 13.6179);

	AddStaticPickup(1242, 3, 2522.4668, -1701.8077, 16.6744);
	AddStaticPickup(1242, 3, 2147.8552, -2269.2341, 14.2344);
	AddStaticPickup(1242, 3, 1596.9431, -1636.1741, 13.7188);
	AddStaticPickup(1242, 3, 277.6429, -1523.5549, 24.9219);
	AddStaticPickup(1242, 3, 1819.4655, -1543.1694, 17.0469);
	AddStaticPickup(1240, 3, 2232.699, -1179.409, 29.2043);
	AddStaticPickup(1240, 3, 2462.5701, -1701.39, 18.325);
	AddStaticPickup(1240, 3, 1206.5338, -1727.9563, 13.5702);
	AddStaticPickup(1240, 3, 1828.9779, -1694.2731, 13.5469);
	AddStaticPickup(1240, 3, 2813.351, -1233.175, 44.5969);
	AddStaticPickup(1240, 3, 1608.8383, -1668.474, 6.2188);
	AddStaticPickup(1240, 3, 291.6209, -1503.0133, 24.9219);
	AddStaticPickup(370, 15, -1765.4392, -174.7473, 3.5547);
	AddStaticPickup(370, 15, -2209.4707, 294.1174, 35.1172);
	AddStaticPickup(358, 3, 306.4243, -1523.5881, 24.9219);
	AddStaticPickup(353, 3, 2222.9568, -1171.2338, 24.7266);
	AddStaticPickup(353, 3, 2494.4333, -1700.5466, 22.6408);
	AddStaticPickup(353, 3, 1198.929, -1734.1022, 13.5738);
	AddStaticPickup(353, 3, 1828.851, -1672.032, 13.5469);
	AddStaticPickup(353, 3, 2831.8074, -1182.6426, 24.8195);
	AddStaticPickup(353, 3, 2147.2861, -2265.137, 14.4545);
	AddStaticPickup(353, 3, 320.7039, -1503.4685, 24.9219);

	DumperVeh = AddStaticVehicle(406, 2723.81, -2392.658, 15.1371, 180.0, 1, 1);
	Hydra1Veh = AddStaticVehicle(520, 1193.8994, -2053.0, 69.9, 270.0, -1, -1);
	Hydra2Veh = AddStaticVehicle(520, 1193.7998, -2020.3994, 69.9, 270.0, -1, -1);
	PanzerVeh = AddStaticVehicle(432, 1273.5, -2015.9, 59.1, 180.0, 95, 10);

	AddStaticVehicle(536, 2510.5398, -1687.1321, 13.3584, 50.9197, 86, 86);
	AddStaticVehicle(587, 2480.4858, -1654.1302, 13.1872, 266.233, 86, 86);
	AddStaticVehicle(451, 2473.2944, -1695.4388, 13.3121, 359.0142, 86, 86);
	AddStaticVehicle(587, 2491.3098, -1684.2821, 13.2161, 270.8374, 86, 86);
	AddStaticVehicle(451, 2516.3401, -1663.6854, 13.7062, 98.6044, 86, 86);

	AddStaticVehicle(587, 2205.5364, -1173.3594, 25.524, 270.2225, 5, 5);
	AddStaticVehicle(536, 2205.667, -1160.7697, 25.5305, 269.1792, 5, 5);
	AddStaticVehicle(580, 2217.304, -1166.0198, 25.5227, 270.6133, 5, 5);
	AddStaticVehicle(451, 2205.6404, -1169.0424, 25.4367, 270.2218, 5, 5);
	AddStaticVehicle(587, 2217.2261, -1161.6858, 25.4529, 268.6277, 5, 5);

	AddStaticVehicle(412, 1214.3103, -1732.5437, 13.5758, 320.4523, 124, 124);
	AddStaticVehicle(412, 1234.4064, -1727.9963, 13.5702, 267.4985, 124, 124);
	AddStaticVehicle(587, 1212.9415, -1698.3743, 13.5469, 87.9801, 124, 124);
	AddStaticVehicle(412, 1187.8851, -1729.4308, 13.5605, 179.161, 124, 124);
	AddStaticVehicle(412, 1211.9354, -1746.6093, 13.5942, 131.8472, 124, 124);

	AddStaticVehicle(586, 1829.3723, -1691.0593, 13.5469, 94.0469, 7, 7);
	AddStaticVehicle(412, 1827.8174, -1675.2429, 13.5469, 95.6136, 7, 7);
	AddStaticVehicle(412, 1911.3422, -1776.1532, 13.3828, 179.5644, 7, 7);
	AddStaticVehicle(412, 1923.6123, -1651.6923, 13.5469, 95.1554, 7, 7);
	AddStaticVehicle(412, 1923.7577, -1640.5507, 13.5469, 260.1153, 7, 7);
	AddStaticVehicle(412, 1923.9928, -1632.3308, 13.5469, 73.0769, 7, 7);

	AddStaticVehicle(474, 2806.8813, -1183.368, 25.1339, 220.2208, 6, 6);
	AddStaticVehicle(587, 2847.969, -1177.1644, 24.5211, 184.5938, 6, 6);
	AddStaticVehicle(587, 2837.6409, -1204.7365, 23.7197, 18.9415, 6, 6);

	AddStaticVehicle(587, 2174.4668, -2267.2534, 13.1978, 227.3613, 0, 0);
	AddStaticVehicle(561, 2160.6382, -2281.0276, 13.1969, 227.699, 0, 0);
	AddStaticVehicle(587, 2222.0906, -2214.6807, 13.3607, 46.9784, 0, 0);
	AddStaticVehicle(561, 2210.8108, -2224.0249, 13.3606, 43.3097, 0, 0);
	AddStaticVehicle(561, 2204.771, -2230.2168, 13.361, 44.5764, 0, 0);

	AddStaticVehicle(412, 870.2476, -1658.4238, 13.3838, 358.0815, 1, 1);
	AddStaticVehicle(412, 879.1808, -1657.7527, 13.3855, 355.5392, 1, 1);
	AddStaticVehicle(587, 883.6476, -1657.7158, 13.4046, 356.7072, 1, 1);
	AddStaticVehicle(412, 892.3967, -1657.7495, 13.3865, 357.5911, 1, 1);

	AddStaticVehicle(455, 2777.486, -2436.554, 14.0719, 90.0, -1, -1);
	AddStaticVehicle(433, 2742.381, -2431.647, 14.0769, -90.0, 55, 123);
	AddStaticVehicle(470, 2777.86, -2420.333, 13.511, 90.0, -1, -1);
	AddStaticVehicle(470, 2777.084, -2415.052, 13.5139, 90.0, -1, -1);
	AddStaticVehicle(470, 2745.412, -2465.488, 13.5234, -90.0, -1, -1);
	AddStaticVehicle(573, 2745.412, -2471.488, 13.5234, -90.0, 55, 123);
	AddStaticVehicle(470, 2775.9172, -2496.6169, 13.6597, 89.8652, 43, 0);

	AddStaticVehicle(522, 1791.6909, -1346.116, 15.2505, 268.532, 3, 8);
	AddStaticVehicle(522, 1791.4189, -1349.6969, 15.2734, 272.4111, 3, 8);
	AddStaticVehicle(522, 1771.0752, -1385.2699, 15.3228, 0.0, 87, 118);
	AddStaticVehicle(522, 1787.7002, -1391.7002, 15.4, 90.0, 3, 8);
	AddStaticVehicle(522, 1786.2998, -1413.9004, 15.4, 180.0, 3, 8);
	AddStaticVehicle(522, 1781.2998, -1413.9004, 15.4, 180.0, 3, 8);

	AddStaticVehicle(507, 303.1888, -1485.572, 24.4517, 235.0976, 0, 0);
	AddStaticVehicle(507, 300.2346, -1490.7909, 24.4517, 234.7545, 0, 0);
	AddStaticVehicle(522, 292.7492, -1545.0107, 24.1656, 56.4227, 0, 7);
	AddStaticVehicle(579, 294.6685, -1540.2906, 24.5941, 54.1857, 1, 1);
	AddStaticVehicle(579, 297.9611, -1535.8444, 24.4263, 53.3489, 1, 1);
	AddStaticVehicle(490, 280.8698, -1531.0291, 24.7048, 233.9172, 0, 0);
	AddStaticVehicle(522, 284.0135, -1525.6366, 24.1668, 232.0144, 0, 7);
	AddStaticVehicle(541, 288.3353, -1522.3414, 24.2319, 235.7059, 6, 1);
	AddStaticVehicle(402, 291.9565, -1518.3005, 24.3524, 234.4961, 0, 0);
	AddStaticVehicle(541, 294.787, -1513.5471, 24.23, 235.823, 6, 1);
	AddStaticVehicle(402, 297.9676, -1508.9458, 24.353, 235.4792, 0, 0);
	AddStaticVehicle(522, 298.4913, -1502.8137, 24.1661, 233.0178, 0, 7);

	AddStaticVehicle(522, 1947.3174, -2223.8005, 13.108, 183.0583, 6, 25);
	AddStaticVehicle(476, 1900.6342, -2623.0081, 14.2588, 359.79, 7, 6);
	AddStaticVehicle(476, 1812.756, -2629.2571, 14.2565, 8.1085, 7, 6);

	AddStaticVehicle(522, 1137.8934, -2066.9849, 68.5797, 270.6263, 3, 8);
	AddStaticVehicle(522, 1140.958, -2004.6023, 68.5787, 272.578, 3, 8);

	AddStaticVehicle(487, 1760.1999, -1537.5999, 9.6, 270.0, 126, 126);

	AddStaticVehicle(522, 3177.2539, -1106.628, 150.598, 0.0, 3, 8);
	AddStaticVehicle(522, 3170.3999, -1103.2889, 150.598, 270.0, 3, 6);
	AddStaticVehicle(522, 3170.29, -1104.9189, 150.598, 270.0, 1, 3);
	AddStaticVehicle(522, 3170.1589, -1106.561, 150.598, 270.0, 3, 8);
	AddStaticVehicle(471, 3206.9609, -1107.7919, 23.163, 264.0, 0, 1);
	AddStaticVehicle(557, 3385.3652, -870.8339, 24.1, 209.9981, -1, -1);
	AddStaticVehicle(568, 3366.3671, -882.5996, 23.5629, 209.9981, 3, 1);
	AddStaticVehicle(487, 3273.5253, -1188.7792, 27.033, 339.9938, 0, 44);
	AddStaticVehicle(522, 3347.634, -913.9, 23.2479, 210.0, 3, 6);
	AddStaticVehicle(522, 3348.9755, -913.1074, 23.2479, 209.9981, 8, 3);
	AddStaticVehicle(522, 3350.3955, -912.3271, 23.2479, 209.9981, 0, 7);
	AddStaticVehicle(522, 3355.028, -903.5549, 23.243, 209.9981, 4, 0);
	AddStaticVehicle(522, 3178.833, -1106.805, 150.598, 0.0, 3, 7);
	AddStaticVehicle(522, 3180.3779, -1106.9589, 150.598, 0.0, 4, 7);
	AddStaticVehicle(522, 3181.8959, -1092.239, 150.598, 180.0, 3, 8);
	AddStaticVehicle(522, 3180.4729, -1092.1619, 150.598, 180.0, 4, 7);
	AddStaticVehicle(522, 3178.9541, -1091.993, 150.598, 180.0, 3, 0);
	AddStaticVehicle(424, 3400.944, -900.228, 23.4349, 150.0, 0, 3);
	AddStaticVehicle(522, 3351.7099, -911.5219, 23.243, 209.9981, 215, 142);
	AddStaticVehicle(411, 3375.676, -876.692, 23.3869, 209.9981, 34, 52);

	AddStaticVehicle(560, 167.2319, 356.6638, 2.6453, 239.621, 0, 0);
	AddStaticVehicle(562, 136.6052, 368.0536, 2.6453, 60.0793, 0, 0);
	AddStaticVehicle(402, 130.3554, 358.1557, 2.6453, 59.1393, 0, 0);
	AddStaticVehicle(522, 123.9401, 348.1812, 2.6453, 58.5126, 0, 0);
	AddStaticVehicle(555, 121.2582, 305.6216, 2.6453, 238.3677, 0, 0);
	AddStaticVehicle(409, 119.9475, 291.8001, 3.0782, 239.9343, 0, 0);
	AddStaticVehicle(470, 103.2772, 255.479, 2.6656, 240.2477, 0, 0);
	AddStaticVehicle(560, 68.837, 334.2394, 2.6453, 56.0059, 0, 0);
	AddStaticVehicle(415, 100.9072, 388.7149, 2.6453, 59.4527, 0, 0);
	AddStaticVehicle(409, 117.6022, 409.0428, 2.6453, 327.0185, 0, 0);
	AddStaticVehicle(487, 157.4129, 402.625, 5.6587, 150.1033, 0, 0);

	AddStaticVehicle(411, 1247.3909, -2011.7758, 59.5084, 0.025, 123, 1);
	AddStaticVehicle(429, 1259.918, -2011.0859, 59.103, 359.8364, 13, 13);
	AddStaticVehicle(568, 1253.8867, -2011.8629, 59.4615, 359.7841, 9, 39);

	TunVehs[0] = AddStaticVehicle(558, 1374.5, 2651.3, 10.5, 0.0, 66, 31);
	AddVehicleComponent(TunVehs[0], 1010);
	AddVehicleComponent(TunVehs[0], 1085);
	AddVehicleComponent(TunVehs[0], 1086);
	AddVehicleComponent(TunVehs[0], 1087);
	AddVehicleComponent(TunVehs[0], 1090);
	AddVehicleComponent(TunVehs[0], 1094);
	AddVehicleComponent(TunVehs[0], 1092);
	AddVehicleComponent(TunVehs[0], 1088);
	AddVehicleComponent(TunVehs[0], 1164);
	AddVehicleComponent(TunVehs[0], 1168);
	AddVehicleComponent(TunVehs[0], 1166);
	ChangeVehiclePaintjob(TunVehs[0], 2);

	TunVehs[1] = AddStaticVehicle(559, 1363.6, 2651.2, 10.6, 0.0, 48, 79);
	AddVehicleComponent(TunVehs[1], 1010);
	AddVehicleComponent(TunVehs[1], 1085);
	AddVehicleComponent(TunVehs[1], 1086);
	AddVehicleComponent(TunVehs[1], 1087);
	AddVehicleComponent(TunVehs[1], 1070);
	AddVehicleComponent(TunVehs[1], 1072);
	AddVehicleComponent(TunVehs[1], 1066);
	AddVehicleComponent(TunVehs[1], 1068);
	AddVehicleComponent(TunVehs[1], 1158);
	AddVehicleComponent(TunVehs[1], 1161);
	AddVehicleComponent(TunVehs[1], 1173);
	ChangeVehiclePaintjob(TunVehs[1], 2);

	TunVehs[2] = AddStaticVehicle(560, 1352.5, 2651.2, 10.6, 0.0, 77, 98);
	AddVehicleComponent(TunVehs[2], 1010);
	AddVehicleComponent(TunVehs[2], 1085);
	AddVehicleComponent(TunVehs[2], 1086);
	AddVehicleComponent(TunVehs[2], 1087);
	AddVehicleComponent(TunVehs[2], 1026);
	AddVehicleComponent(TunVehs[2], 1027);
	AddVehicleComponent(TunVehs[2], 1028);
	AddVehicleComponent(TunVehs[2], 1032);
	AddVehicleComponent(TunVehs[2], 1138);
	AddVehicleComponent(TunVehs[2], 1141);
	AddVehicleComponent(TunVehs[2], 1169);
	ChangeVehiclePaintjob(TunVehs[2], 2);

	TunVehs[3] = AddStaticVehicle(562, 1341.4, 2651.1, 10.6, 0.0, 109, 108);
	AddVehicleComponent(TunVehs[3], 1010);
	AddVehicleComponent(TunVehs[3], 1085);
	AddVehicleComponent(TunVehs[3], 1086);
	AddVehicleComponent(TunVehs[3], 1087);
	AddVehicleComponent(TunVehs[3], 1041);
	AddVehicleComponent(TunVehs[3], 1039);
	AddVehicleComponent(TunVehs[3], 1037);
	AddVehicleComponent(TunVehs[3], 1035);
	AddVehicleComponent(TunVehs[3], 1146);
	AddVehicleComponent(TunVehs[3], 1148);
	AddVehicleComponent(TunVehs[3], 1172);
	ChangeVehiclePaintjob(TunVehs[3], 2);

	TunVehs[4] = AddStaticVehicle(565, 1330.2, 2651.2, 10.5, 0.0, 101, 106);
	AddVehicleComponent(TunVehs[4], 1010);
	AddVehicleComponent(TunVehs[4], 1085);
	AddVehicleComponent(TunVehs[4], 1086);
	AddVehicleComponent(TunVehs[4], 1087);
	AddVehicleComponent(TunVehs[4], 1047);
	AddVehicleComponent(TunVehs[4], 1051);
	AddVehicleComponent(TunVehs[4], 1046);
	AddVehicleComponent(TunVehs[4], 1054);
	AddVehicleComponent(TunVehs[4], 1049);
	AddVehicleComponent(TunVehs[4], 1150);
	AddVehicleComponent(TunVehs[4], 1153);
	ChangeVehiclePaintjob(TunVehs[4], 2);

	TunVehs[5] = AddStaticVehicle(587, 1319.1, 2651.3, 10.6, 0.0, 88, 88);
	AddVehicleComponent(TunVehs[5], 1006);
	AddVehicleComponent(TunVehs[5], 1010);
	AddVehicleComponent(TunVehs[5], 1023);
	AddVehicleComponent(TunVehs[5], 1085);
	AddVehicleComponent(TunVehs[5], 1086);
	AddVehicleComponent(TunVehs[5], 1087);

	TunVehs[6] = AddStaticVehicle(602, 1307.9, 2651.1, 10.7, 0.0, 100, 100);
	AddVehicleComponent(TunVehs[6], 1010);
	AddVehicleComponent(TunVehs[6], 1085);
	AddVehicleComponent(TunVehs[6], 1086);
	AddVehicleComponent(TunVehs[6], 1087);

	TunVehs[7] = AddStaticVehicle(603, 1296.8, 2650.8, 10.8, 0.0, 123, 10);
	AddVehicleComponent(TunVehs[7], 1006);
	AddVehicleComponent(TunVehs[7], 1010);
	AddVehicleComponent(TunVehs[7], 1007);
	AddVehicleComponent(TunVehs[7], 1023);
	AddVehicleComponent(TunVehs[7], 1071);
	AddVehicleComponent(TunVehs[7], 1085);
	AddVehicleComponent(TunVehs[7], 1086);
	AddVehicleComponent(TunVehs[7], 1087);
	AddVehicleComponent(TunVehs[7], 1142);
	AddVehicleComponent(TunVehs[7], 1143);

	TunVehs[8] = AddStaticVehicle(496, 1285.7, 2650.9, 10.6, 0.0, 22, 34);
	AddVehicleComponent(TunVehs[8], 1006);
	AddVehicleComponent(TunVehs[8], 1007);
	AddVehicleComponent(TunVehs[8], 1010);
	AddVehicleComponent(TunVehs[8], 1012);
	AddVehicleComponent(TunVehs[8], 1023);
	AddVehicleComponent(TunVehs[8], 1024);
	AddVehicleComponent(TunVehs[8], 1071);
	AddVehicleComponent(TunVehs[8], 1085);
	AddVehicleComponent(TunVehs[8], 1086);
	AddVehicleComponent(TunVehs[8], 1087);
	AddVehicleComponent(TunVehs[8], 1144);
	AddVehicleComponent(TunVehs[8], 1145);

	TunVehs[9] = AddStaticVehicle(535, 1274.9, 2651.3, 10.7, 0.0, 132, 4);
	AddVehicleComponent(TunVehs[9], 1010);
	AddVehicleComponent(TunVehs[9], 1085);
	AddVehicleComponent(TunVehs[9], 1086);
	AddVehicleComponent(TunVehs[9], 1087);
	AddVehicleComponent(TunVehs[9], 1110);
	AddVehicleComponent(TunVehs[9], 1114);
	AddVehicleComponent(TunVehs[9], 1116);
	AddVehicleComponent(TunVehs[9], 1119);
	AddVehicleComponent(TunVehs[9], 1121);
	ChangeVehiclePaintjob(TunVehs[9], 2);

	TunVehs[10] = AddStaticVehicle(495, 1264.9, 2651.4, 11.4, 0.0, 163, 173);
	AddVehicleComponent(TunVehs[10], 1010);
	AddVehicleComponent(TunVehs[10], 1085);
	AddVehicleComponent(TunVehs[10], 1086);
	AddVehicleComponent(TunVehs[10], 1087);

	TunVehs[11] = AddStaticVehicle(424, 1265.0, 2693.8, 10.7, 180.0, 42, 119);
	AddVehicleComponent(TunVehs[11], 1010);
	AddVehicleComponent(TunVehs[11], 1085);
	AddVehicleComponent(TunVehs[11], 1086);
	AddVehicleComponent(TunVehs[11], 1087);

	TunVehs[12] = AddStaticVehicle(434, 1275.0, 2693.9, 11.0, 180.0, 93, 126);
	AddVehicleComponent(TunVehs[12], 1010);
	AddVehicleComponent(TunVehs[12], 1085);
	AddVehicleComponent(TunVehs[12], 1086);
	AddVehicleComponent(TunVehs[12], 1087);

	TunVehs[13] = AddStaticVehicle(494, 1285.8, 2694.0, 10.8, 180.0, 32, 32);
	AddVehicleComponent(TunVehs[13], 1010);
	AddVehicleComponent(TunVehs[13], 1085);
	AddVehicleComponent(TunVehs[13], 1086);
	AddVehicleComponent(TunVehs[13], 1087);

	TunVehs[14] = AddStaticVehicle(502, 1296.8, 2694.0, 10.8, 180.0, 14, 49);
	AddVehicleComponent(TunVehs[14], 1010);
	AddVehicleComponent(TunVehs[14], 1085);
	AddVehicleComponent(TunVehs[14], 1086);
	AddVehicleComponent(TunVehs[14], 1087);

	TunVehs[15] = AddStaticVehicle(503, 1307.9, 2693.9, 10.8, 180.0, 77, 132);
	AddVehicleComponent(TunVehs[15], 1010);
	AddVehicleComponent(TunVehs[15], 1085);
	AddVehicleComponent(TunVehs[15], 1086);
	AddVehicleComponent(TunVehs[15], 1087);

	TunVehs[16] = AddStaticVehicle(568, 1319.1, 2694.5, 10.8, 180.0, 115, 46);
	AddVehicleComponent(TunVehs[16], 1010);
	AddVehicleComponent(TunVehs[16], 1085);
	AddVehicleComponent(TunVehs[16], 1086);
	AddVehicleComponent(TunVehs[16], 1087);

	TunVehs[17] = AddStaticVehicle(402, 1330.2, 2693.9, 10.8, 180.0, 105, 30);
	AddVehicleComponent(TunVehs[17], 1010);
	AddVehicleComponent(TunVehs[17], 1085);
	AddVehicleComponent(TunVehs[17], 1086);
	AddVehicleComponent(TunVehs[17], 1087);

	TunVehs[18] = AddStaticVehicle(411, 1341.3, 2693.9, 10.6, 180.0, 98, 68);
	AddVehicleComponent(TunVehs[18], 1010);
	AddVehicleComponent(TunVehs[18], 1085);
	AddVehicleComponent(TunVehs[18], 1086);
	AddVehicleComponent(TunVehs[18], 1087);

	TunVehs[19] = AddStaticVehicle(415, 1352.5, 2693.8, 10.7, 180.0, 109, 108);
	AddVehicleComponent(TunVehs[19], 1007);
	AddVehicleComponent(TunVehs[19], 1010);
	AddVehicleComponent(TunVehs[19], 1023);
	AddVehicleComponent(TunVehs[19], 1071);
	AddVehicleComponent(TunVehs[19], 1085);
	AddVehicleComponent(TunVehs[19], 1086);
	AddVehicleComponent(TunVehs[19], 1087);

	TunVehs[20] = AddStaticVehicle(451, 1363.7, 2693.8, 10.6, 180.0, 37, 37);
	AddVehicleComponent(TunVehs[20], 1010);
	AddVehicleComponent(TunVehs[20], 1085);
	AddVehicleComponent(TunVehs[20], 1086);
	AddVehicleComponent(TunVehs[20], 1087);

	TunVehs[21] = AddStaticVehicle(541, 1374.7, 2693.9, 10.5, 180.0, 105, 30);
	AddVehicleComponent(TunVehs[21], 1010);
	AddVehicleComponent(TunVehs[21], 1085);
	AddVehicleComponent(TunVehs[21], 1086);
	AddVehicleComponent(TunVehs[21], 1087);

	AddStaticVehicle(538, 1462.0745, 2630.8787, 10.8203, 200.0, -1, -1);
	AddStaticVehicle(538, -1942.795, 168.4164, 27.0006, 200.0, -1, -1);
	AddStaticVehicle(538, 1700.7551, -1953.6531, 14.8756, 200.0, -1, -1);

	AddStaticVehicle(519, 1328.6196, 1612.25, 11.7437, 270.0001, 1, 1);
	AddStaticVehicle(593, 1352.1102, 1779.0, 11.288, 270.0, 2, 1);
	AddStaticVehicle(593, 1352.1116, 1801.5, 11.2863, 269.9999, 36, 8);
	AddStaticVehicle(522, 1676.4335, 1322.1592, 10.332, 87.7189, 7, 79);
	AddStaticVehicle(417, 1286.8724, 1449.625, 10.8722, 270.0, 0, 0);
	AddStaticVehicle(553, 1571.4385, 1487.7513, 12.1685, 311.1577, 71, 87);
	AddStaticVehicle(553, 1597.4109, 1342.6935, 12.1865, 344.8449, 71, 87);
	AddStaticVehicle(487, 1655.0576, 1554.5649, 10.9879, 64.4211, 26, 3);
	AddStaticVehicle(487, 1397.569, 1770.0475, 10.9971, 269.306, 26, 3);
	AddStaticVehicle(487, 1618.4143, 1357.5428, 10.9893, 169.4555, 26, 3);
	AddStaticVehicle(469, 1358.1189, 1253.5436, 10.8285, 358.5788, 1, 3);
	AddStaticVehicle(609, 1341.5886, 1729.4564, 10.8864, 91.6428, 36, 36);
	AddStaticVehicle(519, 1303.7971, 1360.9348, 11.7405, 267.7907, 1, 1);
	AddStaticVehicle(511, 1341.3031, 1682.6432, 12.1967, 268.587, 3, 90);
	AddStaticVehicle(512, 1326.1611, 1420.4333, 11.103, 178.1441, 17, 39);
	AddStaticVehicle(513, 1280.1281, 1411.8032, 11.3653, 223.4432, 48, 18);
	AddStaticVehicle(515, 1573.4801, 1654.4058, 11.8422, 91.4976, 24, 77);
	AddStaticVehicle(435, 1554.5338, 1669.4784, 11.4542, 180.0, 1, 1);
	AddStaticVehicle(435, 1581.9742, 1664.0665, 11.4526, 180.0, 1, 1);
	AddStaticVehicle(404, 1309.7848, 1279.5735, 10.5544, 359.2681, 101, 101);
	AddStaticVehicle(411, 1682.5769, 1316.6561, 10.5474, 358.3994, 123, 1);
	AddStaticVehicle(436, 1663.4026, 1297.1321, 10.5877, 359.4867, 83, 1);
	AddStaticVehicle(439, 1642.0035, 1293.2332, 10.7156, 268.6615, 54, 38);
	AddStaticVehicle(462, 1713.8118, 1319.2559, 10.4165, 268.4222, 2, 1);
	AddStaticVehicle(474, 1695.433, 1306.1843, 10.5853, 179.3891, 110, 1);
	AddStaticVehicle(480, 1682.4532, 1286.9058, 10.5945, 179.204, 6, 6);
	AddStaticVehicle(420, 1723.873, 1501.4979, 10.5187, 167.014, 6, 1);
	AddStaticVehicle(420, 1712.561, 1461.2471, 10.5375, 162.1933, 6, 1);
	AddStaticVehicle(420, 1707.1067, 1437.8787, 10.4501, 182.4505, 6, 1);
	AddStaticVehicle(438, 1717.6479, 1479.1417, 10.744, 163.7234, 6, 76);
	AddStaticVehicle(438, 1707.2537, 1415.725, 10.564, 189.8016, 6, 76);
	AddStaticVehicle(437, 1719.1062, 1381.2042, 10.6256, 197.7497, 123, 20);
	AddStaticVehicle(485, 1537.6528, 1211.1794, 10.4701, 0.8908, 1, 79);
	AddStaticVehicle(592, 1340.5055, 1495.6396, 12.0169, 270.777, 1, 1);
	AddStaticVehicle(485, 1353.343, 1642.0271, 10.4825, 175.0001, 1, 76);
	AddStaticVehicle(422, 1325.3158, 1278.719, 10.8037, 180.6936, 101, 25);
	AddStaticVehicle(505, 1282.6981, 1304.3754, 10.9647, 82.884, 76, 102);
	AddStaticVehicle(407, 1282.0891, 1477.3781, 11.0577, 244.1416, 3, 1);
	AddStaticVehicle(407, 1312.9038, 1580.9365, 11.0562, 272.9746, 3, 1);

	AddStaticVehicle(485, -1644.8495, -593.8191, 13.8045, 244.2475, 1, 74);
	AddStaticVehicle(485, -1433.6989, -639.9345, 13.8059, 351.8341, 1, 74);
	AddStaticVehicle(485, -1354.3955, -426.7434, 13.8022, 293.6214, 1, 74);
	AddStaticVehicle(485, -1284.1956, 60.9789, 13.8074, 96.5168, 1, 74);
	AddStaticVehicle(485, -1556.3772, -156.9351, 13.8067, 135.6197, 1, 74);
	AddStaticVehicle(583, -1467.6941, -68.7159, 13.689, 135.972, 1, 1);
	AddStaticVehicle(583, -1438.1007, -178.1787, 13.6843, 333.7912, 1, 1);
	AddStaticVehicle(583, -1396.8986, -226.8979, 13.689, 329.7987, 1, 1);
	AddStaticVehicle(583, -1634.3322, -377.9814, 13.689, 335.1347, 1, 1);
	AddStaticVehicle(583, -1299.0438, -286.9009, 13.6891, 341.6255, 1, 1);
	AddStaticVehicle(525, -1354.0233, -375.1031, 14.0255, 263.605, 18, 20);
	AddStaticVehicle(513, -1285.7555, 24.0493, 14.6993, 121.848, 21, 36);
	AddStaticVehicle(513, -1260.604, 7.5347, 14.707, 118.6241, 21, 36);
	AddStaticVehicle(476, -1367.2609, -485.4558, 14.8787, 209.5813, 7, 6);
	AddStaticVehicle(476, -1440.4191, -526.5578, 14.8939, 207.2082, 1, 6);
	AddStaticVehicle(519, -1371.1775, -232.3967, 15.0767, 315.623, 1, 1);
	AddStaticVehicle(519, -1341.1079, -254.3787, 15.0773, 321.6316, 1, 1);
	AddStaticVehicle(420, -1472.3452, -272.3332, 13.7749, 78.9964, 6, 1);
	AddStaticVehicle(420, -1459.8147, -275.601, 13.8146, 65.6229, 6, 1);
	AddStaticVehicle(420, -1439.7112, -284.8562, 13.8131, 58.6121, 6, 1);
	AddStaticVehicle(420, -1421.4268, -298.8921, 13.7817, 46.1681, 6, 1);
	AddStaticVehicle(519, -1331.5316, -618.3227, 15.0629, 325.7105, 1, 1);
	AddStaticVehicle(593, -1384.5905, -625.2684, 14.6115, 321.7572, 58, 8);
	AddStaticVehicle(511, -1449.8151, -617.1895, 15.5199, 329.7999, 12, 60);
	AddStaticVehicle(593, -1325.9851, -276.617, 14.6107, 296.5465, 60, 1);
	AddStaticVehicle(563, -1598.6353, -615.8722, 14.8537, 276.2098, 1, 6);
	AddStaticVehicle(476, -1426.4314, -518.3584, 14.8958, 180.574, 119, 117);
	AddStaticVehicle(513, -1281.6588, -627.3807, 14.6996, 356.907, 21, 36);
	AddStaticVehicle(519, -1299.0974, -353.5505, 15.0716, 278.4124, 1, 1);
	AddStaticVehicle(487, -1182.6599, 22.4607, 14.3251, 45.0604, 29, 42);
	AddStaticVehicle(417, -1222.6132, -11.15, 14.2353, 42.9828, 0, 0);
	AddStaticVehicle(544, -1258.5739, 68.2615, 14.3863, 43.9776, 3, 1);
	AddStaticVehicle(544, -1262.4766, 64.5995, 14.3817, 43.9013, 3, 1);

	AddStaticVehicle(596, 1554.5928, -1615.0944, 13.1075, 143.0, 0, 1);
	AddStaticVehicle(596, 1560.2781, -1614.7255, 13.1065, 143.0, 0, 1);
	AddStaticVehicle(596, 1565.3577, -1615.1208, 13.1006, 143.0, 0, 1);
	AddStaticVehicle(596, 1570.399, -1615.1421, 13.1035, 143.0, 0, 1);
	AddStaticVehicle(596, 1575.5455, -1615.0767, 13.1051, 143.0, 0, 1);
	AddStaticVehicle(427, 1600.4679, -1607.5685, 13.6005, 88.3196, 0, 1);
	AddStaticVehicle(427, 1599.9907, -1613.6184, 13.5959, 89.1377, 0, 1);
	AddStaticVehicle(427, 1600.0579, -1619.9817, 13.5981, 89.713, 0, 1);
	AddStaticVehicle(427, 1599.8956, -1626.2255, 13.5964, 89.2148, 0, 1);
	AddStaticVehicle(596, 1602.4196, -1683.8865, 5.6119, 269.8652, 0, 1);
	AddStaticVehicle(596, 1591.4985, -1711.0421, 5.6128, 0.0437, 0, 1);
	AddStaticVehicle(596, 1602.2015, -1687.9944, 5.6107, 89.8454, 0, 1);
	AddStaticVehicle(596, 1602.0392, -1692.0045, 5.611, 89.1947, 0, 1);
	AddStaticVehicle(596, 1595.4047, -1711.5936, 5.6116, 180.3378, 0, 1);
	AddStaticVehicle(523, 1582.1798, -1667.0845, 5.465, 240.5349, 0, 0);
	AddStaticVehicle(523, 1582.3419, -1669.2539, 5.465, 239.3729, 0, 0);
	AddStaticVehicle(523, 1582.1704, -1671.2072, 5.4657, 237.9856, 0, 0);
	AddStaticVehicle(523, 1582.1514, -1673.463, 5.4652, 238.0086, 0, 0);
	AddStaticVehicle(574, 1526.7522, -1655.7896, 5.6158, 270.8942, 26, 26);
	AddStaticVehicle(574, 1526.7056, -1652.4664, 5.6158, 270.6263, 26, 26);
	AddStaticVehicle(574, 1526.5553, -1642.8456, 5.6158, 180.3993, 26, 26);
	AddStaticVehicle(574, 1530.7841, -1642.8046, 5.6158, 179.2186, 26, 26);

	AddStaticVehicle(519, 1806.1066, -2406.8108, 14.4731, 220.1901, 1, 1);
	AddStaticVehicle(519, 1851.0873, -2397.0818, 14.4738, 221.0776, 1, 1);
	AddStaticVehicle(519, 1881.2903, -2364.6726, 14.476, 231.6925, 1, 1);
	AddStaticVehicle(593, 1990.494, -2400.47, 14.0069, 126.8314, 58, 8);
	AddStaticVehicle(593, 1991.9357, -2377.5691, 14.0096, 111.9823, 19, 33);
	AddStaticVehicle(593, 1994.2283, -2329.9182, 14.0074, 123.692, 68, 8);
	AddStaticVehicle(593, 1993.0359, -2307.1487, 14.0073, 121.4826, 2, 1);
	AddStaticVehicle(485, 2005.4028, -2340.4004, 13.2026, 353.8798, 1, 74);
	AddStaticVehicle(485, 1944.1885, -2234.3225, 13.2017, 358.4947, 1, 75);
	AddStaticVehicle(485, 1893.2838, -2320.5076, 13.207, 285.2385, 1, 76);
	AddStaticVehicle(485, 1882.2479, -2390.3965, 13.2133, 266.7464, 1, 77);
	AddStaticVehicle(485, 1915.2466, -2643.3474, 13.205, 2.2446, 1, 78);
	AddStaticVehicle(553, 1944.5242, -2639.1465, 14.8823, 28.0299, 55, 23);
	AddStaticVehicle(553, 1984.2778, -2637.7561, 14.8831, 9.0602, 94, 116);
	AddStaticVehicle(553, 2019.7615, -2642.5803, 14.8759, 318.3256, 128, 7);
	AddStaticVehicle(476, 2124.738, -2418.2964, 14.2641, 205.4615, 7, 6);
	AddStaticVehicle(476, 2142.8672, -2434.3076, 14.2587, 144.2144, 1, 6);
	AddStaticVehicle(476, 2107.1399, -2417.1648, 14.2647, 150.9743, 135, 14);
	AddStaticVehicle(476, 2083.0217, -2429.4854, 14.2543, 182.9969, 119, 117);
	AddStaticVehicle(510, 2081.9866, -2359.7229, 13.1551, 64.1485, 39, 39);
	AddStaticVehicle(510, 1866.6115, -2660.4602, 13.1552, 18.6151, 6, 6);
	AddStaticVehicle(513, 1881.0273, -2632.3281, 14.0996, 40.9586, 21, 36);
	AddStaticVehicle(513, 1891.9824, -2632.7056, 14.1085, 332.5663, 138, 122);
	AddStaticVehicle(593, 1840.4315, -2631.8525, 14.008, 319.2033, 22, 1);
	AddStaticVehicle(593, 1822.1689, -2629.8713, 14.0076, 35.6965, 36, 8);
	AddStaticVehicle(476, 1752.8643, -2632.2061, 14.2631, 1.4834, 103, 102);
	AddStaticVehicle(481, 1698.6532, -2692.0225, 13.0592, 256.1956, 26, 1);
	AddStaticVehicle(485, 1707.5415, -2646.3325, 13.2052, 359.6846, 1, 73);
	AddStaticVehicle(487, 1716.0422, -2437.5767, 13.7316, 148.7897, 18, 108);
	AddStaticVehicle(487, 1737.4827, -2432.7019, 13.734, 192.0326, 24, 78);
	AddStaticVehicle(487, 1752.5586, -2452.2275, 13.7322, 147.2027, 54, 29);
	AddStaticVehicle(417, 1636.0142, -2409.7209, 13.6266, 193.2301, 0, 0);
	AddStaticVehicle(417, 1655.8718, -2410.4551, 13.635, 156.9428, 0, 0);
	AddStaticVehicle(510, 1600.9696, -2395.0103, 13.2262, 298.2056, 28, 28);
	AddStaticVehicle(497, 1575.9307, -2408.7253, 13.7347, 153.2041, 0, 1);
	AddStaticVehicle(497, 1554.8207, -2406.4417, 13.7308, 190.6669, 0, 1);

	AddStaticVehicle(589, 1251.2297, -2042.1305, 59.4474, 180.0659, 40, 1);
	AddStaticVehicle(521, 1244.8016, -2023.3499, 59.433, 292.8341, 92, 3);
	AddStaticVehicle(506, 1263.7994, -2011.0569, 59.016, 0.0, 7, 7);
	AddStaticVehicle(522, 1266.506, -2010.327, 58.8043, 0.0, 7, 79);
	AddStaticVehicle(475, 892.6356, -1668.8604, 13.3544, 179.2466, 37, 0);
	AddStaticVehicle(506, 874.8234, -1658.4843, 13.2514, 181.7123, 1, 15);
	AddStaticVehicle(521, 870.1176, -1676.6573, 13.1183, 186.2732, 115, 118);
	AddStaticVehicle(496, 888.5651, -1679.1317, 13.2628, 357.5185, 102, 135);

	AddStaticVehicle(513, 291.1346, 2535.585, 17.3778, 180.2974, 21, 36);
	AddStaticVehicle(512, 324.4324, 2535.6506, 17.5121, 181.8785, 89, 91);
	AddStaticVehicle(476, 403.6754, 2456.9727, 16.7825, 357.7751, 15, 123);
	AddStaticVehicle(417, 364.4265, 2535.2258, 16.7616, 143.5451, 0, 0);
	AddStaticVehicle(586, 423.4558, 2541.1025, 15.9887, 339.6539, 10, 1);
	AddStaticVehicle(543, 385.2093, 2603.5049, 16.308, 192.7106, 67, 8);
	AddStaticVehicle(468, 383.9264, 2590.5933, 16.1533, 275.5223, 46, 46);

	AddStaticVehicle(556, -2345.126, -1605.334, 484.0368, 260.9758, 216, 198);
	AddStaticVehicle(482, 2473.6335, -1688.4501, 13.6213, 1.3507, 34, 34);
	AddStaticVehicle(600, 2501.3005, -1685.7114, 13.2052, 54.223, 43, 8);
	AddStaticVehicle(404, 2516.5413, -1672.2059, 13.6568, 247.427, 123, 92);
	AddStaticVehicle(589, 2814.8518, -1186.5088, 24.974, 125.2599, 43, 1);
	AddStaticVehicle(496, 2827.8259, -1165.8298, 24.8425, 74.4954, 41, 29);
	AddStaticVehicle(419, 2828.4297, -1193.2813, 24.7035, 319.2678, 47, 76);
	AddStaticVehicle(403, 2201.249, -2241.3311, 14.1532, 135.1536, 30, 1);
	AddStaticVehicle(403, 2196.7461, -2236.3652, 14.1486, 134.2909, 28, 1);
	AddStaticVehicle(403, 2208.1824, -2296.9404, 15.3708, 136.0373, 25, 1);
	AddStaticVehicle(400, 2744.2754, -2447.5588, 13.7433, 179.2557, 40, 84);
	AddStaticVehicle(400, 2765.2122, -2531.8735, 13.7407, 359.5258, 40, 84);
	AddStaticVehicle(400, 2753.1467, -2387.5439, 13.7358, 1.3794, 40, 84);
	AddStaticVehicle(400, 2443.6687, -1637.1934, 13.3619, 180.6244, 10, 10);

	new tmpveh;
	tmpveh = AddStaticVehicle(504, -1517.9827, 994.6107, 1037.4454, 269.9938, 198, 157);
	LinkVehicleToInterior(tmpveh, 15);

	tmpveh = AddStaticVehicle(504, -1398.8826, 1058.7346, 1038.3002, 179.4297, 186, 25);
	LinkVehicleToInterior(tmpveh, 15);

	tmpveh = AddStaticVehicle(504, -1279.2094, 991.5643, 1036.9727, 87.4943, 250, 20);
	LinkVehicleToInterior(tmpveh, 15);

	AddStaticVehicle(522, -1720.6, -240.2, 13.9, 268.0, 76, 117);
	AddStaticVehicle(522, -1720.7, -243.4, 13.9, 268.0, 76, 117);
	AddStaticVehicle(522, -1720.8, -246.6, 13.9, 268.0, 37, 37);
	AddStaticVehicle(603, -1710.1, -253.4, 14.2, 88.0, 109, 24);
	AddStaticVehicle(559, -1721.1, -256.2, 14.0, 268.0, 105, 30);
	AddStaticVehicle(603, -1710.2, -256.6, 14.2, 87.995, 109, 24);
	AddStaticVehicle(559, -1721.0, -253.0, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1721.2, -259.4, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1721.4, -262.6, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1721.5, -265.7, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1721.6, -269.0, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1721.7, -272.2, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1721.8, -275.3, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1721.9, -278.6, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1722.0, -281.8, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1722.1, -285.0, 14.0, 267.995, 105, 30);
	AddStaticVehicle(559, -1722.2, -288.1, 14.0, 267.995, 105, 30);
	AddStaticVehicle(603, -1710.3, -259.8, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1710.5, -263.0, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1710.7, -266.2, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1710.8, -269.4, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1710.9, -272.6, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1711.0, -275.8, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1711.1, -279.0, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1711.2, -282.2, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1711.3, -285.4, 14.2, 87.995, 109, 24);
	AddStaticVehicle(603, -1711.4, -288.6, 14.2, 87.995, 109, 24);
	AddStaticVehicle(562, -1701.8, -253.7, 14.0, 268.0, 109, 108);
	AddStaticVehicle(562, -1701.9, -256.9, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.0, -260.1, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.1, -263.3, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.2, -266.5, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.3, -269.6, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.4, -272.9, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.5, -276.1, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.6, -279.3, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.7, -282.5, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1702.9, -285.7, 14.0, 267.995, 109, 108);
	AddStaticVehicle(562, -1703.0, -288.9, 14.0, 267.995, 109, 108);
	AddStaticVehicle(560, -1690.9, -254.1, 14.0, 88.0, 45, 58);
	AddStaticVehicle(560, -1691.0, -257.3, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.1, -260.5, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.2, -263.7, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.3, -266.9, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.4, -270.1, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.5, -273.3, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.6, -276.5, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.7, -279.7, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1691.9, -282.9, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1692.0, -286.1, 14.0, 87.995, 45, 58);
	AddStaticVehicle(560, -1692.1, -289.3, 14.0, 87.995, 45, 58);
	AddStaticVehicle(522, -1690.2, -241.2, 13.9, 88.0, 215, 142);
	AddStaticVehicle(522, -1690.3, -244.4, 13.9, 87.995, 215, 142);
	AddStaticVehicle(522, -1690.4, -247.6, 13.9, 87.995, 215, 142);
	AddStaticVehicle(411, -1699.3, -308.0, 14.0, 358.0, 34, 52);
	AddStaticVehicle(411, -1705.3, -307.8, 14.0, 357.995, 34, 52);
	AddStaticVehicle(411, -1711.2, -307.6, 14.0, 357.995, 34, 52);
	AddStaticVehicle(411, -1717.2, -307.4, 14.0, 357.995, 34, 52);

	FerrisWheelObj[10] = CreateObject(18877, 389.7734, -2028.4688, 22.0, 0.0, 0.0, 90.0, 300.0);
	FerrisWheelObj[11] = CreateObject(18878, 389.7734, -2028.4688, 22.0, 0.0, 0.0, 90.0, 300.0);

	for(i = sizeof(FerrisWheelObj) - 3; i >= 0; --i)
	{
		FerrisWheelObj[i] = CreateObject(18879, 389.7734, -2028.4688, 22.0, 0.0, 0.0, 90.0, 300.0);
		AttachObjectToObject(FerrisWheelObj[i], FerrisWheelObj[10], gFerrisCageOffsets[i][0], gFerrisCageOffsets[i][1], gFerrisCageOffsets[i][2], 0.0, 0.0, 90, 0);
	}

	iGateObj = CreateObject(980, 2233.8757, -2214.9118, 13.5468, 0.0, 0.0, 315.4335);
	iGate4Obj = CreateObject(980, 2236.8757, -2217.9118, 13.5468, 0.0, 0.0, 315.4335);
	iGate2Obj = CreateObject(980, 2720.827, -2405.449, 13.4609, 0.0, 0.0, 90.0);
	iGate3Obj = CreateObject(980, 2720.827, -2504.226, 13.4609, 0.0, 0.0, 90.0);

	BalloonObj = CreateObject(19335, 836.08, -2000.51, 13.6, 0.0, 0.0, 0.0);
	FireObj = CreateObject(18692, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	Fire1Obj = CreateObject(18692, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	CreateObject(19087, 834.98, -1999.36, 13.88, 27.0, 31.0, 5.0);
	CreateObject(19087, 837.26, -1999.36, 13.88, 27.0, -31.0, 5.0);
	CreateObject(19087, 837.28, -2001.7, 13.88, -27.0, -31.0, 5.0);
	CreateObject(19087, 834.9, -2001.7, 13.88, -27.0, 31.0, 5.0);
	CreateObject(1448, 833.81, -1998.54, 12.0, 0.0, 0.0, 0.0);
	CreateObject(1448, 838.36, -1998.36, 12.0, 0.0, 0.0, 0.0);
	CreateObject(1448, 838.34, -2002.53, 12.0, 0.0, 0.0, 0.0);
	CreateObject(1448, 833.84, -2002.77, 12.0, 0.0, 0.0, 0.0);
	CreateObject(1468, 836.25, -2003.4, 13.2, 0.0, 0.0, 0.0);
	CreateObject(1468, 839.03, -2000.36, 13.2, 0.0, 0.0, 90.0);
	CreateObject(1468, 833.14, -2000.68, 13.2, 0.0, 0.0, -90.0);
	CreateObject(3361, 836.17, -1994.27, 12.4, 0.0, 0.0, 90.0);
	AttachObjectToObject(FireObj, BalloonObj, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 1);
	AttachObjectToObject(Fire1Obj, BalloonObj, 0.0, 0.0, 4.0, 0.0, 0.0, 0.0, 1);

	VipGatesObj = CreateObject(980, 77.9044, 266.1524, 4.4453, 0.0, 0.0, 150.0);

	CreateObject(16037, 47.2306, 212.921, 5.3296, 0.0, 0.0, 60.0);
	CreateObject(8071, 111.6527, 347.4217, 2.7624, 0.0, 0.0, 61.0);
	CreateObject(8251, 35.1552, 304.85, 5.4624, 0.0, 0.0, -30.0);
	CreateObject(3749, 77.9568, 266.3564, 7.4624, 0.0, 0.0, -30.0);
	CreateObject(8148, 159.9932, 311.4827, 4.6453, 0.0, 0.0, -29.0);
	CreateObject(8148, 63.5385, 383.4356, 4.216, 0.0, 0.0, 10951.0);
	CreateObject(8150, 156.1965, 425.0386, 4.4099, 0.0, 0.0, -28.9999);
	CreateObject(9518, 53.5846, 333.1513, 5.4453, 0.0, 0.0, 240.4);
	CreateObject(9341, 68.9345, 365.3005, 4.6453, 0.0, 0.0, 420.0);
	CreateObject(9324, 87.0662, 386.4773, 7.0153, 0.0, 0.0, 60.0);
	CreateObject(9220, 110.6128, 257.1475, 4.2453, 0.0, 0.0, 60.0);
	CreateObject(9098, 125.3234, 279.5288, 4.6453, 0.0, 0.0, 330.0);
	CreateObject(7940, 138.3218, 305.625, 4.6453, 0.0, 0.0, 240.0);
	CreateObject(7929, 149.109, 328.4827, 8.3453, 0.0, 0.0, 240.0);
	CreateObject(7929, 159.4013, 346.316, 8.3453, 0.0, 0.0, 240.0);
	CreateObject(3619, 182.4606, 363.132, 5.2453, 0.0, 0.0, 60.0);
	CreateObject(987, 199.5961, 382.0538, 1.6453, 0.0, 0.0, 60.8999);
	CreateObject(987, 202.4613, 387.5199, 1.6453, 0.0, 0.0, 60.0);
	CreateObject(987, 110.5965, 245.492, 1.7175, 0.0, 0.0, -30.0);
	CreateObject(987, 100.3136, 251.2792, 1.7169, 0.0, 0.0, -29.0);
	CreateObject(987, 89.8443, 257.4555, 1.6928, 0.0, 0.0, -30.0);
	CreateObject(987, 84.6739, 260.5218, 1.6528, 0.0, 0.0, -30.0);
	CreateObject(987, 58.4741, 275.2959, 1.6453, 0.0, 0.0, -30.0);
	CreateObject(987, 48.1011, 281.3292, 1.6453, 0.0, 0.0, -30.0);
	CreateObject(987, 40.8069, 287.6954, 1.6453, 0.0, 0.0, -38.0999);
	CreateObject(3607, 102.0672, 419.5662, 7.6453, 0.0, 0.0, 60.0);
	CreateObject(9241, 157.469, 402.9028, 3.6453, 0.0, 0.0, 61.0);
	CreateObject(12853, 186.9924, 397.8743, 3.6453, 0.0, 0.0, 60.0);
	CreateObject(1676, 176.354, 391.2341, 3.3453, 0.0, 0.0, -30.0);
	CreateObject(1676, 186.3853, 385.2297, 3.3453, 0.0, 0.0, -30.0);
	CreateObject(8650, 126.0302, 360.4007, 1.6453, 0.0, 0.0, -30.0);
	CreateObject(7940, 103.1799, 337.2624, 4.6453, 0.0, 0.0, 60.0);
	CreateObject(7929, 92.2069, 315.4591, 8.3453, 0.0, 0.0, 60.0);
	CreateObject(3619, 120.0891, 363.2308, 5.3453, 0.0, 0.0, 240.0);

	CreateObject(14639, 1026.2194, -1287.8746, -20.7222, 0.0, 0.0, 0.0);
	CreateObject(14643, 1026.1715, -1287.8306, -20.726, 0.0, 0.0, 0.0);
	CreateObject(14570, 1041.9877, -1307.2463, -21.1899, 0.0, 0.0, 359.9998);
	CreateObject(14569, 1031.2277, -1298.9907, -19.7977, 0.0, 0.0, 0.0);
	CreateObject(3534, 1020.3695, -1298.8355, -17.3862, 0.0, 0.0, 0.0);
	CreateObject(3534, 1030.1901, -1298.8869, -17.3848, 0.0, 0.0, 0.0);
	CreateObject(3531, 1038.1347, -1291.3593, -20.7917, 0.0, 0.0, 44.8521);
	CreateObject(3531, 1029.3867, -1304.6762, -20.7917, 0.0, 0.0, 0.0806);
	CreateObject(3471, 1024.3338, -1310.0854, -20.8353, 0.0, 0.0, 91.1412);
	CreateObject(3471, 1028.7441, -1310.0263, -20.8353, 0.0, 0.0, 92.736);
	CreateObject(953, 1020.3029, -1296.7664, -20.5224, 0.0, 0.0, 92.7402);
	CreateObject(2782, 1024.6396, -1287.8236, -20.5894, 0.0, 0.0, 0.0);
	CreateObject(1599, 1020.2661, -1295.5797, -20.2019, 0.0, 0.0, 0.0);
	CreateObject(1601, 1020.1605, -1293.2117, -20.0471, 0.0, 0.0, 0.0);
	CreateObject(1601, 1026.6633, -1287.8339, -20.0471, 0.0, 0.0, 277.7952);
	CreateObject(1610, 1020.2139, -1294.757, -20.7323, 0.0, 0.0, 0.0);
	CreateObject(14835, 1011.3463, -1290.633, -21.8824, 0.0, 0.0, 3.302);
	CreateObject(3038, 1025.8574, -1288.6898, -16.8735, 0.0, 0.0, 70.3547);
	CreateObject(3038, 1020.1539, -1294.4848, -16.8735, 0.0, 0.0, 188.6756);
	CreateObject(3038, 1020.2936, -1290.3652, -16.8735, 0.0, 0.0, 140.7037);
	CreateObject(2802, 1022.8727, -1295.4769, -21.5259, 0.0, 0.0, 0.0);
	CreateObject(1568, 1022.5761, -1288.3291, -23.311, 0.0, 0.0, 0.0);
	CreateObject(1568, 1020.6669, -1290.6875, -23.311, 0.0, 0.0, 0.0);
	CreateObject(2802, 1022.3729, -1290.9367, -21.6333, 0.0, 0.0, 340.8124);
	CreateObject(2802, 1027.5722, -1290.7449, -21.6606, 0.0, 0.0, 0.0);
	CreateObject(2802, 1025.5444, -1295.0021, -21.6678, 0.0, 0.0, 41.5731);
	CreateObject(2802, 1032.3466, -1291.4403, -21.6606, 0.0, 0.0, 41.5722);
	CreateObject(2802, 1038.7762, -1294.8276, -21.6606, 0.0, 0.0, 348.8061);
	CreateObject(2802, 1034.7952, -1290.4791, -21.6606, 0.0, 0.0, 249.668);
	CreateObject(2802, 1028.3164, -1295.821, -21.6606, 0.0, 0.0, 20.7741);
	CreateObject(2802, 1033.4206, -1293.7514, -21.6606, 0.0, 0.0, 289.6441);
	CreateObject(1670, 1032.2947, -1291.3471, -21.3069, 0.0, 0.0, 0.0);
	CreateObject(1670, 1022.8767, -1295.4876, -21.19, 0.0, 0.0, 0.0);
	CreateObject(1670, 1025.4871, -1294.9394, -21.3396, 0.0, 0.0, 0.0);
	CreateObject(1670, 1028.2352, -1295.758, -21.3045, 0.0, 0.0, 0.0);
	CreateObject(2839, 1025.6672, -1294.8122, -21.3396, 0.0, 0.0, 0.0);
	CreateObject(2839, 1033.5567, -1293.8638, -21.3324, 0.0, 0.0, 0.0);
	CreateObject(2839, 1038.8629, -1294.8785, -21.3246, 0.0, 0.0, 0.0);
	CreateObject(2839, 1034.7569, -1290.6066, -21.3246, 0.0, 0.0, 0.0);
	CreateObject(2839, 1022.4582, -1291.0344, -21.2974, 0.0, 0.0, 0.0);
	CreateObject(2839, 1027.5562, -1290.8835, -21.3246, 0.0, 0.0, 0.0);
	CreateObject(2839, 1022.861, -1295.901, -21.19, 0.0, 0.0, 0.0);
	CreateObject(2839, 1032.4172, -1291.8947, -21.2342, 0.0, 0.0, 0.0);
	CreateObject(3534, 1021.5507, -1288.581, -17.3867, 0.0, 0.0, 0.0);
	CreateObject(3534, 1030.2021, -1289.2744, -17.3867, 0.0, 0.0, 0.0);
	CreateObject(3534, 1040.2877, -1299.4897, -17.3856, 0.0, 0.0, 0.0);
	CreateObject(2885, 1030.3438, -1305.8864, -16.0, 0.0, 0.0, 89.5418);
	CreateObject(2885, 1030.3916, -1305.7236, -16.0, 0.0, 0.0, 268.8519);
	CreateObject(3525, 1029.6416, -1301.8115, -19.8449, 0.0, 0.0, 275.4735);
	CreateObject(3525, 1029.5927, -1307.9345, -20.027, 0.0, 0.0, 262.4696);
	CreateObject(2885, 1036.1601, -1310.5312, -16.0, 0.0, 0.0, 359.9938);
	CreateObject(2885, 1042.8007, -1305.1953, -16.0, 0.0, 0.0, 91.126);
	CreateObject(902, 1030.2143, -1304.3729, -17.5964, 0.0, 273.6551, 0.0);
	CreateObject(2589, 1040.5812, -1308.2457, -16.0519, 0.0, 0.0, 0.0);
	CreateObject(2457, 1041.0673, -1300.3726, -21.9296, 0.0, 0.0, 180.9135);
	CreateObject(2457, 1039.1384, -1300.3898, -21.9296, 0.0, 0.0, 180.9118);
	CreateObject(2455, 1037.2667, -1300.4107, -21.9296, 0.0, 0.0, 180.9118);
	CreateObject(2455, 1036.3399, -1300.4107, -21.9296, 0.0, 0.0, 180.9118);
	CreateObject(2455, 1035.4091, -1300.4101, -21.9296, 0.0, 0.0, 180.9063);
	CreateObject(2455, 1031.0999, -1300.4107, -21.9296, 0.0, 0.0, 180.9118);
	CreateObject(2455, 1032.03, -1300.4107, -21.9296, 0.0, 0.0, 180.9118);
	CreateObject(2455, 1034.4799, -1300.4107, -21.9296, 0.0, 0.0, 180.9063);
	CreateObject(1523, 1032.4881, -1300.2921, -23.3999, 0.0, 0.0, 0.0);
	CreateObject(2415, 1036.624, -1309.6038, -22.072, 0.0, 0.0, 180.0);
	CreateObject(2452, 1031.1928, -1306.9406, -22.1077, 0.0, 0.0, 87.7752);
	CreateObject(2596, 1030.9871, -1288.6813, -17.9405, 15.0, 0.0, 11.3786);
	CreateObject(2130, 1035.8436, -1309.7965, -22.084, 0.0, 0.0, 180.0);
	CreateObject(2144, 1033.8004, -1309.9967, -21.9995, 0.0, 0.0, 180.0);
	CreateObject(2415, 1037.4, -1309.6038, -22.072, 0.0, 0.0, 179.9945);
	CreateObject(2361, 1042.1121, -1307.5187, -21.982, 0.0, 0.0, 270.597);
	CreateObject(2417, 1038.4, -1309.7968, -22.0935, 0.0, 0.0, 180.0);
	CreateObject(2417, 1039.3496, -1309.7968, -22.0993, 0.0, 0.0, 179.9945);
	CreateObject(2426, 1033.2117, -1309.5876, -21.0502, 0.0, 0.0, 180.0);
	CreateObject(2803, 1042.083, -1306.0407, -21.5689, 0.0, 0.0, 0.0);
	CreateObject(2806, 1038.5808, -1309.7968, -21.0, 0.0, 0.0, 0.0);
	CreateObject(2147, 1041.6091, -1303.8532, -21.8478, 0.0, 0.0, 268.9672);
	CreateObject(2147, 1042.017, -1303.9013, -21.8478, 0.0, 0.0, 268.9715);
	CreateObject(2455, 1033.2103, -1309.796, -22.0792, 0.0, 0.0, 180.9063);
	CreateObject(14565, 1039.3123, -1311.1823, -17.7511, 0.0, 0.0, 90.422);
	CreateObject(2885, 1047.0566, -1310.5312, -16.0, 0.0, 0.0, 359.9835);
	CreateObject(1481, 1041.0882, -1301.5686, -20.8698, 0.0, 0.0, 268.9672);
	CreateObject(2775, 1036.1035, -1299.246, -17.8717, 0.0, 0.0, 183.6804);
	CreateObject(2839, 1037.0321, -1300.59, -20.9006, 0.0, 0.0, 0.0);
	CreateObject(2839, 1036.25, -1300.4531, -20.9006, 0.0, 0.0, 66.643);
	CreateObject(2190, 1034.8377, -1300.1215, -20.9006, 0.0, 0.0, 0.0);
	CreateObject(2147, 1041.6748, -1302.9128, -21.8478, 0.0, 0.0, 270.5927);
	CreateObject(1533, 1026.6999, -1311.0, -22.0254, 0.0, 0.0, 180.0);
	CreateObject(1533, 1028.1999, -1311.0, -22.0254, 0.0, 0.0, 179.9945);
	CreateObject(1536, 1018.6502, -1306.3399, -22.0464, 0.0, 0.0, 89.4034);
	CreateObject(1536, 1018.6502, -1303.3399, -19.5356, 0.0, 180.0, 89.4012);
	CreateObject(2796, 1019.5357, -1304.6964, -19.0531, 0.0, 0.0, 181.194);
	CreateObject(5721, 1041.3261, -1309.9541, -27.37, 0.0, 0.0, 94.2791);
	CreateObject(5721, 1025.497, -1307.9814, -27.42, 0.0, 0.0, 91.0272);
	CreateObject(5721, 1023.6376, -1293.0771, -27.42, 0.0, 0.0, 91.0217);
	CreateObject(5721, 1037.8105, -1295.664, -27.42, 0.0, 0.0, 91.0217);
	CreateObject(3038, 1025.1313, -1301.2923, -16.8855, 0.0, 0.0, 270.597);
	CreateObject(3038, 1039.9517, -1294.9732, -16.9386, 0.0, 0.0, 13.0041);
	CreateObject(3038, 1033.8216, -1290.9113, -16.9386, 0.0, 0.0, 55.2658);
	CreateObject(2994, 1031.4677, -1303.2232, -21.5592, 0.0, 0.0, 0.0);
	CreateObject(2941, 1035.3165, -1300.3374, -20.5538, 0.0, 0.0, 182.057);
	CreateObject(14578, 1037.5578, -1307.6652, -16.6975, 0.0, 0.0, 0.0);
	CreateObject(14571, 1020.3173, -1285.4365, -23.3298, 0.0, 0.0, 0.0);
	CreateObject(14571, 1028.6151, -1304.7358, -21.6661, 0.0, 0.0, 0.0);
	CreateObject(2848, 1039.25, -1309.7231, -20.9899, 0.0, 0.0, 0.0);
	CreateObject(2885, 1041.9547, -1293.8389, -16.0, 0.0, 0.0, 104.1302);
	CreateObject(2885, 1037.9726, -1289.1499, -16.0, 0.0, 0.0, 144.766);
	CreateObject(2885, 1030.4373, -1287.0966, -16.0, 0.0, 0.0, 175.6456);
	CreateObject(2885, 1021.6835, -1287.0224, -16.0, 0.0, 0.0, 187.0202);
	CreateObject(2885, 1018.664, -1291.1669, -16.0, 0.0, 0.0, 245.5334);
	CreateObject(2885, 1019.3271, -1293.5205, -16.0, 0.0, 0.0, 268.2861);
	CreateObject(2885, 1017.9619, -1303.0566, -16.0, 0.0, 0.0, 258.5302);
	CreateObject(2885, 1025.3272, -1311.3405, -16.0, 0.0, 0.0, 359.3115);
	CreateObject(2885, 1019.8991, -1312.7025, -16.0, 0.0, 0.0, 287.7852);
	CreateObject(1649, 1030.1889, -1288.2326, -20.7636, 0.0, 0.0, 182.708);
	CreateObject(1649, 1024.3122, -1288.3356, -20.6186, 0.0, 0.0, 178.806);
	CreateObject(1649, 1020.5919, -1292.7497, -20.6186, 0.0, 0.0, 263.3265);
	CreateObject(1649, 1017.7661, -1302.0924, -20.6186, 0.0, 0.0, 279.5755);
	CreateObject(1649, 1018.2675, -1297.7148, -21.1, 0.0, 0.0, 172.293);
	CreateObject(1649, 1027.3017, -1288.3349, -20.6186, 0.0, 0.0, 178.8024);
	CreateObject(2839, 1031.7248, -1303.1419, -21.0539, 0.0, 0.0, 79.6503);
	CreateObject(1543, 1031.8485, -1303.3044, -21.0539, 0.0, 0.0, 0.0);
	CreateObject(2885, 1017.9619, -1303.0566, -16.0, 0.0, 0.0, 273.1541);
	CreateObject(646, 1040.4421, -1295.8145, -20.6441, 0.0, 0.0, 92.6544);
	CreateObject(3802, 1020.3766, -1306.9754, -18.4982, 0.0, 0.0, 0.0);
	CreateObject(14467, 1036.0187, -1301.9763, -28.8741, 0.0, 0.0, 21.1317);
	CreateObject(3524, 1035.5999, -1301.5999, -29.7, 0.0, 0.0, 17.8807);

	CreateObject(10819, 3321.9394, -1030.0585, 8.8999, 0.0, 0.0, 343.9929);
	CreateObject(4602, 3178.3017, -1099.4492, 80.0, 0.0, 0.0, 353.9844);
	CreateObject(7916, 3445.3068, -1029.9399, 26.426, 0.0, 0.0, 264.0);
	CreateObject(3625, 3347.986, -1208.796, 25.0, 0.0, 0.0, 342.246);
	CreateObject(13641, 3375.6779, -1142.712, 24.0, 0.0, 0.0, 84.0);
	CreateObject(13641, 3385.3081, -1025.3709, 24.0, 0.0, 0.0, 263.9959);
	CreateObject(8240, 3372.4824, -906.6015, 36.206, 0.0, 0.0, 208.9984);
	CreateObject(16122, 3462.7519, -1017.8339, 16.0, 0.0, 0.0, 210.0);
	CreateObject(13831, 3463.738, -1034.4379, 36.0, 0.0, 0.0, 272.5);
	CreateObject(17565, 3319.7709, -1159.6149, 25.0919, 0.0, 0.0, 252.7454);
	CreateObject(13648, 3386.185, -1195.5899, 22.5879, 0.0, 0.0, 342.0);
	CreateObject(13643, 3353.8601, -1160.27, 23.884, 0.0, 0.0, 344.2446);
	CreateObject(13590, 3399.9951, -1154.633, 23.7999, 0.0, 0.0, 352.0);
	CreateObject(12956, 3281.9628, -1094.052, 26.0, 0.0, 0.0, 0.0);
	CreateObject(3625, 3324.541, -1201.3559, 25.423, 0.0, 0.0, 342.246);
	CreateObject(13642, 3246.7839, -1157.133, 24.7, 0.0, 0.0, 253.25);
	CreateObject(13640, 3223.914, -1109.4716, 23.6079, 0.0, 0.0, 354.4903);
	CreateObject(1378, 3323.998, -1070.4489, 46.979, 0.0, 0.0, 12.5);
	CreateObject(16085, 3327.665, -1109.608, 23.774, 0.0, 0.0, 335.9979);
	CreateObject(18778, 3363.1943, -1070.1523, 24.1, 0.0, 0.0, 99.9975);
	CreateObject(4874, 3264.6201, -1189.4029, 26.2999, 0.0, 0.0, 159.9989);
	CreateObject(13592, 3273.997, -1048.8017, 32.4, 0.0, 0.0, 5.9985);
	CreateObject(13591, 3399.746, -1107.4589, 23.0499, 0.0, 0.0, 264.0);
	CreateObject(13638, 3346.633, -1179.951, 25.1, 0.0, 0.0, 164.0);
	CreateObject(13604, 3379.895, -1097.8669, 24.291, 0.0, 0.0, 354.0);
	CreateObject(10815, 3083.9829, -1157.2714, 21.0, 0.0, 0.0, 44.5);
	CreateObject(10838, 2913.1899, -1157.8339, 28.2999, 0.0, 0.0, 1.9995);
	CreateObject(10815, 3012.1599, -1156.7989, 19.0, 357.0, 357.0, 45.25);
	CreateObject(18563, 3045.885, -1157.503, 35.0, 0.0, 0.0, 278.5);
	CreateObject(1634, 3313.7839, -977.5319, 23.7, 0.0, 0.0, 87.9995);
	CreateObject(1634, 3309.268, -977.395, 27.3799, 19.9951, 0.0, 87.9995);
	CreateObject(1634, 3306.5249, -977.2839, 32.0999, 39.9957, 0.0, 87.9995);
	CreateObject(1634, 3305.663, -977.2689, 37.262, 59.9963, 0.0, 87.9995);
	CreateObject(10794, 3229.6918, -925.2399, 15.0, 0.0, 0.0, 216.0);
	CreateObject(10795, 3231.603, -923.8519, 25.0, 0.0, 0.0, 216.0);
	CreateObject(10793, 3290.4389, -881.1049, 43.5, 0.0, 0.0, 216.0);
	CreateObject(1632, 3244.0249, -981.0689, 23.68, 0.0, 0.0, 26.0);
	CreateObject(6052, 3335.1149, -997.0629, 25.3349, 0.0, 0.0, 0.0);
	CreateObject(6052, 3356.873, -1002.5499, 25.3349, 0.0, 0.0, 240.0);
	CreateObject(6052, 3341.03, -1018.846, 25.3349, 0.0, 0.0, 119.9963);
	CreateObject(9833, 3343.7351, -1006.2789, 31.1949, 0.0, 0.0, 346.0);
	CreateObject(3852, 3314.9199, -1033.5069, 24.1, 0.0, 0.0, 78.0);
	CreateObject(1634, 3278.5629, -977.1279, 23.7, 0.0, 0.0, 267.9949);
	CreateObject(1634, 3283.0629, -977.2839, 27.3799, 19.9951, 0.0, 267.9949);
	CreateObject(1634, 3285.9189, -977.3729, 32.0999, 39.9957, 0.0, 267.9949);
	CreateObject(1634, 3286.8239, -977.405, 37.262, 59.9908, 0.0, 267.9949);
	CreateObject(18778, 3229.4951, -1028.675, 24.1, 0.0, 0.0, 181.9975);
	CreateObject(18778, 3229.6389, -1033.3079, 27.0, 20.0, 0.0, 181.9945);
	CreateObject(18780, 3231.5969, -1104.859, 136.5, 0.0, 19.9951, 173.979);
	CreateObject(1245, 3186.02, -1101.03, 151.425, 0.0, 0.0, 177.9945);
	CreateObject(18565, 3323.225, -1057.3919, 23.7, 0.0, 0.0, 0.0);
	CreateObject(13592, 3269.2219, -1104.368, 147.7, 357.5994, 345.9979, 1.9985);
	CreateObject(3269, 3298.6809, -1008.9899, 22.5879, 0.0, 0.0, 0.0);
	CreateObject(10757, 3389.6809, -936.3839, 43.387, 0.0, 0.0, 20.0);
	CreateObject(987, 3407.7329, -925.1909, 22.583, 0.0, 0.0, 29.0);
	CreateObject(987, 3397.247, -931.023, 22.583, 0.0, 0.0, 29.0);
	CreateObject(987, 3359.1809, -952.151, 22.583, 0.0, 0.0, 28.9984);
	CreateObject(987, 3369.675, -946.3319, 22.583, 0.0, 0.0, 29.0);

	CreateObject(8040, -1706.6, -271.5, 14.0, 0.0, 0.0, 87.995);
	CreateObject(3279, -1637.0, -178.2, 13.3, 0.0, 0.0, 45.0);
	CreateObject(3881, -1532.3, -228.6, 15.0, 0.0, 0.0, 190.0);
	CreateObject(987, -1039.7, 492.4, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1031.2, 483.8, 13.1, 0.0, 0.0, 135.0);
	CreateObject(987, -1022.7, 475.3, 13.1, 0.0, 0.0, 135.0);
	CreateObject(987, -1014.2, 466.8, 13.1, 0.0, 0.0, 134.995);
	CreateObject(987, -1005.7, 458.3, 13.1, 0.0, 0.0, 134.995);
	CreateObject(987, -1000.4, 453.0, 13.1, 0.0, 0.0, 134.995);
	CreateObject(987, -1008.8, 444.6, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1048.2, 484.0, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1017.3, 436.2, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1056.7, 475.5, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1025.8, 427.7, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1065.2, 467.0, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1034.3, 419.2, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1073.7, 458.5, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1042.8, 410.7, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1082.2, 450.0, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1051.3, 402.2, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1090.7, 441.5, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1059.8, 393.7, 13.1, 0.0, 0.0, 44.995);
	CreateObject(7623, -1617.2, -113.9, 16.2, 0.0, 0.0, 45.0);
	CreateObject(7623, -1606.6, -124.5, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1526.8, -23.5, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1516.2, -34.1, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1436.4, 66.9, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1425.8, 56.3, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1346.0, 157.3, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1335.4, 146.7, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1255.6, 247.7, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1245.0, 237.1, 16.2, 0.0, 0.0, 44.995);
	CreateObject(7623, -1165.2, 338.0, 16.3, 0.0, 0.0, 44.995);
	CreateObject(7623, -1154.6, 327.4, 16.3, 0.0, 0.0, 45.0);
	CreateObject(987, -1099.2, 433.0, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1068.3, 385.2, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1107.8, 424.6, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1076.7, 376.6, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1085.1, 368.0, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1116.3, 416.1, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1124.8, 407.6, 13.1, 0.0, 0.0, 225.0);
	CreateObject(987, -1093.6, 359.5, 13.1, 0.0, 0.0, 44.995);
	CreateObject(16090, -1119.1, 384.2, 13.1, 0.0, 0.0, 44.995);
	CreateObject(16090, -1108.5, 373.6, 13.1, 0.0, 0.0, 44.995);
	CreateObject(987, -1102.0, 368.0, 13.1, 0.0, 0.0, 314.995);
	CreateObject(987, -1133.2, 399.2, 13.1, 0.0, 0.0, 314.995);

	//CreateObject(19076, 2490.6165, -1669.325, 11.6359, 0.0, 0.0, 0.0);

	SetTimer("SaveAccounts", 60000 * 25, 1);
	SetTimer("RandomMessages", 60000 * 10, 1);
	SetTimer("RotateFerrisWheel", FERRIS_WHEEL_WAIT_TIME, 0);
	SetTimer("UpdateTimer", 1000, 1);
	SetTimer("Speedometer", 500, 1);

	print("\n~=~=~=~=~=~=~=~=~=~=~=~=~=~=~~=~=~=");
	print(" .:	ByFly GTA: SA GangWar	:.\n");
	print(" .:	by LethaL		:.\n");
	print(" .:	Modified by Nexius	:.");
	print("~=~=~=~=~=~=~=~=~=~=~=~=~=~=~~=~=~=\n");
	return 1;
}

public OnGameModeExit()
{
	new i;
	for(i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i))
		{
			StopPlayerRace(i);
			PlayerTextDrawDestroy(i, PlayerInfo[i][pVehSpeed]);
			PlayerTextDrawDestroy(i, PlayerInfo[i][pMutedTime]);
			KillTimer(PlayerInfo[i][pGiveMoneyTmr]);
			KillTimer(PlayerInfo[i][pAntiSKTmr]);
			KillTimer(PlayerInfo[i][pPayDayTmr]);
			KillTimer(PlayerInfo[i][pPromiseTmr]);
			KillTimer(PlayerInfo[i][pMineTmr]);
		}
	}
	ElevatorDestroy();
	for(i = sizeof(FerrisWheelObj) - 1; i >= 0; --i) DestroyObject(FerrisWheelObj[i]);
	TextDrawDestroy(TDLogo);
	TextDrawDestroy(TDLogo2);
	KillTimer(CountTmr);

	print("\n~=~=~=~=~=~=~=~=~=~=~=~=~=~=~~=~=~=");
	print(" .:	ByFly GTA: SA GangWar	:.\n");
	print(" .:	by LethaL		:.\n");
	print(" .:	Modified by Nexius	:.\n");
	print(" .:	Has Ended		:.");
	print("~=~=~=~=~=~=~=~=~=~=~=~=~=~=~~=~=~=\n");
	return 1;
}

public OnPlayerConnect(playerid)
{
	PlayerInfo[playerid][pLogged] = false;
	PlayerInfo[playerid][pGiveMoney] = true;
	PlayerInfo[playerid][pPvpAccept] = true;
	PlayerInfo[playerid][pPromise] = true;
	PlayerInfo[playerid][pFightStyle] = 4;
	PlayerInfo[playerid][pSpec] = INVALID_PLAYER_ID;
	PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
	PlayerInfo[playerid][pPointsId] = INVALID_PLAYER_ID;
	PlayerInfo[playerid][pClickedId] = INVALID_PLAYER_ID;
	PlayerInfo[playerid][pGiveMoneyTmr] = -1;
	PlayerInfo[playerid][pCountPvpTmr] = -1;
	PlayerInfo[playerid][pAntiSKTmr] = -1;
	PlayerInfo[playerid][pPromiseTmr] = -1;
	PlayerInfo[playerid][pLastSkin] = -1;
	PlayerInfo[playerid][pMineTmr] = -1;
	PlayerInfo[playerid][pInfoTmr] = -1;
	PlayerInfo[playerid][pDialog] = -1;
	PlayerInfo[playerid][pClass] = -1;
	PlayerInfo[playerid][pSkin] = -1;
	PlayerInfo[playerid][pId] = -1;

	SetPlayerColor(playerid, COLOR_GRAY);

	GangZoneShowForPlayer(playerid, GroveGz, COLOR_GREEN);
	GangZoneShowForPlayer(playerid, BallasGz, COLOR_PURPLE);
	GangZoneShowForPlayer(playerid, AztecGz, COLOR_LIGHTBLUE);
	GangZoneShowForPlayer(playerid, NangGz, COLOR_DARKRED);
	GangZoneShowForPlayer(playerid, VagosGz, COLOR_YELLOW);
	GangZoneShowForPlayer(playerid, MafiaGz, COLOR_BLACK);
	GangZoneShowForPlayer(playerid, CopsGz, COLOR_BLUE_TEAM);
	GangZoneShowForPlayer(playerid, BikerGz, COLOR_ORANGE);
	GangZoneShowForPlayer(playerid, TriadGz, COLOR_WHITE);
	GangZoneShowForPlayer(playerid, AdminGz, COLOR_GRAY);
	GangZoneShowForPlayer(playerid, ArmyGz, COLOR_DARKBROWN);
	GangZoneShowForPlayer(playerid, BanditGz, COLOR_DARKORANGE);

	PlayerInfo[playerid][pRaceInfo] = CreatePlayerTextDraw(playerid, 633.0, 348.0, "_");
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pRaceInfo], 3);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pRaceInfo], 255);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pRaceInfo], 0.24, 1.1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pRaceInfo], -687931137);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pRaceInfo], 1);

	PlayerInfo[playerid][pVehSpeed] = CreatePlayerTextDraw(playerid, 72.5, 319.0, "_");
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pVehSpeed], 3);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pVehSpeed], 255);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pVehSpeed], 0.3099, 1.0999);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pVehSpeed], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pVehSpeed], 1);

	PlayerInfo[playerid][pMutedTime] = CreatePlayerTextDraw(playerid, 17.0, 428.0, "_");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pMutedTime], 255);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pMutedTime], 0.39, 1.1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pMutedTime], -16776961);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pMutedTime], 1);

	SetPlayerMapIcon(playerid, 0, 1969.2941, -2186.8699, 13.5469, 19, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 1, -1552.7843, -427.2818, 6.0163, 19, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 2, 1705.9359, 1599.4969, 10.115, 19, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 3, 1835.3373, -1681.7424, 13.394, 48, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 4, 1372.9, -1278.8, 12.5, 6, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 5, 2400.5, -1978.4, 13.5, 6, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 6, 240.0, -178.2, 2.0, 6, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 7, 2332.9, 63.6, 31.0, 6, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 8, 2067.4, -1831.2, 13.5, 63, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 9, 488.0, -1734.0, 34.4, 63, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 10, 720.016, -454.625, 15.328, 63, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 11, 1966.532, 2162.65, 10.995, 63, 0, MAPICON_LOCAL);
	SetPlayerMapIcon(playerid, 12, 1021.8, -1018.7, 30.9, 63, 0, MAPICON_LOCAL);

	RemoveBuildingForPlayer(playerid, 6463, 389.7734, -2028.4688, 19.8047, 0.5);
	RemoveBuildingForPlayer(playerid, 3751, 389.875, -2035.3828, 29.9531, 50.0);
	RemoveBuildingForPlayer(playerid, 6298, 389.7734, -2028.4688, 19.8047, 0.5);
	RemoveBuildingForPlayer(playerid, 6461, 389.7734, -2028.5, 20.1094, 0.5);
	RemoveBuildingForPlayer(playerid, 3752, 389.875, -2028.5, 32.2266, 50.0);

	static string[145];
	GetPlayerName(playerid, PlayerInfo[playerid][pName], MAX_PLAYER_NAME + 1);
	format(string, sizeof string, "*** %s (id: %d) �����(��) �� ������", PlayerInfo[playerid][pName], playerid);
	SendClientMessageToAll(COLOR_GRAY, string);
	PlaySoundForAll(1056, 0.0, 0.0, 0.0);
	for(new i = strlen(PlayerInfo[playerid][pName]) - 1; i >= 0; --i)
	{
		switch(PlayerInfo[playerid][pName][i])
		{
			case 'A'..'Z', 'a'..'z', '[', ']', '_':{}
			default:
			{
				printf("����� %s ������ �� ������������� ����������� �������� � ����", PlayerInfo[playerid][pName]);
				SendClientMessage(playerid, COLOR_GREEN, "Nickname must have only 'Aa'..'Zz', '[', ']' and '_' characters");
				return Kick2(playerid);
			}
		}
	}
	if(strfind(PlayerInfo[playerid][pName], "[GM]", true) != -1)
	{
		format(string, sizeof string, "Users/%s.ini", PlayerInfo[playerid][pName]);
		if(!fexist(string))
		{
			printf("����� %s ������� �� ������� ����� � ����� �������������", PlayerInfo[playerid][pName]);
			SendClientMessage(playerid, COLOR_RED, "�� �� ������������� �������!");
			Ban2(playerid);
			return 1;
		}
		new iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			new admin;
			ini_getInteger(iniFile, "Admin", admin);
			ini_closeFile(iniFile);
			if(admin < 1)
			{
				printf("����� %s ������� �� ������� ����� � ����� �������������", PlayerInfo[playerid][pName]);
				SendClientMessage(playerid, COLOR_RED, "�� �� ������������� �������!");
				Ban2(playerid);
				return 1;
			}
		}
	}
	static connecting_ip[16];
	GetPlayerIp(playerid, connecting_ip, sizeof connecting_ip);
	if(GetNumberOfPlayersOnThisIP(connecting_ip) > MAX_CONNECTIONS_FROM_IP)
	{
		printf("����� %s ������ �� ��������� ������������� ����������� � ������ IP-������", PlayerInfo[playerid][pName]);
		return Kick2(playerid);
	}
	format(string, sizeof string, "Welcome To ~n~~g~Los Santos ~n~~r~Gang War ~n~~y~%s!", PlayerInfo[playerid][pName]);
	GameTextForPlayer(playerid, string, 4500, 1);
	PlayerPlaySound(playerid, 1097, 0.0, 0.0, 0.0);
	TextDrawShowForPlayer(playerid, TDLogo2);
	ShowPlayerDialog(playerid, DIALOG_RULES, DIALOG_STYLE_MSGBOX, "{FF0000}������� ��������� �� ������� GTA SA GangWar", RulesStr, "�������", "������");
	SendClientMessage(playerid, COLOR_RED, "---------------------------------------------------------------------------------");
	SendClientMessage(playerid, COLOR_RED, "��� ������ ��������: /help");
	SendClientMessage(playerid, COLOR_RED, "---------------------------------------------------------------------------------");
	SendClientMessage(playerid, COLOR_GREEN, "---------------------------------------------------------------------------------");
	SendClientMessage(playerid, COLOR_GREEN, "��� ��������� ������ ��������: /icommands");
	SendClientMessage(playerid, COLOR_GREEN, "---------------------------------------------------------------------------------");
	PlayerInfo[playerid][pPayDayTmr] = SetTimerEx("PayDay", 60000 * 30, 1, "i", playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(PlayerInfo[playerid][pInPvp])
	{
		PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]] = false;
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][pInPvp] && PlayerInfo[i][pPvpPlace] == PlayerInfo[playerid][pPvpPlace])
			{
				PlayerInfo[i][pInPvp] = false;
				PlayerInfo[i][pPvpCreate] = INVALID_PLAYER_ID;
				SpawnPlayer(i);
			}
		}
		PlayerInfo[playerid][pInPvp] = false;
	}
	if(PlayerInfo[playerid][pSpikesObj] > 0)
	{
		DestroyObject(PlayerInfo[playerid][pSpikesObj]);
		PlayerInfo[playerid][pSpikesObj] = 0;
	}
	if(PlayerInfo[playerid][pMineStatus] > 0)
	{
		if(PlayerInfo[playerid][pMineStatus] == 1)
		{
			Delete3DTextLabel(PlayerInfo[playerid][pMineLabel]);
			DestroyObject(PlayerInfo[playerid][pMineObj][1]);
			KillTimer(PlayerInfo[playerid][pMineTmr]);
		}
		else DestroyPickup(PlayerInfo[playerid][pMinePick]);
		DestroyObject(PlayerInfo[playerid][pMineObj][0]);
		PlayerInfo[playerid][pMineStatus] = 0;
	}
	if(PlayerInfo[playerid][pNeonStatus])
	{
		for(new i = 11; i >= 0; --i)
		{
			DestroyObject(PlayerInfo[playerid][pNeonObj][i]);
			PlayerInfo[playerid][pNeonObj][i] = 0;
		}
		PlayerInfo[playerid][pNeonStatus] = false;
	}
	if(PlayerInfo[playerid][pInRace])
	{
		RaceJoinCount--;
		StopPlayerRace(playerid);
	}
	SaveAccount(playerid);
	KillTimer(PlayerInfo[playerid][pPromiseTmr]);
	KillTimer(PlayerInfo[playerid][pPayDayTmr]);
	KillTimer(PlayerInfo[playerid][pAntiSKTmr]);
	KillTimer(PlayerInfo[playerid][pGiveMoneyTmr]);
	PlayerTextDrawDestroy(playerid, PlayerInfo[playerid][pRaceInfo]);
	PlayerTextDrawDestroy(playerid, PlayerInfo[playerid][pVehSpeed]);
	PlayerTextDrawDestroy(playerid, PlayerInfo[playerid][pMutedTime]);
	if(BuildRace == playerid + 1) BuildRace = 0;
	PlayerInfo[playerid][pBan] = false;
	PlayerInfo[playerid][pCap] = false;
	PlayerInfo[playerid][pCaps] = false;
	PlayerInfo[playerid][pMute] = false;
	PlayerInfo[playerid][pJail] = false;
	PlayerInfo[playerid][pPunish] = false;
	PlayerInfo[playerid][pShield] = false;
	PlayerInfo[playerid][pGodMode] = false;
	PlayerInfo[playerid][pAlPreLoaded] = false;
	PlayerInfo[playerid][pLoopingAnim] = false;
	PlayerInfo[playerid][pConnectCount] = 0;
	PlayerInfo[playerid][pFloodCount] = 0;
	PlayerInfo[playerid][pPunishTime] = 0;
	PlayerInfo[playerid][pGangCheck] = 0;
	PlayerInfo[playerid][pTempAdmin] = 0;
	PlayerInfo[playerid][pPassCount] = 0;
	PlayerInfo[playerid][pTeamKills] = 0;
	PlayerInfo[playerid][pMuteTime] = 0;
	PlayerInfo[playerid][pJailTime] = 0;
	PlayerInfo[playerid][pDmPoints] = 0;
	PlayerInfo[playerid][pArmour] = 0.0;
	PlayerInfo[playerid][pBattleId] = 0;
	PlayerInfo[playerid][pBanTime] = 0;
	PlayerInfo[playerid][pAFKTime] = 0;
	PlayerInfo[playerid][pGangLvl] = 0;
	PlayerInfo[playerid][pSeconds] = 0;
	PlayerInfo[playerid][pGangId] = 0;
	PlayerInfo[playerid][pPoints] = 0;
	PlayerInfo[playerid][pDeaths] = 0;
	PlayerInfo[playerid][pKills] = 0;
	PlayerInfo[playerid][pAdmin] = 0;
	PlayerInfo[playerid][pWarns] = 0;
	PlayerInfo[playerid][pMoney] = 0;
	PlayerInfo[playerid][pGang] = 0;
	PlayerInfo[playerid][pDmZone] = 0;
	static string[145];
	format(string, sizeof string, "*** %s (id: %d) �����(��) �� ���� (%s)", PlayerInfo[playerid][pName], playerid, DisReasons[reason]);
	SendClientMessageToAll(COLOR_GRAY, string);
	PlaySoundForAll(1057, 0.0, 0.0, 0.0);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	PlayerPlaySound(playerid, 1097, 0.0, 0.0, 0.0);
	PlayerInfo[playerid][pTeam] = GetPlayerTeam(playerid);
	if(classid != PlayerInfo[playerid][pClass])
	{
		PlayerInfo[playerid][pTurfBackCount] = 0;
		PlayerInfo[playerid][pGangKillCount] = 0;
	}
	PlayerInfo[playerid][pClass] = classid;
	switch(classid)
	{
		case 0..3:
		{
			GameTextForPlayer(playerid, "~g~Grove", 500, 3);
			SetPlayerPos(playerid, 2442.612, -1660.374, 27.4512);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid, 2437.612, -1660.374, 28.9512);
			SetPlayerCameraLookAt(playerid, 2442.612, -1660.374, 27.4512);
		}
		case 4..7:
		{
			GameTextForPlayer(playerid, "~p~Ballas", 500, 3);
			SetPlayerPos(playerid, 2197.747, -1161.255, 35.1022);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid, 2193.747, -1161.255, 37.1022);
			SetPlayerCameraLookAt(playerid, 2197.747, -1161.255, 35.1022);
			ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 8..11:
		{
			GameTextForPlayer(playerid, "~b~Aztec", 500, 3);
			SetPlayerPos(playerid, 1828.7595, -1682.1378, 13.5469);
			SetPlayerFacingAngle(playerid, 88.0);
			SetPlayerCameraPos(playerid, 1823.7562, -1682.1378, 13.3828);
			SetPlayerCameraLookAt(playerid, 1828.7595, -1682.1378, 13.5469);
		}
		case 12..15:
		{
			GameTextForPlayer(playerid, "~r~Nang", 500, 3);
			SetPlayerPos(playerid, 1174.399, -1702.686, 22.2344);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid, 1171.399, -1699.686, 22.8344);
			SetPlayerCameraLookAt(playerid, 1174.399, -1702.686, 22.2344);
		}
		case 16..19:
		{
			GameTextForPlayer(playerid, "~y~Vagos", 500, 3);
			SetPlayerPos(playerid, 2848.22, -1187.98, 24.6544);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerCameraPos(playerid, 2858.22, -1189.58, 24.6544);
			SetPlayerCameraLookAt(playerid, 2848.22, -1187.98, 24.6544);
			ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 20..22:
		{
			GameTextForPlayer(playerid, "~b~Cops", 500, 3);
			SetPlayerPos(playerid, 1508.293, -1679.039, 19.2421);
			SetPlayerFacingAngle(playerid, 135.0);
			SetPlayerCameraPos(playerid, 1505.293, -1682.039, 19.9421);
			SetPlayerCameraLookAt(playerid, 1508.293, -1679.039, 19.2421);
			ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
		}
		case 23..26:
		{
			GameTextForPlayer(playerid, "~r~Italian~n~Mafia", 500, 3);
			SetPlayerPos(playerid, 2183.969, -2243.625, 18.5154);
			SetPlayerFacingAngle(playerid, 135.0);
			SetPlayerCameraPos(playerid, 2177.969, -2247.625, 21.5154);
			SetPlayerCameraLookAt(playerid, 2183.969, -2243.625, 18.5154);
			ApplyAnimation(playerid, "PED", "fucku", 4.0, 0, 0, 0, 0, 0);
		}
		case 27..29:
		{
			GameTextForPlayer(playerid, "~r~Biker", 500, 3);
			SetPlayerPos(playerid, 1797.251, -1346.597, 15.5146);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerCameraPos(playerid, 1803.251, -1345.597, 15.5146);
			SetPlayerCameraLookAt(playerid, 1797.251, -1346.597, 15.5146);
		}
		case 30..32:
		{
			GameTextForPlayer(playerid, "~w~Triad", 500, 3);
			SetPlayerPos(playerid, 895.0587, -1672.637, 14.2871);
			SetPlayerFacingAngle(playerid, 135.0);
			SetPlayerCameraPos(playerid, 900.0587, -1677.637, 14.2871);
			SetPlayerCameraLookAt(playerid, 895.0587, -1672.637, 14.2871);
			ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 33:
		{
			GameTextForPlayer(playerid, "~r~Admin Only", 500, 3);
			SetPlayerPos(playerid, 1176.287, -1994.802, 69.0078);
			SetPlayerFacingAngle(playerid, 10.0);
			SetPlayerCameraPos(playerid, 1174.287, -1991.802, 69.0078);
			SetPlayerCameraLookAt(playerid, 1176.287, -1994.802, 69.0078);
			ApplyAnimation(playerid, "SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 34:
		{
			GameTextForPlayer(playerid, "~w~Army", 500, 3);
			SetPlayerPos(playerid, 2775.568, -2455.016, 23.173);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerCameraPos(playerid, 2780.568, -2460.516, 25.673);
			SetPlayerCameraLookAt(playerid, 2775.568, -2455.016, 23.173);
			ApplyAnimation(playerid, "ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1);
		}
		case 35, 36:
		{
			GameTextForPlayer(playerid, "~r~Bandit", 500, 3);
			SetPlayerPos(playerid, 311.5885, -1512.816, 24.9219);
			SetPlayerFacingAngle(playerid, 60.0);
			SetPlayerCameraPos(playerid, 304.7982, -1509.0461, 24.6007);
			SetPlayerCameraLookAt(playerid, 311.5885, -1512.816, 24.9219);
		}
	}
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(!IsPlayerAdminEx(playerid, 1) && PlayerInfo[playerid][pTeam] == TEAM_ADMIN)
	{
		GameTextForPlayer(playerid, "~r~Admin Only", 500, 3);
		return 0;
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(!PlayerInfo[playerid][pLogged])
	{
		static string[145];
		printf("����� %s ������ �� ����� ��� �����������", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "%s(ID: %d) ��� ������ [���������� ������������]", PlayerInfo[playerid][pName], playerid);
		SendClientMessageToAll(COLOR_GRAY, string);
		SetPlayerHealth(playerid, 0.0);
		Kick2(playerid);
		return 1;
	}
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	if(!PlayerInfo[playerid][pAlPreLoaded])
	{
		PreloadAnimLib(playerid, "BOMBER");
		PreloadAnimLib(playerid, "RAPPING");
		PreloadAnimLib(playerid, "SHOP");
		PreloadAnimLib(playerid, "BEACH");
		PreloadAnimLib(playerid, "SMOKING");
		PreloadAnimLib(playerid, "FOOD");
		PreloadAnimLib(playerid, "ON_LOOKERS");
		PreloadAnimLib(playerid, "DEALER");
		PreloadAnimLib(playerid, "CRACK");
		PreloadAnimLib(playerid, "CARRY");
		PreloadAnimLib(playerid, "COP_AMBIENT");
		PreloadAnimLib(playerid, "PARK");
		PreloadAnimLib(playerid, "INT_HOUSE");
		PreloadAnimLib(playerid, "FOOD");
		PlayerInfo[playerid][pAlPreLoaded] = true;
	}
	SetPlayerFightingStyle(playerid, PlayerInfo[playerid][pFightStyle]);
	PlayerPlaySound(playerid, 1098, 0.0, 0.0, 0.0);
	TextDrawHideForPlayer(playerid, TDLogo2);
	TextDrawShowForPlayer(playerid, TDTime);
	TextDrawShowForPlayer(playerid, TDLogo);
	switch(PlayerInfo[playerid][pTeam])
	{
		case TEAM_GROVE: SetPlayerColor(playerid, COLOR_GREEN);
		case TEAM_BALLAS: SetPlayerColor(playerid, COLOR_PURPLE);
		case TEAM_AZTEC: SetPlayerColor(playerid, COLOR_LIGHTBLUE);
		case TEAM_NANG: SetPlayerColor(playerid, COLOR_DARKRED);
		case TEAM_VAGOS: SetPlayerColor(playerid, COLOR_YELLOW);
		case TEAM_COPS:
		{
			SetPlayerColor(playerid, COLOR_BLUE_TEAM);
			SendClientMessage(playerid, COLOR_BLUE, "������� �����: ����������� ��� - /shield");
		}
		case TEAM_MAFIA:
		{
			SetPlayerColor(playerid, COLOR_BLACK);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "������� ����� Mafia: /opengate /closegate");
		}
		case TEAM_BIKER: SetPlayerColor(playerid, COLOR_ORANGE);
		case TEAM_TRIAD: SetPlayerColor(playerid, COLOR_WHITE);
		case TEAM_ADMIN:
		{
			TogglePlayerClock(playerid, 1);
			SetPlayerColor(playerid, COLOR_GRAY);
			SendClientMessage(playerid, COLOR_GRAY, "������� �������: ����������� ��� - /shield");
			GivePlayerWeapon(playerid, 34, 200);
			GivePlayerWeapon(playerid, 16, 50);
		}
		case TEAM_ARMY:
		{
			SetPlayerColor(playerid, COLOR_DARKBROWN);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "������� �����: /opengate /closegate /opengate2 /closegate2");
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "����������� ��� - /shield");
		}
		case TEAM_BANDIT: SetPlayerColor(playerid, COLOR_DARKORANGE);
	}
	SetPlayerHealth(playerid, 99999.0);
	SetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
	PlayerInfo[playerid][pAntiSKTmr] = SetTimerEx("AntiSpawnKill", 10000, 0, "i", playerid);
	SendClientMessage(playerid, COLOR_RED, "�� �� ������ ���� ����� � ������� 10 ������ (Anti-Spawnkill ������)");
	if(PlayerInfo[playerid][pSkin] >= 0) SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	if(PlayerInfo[playerid][pGang] > 0)
	{
		if(GangSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1] >= 0) SetPlayerSkin(playerid, GangSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1]);
		if(GangSpawn[PlayerInfo[playerid][pGang]][0] && GangSpawn[PlayerInfo[playerid][pGang]][1] && GangSpawn[PlayerInfo[playerid][pGang]][2]) SetPlayerPos(playerid, GangSpawn[PlayerInfo[playerid][pGang]][0], GangSpawn[PlayerInfo[playerid][pGang]][1], GangSpawn[PlayerInfo[playerid][pGang]][2]);
		SetPlayerColor(playerid, HexToInt(GangColor[PlayerInfo[playerid][pGang]]));
		SetPlayerInterior(playerid, GangSpawnInt[PlayerInfo[playerid][pGang]]);
	}
	switch(PlayerInfo[playerid][pDmZone])
	{
		case 1:
		{
			SetPlayerPos(playerid, -1301.9515, 2518.7886, 87.248);
			SetPlayerFacingAngle(playerid, 173.0);
			SetPlayerInterior(playerid, 0);
		}
		case 2:
		{
			SetPlayerPos(playerid, -1096.4175, -1646.427, 76.3672);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerInterior(playerid, 0);
		}
		case 3:
		{
			SetPlayerPos(playerid, -2660.0032, 1372.6454, 27.1563);
			SetPlayerFacingAngle(playerid, 353.0);
			SetPlayerInterior(playerid, 0);
		}
		case 4:
		{
			SetPlayerPos(playerid, 1371.752, 2172.3188, 11.0234);
			SetPlayerFacingAngle(playerid, 130.0);
			SetPlayerInterior(playerid, 0);
		}
		case 5:
		{
			SetPlayerPos(playerid, -2337.2522, -100.1541, 35.3203);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerInterior(playerid, 0);
		}
		case 6:
		{
			SetPlayerPos(playerid, 1.5394, 23.4798, 1199.5938);
			SetPlayerFacingAngle(playerid, 0.0);
			SetPlayerInterior(playerid, 1);
		}
		case 7:
		{
			SetPlayerPos(playerid, -1048.545, -1193.1093, 129.0607);
			SetPlayerFacingAngle(playerid, 180.0);
			SetPlayerInterior(playerid, 0);
		}
		case 8:
		{
			ResetPlayerWeapons(playerid);
			new rand = random(sizeof SniperDmSpawns);
			SetPlayerPos(playerid, SniperDmSpawns[rand][0], SniperDmSpawns[rand][1], SniperDmSpawns[rand][2]);
			SetPlayerFacingAngle(playerid, 90.0);
			GivePlayerWeapon(playerid, 34, 100);
			SetPlayerInterior(playerid, 0);
		}
	}
	if(PlayerInfo[playerid][pJail])
	{
		RemovePlayerAttachedObject(playerid, 8);
		SetPlayerAttachedObject(playerid, 8, 19418, 6, -0.011, 0.028, -0.022, -15.6, -33.6999, -81.7, 0.8919, 1.0, 1.168);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CUFFED);
		PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/shanson.m3u");
		SetPlayerPos(playerid, 265.0318, 77.4488, 1001.0391);
		SetPlayerInterior(playerid, 6);
		ResetPlayerWeapons(playerid);
		SetPlayerSkin(playerid, 268);
	}
	if(PlayerInfo[playerid][pPunish])
	{
		SetPlayerPos(playerid, -1350.1162, 994.3682, 1024.0056);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 15);
	}
	SetCameraBehindPlayer(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	PlayerInfo[playerid][pArmour] = 0.0;
	PlayerInfo[playerid][pAFKTime] = -3;
	KillTimer(PlayerInfo[playerid][pAntiSKTmr]);
	if(PlayerInfo[playerid][pLoopingAnim])
	{
		PlayerInfo[playerid][pLoopingAnim] = false;
		TextDrawHideForPlayer(playerid, TDAnimHelper);
	}
	TextDrawHideForPlayer(playerid, TDTime);
	SendDeathMessage(killerid, playerid, reason);
	GameTextForPlayer(playerid, "~r~Wasted", 5000, 1);
	PlayerInfo[playerid][pDeaths]++;
	PlayerInfo[playerid][pMoney] -= 600;
	if(PlayerInfo[playerid][pInRace])
	{
		RaceJoinCount--;
		StopPlayerRace(playerid);
	}
	if(BuildRace == playerid + 1) BuildRace = 0;
	static string[145];
	if(killerid != INVALID_PLAYER_ID)
	{
		if(PlayerInfo[killerid][pInPvp] && PlayerInfo[playerid][pInPvp])
		{
			PvpPlaceVisit[PlayerInfo[killerid][pPvpPlace]] = false;
			PlayerInfo[killerid][pInPvp] = false;
			PlayerInfo[playerid][pInPvp] = false;
			PlayerInfo[killerid][pPvpCreate] = INVALID_PLAYER_ID;
			PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
			PlayerInfo[killerid][pMoney] += PlayerInfo[killerid][pPvpMoney];
			PlayerInfo[playerid][pMoney] -= PlayerInfo[playerid][pPvpMoney];
			format(string, sizeof string, "~g~+%d$", PlayerInfo[killerid][pPvpMoney]);
			GameTextForPlayer(killerid, string, 1000, 1);
			format(string, sizeof string, "~r~-%d$", PlayerInfo[playerid][pPvpMoney]);
			GameTextForPlayer(playerid, string, 1000, 1);
			format(string, sizeof string, ">>> � PVP ����� �������� {FFFFFF}%s{00FF00} � {FFFFFF}%s{00FF00} ������� ����� {FFFFFF}%s. {00FF00}������� %d$", PlayerInfo[killerid][pName], PlayerInfo[playerid][pName], PlayerInfo[killerid][pName], PlayerInfo[killerid][pPvpMoney]);
			SendClientMessageToAll(COLOR_LIME_2, string);
			SpawnPlayer(killerid);
			return 1;
		}
		if(PlayerInfo[killerid][pGang] <= 0)
		{
			switch(PlayerInfo[killerid][pTeam])
			{
				case TEAM_GROVE:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(GroveGz);
						GangZoneHideForAll(GroveGz);
						GangZoneShowForAll(GroveGz, COLOR_GREEN);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_BALLAS:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(BallasGz);
						GangZoneHideForAll(BallasGz);
						GangZoneShowForAll(BallasGz, COLOR_PURPLE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_AZTEC:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(AztecGz);
						GangZoneHideForAll(AztecGz);
						GangZoneShowForAll(AztecGz, COLOR_LIGHTBLUE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_NANG:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(NangGz);
						GangZoneHideForAll(NangGz);
						GangZoneShowForAll(NangGz, COLOR_DARKRED);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_VAGOS:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(VagosGz);
						GangZoneHideForAll(VagosGz);
						GangZoneShowForAll(VagosGz, COLOR_YELLOW);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_MAFIA:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(MafiaGz);
						GangZoneHideForAll(MafiaGz);
						GangZoneShowForAll(MafiaGz, COLOR_BLACK);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_COPS:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(CopsGz);
						GangZoneHideForAll(CopsGz);
						GangZoneShowForAll(CopsGz, COLOR_BLUE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_BIKER:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(BikerGz);
						GangZoneHideForAll(BikerGz);
						GangZoneShowForAll(BikerGz, COLOR_ORANGE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_TRIAD:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(TriadGz);
						GangZoneHideForAll(TriadGz);
						GangZoneShowForAll(TriadGz, COLOR_WHITE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_ARMY:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(ArmyGz);
						GangZoneHideForAll(ArmyGz);
						GangZoneShowForAll(ArmyGz, COLOR_DARKBROWN);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_BANDIT:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= KILLS_FOR_REOWN_TURF)
					{
						GangZoneStopFlashForAll(BanditGz);
						GangZoneHideForAll(BanditGz);
						GangZoneShowForAll(BanditGz, COLOR_DARKORANGE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
			}
		}
		if(PlayerInfo[playerid][pGang] <= 0)
		{
			switch(PlayerInfo[playerid][pTeam])
			{
				case TEAM_GROVE:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_GROVE)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: �������� ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(GroveGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s �������� ���������� ���������", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(GroveGz);
									GangZoneHideForAll(GroveGz);
									GangZoneShowForAll(GroveGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_BALLAS:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_BALLAS)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ������� ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(BallasGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s �������� ���������� ��������", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(BallasGz);
									GangZoneHideForAll(BallasGz);
									GangZoneShowForAll(BallasGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_AZTEC:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_AZTEC)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ������� ������� ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(AztecGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s �������� ���������� �������", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(AztecGz);
									GangZoneHideForAll(AztecGz);
									GangZoneShowForAll(AztecGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_NANG:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_NANG)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ������� Nang ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(NangGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s �������� ���������� NANG", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(NangGz);
									GangZoneHideForAll(NangGz);
									GangZoneShowForAll(NangGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_VAGOS:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_VAGOS)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ������ ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(VagosGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s �������� ���������� �������", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(VagosGz);
									GangZoneHideForAll(VagosGz);
									GangZoneShowForAll(VagosGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_COPS:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_COPS)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ���� ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(CopsGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s ���� ���������� �����", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(CopsGz);
									GangZoneHideForAll(CopsGz);
									GangZoneShowForAll(CopsGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_MAFIA:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_MAFIA)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ����� ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(MafiaGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s ���� ���������� �����", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(MafiaGz);
									GangZoneHideForAll(MafiaGz);
									GangZoneShowForAll(MafiaGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_BIKER:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_BIKER)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ������� �������� ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(BikerGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s ���� ���������� ��������", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(BikerGz);
									GangZoneHideForAll(BikerGz);
									GangZoneShowForAll(BikerGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_TRIAD:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_TRIAD)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ������ ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(TriadGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s ���� ���������� ������", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(TriadGz);
									GangZoneHideForAll(TriadGz);
									GangZoneShowForAll(TriadGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_ADMIN:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_ADMIN)
					{
						if(++PlayerInfo[playerid][pGangKillCount] > KILLS_FOR_GANGAREA_WARNING)
						{
							SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ������� ������� ���������!");
							PlayerInfo[playerid][pGangKillCount] = 0;
						}
					}
				}
				case TEAM_ARMY:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_ARMY)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ����� ���������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(ArmyGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s ���� ���������� �����", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(ArmyGz);
									GangZoneHideForAll(ArmyGz);
									GangZoneShowForAll(ArmyGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
				case TEAM_BANDIT:
				{
					if(PlayerInfo[killerid][pTeam] != TEAM_BANDIT)
					{
						PlayerInfo[playerid][pGangKillCount]++;
						switch(PlayerInfo[playerid][pGangKillCount])
						{
							case KILLS_FOR_GANGAREA_WARNING:
							{
								SendClientMessageToAll(COLOR_BORDO, "��������� ��������: ���� Bandit ��������!");
								if(PlayerInfo[killerid][pGang] <= 0) GangZoneFlashForAll(BanditGz, GetPlayerColor(killerid));
							}
							case KILLS_FOR_GANGAREA_TAKE:
							{
								if(PlayerInfo[killerid][pGang] <= 0)
								{
									format(string, sizeof string, "��������� ��������: %s ���� ���������� Bandit", PlayerInfo[killerid][pName]);
									SendClientMessageToAll(GetPlayerColor(killerid), string);
									GangZoneStopFlashForAll(BanditGz);
									GangZoneHideForAll(BanditGz);
									GangZoneShowForAll(BanditGz, GetPlayerColor(killerid));
								}
								PlayerInfo[playerid][pGangKillCount] = 0;
							}
						}
					}
				}
			}
		}
		else if(PlayerInfo[playerid][pGang] != PlayerInfo[killerid][pGang])
		{
			GangKills[PlayerInfo[playerid][pGang]]++;
			PlayerInfo[playerid][pGangKillCount]++;
			switch(PlayerInfo[playerid][pGangKillCount])
			{
				case KILLS_FOR_GANGAREA_WARNING:
				{
					format(string, sizeof string, "��������� ��������: ����� \"%s\" ���������!", GangName[PlayerInfo[playerid][pGang]]);
					SendClientMessageToAll(COLOR_BORDO, string);
				}
				case KILLS_FOR_GANGAREA_TAKE:
				{
					format(string, sizeof string, "��������� ��������: %s ������� ������ ��� ������ \"%s\"", PlayerInfo[killerid][pName], GangName[PlayerInfo[playerid][pGang]]);
					SendClientMessageToAll(COLOR_BORDO, string);
					PlayerInfo[playerid][pGangKillCount] = 0;
					GangKills[PlayerInfo[playerid][pGang]] = 0;
				}
			}
			switch(GangKills[PlayerInfo[playerid][pGang]])
			{
				case KILLS_FOR_GANGAREA_TAKE:
				{
					format(string, sizeof string, "��������� ��������: ����� \"%s\" �������� ������ ��� ������ \"%s\"", GangName[PlayerInfo[killerid][pGang]], GangName[PlayerInfo[playerid][pGang]]);
					SendClientMessageToAll(GetPlayerColor(killerid), string);
					GangKills[PlayerInfo[playerid][pGang]] = 0;
				}
			}
		}
		if((PlayerInfo[playerid][pTeam] == PlayerInfo[killerid][pTeam] || PlayerInfo[playerid][pGang] > 0 && PlayerInfo[killerid][pGang] > 0) && PlayerInfo[playerid][pGang] == PlayerInfo[killerid][pGang])
		{
			SetPlayerHealth(killerid, 0.0);
			PlayerInfo[killerid][pMoney] -= 1000;
			GameTextForPlayer(killerid, "~r~Team Killer", 5000, 3);
			PlayerInfo[killerid][pKills]--;
			SetPlayerScore(killerid, PlayerInfo[killerid][pKills]);
			if(++PlayerInfo[killerid][pTeamKills] > MAX_TEAMKILLS)
			{
				printf("����� %s ������ �� Team Kill", PlayerInfo[killerid][pName]);
				format(string, sizeof string, "***[ %s ] ��� ������ �� ��� ����� ��� ��� ���]", PlayerInfo[killerid][pName]);
				SendClientMessageToAll(COLOR_GRAY, string);
				SendClientMessage(killerid, COLOR_GRAY, "�� ���� ������� �� ���-�����!");
				Kick2(killerid);
				return 1;
			}
			format(string, sizeof string, "*** [ %s ] ��� ������� �� team-kill!", PlayerInfo[killerid][pName]);
			SendClientMessageToAll(COLOR_YELLOW, string);
			SetPlayerPos(killerid, -1350.1162, 994.3682, 1024.0056);
			SetPlayerInterior(killerid, 15);
		}
		else if(GetPlayerState(killerid) == PLAYER_STATE_DRIVER)
		{
			PlayerInfo[killerid][pKills]++;
			SetPlayerScore(killerid, PlayerInfo[killerid][pKills]);
			PlayerInfo[killerid][pMoney] -= 10000;
			printf("����� %s ������ �� Drive-By", PlayerInfo[killerid][pName]);
			format(string, sizeof string, "***[ %s ] ��� ������ �� ��!!!", PlayerInfo[killerid][pName]);
			SendClientMessageToAll(-1, string);
			Kick2(killerid);
			return 1;
		}
		else
		{
			GameTextForPlayer(killerid, "~r~Owned", 5000, 1);
			if(PlayerInfo[killerid][pDmZone] > 0) PlayerInfo[killerid][pDmPoints]++;
			else
			{
				PlayerInfo[killerid][pKills]++;
				SetPlayerScore(killerid, PlayerInfo[killerid][pKills]);
			}
			PlayerInfo[killerid][pMoney] += 1000;
		}
		for(new i = sizeof(Ranks) - 1; i >= 0; --i)
		{
			if(PlayerInfo[killerid][pKills] == Ranks[i][1][0])
			{
				SendClientMessageToAll(COLOR_BORDO, "____________________________");
				format(string, sizeof string, "...::: [%s] ������������� ������ \"%s (%d kill's)\" :::...", PlayerInfo[killerid][pName], Ranks[i][0], PlayerInfo[killerid][pKills]);
				SendClientMessageToAll(GetPlayerColor(killerid), string);
				break;
			}
		}
	}
	else if(PlayerInfo[playerid][pInPvp])
	{
		PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]] = false;
		PlayerInfo[playerid][pInPvp] = false;
		PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
		PlayerInfo[playerid][pMoney] -= PlayerInfo[playerid][pPvpMoney];
		format(string, sizeof string, "~r~-%d$", PlayerInfo[playerid][pPvpMoney]);
		GameTextForPlayer(playerid, string, 1000, 1);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][pInPvp] && PlayerInfo[i][pPvpPlace] == PlayerInfo[playerid][pPvpPlace])
			{
				PlayerInfo[i][pInPvp] = false;
				PlayerInfo[i][pPvpCreate] = INVALID_PLAYER_ID;
				PlayerInfo[i][pMoney] += PlayerInfo[playerid][pPvpMoney];
				format(string, sizeof string, "~g~+%d$", PlayerInfo[playerid][pPvpMoney]);
				GameTextForPlayer(i, string, 1000, 1);
				format(string, sizeof string, ">>> � PVP ����� �������� {FFFFFF}%s{00FF00} � {FFFFFF}%s{00FF00} ������� ����� {FFFFFF}%s. {00FF00}������� %d$", PlayerInfo[i][pName], PlayerInfo[playerid][pName], PlayerInfo[i][pName], PlayerInfo[playerid][pPvpMoney]);
				SendClientMessageToAll(COLOR_LIME_2, string);
				SpawnPlayer(i);
				break;
			}
		}
	}
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) SetPlayerInterior(i, newinteriorid);
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(!PlayerInfo[playerid][pLogged]) return SendClientMessage(playerid, COLOR_BORDO, "����� ������ � ���, ���������� ������������!"), 0;
	if(PlayerInfo[playerid][pMute]) return SendClientMessage(playerid, COLOR_RED, "�� �� ������ ������ � ���, �� ���������!"), 0;
	static string[145];
	if(PlayerInfo[playerid][pFloodTime] > gettime())
	{
		PlayerInfo[playerid][pFloodCount]++;
		if(PlayerInfo[playerid][pFloodCount] >= 3)
		{
			printf("����� %s ������ �� ���� � ����", PlayerInfo[playerid][pName]);
			format(string, sizeof string, "%s(ID: %d) ��� ������. �������: ����", PlayerInfo[playerid][pName], playerid);
			SendClientMessageToAll(COLOR_BORDO, string);
			Kick2(playerid);
			return 0;
		}
		else if(PlayerInfo[playerid][pFloodCount] >= 2) SendClientMessage(playerid, COLOR_RED, "�������� ��������������! ������ ���.");
		else SendClientMessage(playerid, COLOR_LIGHTBLUE, "�������������: �� �����!");
		return 0;
	}
	if(CheckAnyIP(text))
	{
		printf("����� %s ������� �� ������� � ����", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "SERVER: %s(%d) ������� �� �������. �������: �������", PlayerInfo[playerid][pName], playerid);
		SendClientMessageToAll(COLOR_BORDO, string);
		Ban2(playerid);
		return 0;
	}
	for(new s, i, pos, start, end; s < sizeof BadWords; s++)
	{
		pos = -1;
		while((pos = strfuzzyfind(text, BadWords[s], pos + 1, start, end)) != -1)
		{
			for(i = end; i >= start; --i) text[i] = '*';
		}
	}
	if(IsEmptyMessage(text)) return 0;
	if(PlayerInfo[playerid][pCaps]) UpperToLower(text);
	PlayerInfo[playerid][pFloodTime] = gettime() + 1;
	if(text[0] == '!')
	{
		if(IsEmptyMessage(text[1])) return 0;
		if(PlayerInfo[playerid][pGang] > 0)
		{
			format(string, sizeof string, "* ��� ����� %s >> �� %s: %s", GangName[PlayerInfo[playerid][pGang]], PlayerInfo[playerid][pName], text[1]);
			SendClientMessageToGang(PlayerInfo[playerid][pGang], GetPlayerColor(playerid), string);
		}
		else
		{
			format(string, sizeof string, "* ��� ����� %s >> �� %s: %s", DefaultGangNames[PlayerInfo[playerid][pTeam]], PlayerInfo[playerid][pName], text[1]);
			SendClientMessageToTeam(PlayerInfo[playerid][pTeam], GetPlayerColor(playerid), string);
		}
		return 0;
	}
	if(text[0] == '#' && IsPlayerAdminEx(playerid, 1))
	{
		if(IsEmptyMessage(text[1])) return 0;
		format(string, sizeof string, "* ��������� ���: %s: %s", PlayerInfo[playerid][pName], text[1]);
		SendClientMessageToAdmins(COLOR_LIME, string);
		return 0;
	}
	if(PlayerInfo[playerid][pGang] > 0 && GangTag[PlayerInfo[playerid][pGang]])
	{
		format(string, sizeof string, "[%s]%s(%d): {FFFFFF}%s", GangName[PlayerInfo[playerid][pGang]], PlayerInfo[playerid][pName], playerid, text);
		SendClientMessageToAll(GetPlayerColor(playerid), string);
		return 0;
	}
	format(string, sizeof string, "(%d): %s", playerid, text);
	SendPlayerMessageToAll(playerid, string);
	return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!PlayerInfo[playerid][pLogged]) return SendClientMessage(playerid, COLOR_RED, "*** ������: �� ������ ��������������");
	if(PlayerInfo[playerid][pJail]) return SendClientMessage(playerid, COLOR_RED, "�� �� ������ ������������ �������, �� � ������!");
	static string[145];
	if(PlayerInfo[playerid][pFloodTime] > gettime())
	{
		PlayerInfo[playerid][pFloodCount]++;
		if(PlayerInfo[playerid][pFloodCount] >= 3)
		{
			printf("����� %s ������ �� ���� ���������", PlayerInfo[playerid][pName]);
			format(string, sizeof string, "%s(ID: %d) ��� ������. �������: ����", PlayerInfo[playerid][pName], playerid);
			SendClientMessageToAll(COLOR_BORDO, string);
			Kick2(playerid);
			return 1;
		}
		else if(PlayerInfo[playerid][pFloodCount] >= 2) SendClientMessage(playerid, COLOR_RED, "�������� ��������������! ������ ���.");
		else SendClientMessage(playerid, COLOR_LIGHTBLUE, "�������������: �� �����!");
		return 1;
	}
	PlayerInfo[playerid][pFloodTime] = gettime() + 1;
	static cmd[32], tmp[32];
	string[0] = EOS;
	new idx;
	cmd = strtok(cmdtext, idx);
	format(string, sizeof string, "*** %s (ID:%d) ����������� �������: %s", PlayerInfo[playerid][pName], playerid, cmd);
	SendClientMessageToAdmins(COLOR_GRAY, string);
	if(!strcmp(cmd, "/stats", true))
	{
		tmp = strtok(cmdtext, idx);
		static string2[256];
		new player;
		if(!tmp[0]) player = playerid;
		else
		{
			player = strval(tmp);
			if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		}
		format(string, sizeof string, "{FFFF00}���������� %s", PlayerInfo[player][pName]);
		format(string2, sizeof string2, "�������: %d\n�������: %d\n����������: %0.2f\n�����: %d\nDM Points: %d\n�����: %s\n������� � �����: %d\n������: $%d\n����� �� �������: %d ���\n����������� ����������� �� PVP: %s\n����������� � �������: %d\n����� ���: %d\n����: %d", PlayerInfo[player][pKills],
		PlayerInfo[player][pDeaths], float(PlayerInfo[player][pKills]) / float(PlayerInfo[player][pDeaths]), PlayerInfo[player][pPoints], PlayerInfo[player][pDmPoints], (GangName[PlayerInfo[player][pGang]][0] ? GangName[PlayerInfo[player][pGang]] : "���"),
		PlayerInfo[player][pGangLvl], PlayerInfo[player][pMoney], floatround(PlayerInfo[player][pSeconds] / 3600, floatround_tozero), PlayerInfo[player][pPvpAccept] ? ("��") : ("���"), PlayerInfo[player][pConnectCount], PlayerInfo[playerid][pFightStyle], PlayerInfo[playerid][pSkin]);
		ShowPlayerDialog(playerid, DIALOG_STATS, DIALOG_STYLE_MSGBOX, string, string2, "��", "");
		return 1;
	}
	if(!strcmp(cmd, "/start", true))
	{
		if(BalloonIsStarted) return SendClientMessage(playerid, COLOR_BORDO, "��������� ��� ��� �������!");
		if(!IsPlayerInRangeOfPoint(playerid, 10.0, 836.08, -2000.51, 13.6)) return SendClientMessage(playerid, COLOR_BORDO, "�� ���������� ������� ������!");
		MoveObject(BalloonObj, 856.731, -2011.687, 45.7461, 3.0);
		Delete3DTextLabel(BalloonLabel);
		BalloonIsStarted = true;
		BalloonStage = 1;
		return 1;
	}
	if(!strcmp(cmd, "/spikes", true))
	{
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "*** ������: �� �� ������ ���������� � ����������!");
		if(PlayerInfo[playerid][pSpikesObj] <= 0)
		{
			new Float:plocx, Float:plocy, Float:plocz, Float:ploca;
			GetPlayerPos(playerid, plocx, plocy, plocz);
			GetPlayerFacingAngle(playerid, ploca);
			PlayerInfo[playerid][pSpikesObj] = CreateObject(2899, plocx, plocy, plocz - 0.9, 0.0, 0.0, ploca - 90.0);
		}
		else
		{
			DestroyObject(PlayerInfo[playerid][pSpikesObj]);
			PlayerInfo[playerid][pSpikesObj] = 0;
		}
		return 1;
	}
	if(!strcmp(cmd, "/dmpoints", true)) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM ����", "�������� ���� �� �����\n�������� ����� �� ����\n�������� ���� ������", "��", "������");
	if(!strcmp(cmd, "/tune", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** ������: �� ������ ���������� � ����������!");
		if(PlayerInfo[playerid][pMoney] < 500) return SendClientMessage(playerid, COLOR_BORDO, "� ��� ��������� �����!");
		if(!IsACar(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_RED, "������ ���������� ��� ����� ����������!");
		ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
		GameTextForPlayer(playerid, "~r~-500$", 1000, 1);
		PlayerInfo[playerid][pMoney] -= 500;
		return 1;
	}
	if(!strcmp(cmd, "/bloodring", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		SetPlayerPos(playerid, -1470.8719, 947.058, 1036.7661);
		SetPlayerFacingAngle(playerid, 332.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 15);
		SetCameraBehindPlayer(playerid);
		format(string, sizeof string, "%s ���������������� �� BloodRing (/bloodring)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "�� ����������������� �� BloodRing (/bloodring)");
		return 1;
	}
	if(!strcmp(cmd, "/report", true))
	{
		if(PlayerInfo[playerid][pMute]) return SendClientMessage(playerid, COLOR_RED, "�� �� ������ ������������ �������, �� ���������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /report [id] [�������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "������: �� �� ������ �������� ������ �� ������ ����");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /report [id] [�������]");
		format(string, sizeof string, "������ �� %s(%d) �� %s(%d): %s", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player, cmdtext[strfind(cmdtext, " ", true, 8) + 1]);
		SendClientMessageToAdmins(COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "���� ������ ���������� �������������");
		return 1;
	}
	if(!strcmp(cmd, "/icommands", true)) return ShowPlayerDialog(playerid, DIALOG_ICOMMANDS, DIALOG_STYLE_MSGBOX, "{FFFF00}������� �������", CmdsStr, "��", "");
	if(!strcmp(cmd, "/stuntpr", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		SetPlayerPos(playerid, 1285.0985, 2681.6624, 10.8203);
		SetPlayerFacingAngle(playerid, 0.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		format(string, sizeof string, "%s ���������������� � Stunt Park (/stuntpr)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "�� ����������������� � Stunt Park (/stuntpr)");
		return 1;
	}
	if(!strcmp(cmd, "/help", true)) return ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "{FFFF00}������", "� GangWar ����\n������� �� �����\n������� �� PVP\n������� �� ���������� �����������", "�������", "������");
	if(!strcmp(cmd, "/�����", true))
	{
		if(PlayerInfo[playerid][pCap]) RemovePlayerAttachedObject(playerid, 3);
		else SetPlayerAttachedObject(playerid, 3, 19066, 2, 0.13, 0.0, 0.0, 0.0, 90.0, 90.0);
		PlayerInfo[playerid][pCap] = !PlayerInfo[playerid][pCap];
		return 1;
	}
	if(!strcmp(cmd, "/rules", true)) return ShowPlayerDialog(playerid, DIALOG_RULES, DIALOG_STYLE_MSGBOX, "{FF0000}������� ��������� �� ������� GTA SA GangWar", RulesStr, "�������", "������");
	if(!strcmp(cmd, "/�������", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** ������: �� ������ ���������� � ����������!");
		new vehid = GetPlayerVehicleID(playerid);
		if(!IsACar(vehid)) return SendClientMessage(playerid, COLOR_RED, "������� ���������� ��� ����� ����������!");
		if(FlasherObj[vehid])
		{
			DestroyObject(FlasherObj[vehid]);
			FlasherObj[vehid] = 0;
		}
		else
		{
			FlasherObj[vehid] = CreateObject(19419, 0, 0, 0, 0, 0, 0, 0.0);
			AttachObjectToVehicle(FlasherObj[vehid], vehid, -0.0, -0.2, 0.74, 1.0, 1.0, 1.0);
		}
		return 1;
	}
	if(!strcmp(cmd, "/sadomazo", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		SetPlayerSkin(playerid, 178);
		SetPlayerPos(playerid, 2096.9209, 2062.2678, 10.8203);
		SetPlayerFacingAngle(playerid, 270.3132);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		GivePlayerWeapon(playerid, 10, 1);
		format(string, sizeof string, "%s ���������������� � Sex Shop (/sadomazo)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "�� ����������������� � Sex Shop (/sadomazo)");
		return 1;
	}
	if(!strcmp(cmd, "/shield", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_COPS, TEAM_ADMIN, TEAM_ARMY:
			{
				if(PlayerInfo[playerid][pShield]) RemovePlayerAttachedObject(playerid, 1);
				else SetPlayerAttachedObject(playerid, 1, 18637, 14, 0.0, 0.0, 0.0, 0.0, 180.0, 180.0);
				PlayerInfo[playerid][pShield] = !PlayerInfo[playerid][pShield];
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "������ ������� ���������� ����� �����!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/lock", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** ������: �� ������ ���������� � ����������!");
		new veh = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(veh, engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
		format(string, sizeof string, "***%s ������ ����� ������ ����������", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		return 1;
	}
	if(!strcmp(cmd, "/unlock", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** ������: �� ������ ���������� � ����������!");
		new veh = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(veh, engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
		format(string, sizeof string, "***%s ������ ����� ������ ����������", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		return 1;
	}
	if(!strcmp(cmd, "/����", true)) return ShowPlayerDialog(playerid, DIALOG_GLASSES, DIALOG_STYLE_LIST, "{FFFF00}����", "����� ����\n���� 1\n���� 2\n���� 3\n���� 4\n���� 5\n���� 6\n���� 7\n���� 8\n\
	���� 9\n���� 10\n���� 11\n���� 12\n���� 13\n���� 14\n���� 15\n���� 16\n���� 17\n���� 18\n���� 19\n���� 20\n���� 21\n���� 22\n���� 23\n���� 24\n���� 25\n���� 26\n���� 27\n���� 28\n���� 29\n���� 30", "�������", "������");
	if(!strcmp(cmd, "/avto", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** ������: �� ������ ���������� � ����������!");
		ShowPlayerDialog(playerid, DIALOG_AVTO, DIALOG_STYLE_LIST, "{FFFF00}����-����", AvtoStr, "�������", "������");
		return 1;
	}
	if(!strcmp(cmd, "/skin", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /skin [id �����]");
		new skinid = strval(tmp);
		if(!(0 <= skinid <= 311)) return SendClientMessage(playerid, COLOR_BORDO, "�� ����� �������� id �����. ����������� id �� 0 �� 311!");
		format(string, sizeof string, "�� �������� ���� ���� �� %d. �����������: /noskin ����� ���������� �� ����������� �����.", skinid);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pLastSkin] = GetPlayerSkin(playerid);
		PlayerInfo[playerid][pSkin] = skinid;
		SetPlayerSkin(playerid, skinid);
		return 1;
	}
	if(!strcmp(cmd, "/noskin", true))
	{
		if(PlayerInfo[playerid][pLastSkin] != -1)
		{
			PlayerInfo[playerid][pSkin] = PlayerInfo[playerid][pLastSkin];
			SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		}
		return 1;
	}
	if(!strcmp(cmd, "/drink", true)) return ShowPlayerDialog(playerid, DIALOG_DRINK, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "������\nBeer\nWine\nSprunk", "�������", "������");
	if(!strcmp(cmd, "/skydive", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz + 1500.0);
		GivePlayerWeapon(playerid, 46, 1);
		format(string, sizeof string, "%s �������� ������ � ���������! (/skydive)", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		SendClientMessage(playerid, -1, "GO GO GO!");
		return 1;
	}
	if(!strcmp(cmd, "/count", true))
	{
		if(CountStarted) return SendClientMessage(playerid, COLOR_DARKORANGE, "���-�� ��� ����� ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /count [1-5]");
		CountCmd = strval(tmp);
		if(!(1 <= CountCmd <= 5)) return SendClientMessage(playerid, COLOR_RED, "���������� ������ �� 1 �� 5!");
		format(string, sizeof string, "*** %s ����� ������.", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		format(string, sizeof string, "~y~%d", CountCmd);
		PlaySoundForAll(1056, 0.0, 0.0, 0.0);
		GameTextForAll(string, 1000, 3);
		SetTimer("CountFunc", 1000, 0);
		CountStarted = true;
		return 1;
	}
	if(!strcmp(cmd, "/drag", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		format(string, sizeof string, "%s ���������������� �� ���� ���� (/drag)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "�� ����������������� �� ���� ���� (/drag)");
		GameTextForPlayer(playerid, "~n~~n~~b~Welcome to Drag zone", 5000, 3);
		SetPlayerPos(playerid, -1662.0, -170.0, 15.0);
		SetPlayerFacingAngle(playerid, 133.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/china", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		format(string, sizeof string, "%s ���������������� � ��������� �������� (/china)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "�� ����������������� � ��������� �������� (/china)");
		SetPlayerPos(playerid, 1026.0891, -1307.3922, -21.0606);
		SetPlayerFacingAngle(playerid, 50.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/sjump", true))
	{
		switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
		{
			case 0, 461, 463, 468, 471, 521, 522, 581:
			{
				if(PlayerInfo[playerid][pMoney] < 1000) return SendClientMessage(playerid, COLOR_DARKRED, "� ��� ��������� �����!");
				SendClientMessage(playerid, COLOR_DARKRED, "����� ���������� �� BIGJUMP!");
				SetPlayerPos(playerid, 3170.7329, -1097.5336, 150.9375);
				PlayerInfo[playerid][pMoney] -= 1000;
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
			}
			default: return SendClientMessage(playerid, -1, "������ ����������������� �� BIGJUMP �� ���� ���������� !!!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/piss", true)) return SetPlayerSpecialAction(playerid, 68);
	if(!strcmp(cmd, "/vip", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		if(PlayerInfo[playerid][pMoney] < 1000) return SendClientMessage(playerid, COLOR_DARKRED, "� ��� ������������ �����!");
		SendClientMessage(playerid, COLOR_GREEN, "�� ����������������� �� ������ VIP");
		SendClientMessage(playerid, COLOR_GREEN, "VIP: ������� ������ /vipon");
		SendClientMessage(playerid, COLOR_GREEN, "VIP: ������� ������ /vipoff");
		SetPlayerPos(playerid, 88.3505, 288.4197, 2.6452);
		PlayerInfo[playerid][pMoney] -= 1000;
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/vipon", true))
	{
		SendClientMessage(playerid, COLOR_GREEN, "������ �� ������ VIP �������");
		MoveObject(VipGatesObj, 77.9044, 266.1524, 10.4453, 2.0);
		return 1;
	}
	if(!strcmp(cmd, "/vipoff", true))
	{
		SendClientMessage(playerid, COLOR_GREEN, "������ �� ������ VIP �������");
		MoveObject(VipGatesObj, 77.9044, 266.1524, 4.4453, 2.0);
		return 1;
	}
	if(!strcmp(cmd, "/dm", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��� ��������������� �� dm. ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "������: �� �� ������ ���������� � ����������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /dm [1-8]");
		new dmzone = strval(tmp);
		if(!(1 <= dmzone <= 8)) return SendClientMessage(playerid, -1, "�� ����� �������� dm ����. ����������� �� 1 �� 8.");
		if(PlayerInfo[playerid][pMoney] < 1000) return SendClientMessage(playerid, -1, "� ��� ��������� �����.");
		PlayerInfo[playerid][pMoney] -= 1000;
		GameTextForPlayer(playerid, "~r~-1000$", 1000, 1);
		PlayerInfo[playerid][pDmZone] = dmzone;
		if(dmzone != 8)
		{
			format(string, sizeof string, "*** %s ���������������� �� dm ���� � %d (/dm %d)", PlayerInfo[playerid][pName], dmzone, dmzone);
			SendClientMessageToAll(COLOR_YELLOW, string);
		}
		switch(dmzone)
		{
			case 1:
			{
				SetPlayerPos(playerid, -1301.9515, 2518.7886, 87.248);
				SetPlayerWorldBounds(playerid, -1251.6665, -1352.8558, 2583.0181, 2460.4827);
				SetPlayerFacingAngle(playerid, 173.0);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
			case 2:
			{
				SetPlayerPos(playerid, -1096.4175, -1646.427, 76.3672);
				SetPlayerWorldBounds(playerid, -1039.3718, -1131.6187, -1603.5472, -1693.9493);
				SetPlayerFacingAngle(playerid, 270.0);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
			case 3:
			{
				SetPlayerPos(playerid, -2660.0032, 1372.6454, 27.1563);
				SetPlayerWorldBounds(playerid, -2648.0581, -2666.4216, 1531.7625, 1370.8257);
				SetPlayerFacingAngle(playerid, 353.0);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
			case 4:
			{
				SetPlayerPos(playerid, 1371.752, 2172.3188, 11.0234);
				SetPlayerWorldBounds(playerid, 1418.5216, 1298.0614, 2219.1116, 2101.2573);
				SetPlayerFacingAngle(playerid, 130.0);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
			case 5:
			{
				SetPlayerPos(playerid, -2337.2522, -100.1541, 35.3203);
				SetPlayerWorldBounds(playerid, -2312.281, -2361.5796, -80.6321, -119.9467);
				SetPlayerFacingAngle(playerid, 270.0);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
			case 6:
			{
				SetPlayerPos(playerid, 1.5394, 23.4798, 1199.5938);
				SetPlayerWorldBounds(playerid, 4.3014, -1.1463, 37.5419, 20.5828);
				SetPlayerFacingAngle(playerid, 0.0);
				SetCameraBehindPlayer(playerid);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 1);
			}
			case 7:
			{
				SetPlayerPos(playerid, -1048.545, -1193.1093, 129.0607);
				SetPlayerWorldBounds(playerid, -1016.3928, -1087.9451, -1130.7377, -1250.1014);
				SetPlayerFacingAngle(playerid, 180.0);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
			case 8:
			{
				ResetPlayerWeapons(playerid);
				new rand = random(sizeof SniperDmSpawns);
				SetPlayerWorldBounds(playerid, 2750.1135, 2496.8916, 2858.3401, 2616.925);
				SetPlayerPos(playerid, SniperDmSpawns[rand][0], SniperDmSpawns[rand][1], SniperDmSpawns[rand][2]);
				format(string, sizeof string, "*** %s ���������������� �� \"sniper dm\" ���� � 8 (/dm 8)", PlayerInfo[playerid][pName]);
				SendClientMessageToAll(COLOR_YELLOW, string);
				SetPlayerFacingAngle(playerid, 90.0);
				GivePlayerWeapon(playerid, 34, 100);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
		}
		SendClientMessage(playerid, COLOR_YELLOW, "*** ����� �� ����: /exitdm");
		return 1;
	}
	if(!strcmp(cmd, "/exitdm", true))
	{
		if(PlayerInfo[playerid][pDmZone] < 1) return SendClientMessage(playerid, COLOR_YELLOW, "�� �� ���������� �� dm!");
		SendClientMessage(playerid, COLOR_YELLOW, "*** �� ����� � dm");
		SetPlayerWorldBounds(playerid, 20000.0, -20000.0, 20000.0, -20000.0);
		PlayerInfo[playerid][pDmZone] = 0;
		return 1;
	}
	if(!strcmp(cmd, "/pvp", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ��� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "������: �� �� ������ ���������� � ����������");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, -1, "�����������: /pvp [id ������] [id ������] [1/0 ������� �����] [����� (1-5)] [������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, -1, "����� � ��������� ���� id �� ������!");
		if(player == playerid) return SendClientMessage(playerid, -1, "�� �� ������ ��������� ��� �������� � ������ ����.");
		if(IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, -1, "������: ����� �� ������ ���������� � ����������");
		if(!PlayerInfo[player][pPvpAccept]) return SendClientMessage(playerid, COLOR_YELLOW, "����� �������� ����������� ������� � PVP");
		if(PlayerInfo[player][pInPvp]) return SendClientMessage(playerid, -1, "���� ����� ��� ��������� � PvP.");
		if(PlayerInfo[player][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: ���� ����� ��������� � �����.");
		if(PlayerInfo[player][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "����� ��������� �� dm!");
		if(PlayerInfo[player][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "���� ����� �������� ���������!");
		if(PlayerInfo[player][pJail]) return SendClientMessage(playerid, COLOR_RED, "������: ������ ����� � ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, -1, "�����������: /pvp [id ������] [id ������] [1/0 ������� �����] [����� (1-5)] [������]");
		new pvpweapon = strval(tmp);
		switch(pvpweapon)
		{
			case 16, 24, 25, 27, 29, 31, 34:
			{
				tmp = strtok(cmdtext, idx);
				if(!tmp[0]) return SendClientMessage(playerid, -1, "�����������: /pvp [id ������] [id ������] [1/0 ������� �����] [����� (1-5)] [������]");
				new pvparmour = strval(tmp);
				if(!(0 <= pvparmour <= 1)) return SendClientMessage(playerid, -1, "�� ����� �������� ������� �����. ��������� 1/0");
				tmp = strtok(cmdtext, idx);
				if(!tmp[0]) return SendClientMessage(playerid, -1, "�����������: /pvp [id ������] [id ������] [1/0 ������� �����] [����� (1-5)] [������]");
				new pvpplace = strval(tmp) - 1;
				if(!(0 <= pvpplace <= 4)) return SendClientMessage(playerid, -1, "�� ����� �������� �����. ����������� ����� �� 1 �� 5");
				if(PvpPlaceVisit[pvpplace]) return SendClientMessage(playerid, -1, "PvP-����� ������.");
				tmp = strtok(cmdtext, idx);
				if(!tmp[0]) return SendClientMessage(playerid, -1, "�����������: /pvp [id ������] [id ������] [1/0 ������� �����] [����� (1-5)] [������]");
				new pvpmoney = strval(tmp);
				if(!(1 <= pvpmoney <= 100000)) return SendClientMessage(playerid, -1, "�� ����� �������� ����� ������. ����������� ����� �� 1$ �� 100000$");
				if(pvpmoney > PlayerInfo[playerid][pMoney]) return SendClientMessage(playerid, -1, "� ��� ��������� �����.");
				if(pvpmoney > PlayerInfo[player][pMoney]) return SendClientMessage(playerid, -1, "� ���������� ��������� �����.");
				PlayerInfo[player][pPvpCreate] = playerid;
				PlayerInfo[playerid][pPvpWeapon] = pvpweapon;
				PlayerInfo[playerid][pPvpArmour] = pvparmour;
				PlayerInfo[playerid][pPvpPlace] = pvpplace;
				PlayerInfo[playerid][pPvpMoney] = pvpmoney;
				format(string, sizeof string, "�� ������� ���������� ������ {9DDAF2}%s{FFFFFF} �� PVP! ��������� ������.", PlayerInfo[player][pName]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "����� %s ���������� ���� �� PVP.\n\n������: %d\n�����: %d\n�����: %d\n������: %d$", PlayerInfo[playerid][pName], PlayerInfo[playerid][pPvpWeapon], PlayerInfo[playerid][pPvpArmour], PlayerInfo[playerid][pPvpPlace], PlayerInfo[playerid][pPvpMoney]);
				ShowPlayerDialog(player, DIALOG_PVP, DIALOG_STYLE_MSGBOX, "{FFFF00}����������� �� PVP", string, "��", "���");
			}
			default: SendClientMessage(playerid, -1, "�� ����� �������� id ������. ��������� id: 16, 24, 25, 27, 29, 31, 34");
		}
		return 1;
	}
	if(!strcmp(cmd, "/nopvp", true))
	{
		format(string, sizeof string, "�� %s ����������� ������� � PVP", PlayerInfo[playerid][pPvpAccept] ? ("���������") : ("��������"));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pPvpAccept] = !PlayerInfo[playerid][pPvpAccept];
		return 1;
	}
	if(!strcmp(cmd, "/joinrace", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "����� ��� ��������! ���������, ���� ��� ����������!");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		if(!RaceBusy) return SendClientMessage(playerid, COLOR_RED_RACE, "�� ������ ������ ��� �����, � ������� ����� ��������������!");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "�� ��� ���������� � �����!");
		if(IsPlayerInAnyVehicle(playerid))
		{
			PlayerInfo[playerid][pInRace] = true;
			SetTimerEx("SetupRaceForPlayer", 2500, 0, "i", playerid);
			return RemovePlayerFromVehicle(playerid);
		}
		SetupRaceForPlayer(playerid);
		PlayerInfo[playerid][pInRace] = true;
		return 1;
	}
	if(!strcmp(cmd, "/exitrace", true))
	{
		if(!PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ���������� � �����!");
		RaceJoinCount--;
		StopPlayerRace(playerid);
		TogglePlayerControllable(playerid, 1);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/mine", true))
	{
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, " ��� ������������� ������� �� �� ������ ���������� � ����������!");
		if(PlayerInfo[playerid][pMineStatus] > 0) return SendClientMessage(playerid, -1, " �� ��� ���������� ����!");
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		PlayerInfo[playerid][pMineObj][0] = CreateObject(2992, X, Y, Z - 0.85, 0.0, 0.0, 0.0);
		PlayerInfo[playerid][pMineObj][1] = CreateObject(19290, X, Y, Z - 0.85, 0.0, 0.0, 0.0);
		PlayerInfo[playerid][pMineLabel] = Text3D:-1;
		PlayerInfo[playerid][pMinePick] = -1;
		PlayerInfo[playerid][pMineStatus] = 1;
		PlayerInfo[playerid][pMineCount] = 11;
		MineCount(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/actions", true)) return ShowPlayerDialog(playerid, DIALOG_ACTIONS, DIALOG_STYLE_LIST, "{FFFF00}����������� �������� / ����� ��� / ������ ��������", "����������� ��������\n����� ���\n��������", "�������", "������");
	if(!strcmp(cmd, "/kill", true))
	{
		SetPlayerHealth(playerid, 0.0);
		GameTextForPlayer(playerid, "~r~Suicide", 5000, 1);
		return 1;
	}
	if(!strcmp(cmd, "/givemoney", true))
	{
		if(!PlayerInfo[playerid][pGiveMoney]) return SendClientMessage(playerid, COLOR_BORDO, "*** ���������� ������ ����� �� ����, ��� 1 ��� � 1 ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /givemoney [id] [summa]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /givemoney [id] [summa]");
		new moneys = strval(tmp);
		if(moneys < 1) return SendClientMessage(playerid, COLOR_BORDO, "�� ������� �������� �����!");
		if(PlayerInfo[playerid][pMoney] < moneys) return SendClientMessage(playerid, COLOR_BORDO, "� ��� �� ������� �����!");
		PlayerInfo[playerid][pMoney] -= moneys;
		PlayerInfo[player][pMoney] += moneys;
		format(string, sizeof string, "�� ��������� %s(ID: %d), $%d.", PlayerInfo[player][pName], player, moneys);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		format(string, sizeof string, "�� �������� $%d �� %s(ID: %d).", moneys, PlayerInfo[playerid][pName], playerid);
		SendClientMessage(player, COLOR_YELLOW, string);
		PlayerInfo[playerid][pGiveMoneyTmr] = SetTimerEx("GiveMoney", 1000 * 60, 0, "i", playerid);
		PlayerInfo[playerid][pGiveMoney] = false;
		return 1;
	}
	if(!strcmp(cmd, "/pm", true))
	{
		if(PlayerInfo[playerid][pMute]) return SendClientMessage(playerid, COLOR_RED, "�� �� ������ ������������ �������, �� ���������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /pm [id] [���������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ �������� PM ������ ����.");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /pm [id] [���������]");
		new pos = strfind(cmdtext, " ", true, 4) + 1;
		if(CheckAnyIP(cmdtext[pos]))
		{
			printf("����� %s ������� �� ������� � PM", PlayerInfo[playerid][pName]);
			format(string, sizeof string, "SERVER: %s(%d) ������� �� �������. �������: ������� � PM", PlayerInfo[playerid][pName], playerid);
			SendClientMessageToAll(COLOR_BORDO, string);
			Ban2(playerid);
			return 1;
		}
		format(string, sizeof string, "�� ������� PM %s(%d): %s", PlayerInfo[player][pName], player, cmdtext[pos]);
		SendClientMessage(playerid, COLOR_YELLOW_2, string);
		format(string, sizeof string, "�� �������� PM �� %s(%d): %s", PlayerInfo[playerid][pName], playerid, cmdtext[pos]);
		SendClientMessage(player, COLOR_YELLOW, string);
		if(EarsIsEnabled)
		{
			format(string, sizeof string, "PM �� %s(%d) ��� %s(%d): %s", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player, cmdtext[pos]);
			for(new i = GetPlayerPoolSize(); i >= 0; --i)
			{
				if(IsPlayerConnected(i) && IsPlayerAdminEx(i, 10)) SendClientMessage(i, COLOR_YELLOW, string);
			}
		}
		PlayerPlaySound(player, 1085, 0.0, 0.0, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/ky", true))
	{
		format(string, sizeof string, "..:: %s ������������ ����!!! ::..", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/hi", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /hi [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ������� ���� id!");
		format(string, sizeof string, "..:: %s[%d] ������������ %s[%d]!!! ::..", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/bb", true))
	{
		format(string, sizeof string, "..:: %s ��������� �� �����!!! ::..", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/by", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /by [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ������� ������ ����!");
		format(string, sizeof string, "..:: %s[%d] ��������� � %s[%d]!!! ::..", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/porvu", true))
	{
		if(!PlayerInfo[playerid][pPromise]) return SendClientMessage(playerid, COLOR_BORDO, "*** ������ ������� ����� ������������ �� ����, ��� 1 ��� � 30 ������!");
		format(string, sizeof string, "..:: %s ������� ���� �������!!! ::..", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_LIME, string);
		PlayerInfo[playerid][pPromiseTmr] = SetTimerEx("Promise", 1000 * 30, 0, "i", playerid);
		PlayerInfo[playerid][pPromise] = false;
		return 1;
	}
	if(!strcmp(cmd, "/radio", true)) return ShowPlayerDialog(playerid, DIALOG_RADIO, DIALOG_STYLE_LIST, "{FFFF00}������ �����", "��������� �����\nLove �����\nKiss FM\n����� ������\n����� ������\nSky Radio\nEuropa +\nRadio aplus", "�������", "������");
	if(!strcmp(cmd, "/changepass", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /changepass [����� ������]");
		if(strlen(tmp) < 4) return SendClientMessage(playerid, COLOR_RED, "������ ������ �������� ��� ������� �� 4 ��������!");
		if(strlen(tmp) > 31) return SendClientMessage(playerid, COLOR_RED, "����� ������ ������ ���� ������ 32 ��������!");
		format(PlayerInfo[playerid][pPass], MAX_PASSWORD_LENGTH, "%s", tmp);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		format(string, sizeof string, "�������: ������ ������� ������� �� [ %s ]", PlayerInfo[playerid][pPass]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		return 1;
	}
	if(!strcmp(cmd, "/resetstats", true))
	{
		PlayerInfo[playerid][pKills] = 0;
		PlayerInfo[playerid][pDeaths] = 0;
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		SetPlayerScore(playerid, PlayerInfo[playerid][pKills]);
		SendClientMessage(playerid, COLOR_YELLOW, "�������: ���������� ������� ��������. ���� �������� � ������: 0");
		return 1;
	}
	if(!strcmp(cmd, "/engine", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "��� ������������� ������� �� ������ ���������� � ����������!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, !engine, lights, alarm, doors, bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/bonnet", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "��� ������������� ������� �� ������ ���������� � ����������!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, alarm, doors, !bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/boot", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "��� ������������� ������� �� ������ ���������� � ����������!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, !boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/lights", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "��� ������������� ������� �� ������ ���������� � ����������!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, !lights, alarm, doors, bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/alarm", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "��� ������������� ������� �� ������ ���������� � ����������!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, !alarm, doors, bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/nomer", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "��� ������������� ������� �� ������ ���������� � ����������!");
		ShowPlayerDialog(playerid, DIALOG_CHANGE_NUMBER, DIALOG_STYLE_INPUT, "{FFFF00}����� ������", "������� ����� ����� ����������:", "�������", "������");
		return 1;
	}
	if(!strcmp(cmd, "/objective", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "��� ������������� ������� �� ������ ���������� � ����������!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, !objective);
		return 1;
	}
	if(!strcmp(cmd, "/dance", true))
	{
		new dance = strval(strtok(cmdtext, idx));
		if(!(1 <= dance <= 4)) return SendClientMessage(playerid, COLOR_RED, "�����������: /dance [1-4]");
		SetPlayerSpecialAction(playerid, dance + 4);
		return 1;
	}
	if(!strcmp(cmd, "/gang", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		return 1;
	}
	if(!strcmp(cmd, "/�����", true))
	{
		static string2[256];
		string2[0] = EOS;
		for(new i = 1; i < MAX_GANGS; i++)
		{
			if(Gang[i])
			{
				format(string, sizeof string, "%d. ����� \"%s\"\n", i, GangName[i]);
				strcat(string2, string);
			}
		}
		if(!string2[0]) return ShowPlayerDialog(playerid, DIALOG_GANGS, DIALOG_STYLE_MSGBOX, "{FFFF00}�����", "����� �� �������", "��", "");
		ShowPlayerDialog(playerid, DIALOG_GANGS, DIALOG_STYLE_LIST, "{FFFF00}�����", string2, "��", "������");
		return 1;
	}
	if(!strcmp(cmd, "/listrace", true))
	{
		LoadRaceNames();
		static string2[256];
		string2[0] = EOS;
		for(new i; i < TotalRaces; i++)
		{
			strcat(string2, RaceNames[i]);
			strcat(string2, "\n");
		}
		ShowPlayerDialog(playerid, DIALOG_RACES, DIALOG_STYLE_MSGBOX, "{FFFF00}��������� �����", string2, "��", "");
		return 1;
	}
	if(!strcmp(cmd, "/toprace", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED_RACE, "�����������: /toprace [racename]");
		format(string, sizeof string, "/rRaceSystem/%s.RRACE", tmp);
		if(!fexist(string)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: ����� �� ����������!");
		new iniFile = ini_openFile(string);
		static string2[64];
		if(iniFile >= INI_OK)
		{
			string[0] = EOS;
			static name[MAX_PLAYER_NAME + 1];
			for(new i, time, TempTime1, TempTime2, TempTime3; i < 5; i++)
			{
				format(string2, sizeof string2, "BestRacerTime_%d", i);
				ini_getInteger(iniFile, string2, time);
				format(string2, sizeof string2, "BestRacer_%d", i);
				ini_getString(iniFile, string2, name);
				ConvertTime(var, time, TempTime1, TempTime2, TempTime3);
				format(string2, sizeof string2, "%d. %s\t%02d:%02d.%03d\n", i + 1, name, TempTime1, TempTime2, TempTime3);
				strcat(string, string2);
			}
			ini_closeFile(iniFile);
		}
		format(string2, sizeof string2, "{FFFF00}���������� ����� %s", tmp);
		ShowPlayerDialog(playerid, DIALOG_RACE_TOP, DIALOG_STYLE_MSGBOX, string2, string, "��", "");
		return 1;
	}
	if(!strcmp(cmd, "/opengate", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_MAFIA, TEAM_ADMIN:
			{
				MoveObject(iGateObj, 2223.8757, -2205.9118, 13.5468, 2.5);
				MoveObject(iGate4Obj, 2223.8757, -2205.9118, 13.5468, 2.5);
				GameTextForPlayer(playerid, "~w~BOPO�A O�KP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
			}
			case TEAM_ARMY:
			{
				MoveObject(iGate2Obj, 2720.827, -2414.449, 13.46094, 3.0);
				GameTextForPlayer(playerid, "~w~BOPO�A O�KP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "���� ����� �� ����� ��������� ������!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/opengate2", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_ADMIN:
			{
				MoveObject(iGate3Obj, 2720.827, -2514.226, 13.4609, 3.0);
				GameTextForPlayer(playerid, "BOPO�A O�KP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
			}
			case TEAM_ARMY:
			{
				MoveObject(iGate3Obj, 2720.827, -2514.226, 13.4609, 3.0);
				GameTextForPlayer(playerid, "~w~BOPO�A O�KP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "���� ����� �� ����� ��������� ������!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/closegate", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_ADMIN, TEAM_MAFIA:
			{
				MoveObject(iGateObj, 2233.8757, -2214.9118, 13.5468, 2.5);
				MoveObject(iGate4Obj, 2236.8757, -2217.9118, 13.5468, 2.5);
				GameTextForPlayer(playerid, "~w~BOPO�A �AKP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
			}
			case TEAM_ARMY:
			{
				MoveObject(iGate2Obj, 2720.827, -2405.449, 13.4609, 2.5);
				GameTextForPlayer(playerid, "~w~BOPO�A �AKP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "���� ����� �� ����� ��������� ������!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/closegate2", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_ADMIN, TEAM_ARMY:
			{
				MoveObject(iGate3Obj, 2720.827, -2504.226, 13.4609, 2.5);
				GameTextForPlayer(playerid, "~w~BOPO�A �AKP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "���� ����� �� ����� ��������� ������!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/closeallgates", true))
	{
		if(PlayerInfo[playerid][pTeam] == TEAM_ADMIN)
		{
			MoveObject(iGateObj, 2233.8757, -2214.9118, 13.5468, 2.5);
			MoveObject(iGate4Obj, 2236.8757, -2217.9118, 13.5468, 2.5);
			MoveObject(iGate2Obj, 2720.827, -2405.449, 13.4609, 2.5);
			MoveObject(iGate3Obj, 2720.827, -2504.226, 13.4609, 2.5);
			GameTextForPlayer(playerid, "~w~BOPO�A �AKP�BA��C�, �O�A��YC�A ����E...", 4000, 3);
		}
		return 1;
	}
	if(!strcmp(cmd, "/startrace", true))
	{
		if(!IsPlayerAdminEx(playerid, 1)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ��������� ���������������!");
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ���������� � PvP.");
		if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
		if(AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "������ �������� ����������, �������� �������������� �����!");
		if(BuildRace > 0) return SendClientMessage(playerid, COLOR_RED_RACE, "�� ������ ������ ���-�� ��� ������ �����!");
		if(RaceBusy || RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "���������, ���� ���������� ������� �����!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED_RACE, "�����������: /startrace [racename]");
		printf("����� %s �������� ����� %s", PlayerInfo[playerid][pName], tmp);
		LoadRace(tmp, playerid);
		return 1;
	}
	if(!strcmp(cmd, "/stoprace", true))
	{
		if(!IsPlayerAdminEx(playerid, 1)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ��������� ���������������!");
		if(!RaceBusy || !RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "�� ������ ������ ��� �����, ������� ����� ����������!");
		SendClientMessageToAll(COLOR_RED_RACE, "������������� ��������� ������� �����!");
		printf("����� %s ��������� ������� �����", PlayerInfo[playerid][pName]);
		StopRace();
		return 1;
	}
	if(!strcmp(cmd, "/admins", true))
	{
		if(!IsPlayerAdminEx(playerid, 1)) return SendClientMessage(playerid, COLOR_RED, "�� �� ��������� ���������������!");
		static string2[256];
		string2[0] = EOS;
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && IsPlayerAdminEx(i, 1))
			{
				format(string, sizeof string, "�����: %s [ID %d] [������� %d]\n", PlayerInfo[i][pName], i, PlayerInfo[i][pAdmin]);
				strcat(string2, string);
			}
		}
		if(!string2[0]) strcat(string2, "� ������ ������ ��� ������� ������");
		ShowPlayerDialog(playerid, DIALOG_ADMINS, DIALOG_STYLE_MSGBOX, "{FFFF00}������ ������", string2, "��", "");
		return 1;
	}
	if(!strcmp(cmd, "/buildrace", true))
	{
		if(!IsPlayerAdminEx(playerid, 2)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ��������� ���������������!");
		if(BuildRace > 0) return SendClientMessage(playerid, COLOR_RED_RACE, "�� ������ ������ ���-�� ��� ������ �����!");
		if(RaceBusy) return SendClientMessage(playerid, COLOR_RED_RACE, "���������, ���� ���������� ������� �����!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ������ ���������� � ������!");
		ShowPlayerDialog(playerid, DIALOG_RACE_CREATE, DIALOG_STYLE_LIST, "{FFFF00}�������� ����� �����", "������� �����\n��������� �����", "�����", "�����");
		BuildRace = playerid + 1;
		return 1;
	}
	if(!strcmp(cmd, "/ltc", true))
	{
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� ��� ���������� � ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /ltc [1-13]");
		new modelid = strval(tmp);
		if(!(1 <= modelid <= 13)) return SendClientMessage(playerid, COLOR_RED, "����������� ������ �� 1 �� 13!");
		new Float:x, Float:y, Float:z, Float:a, vid;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);
		switch(modelid)
		{
			case 1, 2, 3:
			{
				vid = CreateVehicle(560, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1028);
				AddVehicleComponent(vid, 1030);
				AddVehicleComponent(vid, 1031);
				AddVehicleComponent(vid, 1080);
				AddVehicleComponent(vid, 1086);
				AddVehicleComponent(vid, 1087);
				AddVehicleComponent(vid, 1138);
				AddVehicleComponent(vid, 1140);
				AddVehicleComponent(vid, 1170);
				ChangeVehiclePaintjob(vid, modelid - 1);
			}
			case 4:
			{
				vid = CreateVehicle(559, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1065);
				AddVehicleComponent(vid, 1067);
				AddVehicleComponent(vid, 1073);
				AddVehicleComponent(vid, 1162);
				ChangeVehiclePaintjob(vid, 1);
			}
			case 5:
			{
				vid = CreateVehicle(565, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1046);
				AddVehicleComponent(vid, 1049);
				AddVehicleComponent(vid, 1053);
				AddVehicleComponent(vid, 1073);
				ChangeVehiclePaintjob(vid, 1);
			}
			case 6, 10:
			{
				vid = CreateVehicle(558, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1092);
				if(modelid == 6)
				{
					AddVehicleComponent(vid, 1073);
					AddVehicleComponent(vid, 1088);
					AddVehicleComponent(vid, 1139);
					ChangeVehiclePaintjob(vid, 1);
				}
				else
				{
					AddVehicleComponent(vid, 1087);
					AddVehicleComponent(vid, 1090);
					AddVehicleComponent(vid, 1091);
					AddVehicleComponent(vid, 1094);
					AddVehicleComponent(vid, 1163);
					AddVehicleComponent(vid, 1166);
					AddVehicleComponent(vid, 1165);
					ChangeVehiclePaintjob(vid, 2);
				}
			}
			case 7:
			{
				vid = CreateVehicle(561, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1055);
				AddVehicleComponent(vid, 1058);
				AddVehicleComponent(vid, 1064);
				AddVehicleComponent(vid, 1073);
				ChangeVehiclePaintjob(vid, 1);
			}
			case 8, 13:
			{
				vid = CreateVehicle(562, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1034);
				AddVehicleComponent(vid, 1038);
				AddVehicleComponent(vid, 1073);
				AddVehicleComponent(vid, 1147);
				if(modelid == 8) ChangeVehiclePaintjob(vid, 1);
				else ChangeVehiclePaintjob(vid, 0);
			}
			case 9:
			{
				vid = CreateVehicle(567, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1085);
				AddVehicleComponent(vid, 1086);
				AddVehicleComponent(vid, 1087);
				AddVehicleComponent(vid, 1102);
				AddVehicleComponent(vid, 1129);
				AddVehicleComponent(vid, 1133);
				AddVehicleComponent(vid, 1186);
				AddVehicleComponent(vid, 1188);
				ChangeVehiclePaintjob(vid, 1);
			}
			case 11:
			{
				vid = CreateVehicle(557, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1081);
			}
			case 12:
			{
				vid = CreateVehicle(535, x, y, z, a, random(256), random(256), -1);
				AddVehicleComponent(vid, 1010);
				AddVehicleComponent(vid, 1073);
				AddVehicleComponent(vid, 1081);
				AddVehicleComponent(vid, 1087);
				AddVehicleComponent(vid, 1109);
				AddVehicleComponent(vid, 1114);
				AddVehicleComponent(vid, 1115);
				AddVehicleComponent(vid, 1117);
				AddVehicleComponent(vid, 1119);
				AddVehicleComponent(vid, 1121);
				ChangeVehiclePaintjob(vid, 1);
			}
		}
		SetVehicleVirtualWorld(vid, GetPlayerVirtualWorld(playerid));
		LinkVehicleToInterior(vid, GetPlayerInterior(playerid));
		PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		PutPlayerInVehicle(playerid, vid, 0);
		return 1;
	}
	if(!strcmp(cmd, "/givecar", true))
	{
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /givecar [id] [model]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /givecar [id] [model]");
		new modelid = strval(tmp);
		if(!(400 <= modelid <= 611)) return SendClientMessage(playerid, COLOR_RED, "����������� ������ �� 400 �� 611!");
		format(string, sizeof string, "�� ���� ������ %s ������. ������: %d", PlayerInfo[player][pName], modelid);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��� ��� ������. ������: %d", PlayerInfo[playerid][pName], modelid);
		SendClientMessage(player, COLOR_BLUE, string);
		new Float:x, Float:y, Float:z, Float:a;
		GetPlayerPos(player, x, y, z);
		GetPlayerFacingAngle(player, a);
		new vid = CreateVehicle(modelid, x, y, z, a, random(256), random(256), -1);
		SetVehicleVirtualWorld(vid, GetPlayerVirtualWorld(player));
		LinkVehicleToInterior(vid, GetPlayerInterior(player));
		PutPlayerInVehicle(player, vid, 0);
		return 1;
	}
	if(!strcmp(cmd, "/destroycar", true))
	{
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "������: �� �� � ����������!");
		DestroyVehicle(GetPlayerVehicleID(playerid));
		return 1;
	}
	if(!strcmp(cmd, "/fixcar", true))
	{
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0])
		{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "�� �� � ����������!");
			new Float:x, Float:y, Float:z, Float:a, vehid = GetPlayerVehicleID(playerid);
			GetVehiclePos(vehid, x, y, z);
			GetVehicleZAngle(vehid, a);
			SetVehiclePos(vehid, x, y, z);
			SetVehicleZAngle(vehid, a);
			return RepairVehicle(vehid);
		}
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(!IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, -1, "������ ����� �� � ����������!");
		new Float:x, Float:y, Float:z, Float:a, vehid = GetPlayerVehicleID(player);
		GetVehiclePos(vehid, x, y, z);
		GetVehicleZAngle(vehid, a);
		SetVehiclePos(vehid, x, y, z);
		SetVehicleZAngle(vehid, a);
		RepairVehicle(vehid);
		return 1;
	}
	if(!strcmp(cmd, "/getinfo", true))
	{
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /getinfo [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		static string2[256], ip[16];
		new Float:health, Float:armour;
		GetPlayerHealth(player, health);
		GetPlayerArmour(player, armour);
		GetPlayerIp(player, ip, sizeof ip);
		format(string, sizeof string, "{FFFF00}���������� � %s", PlayerInfo[player][pName]);
		format(string2, sizeof string2, "��������: %.1f\n�����: %.2f\n������: %d\n��������: %d\nIP �����: %s\nPing: %d\n�������: %d\n�����: %s\nScore: %d\n����: %d\n\
		� ������: %s", health, armour, GetPlayerMoney(player), GetPlayerInterior(player), ip, GetPlayerPing(player), GetPlayerAmmo(player), DefaultGangNames[PlayerInfo[player][pTeam]], GetPlayerScore(player), GetPlayerSkin(player), PlayerInfo[player][pJail] ? ("��") : ("���"));
		ShowPlayerDialog(playerid, DIALOG_PLAYER_INFO, DIALOG_STYLE_MSGBOX, string, string2, "��", "");
		return 1;
	}
	if(!strcmp(cmd, "/startautorace", true))
	{
		if(!IsPlayerAdminEx(playerid, 4)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ��������� ���������������!");
		if(RaceBusy || RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "���������, ���� ���������� ������� �����!");
		if(AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "�������������� ����� ��� �������!");
		printf("����� %s ������� �������������� ����� ������� �����", PlayerInfo[playerid][pName]);
		AutomaticRace = true;
		LoadRaceNames();
		LoadRace(RaceNames[random(TotalRaces)]);
		SendClientMessage(playerid, COLOR_GREEN_RACE, "�� �������� �������������� �����! ����� ���������� ��������� ����� ����� ��������� ����������!");
		return 1;
	}
	if(!strcmp(cmd, "/stopautorace", true))
	{
		if(!IsPlayerAdminEx(playerid, 4)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ��������� ���������������!");
		if(!AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "�������������� ����� ��� ��������!");
		printf("����� %s �������� �������������� ����� ������� �����", PlayerInfo[playerid][pName]);
		AutomaticRace = false;
		return 1;
	}
	if(!strcmp(cmd, "/delrace", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ��������� ���������������!");
		if(AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "������ �������� ����������, �������� �������������� �����!");
		if(BuildRace > 0) return SendClientMessage(playerid, COLOR_RED_RACE, "�� ������ ������ ���-�� ��� ������ �����!");
		if(RaceBusy || RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "���������, ���� ���������� ������� �����!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED_RACE, "�����������: /delrace [racename]");
		printf("����� %s ������ ����� %s", PlayerInfo[playerid][pName], tmp);
		DeleteRace(tmp, playerid);
		return 1;
	}
	if(!strcmp(cmd, "/deltoprace", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED_RACE, "�� �� ��������� ���������������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED_RACE, "�����������: /deltoprace [racename]");
		format(string, sizeof string, "/rRaceSystem/%s.RRACE", tmp);
		if(!fexist(string)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: ����� �� ����������!");
		SendClientMessage(playerid, COLOR_YELLOW, "RACE: ���������� ����� ��������!");
		printf("����� %s ������� ���������� ����� %s", PlayerInfo[playerid][pName], tmp);
		new iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			for(new i; i < 5; i++)
			{
				format(string, sizeof string, "BestRacerTime_%d", i);
				ini_setInteger(iniFile, string, 0);
				format(string, sizeof string, "BestRacer_%d", i);
				ini_setString(iniFile, string, "noone");
			}
			ini_closeFile(iniFile);
		}
		return 1;
	}
	if(!strcmp(cmd, "/a", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		format(string, sizeof string, "*** ������������� %s: %s", PlayerInfo[playerid][pName], cmdtext[3]);
		SendClientMessageToAll(COLOR_RED, string);
		return 1;
	}
	if(!strcmp(cmd, "/slap", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /slap [id] [�������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /slap [id] [�������]");
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(player, slx, sly, slz);
		SetPlayerPos(player, slx, sly, slz + 5.0);
		PlayerPlaySound(player, 1130, 0.0, 0.0, 0.0);
		printf("����� %s ���� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ���� ���. �������: %s", PlayerInfo[playerid][pName], cmdtext[strfind(cmdtext, " ", true, 6) + 1]);
		SendClientMessage(player, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/freeze", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /freeze [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		TogglePlayerControllable(player, 0);
		printf("����� %s ��������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ��������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/unfreeze", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /unfreeze [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		TogglePlayerControllable(player, 1);
		printf("����� %s ���������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ���������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/disarm", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /disarm [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		printf("����� %s ���������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "�� ����������� ������ %s", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ���������� ���", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		ResetPlayerWeapons(player);
		return 1;
	}
	if(!strcmp(cmd, "/spec", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /spec [id]");
		new specid = strval(tmp);
		if(!IsPlayerConnected(specid)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(specid == playerid) return SendClientMessage(playerid, COLOR_GRAY, "�� �� ������ ��������� �� ����� �����!");
		if(PlayerInfo[playerid][pSpec] != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_BORDO, "�� ��� ����� ����������!");
		if(GetPlayerAdmin(specid) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		TogglePlayerSpectating(playerid, 1);
		if(IsPlayerInAnyVehicle(specid)) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(specid));
		else PlayerSpectatePlayer(playerid, specid);
		PlayerInfo[playerid][pSpec] = specid;
		SetPlayerInterior(playerid, GetPlayerInterior(specid));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(specid));
		SendClientMessage(playerid, COLOR_BLUE, "������ ������");
		return 1;
	}
	if(!strcmp(cmd, "/specoff", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(PlayerInfo[playerid][pSpec] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ����� ����������!");
		TogglePlayerSpectating(playerid, 0);
		PlayerInfo[playerid][pSpec] = INVALID_PLAYER_ID;
		SendClientMessage(playerid, COLOR_BLUE, "������ ����������");
		return 1;
	}
	if(!strcmp(cmd, "/caps", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /caps [id] [����� (���)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		if(PlayerInfo[player][pCaps]) return SendClientMessage(playerid, COLOR_RED, "������� ������ ��� ��������� ������������� ��������� ����!");
		PlayerInfo[player][pCaps] = true;
		printf("����� %s �������� ������������� ��������� ���� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s �������� ������������� ��������� ���� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/uncaps", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /unmute [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(!PlayerInfo[player][pCaps]) return SendClientMessage(playerid, COLOR_RED, "������� ������ ��� ��������� ������������� ��������� ����!");
		PlayerInfo[player][pCaps] = false;
		printf("����� %s �������� ������������� ��������� ���� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s �������� ������������� ��������� ���� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/mute", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /mute [id] [����� (���)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /mute [id] [����� (���)]");
		new time = strval(tmp);
		if(time < 1) return SendClientMessage(playerid, COLOR_GRAY, "����� �������� ������� �������!");
		PlayerInfo[player][pMute] = true;
		PlayerInfo[player][pMuteTime] = time * 60;
		printf("����� %s ������� ������ %s �� %d �����", PlayerInfo[playerid][pName], PlayerInfo[player][pName], time);
		format(string, sizeof string, "����� %s ������� ������ %s �� %d �����", PlayerInfo[playerid][pName], PlayerInfo[player][pName], time);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/unmute", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /unmute [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		PlayerInfo[player][pMute] = false;
		PlayerInfo[player][pMuteTime] = 0;
		printf("����� %s ���� ������� � ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ���� ������� � ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setskin", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setskin [id] [skin]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setskin [id] [skin]");
		new skin = strval(tmp);
		if(!(0 <= skin <= 311)) return SendClientMessage(playerid, COLOR_RED, "�� ������� �������� ID �����!");
		format(string, sizeof string, "�� ���������� %d ���� ������ %s", skin, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��������� ��� %d ����", PlayerInfo[playerid][pName], skin);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerSkin(player, skin);
		return 1;
	}
	if(!strcmp(cmd, "/setvw", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setvw [id] [vw]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setvw [id] [vw]");
		new vw = strval(tmp);
		format(string, sizeof string, "�� ���������� ������ %s ����������� ��� �� %d", PlayerInfo[player][pName], vw);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��������� ��� ����������� ��� �� %d", PlayerInfo[playerid][pName], vw);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerVirtualWorld(player, vw);
		return 1;
	}
	if(!strcmp(cmd, "/setint", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setint [id] [interior]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setint [id] [interior]");
		new interior = strval(tmp);
		format(string, sizeof string, "�� ���������� ������ %s �������� �� %d", PlayerInfo[player][pName], interior);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��������� ��� �������� �� %d", PlayerInfo[playerid][pName], interior);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerInterior(player, interior);
		return 1;
	}
	if(!strcmp(cmd, "/sethp", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /sethp [id] [���-��]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /sethp [id] [���-��]");
		new Float:hp = floatstr(tmp);
		printf("����� %s ��������� �������� ������ %s �� %.0f", PlayerInfo[playerid][pName], PlayerInfo[player][pName], hp);
		format(string, sizeof string, "�� ���������� ������ %s �������� �� %.0f", PlayerInfo[player][pName], hp);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��������� ��� �������� �� %.0f", PlayerInfo[playerid][pName], hp);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerHealth(player, hp);
		return 1;
	}
	if(!strcmp(cmd, "/carhealth", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /carhealth [playerid] [���-��]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(!IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, COLOR_BORDO, "������ ����� �� � ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /carhealth [playerid] [���-��]");
		new Float:hp = floatstr(tmp);
		if(!(0.0 <= hp <= 1000000.0)) return SendClientMessage(playerid, COLOR_BORDO, "������: ����������� ������� ���������� hp");
		format(string, sizeof string, "�� ���������� �������� ������ ������ %s �� %.0f", PlayerInfo[player][pName], hp);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��������� �������� ����� ������ �� %.0f", PlayerInfo[playerid][pName], hp);
		SendClientMessage(player, COLOR_BLUE, string);
		SetVehicleHealth(GetPlayerVehicleID(player), hp);
		return 1;
	}
	if(!strcmp(cmd, "/eject", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /eject [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		if(!IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, COLOR_RED, "������ ����� �� � ������!");
		printf("����� %s ������� �� ���� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "�� �������� ������ %s �� ����", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ������� ��� �� ����", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		RemovePlayerFromVehicle(player);
		return 1;
	}
	if(!strcmp(cmd, "/jail", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /jail [id] [����� (���)] [�������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		if(PlayerInfo[player][pJail]) return SendClientMessage(playerid, COLOR_RED, "������ ����� ��� ��������� � ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /jail [id] [����� (���)] [�������]");
		new time = strval(tmp);
		if(time < 1) return SendClientMessage(playerid, COLOR_GRAY, "����� ������� ������� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /jail [id] [����� (���)] [�������]");
		if(PlayerInfo[player][pDmZone] > 0)
		{
			SetPlayerWorldBounds(player, 20000.0, -20000.0, 20000.0, -20000.0);
			PlayerInfo[player][pDmZone] = 0;
		}
		else if(PlayerInfo[player][pInRace])
		{
			RaceJoinCount--;
			StopPlayerRace(player);
		}
		else if(PlayerInfo[player][pInPvp])
		{
			PlayerInfo[player][pInPvp] = false;
			PlayerInfo[player][pPvpCreate] = INVALID_PLAYER_ID;
		}
		SetTimerEx("Jail", 1000, 0, "iii", player, time, 1);
		printf("����� %s ������� � ������ ������ %s �� %d �����", PlayerInfo[playerid][pName], PlayerInfo[player][pName], time);
		format(string, sizeof string, "����� %s ������� ������ %s � ������ �� %d �����. �������: %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName], time, cmdtext[strfind(cmdtext, " ", true, 8) + 1]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/unjail", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /unjail [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(!PlayerInfo[player][pJail]) return SendClientMessage(playerid, COLOR_RED, "������ ����� �� ��������� � ������!");
		printf("����� %s ��������� �� ������ ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ��������� ������ %s �� ������", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		UnJail(player);
		return 1;
	}
	if(!strcmp(cmd, "/explode", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /explode [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		new Float:ePosX, Float:ePosY, Float:ePosZ;
		GetPlayerPos(player, ePosX, ePosY, ePosZ);
		printf("����� %s ������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "�� �������� ������ %s", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ������� ���", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		CreateExplosion(ePosX, ePosY, ePosZ, 7, 10.0);
		return 1;
	}
	if(!strcmp(cmd, "/clearchat", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		for(new i = 30; i >= 0; --i) SendClientMessageToAll(-1, " ");
		printf("����� %s ������� ���", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "������������� %s ������� ���", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/goto", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /goto [id]");
		new player = strval(tmp);
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ������� ���� id!");
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(player, x, y, z);
		format(string, sizeof string, "�� ����������������� � ������ %s", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		SetPlayerPos(playerid, x, y, z);
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(player));
		SetPlayerInterior(playerid, GetPlayerInterior(player));
		return 1;
	}
	if(!strcmp(cmd, "/warn", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /warn [id] [�������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /warn [id] [�������]");
		PlayerInfo[player][pWarns]++;
		printf("����� %s ����������� ������ %s (%d/3)", PlayerInfo[playerid][pName], PlayerInfo[player][pName], PlayerInfo[player][pWarns]);
		format(string, sizeof string, "***������������� %s ����������� ������ %s �� ������� %s (����� ������: %d/3)***", PlayerInfo[playerid][pName], PlayerInfo[player][pName], cmdtext[strfind(cmdtext, " ", true, 6) + 1], PlayerInfo[player][pWarns]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		if(PlayerInfo[player][pWarns] >= 3) Kick2(player);
		return 1;
	}
	if(!strcmp(cmd, "/kick", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /kick [id] [�������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /kick [id] [�������]");
		printf("����� %s ������ ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "������������� %s ������ ������ %s. �������: %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName], cmdtext[strfind(cmdtext, " ", true, 6) + 1]);
		SendClientMessageToAll(COLOR_BORDO, string);
		Kick2(player);
		return 1;
	}
	if(!strcmp(cmd, "/ban", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /ban [id] [���] [�������]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /ban [id] [���] [�������]");
		new time = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /ban [id] [���] [�������]");
		new pos = strfind(cmdtext, " ", true, 7) + 1, year, month, day, hour, minute;
		getdate(year, month, day);
		gettime(hour, minute);
		printf("����� %s ������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ������� ������� %s. [�������: %s] [����: %d.%d.%d] [�����: %d:%d]", PlayerInfo[player][pName], PlayerInfo[playerid][pName], cmdtext[pos], day, month, year, hour, minute);
		SendClientMessageToAll(COLOR_BORDO, string);
		PlayerInfo[player][pBan] = true;
		PlayerInfo[player][pBanTime] = gettime() + (time * 86400);
		BanEx2(player, cmdtext[pos]);
		return 1;
	}
	if(!strcmp(cmd, "/setmaxping", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setmaxping [maxping]");
		new ping = strval(tmp);
		if(!(50 <= ping <= 1000)) return SendClientMessage(playerid, COLOR_RED, "���������� �������� �����: 50-1000!");
		MaxPing = ping;
		printf("����� %s ��������� ������������ ���� �� %d", PlayerInfo[playerid][pName], ping);
		format(string, sizeof string, "����� %s ��������� ������������ ���� �� %d", PlayerInfo[playerid][pName], ping);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setmoney", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setmoney [id] [summa]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setmoney [id] [summa]");
		new money = strval(tmp);
		printf("����� %s ��������� ����� ����� ������ %s �� $%d", PlayerInfo[playerid][pName], PlayerInfo[player][pName], money);
		format(string, sizeof string, "�� ���������� ����� ����� �� $%d ������ %s", money, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��������� ��� ����� ����� �� $%d", PlayerInfo[playerid][pName], money);
		SendClientMessage(player, COLOR_BLUE, string);
		PlayerInfo[player][pMoney] = money;
		return 1;
	}
	if(!strcmp(cmd, "/givecash", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /givecash [id] [summa]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /givecash [id] [summa]");
		new money = strval(tmp);
		printf("����� %s ����� $%d ������ %s", PlayerInfo[playerid][pName], money, PlayerInfo[player][pName]);
		format(string, sizeof string, "�� ���� $%d ������ %s", money, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��� ��� $%d", PlayerInfo[playerid][pName], money);
		SendClientMessage(player, COLOR_BLUE, string);
		PlayerInfo[player][pMoney] += money;
		return 1;
	}
	if(!strcmp(cmd, "/giveweapon", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /giveweapon [id] [weapon] [ammo]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /giveweapon [id] [weapon] [ammo]");
		new weapon = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /giveweapon [id] [weapon] [ammo]");
		static wname[32];
		new ammo = strval(tmp);
		GetWeaponName(weapon, wname, sizeof wname);
		printf("����� %s ����� %s � %d ��������� ������ %s", PlayerInfo[playerid][pName], wname, ammo, PlayerInfo[player][pName]);
		format(string, sizeof string, "�� ���� ������ %s ������ %s (%d) � %d ���������", PlayerInfo[player][pName], wname, weapon, ammo);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��� ��� ������ %s (%d) � %d ���������", PlayerInfo[playerid][pName], wname, weapon, ammo);
		SendClientMessage(player, COLOR_BLUE, string);
		GivePlayerWeapon(player, weapon, ammo);
		return 1;
	}
	if(!strcmp(cmd, "/spawn", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /spawn [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		format(string, sizeof string, "����� %s ��������� ���", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		SpawnPlayer(player);
		return 1;
	}
	if(!strcmp(cmd, "/akill", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /akill [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		printf("����� %s ���� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ���� ���", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerHealth(player, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/get", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /get [id]");
		new player = strval(tmp);
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ������� ���� id!");
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		format(string, sizeof string, "�� ��������������� ������ %s � ����", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s �������������� ��� � ����", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerVirtualWorld(player, GetPlayerVirtualWorld(playerid));
		SetPlayerInterior(player, GetPlayerInterior(playerid));
		SetPlayerPos(player, x, y, z);
		return 1;
	}
	if(!strcmp(cmd, "/settime", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /settime [hour]");
		new time = strval(tmp);
		if(!(0 <= time <= 23)) return SendClientMessage(playerid, COLOR_RED, "��������� �������� ������ ���� �� 0 �� 23!");
		format(string, sizeof string, "����� %s ������ �����", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		for(new i = GetPlayerPoolSize(); i >= 0; --i) SetPlayerTime(i, time, 0);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/setweather", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setweather [weather]");
		new weather = strval(tmp);
		if(!(0 <= weather <= 20)) return SendClientMessage(playerid, COLOR_RED, "��������� �������� ������ ���� �� 0 �� 20!");
		format(string, sizeof string, "����� %s ������ ������", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		for(new i = GetPlayerPoolSize(); i >= 0; --i) SetPlayerWeather(i, weather);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/gm", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		PlayerInfo[playerid][pGodMode] = !PlayerInfo[playerid][pGodMode];
		printf("����� %s %s GodMode", PlayerInfo[playerid][pName], PlayerInfo[playerid][pGodMode] ? ("�������") : ("��������"));
		format(string, sizeof string, "�� %s GodMode", PlayerInfo[playerid][pGodMode] ? ("��������") : ("���������"));
		SendClientMessage(playerid, COLOR_BLUE, string);
		if(PlayerInfo[playerid][pGodMode]) SetPlayerHealth(playerid, 99999.0);
		else SetPlayerHealth(playerid, 100.0);
		return 1;
	}
	if(!strcmp(cmd, "/getall", true) || !strcmp(cmd, "/gethere", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		for(new i = GetPlayerPoolSize(), interior = GetPlayerInterior(playerid), vw = GetPlayerVirtualWorld(playerid); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && i != playerid)
			{
				SetPlayerVirtualWorld(i, vw);
				SetPlayerInterior(i, interior);
				SetPlayerPos(i, x, y, z + 1.0);
			}
		}
		format(string, sizeof string, "����� %s �������������� ���� � ����", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setvwall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setvwall [vw]");
		new vw = strval(tmp);
		format(string, sizeof string, "����� %s ��������� ���� ����������� ��� �� %d", PlayerInfo[playerid][pName], vw);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerVirtualWorld(i, vw);
		}
		return 1;
	}
	if(!strcmp(cmd, "/setintall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setintall [interior]");
		new interior = strval(tmp);
		format(string, sizeof string, "����� %s ��������� ���� �������� �� %d", PlayerInfo[playerid][pName], interior);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerInterior(i, interior);
		}
		return 1;
	}
	if(!strcmp(cmd, "/giveweaponall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /giveweaponall [weapon] [ammo]");
		new weapon = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /giveweaponall [weapon] [ammo]");
		static wname[32];
		new ammo = strval(tmp);
		GetWeaponName(weapon, wname, sizeof wname);
		printf("����� %s ����� ���� ������� %s � %d ���������", PlayerInfo[playerid][pName], wname, ammo);
		format(string, sizeof string, "����� %s ��� ���� ������� %s (ID:%d) � %d ���������", PlayerInfo[playerid][pName], wname, weapon, ammo);
		SendClientMessageToAll(COLOR_BLUE, string);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i)) GivePlayerWeapon(i, weapon, ammo);
		}
		return 1;
	}
	if(!strcmp(cmd, "/healall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		format(string, sizeof string, "����� %s ������� ����", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerHealth(i, 100.0);
		}
		return 1;
	}
	if(!strcmp(cmd, "/armourall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		format(string, sizeof string, "����� %s ����� ���� �����", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerArmour(i, 100.0);
		}
		return 1;
	}
	if(!strcmp(cmd, "/killall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		SendClientMessage(playerid, COLOR_BLUE, "�� ����� ���� �������");
		printf("����� %s ���� ���� �������", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "������������� %s ���� ���", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && i != playerid)
			{
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				SendClientMessage(i, COLOR_BLUE, string);
				SetPlayerHealth(i, 0.0);
			}
		}
		return 1;
	}
	if(!strcmp(cmd, "/freezeall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		SendClientMessage(playerid, COLOR_BLUE, "�� ���������� ���� �������");
		printf("����� %s ��������� ���� �������", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "������������� %s ��������� ���", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && i != playerid)
			{
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				SendClientMessage(i, COLOR_BLUE, string);
				TogglePlayerControllable(i, 0);
			}
		}
		return 1;
	}
	if(!strcmp(cmd, "/unfreezeall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		SendClientMessage(playerid, COLOR_BLUE, "�� ����������� ���� �������");
		printf("����� %s ���������� ���� �������", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "������������� %s ���������� ���", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && i != playerid)
			{
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				SendClientMessage(i, COLOR_BLUE, string);
				TogglePlayerControllable(i, 1);
			}
		}
		return 1;
	}
	if(!strcmp(cmd, "/ejectall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		SendClientMessage(playerid, COLOR_BLUE, "�� �������� �� ���� ���� �������");
		printf("����� %s ������� �� ���� ���� �������", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "������������� %s ������� ��� �� ����", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && i != playerid)
			{
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				SendClientMessage(i, COLOR_BLUE, string);
				RemovePlayerFromVehicle(i);
			}
		}
		return 1;
	}
	if(!strcmp(cmd, "/disarmall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		SendClientMessage(playerid, COLOR_BLUE, "�� ����������� ���� �������");
		printf("����� %s ���������� ���� �������", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "������������� %s ���������� ��c", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && i != playerid)
			{
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				SendClientMessage(i, COLOR_BLUE, string);
				ResetPlayerWeapons(i);
			}
		}
		return 1;
	}
	if(!strcmp(cmd, "/setmoneyall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setmoneyall [summa]");
		new money = strval(tmp);
		printf("����� %s ��������� $%d ���� �������", PlayerInfo[playerid][pName], money);
		format(string, sizeof string, "����� %s ��������� ���� $%d", PlayerInfo[playerid][pName], money);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i)) PlayerInfo[i][pMoney] = money;
		}
		return 1;
	}
	if(!strcmp(cmd, "/givecashall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /givecashall [summa]");
		new money = strval(tmp);
		printf("����� %s ����� $%d ���� �������", PlayerInfo[playerid][pName], money);
		format(string, sizeof string, "����� %s ��� ���� $%d", PlayerInfo[playerid][pName], money);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i)) PlayerInfo[i][pMoney] += money;
		}
		return 1;
	}
	if(!strcmp(cmd, "/setscore", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setscore [id] [score]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setscore [id] [score]");
		new score = strval(tmp);
		printf("����� %s ��������� %d ����� ������ %s", PlayerInfo[playerid][pName], score, PlayerInfo[player][pName]);
		format(string, sizeof string, "�� ���������� %d ����� ������ %s", score, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ��������� ��� %d �����", PlayerInfo[playerid][pName], score);
		SendClientMessage(player, COLOR_BLUE, string);
		PlayerInfo[player][pKills] = score;
		SetPlayerScore(player, score);
		return 1;
	}
	if(!strcmp(cmd, "/banip", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /banip [ip]");
		new count;
		for(new i = 7, j = strlen(cmdtext); i < j; i++)
		{
			switch(cmdtext[i])
			{
				case '*':
				{
					if(count < 2) return SendClientMessage(playerid, COLOR_BORDO, "IP-����� ����� �����������!");
				}
				case '0'..'9':{}
				case '.': count++;
				default: return SendClientMessage(playerid, COLOR_BORDO, "IP-����� ����� �����������!");
			}
		}
		format(string, sizeof string, "banip %s", cmdtext[7]);
		SendRconCommand(string);
		printf("����� %s ������� IP %s", PlayerInfo[playerid][pName], cmdtext[7]);
		format(string, sizeof string, "������������� %s ������� IP %s", PlayerInfo[playerid][pName], cmdtext[7]);
		SendClientMessageToAll(COLOR_BORDO, string);
		return 1;
	}
	if(!strcmp(cmd, "/unban", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /unban [name]");
		new pname[MAX_PLAYER_NAME + 1];
		strmid(pname, tmp, 0, strlen(tmp));
		format(string, sizeof string, "Users/%s.ini", pname);
		if(!fexist(string)) return SendClientMessage(playerid, COLOR_RED, "������ �������� �� ����������!");
		new iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			new bool:ban;
			ini_getInteger(iniFile, "Ban", ban);
			if(!ban)
			{
				SendClientMessage(playerid, COLOR_RED, "���� ������� �� �������!");
				ini_closeFile(iniFile);
				return 1;
			}
			ini_setInteger(iniFile, "Ban", 0);
			ini_setInteger(iniFile, "BanTime", 0);
			ini_closeFile(iniFile);
		}
		printf("����� %s �������� ������ %s", PlayerInfo[playerid][pName], pname);
		format(string, sizeof string, "����� %s �������� ������� %s", pname, PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_GREEN, string);
		return 1;
	}
	if(!strcmp(cmd, "/kickall", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /kick [�������]");
		printf("����� %s ������ ���� �������", PlayerInfo[playerid][pName]);
		format(string, sizeof string, "������������� %s ������ ���� �������. �������: %s", PlayerInfo[playerid][pName], cmdtext[9]);
		SendClientMessageToAll(COLOR_BORDO, string);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i) && i != playerid) Kick2(i);
		}
		return 1;
	}
	if(!strcmp(cmd, "/setscoreall", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setscoreall [score]");
		new score = strval(tmp);
		printf("����� %s ��������� %d ����� ���� �������", PlayerInfo[playerid][pName], score);
		format(string, sizeof string, "����� %s ��������� ���� %d �����", PlayerInfo[playerid][pName], score);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i >= 0; --i)
		{
			if(IsPlayerConnected(i))
			{
				PlayerInfo[i][pKills] = score;
				SetPlayerScore(i, score);
			}
		}
		return 1;
	}
	if(!strcmp(cmd, "/unbanip", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /unbanip [ip]");
		for(new i = 9, j = strlen(cmdtext); i < j; i++)
		{
			switch(cmdtext[i])
			{
				case '0'..'9', '.', '*':{}
				default: return SendClientMessage(playerid, COLOR_BORDO, "IP-����� ����� �����������!");
			}
		}
		format(string, sizeof string, "unbanip %s", cmdtext[9]);
		SendRconCommand(string);
		SendRconCommand("reloadbans");
		printf("����� %s �������� IP %s", PlayerInfo[playerid][pName], cmdtext[9]);
		format(string, sizeof string, "������������� %s �������� IP %s", PlayerInfo[playerid][pName], cmdtext[9]);
		SendClientMessageToAll(COLOR_GREEN, string);
		return 1;
	}
	if(!strcmp(cmd, "/noob", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /noob [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "�� �� ������ ��������� ��� �������� � ������� ������!");
		PlayerInfo[player][pKills] = 0;
		SetPlayerScore(player, PlayerInfo[player][pKills]);
		PlayerInfo[player][pDmPoints] = 0;
		GivePlayerWeapon(player, 10, 1);
		PlayerInfo[player][pPoints] = 0;
		PlayerInfo[player][pMoney] = 0;
		SetPlayerSkin(player, 137);
		printf("����� %s ������ ���������� ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ������ ��� ����������", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setname", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setname [id] [name]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setname [id] [name]");
		new pname[MAX_PLAYER_NAME + 1];
		strmid(pname, cmdtext, 11, strlen(cmdtext));
		format(string, sizeof string, "Users/%s.ini", pname);
		new ret = SetPlayerName(player, pname);
		if(fexist(string) || ret == 0) return SendClientMessage(playerid, COLOR_RED, "������ ��� ��� ���-�� �����!");
		if(ret == -1) return SendClientMessage(playerid, COLOR_RED, "������ ��� ����� ������������ �������!");
		new iniFile = ini_createFile(string);
		if(iniFile >= INI_OK)
		{
			ini_setString(iniFile, "Pass", PlayerInfo[player][pPass]);
			ini_closeFile(iniFile);
		}
		printf("����� %s ������ ��� ������ %s �� %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName], pname);
		format(string, sizeof string, "�� ������� ������ %s ��� �� %s", PlayerInfo[player][pName], pname);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "����� %s ������ ��� ��� �� %s", PlayerInfo[playerid][pName], pname);
		SendClientMessage(player, COLOR_BLUE, string);
		format(string, sizeof string, "Users/%s.ini", PlayerInfo[player][pName]);
		fremove(string);
		GetPlayerName(player, PlayerInfo[player][pName], MAX_PLAYER_NAME + 1);
		SaveAccount(player);
		return 1;
	}
	if(!strcmp(cmd, "/setlevel", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setlevel [id] [������� (0-10)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /setlevel [id] [������� (0-10)]");
		new level = strval(tmp);
		if(!(0 <= level <= 10)) return SendClientMessage(playerid, COLOR_RED, "������� ������ ���� �� 0 �� 10!");
		PlayerInfo[player][pAdmin] = level;
		printf("����� %s ������� �� %d ������ ������� ������ %s", PlayerInfo[playerid][pName], level, PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ������� ��� �� %d ������ �������", PlayerInfo[playerid][pName], level);
		SendClientMessage(player, COLOR_BLUE, string);
		format(string, sizeof string, "�� �������� %s(ID: %d) �� %d ������ �������", PlayerInfo[player][pName], player, level);
		SendClientMessage(playerid, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/settemplevel", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /settemplevel [id] [������� (0-10)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /settemplevel [id] [������� (0-10)]");
		new level = strval(tmp);
		if(!(0 <= level <= 10)) return SendClientMessage(playerid, COLOR_RED, "������� ������ ���� �� 0 �� 10!");
		PlayerInfo[player][pTempAdmin] = level;
		printf("����� %s ������� �� %d ������ ��������� ������� ������ %s", PlayerInfo[playerid][pName], level, PlayerInfo[player][pName]);
		format(string, sizeof string, "����� %s ������� ��� �� %d ������ ��������� �������", PlayerInfo[playerid][pName], level);
		SendClientMessage(player, COLOR_BLUE, string);
		format(string, sizeof string, "�� �������� %s(ID: %d) �� %d ������ ��������� �������", PlayerInfo[player][pName], player, level);
		SendClientMessage(playerid, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/skick", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		tmp = strtok(cmdtext, idx);
		if(!tmp[0]) return SendClientMessage(playerid, COLOR_RED, "�����������: /skick [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "������ ����� �������!");
		printf("����� %s ������ ������ ������ %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		Kick(player);
		return 1;
	}
	if(!strcmp(cmd, "/ears", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "�� �� ������������ ������������ ��� �������!");
		printf("����� %s %s ��������� PM", PlayerInfo[playerid][pName], EarsIsEnabled ? ("��������") : ("�������"));
		format(string, sizeof string, "�� %s ��������� PM", EarsIsEnabled ? ("���������") : ("��������"));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		EarsIsEnabled = !EarsIsEnabled;
		return 1;
	}
	format(string, sizeof string, " ������� %s �� ����������. ��� ������ ��������: /help", cmd);
	SendClientMessage(playerid, COLOR_BORDO, string);
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(GetPlayerWeapon(playerid) > 0 && GetPlayerInterior(playerid) > 0 && PlayerInfo[playerid][pDmZone] < 1 && !PlayerInfo[playerid][pInPvp]) SetPlayerArmedWeapon(playerid, 0);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vid = GetPlayerVehicleID(playerid), panels, doors, lights, tires;
		GetVehicleDamageStatus(vid, panels, doors, lights, tires);
		for(new i = GetPlayerPoolSize(), Float:sx, Float:sy, Float:sz; i >= 0; --i)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][pSpikesObj] > 0)
			{
				GetObjectPos(PlayerInfo[i][pSpikesObj], sx, sy, sz);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, sx, sy, sz))
				{
					tires = encode_tires(1, 1, 1, 1);
					UpdateVehicleDamageStatus(vid, panels, doors, lights, tires);
					break;
				}
			}
		}
	}
	PlayerInfo[playerid][pAFKTime] = 0;
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	switch(newstate)
	{
		case PLAYER_STATE_ONFOOT:
		{
			for(new i = GetPlayerPoolSize(); i >= 0; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) PlayerSpectatePlayer(i, playerid);
			}
			if(PLAYER_STATE_DRIVER <= oldstate <= PLAYER_STATE_PASSENGER) SendClientMessage(playerid, COLOR_SALMON, "�� ���� ������ ����������.");
		}
		case PLAYER_STATE_DRIVER:
		{
			new vehid = GetPlayerVehicleID(playerid);
			for(new i = GetPlayerPoolSize(); i >= 0; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) PlayerSpectateVehicle(i, vehid);
			}
			SetPlayerArmedWeapon(playerid, 0);
			PlayerTextDrawShow(playerid, PlayerInfo[playerid][pVehSpeed]);
			SendClientMessage(playerid, COLOR_SALMON, "�� ���� ������ ������ ��� �������������� ��.");
			if(PlayerInfo[playerid][pTeam] != TEAM_ADMIN)
			{
				if(PlayerInfo[playerid][pTeam] != TEAM_ARMY && vehid == DumperVeh)
				{
					GameTextForPlayer(playerid, "Get Out Of Army's Dumper", 3000, 3);
					RemovePlayerFromVehicle(playerid);
				}
				if(vehid == PanzerVeh)
				{
					GameTextForPlayer(playerid, "This Tank Is For Admin Use Only", 3000, 3);
					RemovePlayerFromVehicle(playerid);
				}
				else if(vehid == Hydra1Veh || vehid == Hydra2Veh)
				{
					GameTextForPlayer(playerid, "���E��_��_�OE�_�A���!", 3000, 3);
					RemovePlayerFromVehicle(playerid);
				}
			}
			switch(GetVehicleModel(vehid))
			{
				case 427: SetPlayerArmour(playerid, 100.0);
				case 596..599: GivePlayerWeapon(playerid, 25, 15);
			}
		}
		case PLAYER_STATE_PASSENGER:
		{
			new vehid = GetPlayerVehicleID(playerid);
			for(new i = GetPlayerPoolSize(); i >= 0; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) PlayerSpectateVehicle(i, vehid);
			}
			SendClientMessage(playerid, COLOR_SALMON, "�� ���� ������ ������ ��� ���������� ������������� � �������� �� ����������. �������� ������ MP5.");
			if(GetPlayerWeapon(playerid) != 29) SetPlayerArmedWeapon(playerid, 0);
		}
	}
	if(oldstate == PLAYER_STATE_DRIVER) PlayerTextDrawHide(playerid, PlayerInfo[playerid][pVehSpeed]);
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	static string[64];
	format(string, sizeof string, "~n~~n~~n~~n~~n~~n~~n~~g~+%.01f HP", amount);
	GameTextForPlayer(playerid, string, 1500, 3);
	if(PlayerInfo[damagedid][pGang] > 0 && GangSpawn[PlayerInfo[damagedid][pGang]][0] && GangSpawn[PlayerInfo[damagedid][pGang]][1] && GangSpawn[PlayerInfo[damagedid][pGang]][2])
	{
		if(IsPlayerInRangeOfPoint(damagedid, 1.5, GangSpawn[PlayerInfo[damagedid][pGang]][0], GangSpawn[PlayerInfo[damagedid][pGang]][1], GangSpawn[PlayerInfo[damagedid][pGang]][2])) Punish(playerid);
	}
	else if(IsPlayerInRangeOfPoint(damagedid, 1.5, TeamSpawns[PlayerInfo[damagedid][pTeam]][0], TeamSpawns[PlayerInfo[damagedid][pTeam]][1], TeamSpawns[PlayerInfo[damagedid][pTeam]][2])) Punish(playerid);
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(issuerid != INVALID_PLAYER_ID)
	{
		static string[64];
		format(string, sizeof string, "~n~~n~~n~~n~~n~~n~~n~~r~-%.01f HP", amount);
		GameTextForPlayer(playerid, string, 1500, 3);
		if(PlayerInfo[playerid][pDmZone] == 8)
		{
			new Float:health;
			GetPlayerHealth(playerid, health);
			SetPlayerHealth(playerid, health - (amount + 30.0));
		}
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(hittype != BULLET_HIT_TYPE_NONE)
	{
		if(!(BULLET_HIT_TYPE_NONE <= hittype <= BULLET_HIT_TYPE_PLAYER_OBJECT)) return 0;
		if(!(-1000.0 <= fX <= 1000.0) || !(-1000.0 <= fY <= 1000.0) || !(-1000.0 <= fZ <= 1000.0)) return 0;
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	if(vehicleid == TunVehs[6] || vehicleid == TunVehs[10] || vehicleid == TunVehs[11] || vehicleid == TunVehs[12] ||
	vehicleid == TunVehs[13] || vehicleid == TunVehs[14] || vehicleid == TunVehs[15] || vehicleid == TunVehs[16] ||
	vehicleid == TunVehs[17] || vehicleid == TunVehs[18] || vehicleid == TunVehs[20] || vehicleid == TunVehs[21])
	{
		AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1085);
		AddVehicleComponent(vehicleid, 1086);
		AddVehicleComponent(vehicleid, 1087);
	}
	else if(vehicleid == TunVehs[0])
	{
		AddVehicleComponent(TunVehs[0], 1010);
		AddVehicleComponent(TunVehs[0], 1085);
		AddVehicleComponent(TunVehs[0], 1086);
		AddVehicleComponent(TunVehs[0], 1087);
		AddVehicleComponent(TunVehs[0], 1090);
		AddVehicleComponent(TunVehs[0], 1094);
		AddVehicleComponent(TunVehs[0], 1092);
		AddVehicleComponent(TunVehs[0], 1088);
		AddVehicleComponent(TunVehs[0], 1164);
		AddVehicleComponent(TunVehs[0], 1168);
		AddVehicleComponent(TunVehs[0], 1166);
		ChangeVehiclePaintjob(TunVehs[0], 2);
	}
	else if(vehicleid == TunVehs[1])
	{
		AddVehicleComponent(TunVehs[1], 1010);
		AddVehicleComponent(TunVehs[1], 1085);
		AddVehicleComponent(TunVehs[1], 1086);
		AddVehicleComponent(TunVehs[1], 1087);
		AddVehicleComponent(TunVehs[1], 1070);
		AddVehicleComponent(TunVehs[1], 1072);
		AddVehicleComponent(TunVehs[1], 1066);
		AddVehicleComponent(TunVehs[1], 1068);
		AddVehicleComponent(TunVehs[1], 1158);
		AddVehicleComponent(TunVehs[1], 1161);
		AddVehicleComponent(TunVehs[1], 1173);
		ChangeVehiclePaintjob(TunVehs[1], 2);
	}
	else if(vehicleid == TunVehs[2])
	{
		AddVehicleComponent(TunVehs[2], 1010);
		AddVehicleComponent(TunVehs[2], 1085);
		AddVehicleComponent(TunVehs[2], 1086);
		AddVehicleComponent(TunVehs[2], 1087);
		AddVehicleComponent(TunVehs[2], 1026);
		AddVehicleComponent(TunVehs[2], 1027);
		AddVehicleComponent(TunVehs[2], 1028);
		AddVehicleComponent(TunVehs[2], 1032);
		AddVehicleComponent(TunVehs[2], 1138);
		AddVehicleComponent(TunVehs[2], 1141);
		AddVehicleComponent(TunVehs[2], 1169);
		ChangeVehiclePaintjob(TunVehs[2], 2);
	}
	else if(vehicleid == TunVehs[3])
	{
		AddVehicleComponent(TunVehs[3], 1010);
		AddVehicleComponent(TunVehs[3], 1085);
		AddVehicleComponent(TunVehs[3], 1086);
		AddVehicleComponent(TunVehs[3], 1087);
		AddVehicleComponent(TunVehs[3], 1041);
		AddVehicleComponent(TunVehs[3], 1039);
		AddVehicleComponent(TunVehs[3], 1037);
		AddVehicleComponent(TunVehs[3], 1035);
		AddVehicleComponent(TunVehs[3], 1146);
		AddVehicleComponent(TunVehs[3], 1148);
		AddVehicleComponent(TunVehs[3], 1172);
		ChangeVehiclePaintjob(TunVehs[3], 2);
	}
	else if(vehicleid == TunVehs[4])
	{
		AddVehicleComponent(TunVehs[4], 1010);
		AddVehicleComponent(TunVehs[4], 1085);
		AddVehicleComponent(TunVehs[4], 1086);
		AddVehicleComponent(TunVehs[4], 1087);
		AddVehicleComponent(TunVehs[4], 1047);
		AddVehicleComponent(TunVehs[4], 1051);
		AddVehicleComponent(TunVehs[4], 1046);
		AddVehicleComponent(TunVehs[4], 1054);
		AddVehicleComponent(TunVehs[4], 1049);
		AddVehicleComponent(TunVehs[4], 1150);
		AddVehicleComponent(TunVehs[4], 1153);
		ChangeVehiclePaintjob(TunVehs[4], 2);
	}
	else if(vehicleid == TunVehs[5])
	{
		AddVehicleComponent(TunVehs[5], 1006);
		AddVehicleComponent(TunVehs[5], 1010);
		AddVehicleComponent(TunVehs[5], 1023);
		AddVehicleComponent(TunVehs[5], 1085);
		AddVehicleComponent(TunVehs[5], 1086);
		AddVehicleComponent(TunVehs[5], 1087);
	}
	else if(vehicleid == TunVehs[7])
	{
		AddVehicleComponent(TunVehs[7], 1006);
		AddVehicleComponent(TunVehs[7], 1010);
		AddVehicleComponent(TunVehs[7], 1007);
		AddVehicleComponent(TunVehs[7], 1023);
		AddVehicleComponent(TunVehs[7], 1071);
		AddVehicleComponent(TunVehs[7], 1085);
		AddVehicleComponent(TunVehs[7], 1086);
		AddVehicleComponent(TunVehs[7], 1087);
		AddVehicleComponent(TunVehs[7], 1142);
		AddVehicleComponent(TunVehs[7], 1143);
	}
	else if(vehicleid == TunVehs[8])
	{
		AddVehicleComponent(TunVehs[8], 1006);
		AddVehicleComponent(TunVehs[8], 1007);
		AddVehicleComponent(TunVehs[8], 1010);
		AddVehicleComponent(TunVehs[8], 1012);
		AddVehicleComponent(TunVehs[8], 1023);
		AddVehicleComponent(TunVehs[8], 1024);
		AddVehicleComponent(TunVehs[8], 1071);
		AddVehicleComponent(TunVehs[8], 1085);
		AddVehicleComponent(TunVehs[8], 1086);
		AddVehicleComponent(TunVehs[8], 1087);
		AddVehicleComponent(TunVehs[8], 1144);
		AddVehicleComponent(TunVehs[8], 1145);
	}
	else if(vehicleid == TunVehs[9])
	{
		AddVehicleComponent(TunVehs[9], 1010);
		AddVehicleComponent(TunVehs[9], 1085);
		AddVehicleComponent(TunVehs[9], 1086);
		AddVehicleComponent(TunVehs[9], 1087);
		AddVehicleComponent(TunVehs[9], 1110);
		AddVehicleComponent(TunVehs[9], 1114);
		AddVehicleComponent(TunVehs[9], 1116);
		AddVehicleComponent(TunVehs[9], 1119);
		AddVehicleComponent(TunVehs[9], 1121);
	}
	else if(vehicleid == TunVehs[19])
	{
		AddVehicleComponent(TunVehs[19], 1007);
		AddVehicleComponent(TunVehs[19], 1010);
		AddVehicleComponent(TunVehs[19], 1023);
		AddVehicleComponent(TunVehs[19], 1071);
		AddVehicleComponent(TunVehs[19], 1085);
		AddVehicleComponent(TunVehs[19], 1086);
		AddVehicleComponent(TunVehs[19], 1087);
	}
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	if(GetPlayerInterior(playerid) == 0) return 0;
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	for(new i = strlen(inputtext) - 1; i >= 0; --i)
	{
		if(inputtext[i] == '%') inputtext[i] = '#';
	}
	if(dialogid != PlayerInfo[playerid][pDialog])
	{
		PlayerInfo[playerid][pDialog] = -1;
		return 0;
	}
	PlayerInfo[playerid][pDialog] = -1;
	static string[145];
	switch(dialogid)
	{
		case DIALOG_REGISTRATION:
		{
			if(response)
			{
				if(strlen(inputtext) < 4)
				{
					SendClientMessage(playerid, COLOR_RED, "������ ������ �������� ��� ������� �� 4 ��������!");
					format(string, sizeof string, "{FA8072}���� ������� {FFFF00}'%s'{FA8072} �� ���������������!\n\n{FF5300}�����������������, ��� ������� � ������� ������:", PlayerInfo[playerid][pName]);
					ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}����������� ��������", string, "Register", "������");
					return 1;
				}
				if(strlen(inputtext) > 31)
				{
					SendClientMessage(playerid, COLOR_RED, "����� ������ ������ ���� ������ 32 ��������!");
					format(string, sizeof string, "{FA8072}���� ������� {FFFF00}'%s'{FA8072} �� ���������������!\n\n{FF5300}�����������������, ��� ������� � ������� ������:", PlayerInfo[playerid][pName]);
					ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}����������� ��������", string, "Register", "������");
					return 1;
				}
				format(string, sizeof string, "Users/%s.ini", PlayerInfo[playerid][pName]);
				new iniFile = ini_createFile(string);
				if(iniFile < 0) iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					format(PlayerInfo[playerid][pPass], MAX_PASSWORD_LENGTH, "%s", inputtext);
					ini_setString(iniFile, "Pass", inputtext);
					ini_setInteger(iniFile, "Money", 40000);
					ini_setFloat(iniFile, "Health", 100.0);
					ini_setFloat(iniFile, "Armour", 0.0);
					ini_setInteger(iniFile, "Kills", 0);
					ini_setInteger(iniFile, "Deaths", 0);
					ini_setInteger(iniFile, "Points", 0);
					ini_setInteger(iniFile, "DmPoints", 0);
					ini_setInteger(iniFile, "Skin", -1);
					ini_setInteger(iniFile, "Gang", 0);
					ini_setInteger(iniFile, "GangCheck", 0);
					ini_setInteger(iniFile, "GangLvl", 0);
					ini_setInteger(iniFile, "Mute", 0);
					ini_setInteger(iniFile, "MuteTime", 0);
					ini_setInteger(iniFile, "Jail", 0);
					ini_setInteger(iniFile, "JailTime", 0);
					ini_setInteger(iniFile, "Punish", 0);
					ini_setInteger(iniFile, "PunishTime", 0);
					ini_setInteger(iniFile, "TimeCount", 0);
					ini_setInteger(iniFile, "ConnectCount", 1);
					ini_setInteger(iniFile, "Ban", 0);
					ini_setInteger(iniFile, "BanTime", 0);
					ini_setInteger(iniFile, "PvpAccept", 1);
					ini_setInteger(iniFile, "FightStyle", 4);
					ini_setInteger(iniFile, "Admin", 0);
					ini_closeFile(iniFile);
					PlayerInfo[playerid][pMoney] += 40000;
					PlayerInfo[playerid][pLogged] = true;
					PlayerInfo[playerid][pConnectCount] = 1;
					SendClientMessage(playerid, COLOR_LIME, "�������: �� ���������������� � ������������� ����������");
				}
			}
			else
			{
				format(string, sizeof string, "{FA8072}���� ������� {FFFF00}'%s'{FA8072} �� ���������������!\n\n{FF5300}�����������������, ��� ������� � ������� ������:", PlayerInfo[playerid][pName]);
				ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}����������� ��������", string, "Register", "������");
			}
		}
		case DIALOG_LOGIN:
		{
			if(response)
			{
				if(!inputtext[0])
				{
					format(string, sizeof string, "{FA8072}���� ������� {FFFF00}%s{FA8072} ���������������\n{FF5300}���������� ������������:", PlayerInfo[playerid][pName]);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FFCC00}����������� ��������", string, "Login", "�����");
					return 1;
				}
				format(string, sizeof string, "Users/%s.ini", PlayerInfo[playerid][pName]);
				static password[MAX_PASSWORD_LENGTH];
				new iniFile = ini_openFile(string);
				ini_getString(iniFile, "Pass", password);
				format(PlayerInfo[playerid][pPass], MAX_PASSWORD_LENGTH, "%s", password);
				if(strcmp(inputtext, password, true))
				{
					if(++PlayerInfo[playerid][pPassCount] >= MAX_PASSWORD_ATTEMPTS)
					{
						printf("����� %s ������ �� ���� ��������� ������", PlayerInfo[playerid][pName]);
						format(string, sizeof string, "%s(ID: %d) ��� ������ [3/3 ��� ��� �������� ������]", PlayerInfo[playerid][pName], playerid);
						SendClientMessageToAll(COLOR_GRAY, string);
						Kick2(playerid);
						return 1;
					}
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FFFF00}������", "{FF0000}������������ ������\n{00FFFF}���������� ��� ���", "��", "�����");
				}
				else
				{
					ini_getInteger(iniFile, "Money", PlayerInfo[playerid][pMoney]);
					ini_getFloat(iniFile, "Armour", PlayerInfo[playerid][pArmour]);
					ini_getInteger(iniFile, "Kills", PlayerInfo[playerid][pKills]);
					ini_getInteger(iniFile, "Deaths", PlayerInfo[playerid][pDeaths]);
					ini_getInteger(iniFile, "Points", PlayerInfo[playerid][pPoints]);
					ini_getInteger(iniFile, "DmPoints", PlayerInfo[playerid][pDmPoints]);
					ini_getInteger(iniFile, "Skin", PlayerInfo[playerid][pSkin]);
					ini_getInteger(iniFile, "Gang", PlayerInfo[playerid][pGang]);
					ini_getInteger(iniFile, "GangCheck", PlayerInfo[playerid][pGangCheck]);
					ini_getInteger(iniFile, "GangLvl", PlayerInfo[playerid][pGangLvl]);
					if(!Gang[PlayerInfo[playerid][pGang]] || GangCheck[PlayerInfo[playerid][pGang]] != PlayerInfo[playerid][pGangCheck])
					{
						PlayerInfo[playerid][pGang] = 0;
						PlayerInfo[playerid][pGangCheck] = 0;
						PlayerInfo[playerid][pGangLvl] = 0;
					}
					ini_getInteger(iniFile, "Mute", PlayerInfo[playerid][pMute]);
					ini_getInteger(iniFile, "MuteTime", PlayerInfo[playerid][pMuteTime]);
					ini_getInteger(iniFile, "Jail", PlayerInfo[playerid][pJail]);
					ini_getInteger(iniFile, "JailTime", PlayerInfo[playerid][pJailTime]);
					ini_getInteger(iniFile, "Punish", PlayerInfo[playerid][pPunish]);
					ini_getInteger(iniFile, "PunishTime", PlayerInfo[playerid][pPunishTime]);
					ini_getInteger(iniFile, "TimeCount", PlayerInfo[playerid][pSeconds]);
					ini_getInteger(iniFile, "ConnectCount", PlayerInfo[playerid][pConnectCount]);
					ini_getInteger(iniFile, "Ban", PlayerInfo[playerid][pBan]);
					ini_getInteger(iniFile, "BanTime", PlayerInfo[playerid][pBanTime]);
					ini_getInteger(iniFile, "PvpAccept", PlayerInfo[playerid][pPvpAccept]);
					ini_getInteger(iniFile, "FightStyle", PlayerInfo[playerid][pFightStyle]);
					ini_getInteger(iniFile, "Admin", PlayerInfo[playerid][pAdmin]);
					ini_closeFile(iniFile);
					if(PlayerInfo[playerid][pBan])
					{
						if(gettime() > PlayerInfo[playerid][pBanTime])
						{
							PlayerInfo[playerid][pBan] = false;
							PlayerInfo[playerid][pBanTime] = 0;
						}
						else
						{
							SendClientMessage(playerid, COLOR_RED, "�� �������� �� ���� �������.");
							Kick2(playerid);
							return 1;
						}
					}
					SetPlayerScore(playerid, PlayerInfo[playerid][pKills]);
					if(PlayerInfo[playerid][pGang] > 0) SetPlayerColor(playerid, HexToInt(GangColor[PlayerInfo[playerid][pGang]]));
					PlayerInfo[playerid][pConnectCount]++;
					PlayerInfo[playerid][pLogged] = true;
					if(IsPlayerAdminEx(playerid, 1))
					{
						format(string, sizeof string, "�������: �� ������� ������������ (������� %d)", GetPlayerAdmin(playerid));
						SendClientMessage(playerid, COLOR_LIME, string);
					}
					else SendClientMessage(playerid, COLOR_LIME, "�������: �� ������� ������������");
				}
			}
			else
			{
				printf("����� %s ������ �� ���������� �����������", PlayerInfo[playerid][pName]);
				Kick2(playerid);
			}
		}
		case DIALOG_RULES:
		{
			if(PlayerInfo[playerid][pLogged]) return 1;
			if(!response)
			{
				printf("����� %s ������ �� ���������� � ��������� �������", PlayerInfo[playerid][pName]);
				format(string, sizeof string, "%s(ID: %d) ��� ������ �� ���������� � ��������� �������!", PlayerInfo[playerid][pName], playerid);
				SendClientMessageToAll(COLOR_GRAY, string);
				Kick2(playerid);
				return 1;
			}
			SendClientMessage(playerid, COLOR_GREEN, " ������� ���� �� �������");
			format(string, sizeof string, "Users/%s.ini", PlayerInfo[playerid][pName]);
			if(!fexist(string))
			{
				SendClientMessage(playerid, COLOR_RED, "�������: ��� ���� �� ������� ��� ���������� ������������������.");
				format(string, sizeof string, "{FA8072}���� ������� {FFFF00}'%s'{FA8072} �� ���������������!\n\n{FF5300}�����������������, ��� ������� � ������� ������:", PlayerInfo[playerid][pName]);
				ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}����������� ��������", string, "Register", "������");
			}
			else
			{
				SendClientMessage(playerid, COLOR_LIME, "�������: ��� ���� �� ������� ��� ���������� ������������.");
				format(string, sizeof string, "{FA8072}���� ������� {FFFF00}%s{FA8072} ���������������\n{FF5300}���������� ������������:", PlayerInfo[playerid][pName]);
				ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FFCC00}����������� ��������", string, "Login", "�����");
			}
		}
		case DIALOG_GLASSES:
		{
			if(response)
			{
				if(listitem > 0) SetPlayerAttachedObject(playerid, 2, listitem + 19005, 2, 0.1, 0.03, 0.0, 0.0, 90.0, 90.0);
				else RemovePlayerAttachedObject(playerid, 2);
			}
		}
		case DIALOG_DRINK:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
					case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
					case 3: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
				}
			}
		}
		case DIALOG_RADIO:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: StopAudioStreamForPlayer(playerid);
					case 1: PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/loveradio.m3u");
					case 2: PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/kissfm128.m3u");
					case 3: PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/shanson.m3u");
					case 4: PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/radiorecord.m3u");
					case 5: PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/skyradio.m3u");
					case 6: PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/europaplus.m3u");
					case 7: PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/aplus");
				}
			}
		}
		case DIALOG_PVP:
		{
			if(response)
			{
				if(PlayerInfo[playerid][pInPvp] || PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pInPvp])
				{
					SendClientMessage(playerid, -1, "�� ��� ���������� � PvP.");
					SendClientMessage(PlayerInfo[playerid][pPvpCreate], -1, "��� ���������� �� ������� � PvP ��������� ������!");
					PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
					return 1;
				}
				if(PvpPlaceVisit[PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpPlace]])
				{
					SendClientMessage(playerid, -1, "PvP-����� ������.");
					SendClientMessage(PlayerInfo[playerid][pPvpCreate], -1, "PvP-����� ������.");
					PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
					return 1;
				}
				if(IsPlayerConnected(PlayerInfo[playerid][pPvpCreate]))
				{
					PlayerInfo[playerid][pPvpMoney] = PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpMoney];
					PlayerInfo[playerid][pPvpPlace] = PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpPlace];
					PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]] = true;
					PlayerInfo[playerid][pInPvp] = true;
					PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pInPvp] = true;
					if(PlayerInfo[playerid][pPvpPlace] == 1)
					{
						SetPlayerInterior(playerid, 1);
						SetPlayerInterior(PlayerInfo[playerid][pPvpCreate], 1);
					}
					else
					{
						SetPlayerInterior(playerid, 0);
						SetPlayerInterior(PlayerInfo[playerid][pPvpCreate], 0);
					}
					SetPlayerPos(playerid, PvpSpawns[PlayerInfo[playerid][pPvpPlace]][0][0], PvpSpawns[PlayerInfo[playerid][pPvpPlace]][0][1], PvpSpawns[PlayerInfo[playerid][pPvpPlace]][0][2]);
					SetPlayerPos(PlayerInfo[playerid][pPvpCreate], PvpSpawns[PlayerInfo[playerid][pPvpPlace]][1][0], PvpSpawns[PlayerInfo[playerid][pPvpPlace]][1][1], PvpSpawns[PlayerInfo[playerid][pPvpPlace]][1][2]);
					SetCameraBehindPlayer(playerid);
					SetCameraBehindPlayer(PlayerInfo[playerid][pPvpCreate]);
					SetPlayerHealth(PlayerInfo[playerid][pPvpCreate], 100.0);
					SetPlayerHealth(playerid, 100.0);
					if(PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpArmour])
					{
						SetPlayerArmour(PlayerInfo[playerid][pPvpCreate], 100.0);
						SetPlayerArmour(playerid, 100.0);
					}
					SetPlayerVirtualWorld(playerid, PVP_WORLD);
					SetPlayerVirtualWorld(PlayerInfo[playerid][pPvpCreate], PVP_WORLD);
					TogglePlayerControllable(playerid, 0);
					TogglePlayerControllable(PlayerInfo[playerid][pPvpCreate], 0);
					PlayerInfo[playerid][pPvpCount] = 6;
					PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpCount] = 6;
					PlayerInfo[playerid][pCountPvpTmr] = SetTimerEx("PvpStarting", 1000, 1, "i", playerid);
					PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pCountPvpTmr] = SetTimerEx("PvpStarting", 1000, 1, "i", PlayerInfo[playerid][pPvpCreate]);
					ResetPlayerWeapons(playerid);
					ResetPlayerWeapons(PlayerInfo[playerid][pPvpCreate]);
					GivePlayerWeapon(playerid, PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpWeapon], 99999);
					GivePlayerWeapon(PlayerInfo[playerid][pPvpCreate], PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpWeapon], 99999);
					KillTimer(PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pAntiSKTmr]);
					KillTimer(PlayerInfo[playerid][pAntiSKTmr]);
					PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
				}
				else
				{
					SendClientMessage(playerid, -1, "�����, ���������� ���� �����������, ������������!");
					PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
				}
			}
			else
			{
				format(string, sizeof string, "�� ��������� �� ������� � PVP � ������� {9DDAF2}%s", PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pName]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "����� {9DDAF2}%s{FFFFFF} ��������� �� ������� � PVP!", PlayerInfo[playerid][pName]);
				SendClientMessage(PlayerInfo[playerid][pPvpCreate], -1, string);
				PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
			}
		}
		case DIALOG_TP:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_TPLS, DIALOG_STYLE_LIST, "Los Santos", "Los Santos Airport\nSanta Marina\nGrove Street\nCity Hall\nPolice Station\nBank\nOcean Docks\nCrazybob's House\nJefferson Motel", "�������", "�����");
					case 1: ShowPlayerDialog(playerid, DIALOG_TPSF, DIALOG_STYLE_LIST, "San Fierro", "San Fierro Airport\nCity Hall\nBank\nOcean Flats\nMissionary Hill\nJizzys Pleasure Dome\nPolice Station", "�������", "�����");
					case 2: ShowPlayerDialog(playerid, DIALOG_TPLV, DIALOG_STYLE_LIST, "Las Venturas", "Las Venturas Airport\nCity Hall\nPolice Station\nCaligulas Casino\nStarfish Casino\nBank\nPrickle Pine\nBandit Stadium\nLast Dime Motel", "�������", "�����");
					case 3: ShowPlayerDialog(playerid, DIALOG_TP_OTHER, DIALOG_STYLE_LIST, "������", "Verdant Meadows\nBayside\nPalominmo Creek\nMontgomery\nBlueberry\nMount Chilliad Cabin\nTop of Mount Chilliad\nMount Chilliad", "�������", "�����");
				}
			}
		}
		case DIALOG_TPLS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, 1934.8811, -2305.5283, 13.5469);
						format(string, sizeof string, "*** %s ���������������� � Los Santos Airport", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, 433.1179, -1796.5649, 5.5469);
						format(string, sizeof string, "*** %s ���������������� �� Santa Marina Beach", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, 2499.8733, -1667.6309, 13.3512);
						format(string, sizeof string, "*** %s ���������������� �� Grove Street", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, 1461.0043, -1019.4626, 24.6975);
						format(string, sizeof string, "*** %s ���������������� � Los Santos City Hall", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, 1544.87, -1675.8081, 13.5593);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s ���������������� � Los Santos Police Department", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, 595.1895, -1243.1205, 18.0844);
						format(string, sizeof string, "*** %s ���������������� � Los Santos Bank", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, 2791.1782, -2534.6309, 13.6303);
						format(string, sizeof string, "*** %s ���������������� � Ocean Docks", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 7:
					{
						SetPlayerPos(playerid, 1255.2925, -778.2413, 92.0302);
						format(string, sizeof string, "*** %s ���������������� � Crazybob's House", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 8:
					{
						SetPlayerPos(playerid, 2229.02, -1159.8, 25.7981);
						format(string, sizeof string, "*** %s ���������������� � Jefferson Motel", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}���� ����������", "Los Santos\nSan Fierro\nLas Venturas\n������", "��", "������");
		}
		case DIALOG_TPSF:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, -1315.9419, -223.8595, 14.1484);
						format(string, sizeof string, "*** %s ���������������� � San Fierro Airport", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, -2672.6116, 1268.4943, 55.9456);
						format(string, sizeof string, "*** %s ���������������� � San Fierro City Hall", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, -2050.6089, 459.3649, 35.1719);
						format(string, sizeof string, "*** %s ���������������� � San Fierro Bank", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, -2670.1101, -4.9832, 6.1328);
						format(string, sizeof string, "*** %s ���������������� � Ocean Flats", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, -2515.6768, -611.6651, 132.5625);
						format(string, sizeof string, "*** %s ���������������� � Missionary Hill", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, -2621.0244, 1403.7534, 7.0938);
						format(string, sizeof string, "*** %s ���������������� � Jizzy's Pleasure Dome", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, -1608.1376, 718.9722, 12.4356);
						format(string, sizeof string, "*** %s ���������������� �� San Fierro Police Station", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}���� ����������", "Los Santos\nSan Fierro\nLas Venturas\n������", "��", "������");
		}
		case DIALOG_TPLV:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, 1487.9703, 1736.9537, 10.8125);
						format(string, sizeof string, "*** %s ���������������� � Las Venturas Airport", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, 2421.7185, 1121.9866, 10.8125);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s ���������������� � Las Venturas City Hall", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, 2287.2561, 2426.2576, 10.8203);
						format(string, sizeof string, "*** %s ���������������� �� Las Venturas Police Station", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, 2187.835, 1678.5358, 11.1094);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s ���������������� � Caligulas Casino", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, 2227.3596, 1894.3228, 10.6719);
						format(string, sizeof string, "*** %s ���������������� � Starfish Casino", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, 2463.668, 2240.7524, 10.8203);
						format(string, sizeof string, "*** %s ���������������� � Las Venturas Bank", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, 1434.6989, 2654.4026, 11.3926);
						format(string, sizeof string, "*** %s ���������������� � Prickle Pine", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 7:
					{
						SetPlayerPos(playerid, 1493.2443, 2238.1526, 11.0291);
						format(string, sizeof string, "*** %s ���������������� �� Bandit Stadium", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 8:
					{
						SetPlayerPos(playerid, 1929.0522, 707.8507, 10.8203);
						format(string, sizeof string, "*** %s ���������������� � Last Dime Motel", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}���� ����������", "Los Santos\nSan Fierro\nLas Venturas\n������", "��", "������");
		}
		case DIALOG_TP_OTHER:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, 414.9159, 2532.97, 19.1484);
						format(string, sizeof string, "*** %s ���������������� � Verdant Meadows", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, -2271.0764, 2317.8457, 4.8202);
						SetPlayerFacingAngle(playerid, 180.0);
						format(string, sizeof string, "*** %s ���������������� �� Bayside", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, 2259.5532, -85.0334, 26.5107);
						SetPlayerFacingAngle(playerid, 180.0);
						format(string, sizeof string, "*** %s ���������������� � Palomino Creek", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, 1377.4314, 271.4077, 19.5669);
						format(string, sizeof string, "*** %s ���������������� � Montgomery", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, 183.9907, -108.544, 2.0234);
						format(string, sizeof string, "*** %s ���������������� � Blueberry", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, -2809.0, -1516.5, 142.0);
						SetPlayerFacingAngle(playerid, 270.0);
						format(string, sizeof string, "*** %s ���������������� � Mount Chilliad Cabin", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, -2238.0, -1712.27, 482.0);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s ���������������� �� Top of Mount Chilliad", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 7:
					{
						SetPlayerPos(playerid, -2409.5, -2190.0, 35.0);
						SetPlayerFacingAngle(playerid, 270.0);
						format(string, sizeof string, "*** %s ���������������� �� Mount Chilliad", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}���� ����������", "Los Santos\nSan Fierro\nLas Venturas\n������", "��", "������");
		}
		case DIALOG_HELP:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_ABOUT, DIALOG_STYLE_MSGBOX, "{FFFF00}� GangWar ����", "������ ������������� ������ ����: LethaL'�\n������������ ���� - Shurik\n��������� ������� - aig & Shurik", "�����", "�����");
					case 1: ShowPlayerDialog(playerid, DIALOG_RACE, DIALOG_STYLE_MSGBOX, "{FFFF00}������� �� �����", RaceAboutStr, "�����", "�����");
					case 2: ShowPlayerDialog(playerid, DIALOG_PVP_ABOUT, DIALOG_STYLE_MSGBOX, "{FFFF00}������� �� PVP", PvpAboutStr, "�����", "�����");
					case 3: ShowPlayerDialog(playerid, DIALOG_VEHICLE, DIALOG_STYLE_MSGBOX, "{FFFF00}������� �� ���������� �����������", AvtoAboutStr, "�����", "�����");
				}
			}
		}
		case DIALOG_ABOUT, DIALOG_RACE, DIALOG_PVP_ABOUT, DIALOG_VEHICLE:
		{
			if(response) ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "{FFFF00}������", "� GangWar ����\n������� �� �����\n������� �� PVP\n������� �� ���������� �����������", "�������", "������");
		}
		case DIALOG_ACTIONS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_SPEC_ACTIONS, DIALOG_STYLE_LIST, "{FFFF00}����������� ��������", "dance 1\ndance 2\ndance 3\ndance 4\nhandsup", "�������", "������");
					case 1: ShowPlayerDialog(playerid, DIALOG_FIGHTING_STYLES, DIALOG_STYLE_LIST, "{FFFF00}����� ���", "Boxing\nKungfu\nKneeHead\nGrabkick\nElbow", "�������", "������");
					case 2: ShowPlayerDialog(playerid, DIALOG_ANIMATION, DIALOG_STYLE_LIST, "{FFFF00}������ ��������", "���������� ��������\nDrunk Walk\nbomb\ngetarrested\nlaugh\nlookout\n\
					robman\ncrossarms\nlay\nhide\nvomit\neat\nwave\ntaichi\ndeal\ncrack\nsmokem\nsmokef\ngroundsit\nchat\nfucku", "�������", "������");
				}
			}
		}
		case DIALOG_SPEC_ACTIONS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
					case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
					case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
					case 3: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
					case 4: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
				}
			}
		}
		case DIALOG_FIGHTING_STYLES:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetPlayerFightingStyle(playerid, FIGHT_STYLE_NORMAL);
						PlayerInfo[playerid][pFightStyle] = FIGHT_STYLE_NORMAL;
					}
					case 1:
					{
						SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
						PlayerInfo[playerid][pFightStyle] = FIGHT_STYLE_BOXING;
					}
					case 2:
					{
						SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
						PlayerInfo[playerid][pFightStyle] = FIGHT_STYLE_KUNGFU;
					}
					case 3:
					{
						SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);
						PlayerInfo[playerid][pFightStyle] = FIGHT_STYLE_KNEEHEAD;
					}
					case 4:
					{
						SetPlayerFightingStyle(playerid, FIGHT_STYLE_GRABKICK);
						PlayerInfo[playerid][pFightStyle] = FIGHT_STYLE_GRABKICK;
					}
					case 5:
					{
						SetPlayerFightingStyle(playerid, FIGHT_STYLE_ELBOW);
						PlayerInfo[playerid][pFightStyle] = FIGHT_STYLE_ELBOW;
					}
				}
			}
		}
		case DIALOG_ANIMATION:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: StopLoopingAnim(playerid);
					case 1: LoopingAnim(playerid, "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 0, 0, 1);
					case 2: ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0, 1);
					case 3: ApplyAnimation(playerid, "ped", "ARRESTgun", 4.1, 0, 1, 1, 1, 1, 1);
					case 4: ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.1, 0, 0, 0, 0, 0, 1);
					case 5: ApplyAnimation(playerid, "SHOP", "ROB_Shifty", 4.1, 0, 0, 0, 0, 0, 1);
					case 6: LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.1, 1, 0, 0, 0, 0, 1);
					case 7: ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1, 1);
					case 8: LoopingAnim(playerid, "BEACH", "bather", 4.1, 1, 0, 0, 0, 0, 1);
					case 9: LoopingAnim(playerid, "ped", "cower", 4.1, 1, 0, 0, 0, 0, 1);
					case 10: ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 4.1, 0, 0, 0, 0, 0, 1);
					case 11: ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 0, 0, 0, 0, 1);
					case 12: LoopingAnim(playerid, "ON_LOOKERS", "wave_loop", 4.1, 1, 0, 0, 0, 0, 1);
					case 13: LoopingAnim(playerid, "PARK", "Tai_Chi_Loop", 4.1, 1, 0, 0, 0, 0, 1);
					case 14: ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.1, 0, 0, 0, 0, 0, 1);
					case 15: LoopingAnim(playerid, "CRACK", "crckdeth2", 4.1, 1, 0, 0, 0, 0, 1);
					case 16: LoopingAnim(playerid, "SMOKING", "M_smklean_loop", 4.1, 1, 0, 0, 0, 0, 1);
					case 17: LoopingAnim(playerid, "SMOKING", "F_smklean_loop", 4.1, 1, 0, 0, 0, 0, 1);
					case 18: LoopingAnim(playerid, "BEACH", "ParkSit_M_loop", 4.1, 1, 0, 0, 0, 0, 1);
					case 19: ApplyAnimation(playerid, "PED", "IDLE_CHAT", 4.1, 0, 0, 0, 0, 0, 1);
					case 20: ApplyAnimation(playerid, "PED", "fucku", 4.1, 0, 0, 0, 0, 0, 1);
				}
			}
		}
		case DIALOG_PLAYER_MENU:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_PM, DIALOG_STYLE_INPUT, "{FFFF00}�������� PM", "�������� ���� ��������� ����:", "��", "�����");
					case 1: ShowPlayerDialog(playerid, DIALOG_GIVE_MONEY, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "������� ���� ������ ����� ��� ��������:", "��", "�����");
					case 2:
					{
						if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "�� ��� ���������� � PvP.");
						if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: �� ���������� � �����.");
						if(PlayerInfo[playerid][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "�� ���������� �� dm! ������� /exitdm, ����� �����.");
						if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "�� ��������� ���������!");
						if(PlayerInfo[playerid][pJail]) return SendClientMessage(playerid, COLOR_RED, "������: �� ���������� � ������!");
						if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "������: �� �� ������ ���������� � ����������");
						if(IsPlayerInAnyVehicle(PlayerInfo[playerid][pClickedId])) return SendClientMessage(playerid, -1, "������: ����� �� ������ ���������� � ����������");
						if(!PlayerInfo[PlayerInfo[playerid][pClickedId]][pPvpAccept]) return SendClientMessage(playerid, COLOR_YELLOW, "����� �������� ����������� ������� � PVP");
						if(PlayerInfo[PlayerInfo[playerid][pClickedId]][pInPvp]) return SendClientMessage(playerid, -1, "���� ����� ��� ��������� � PvP.");
						if(PlayerInfo[PlayerInfo[playerid][pClickedId]][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** ������: ���� ����� ��������� � �����.");
						if(PlayerInfo[PlayerInfo[playerid][pClickedId]][pDmZone] > 0) return SendClientMessage(playerid, COLOR_YELLOW, "����� ��������� �� dm!");
						if(PlayerInfo[PlayerInfo[playerid][pClickedId]][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "���� ����� �������� ���������!");
						if(PlayerInfo[PlayerInfo[playerid][pClickedId]][pJail]) return SendClientMessage(playerid, COLOR_RED, "������: ������ ����� � ������!");
						ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ID ������ ����:", "��", "�����");
					}
					case 3: ShowPlayerDialog(playerid, DIALOG_REPORT, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "�������� ����� ������ ����:", "��", "�����");
					case 4:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pGangLvl] >= 4)
						{
							PlayerInfo[playerid][pDialog] = DIALOG_GANG_INVITE;
							valstr(string, PlayerInfo[playerid][pClickedId]);
							OnDialogResponse(playerid, DIALOG_GANG_INVITE, 1, 0, string);
						}
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ��� ������� 4 �������.");
					}
					case 5:
					{
						format(string, sizeof string, "/stats %d", PlayerInfo[playerid][pClickedId]);
						OnPlayerCommandText(playerid, string);
					}
					case 6:
					{
						PlayerInfo[playerid][pPointsId] = PlayerInfo[playerid][pClickedId];
						ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ���������� �����, ������� ������ ��������:", "��", "�����");
					}
				}
			}
		}
		case DIALOG_DMPOINTS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "�������� ����, ������� ����� �� ������ ��������\n3 ���� = 1 ����", "��", "�����");
					case 1: ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� �����", "�������� ����, ������� ������ �� ������ ��������\n1 ���� = 3 ����", "��", "�����");
					case 2: ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ID ������, �������� ������ �������� ����:", "��", "�����");
				}
			}
		}
		case DIALOG_DMPOINTS_EXCHANGE:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "�������� ����, ������� ����� �� ������ ��������\n3 ���� = 1 ����", "��", "�����");
				new amount = strval(inputtext);
				if(amount % 3)
				{
					SendClientMessage(playerid, COLOR_RED, "�������� ���� ���������� ����� �������� ������!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "�������� ����, ������� ����� �� ������ ��������\n3 ���� = 1 ����", "��", "�����");
					return 1;
				}
				new amount2 = floatround(amount / 3, floatround_tozero);
				PlayerInfo[playerid][pDmPoints] -= amount;
				PlayerInfo[playerid][pKills] += amount2;
				format(string, sizeof string, "�� �������� %d ����� �� %d �����", amount, amount2);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM ����", "�������� ���� �� �����\n�������� ����� �� ����\n�������� ���� ������", "��", "������");
		}
		case DIALOG_DMPOINTS_EXCHANGE_2:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� �����", "�������� ����, ������� ������ �� ������ ��������\n1 ���� = 3 ����", "��", "�����");
				new amount = strval(inputtext);
				PlayerInfo[playerid][pKills] -= amount;
				PlayerInfo[playerid][pDmPoints] += amount * 3;
				format(string, sizeof string, "�� �������� %d ����� �� %d �����", amount, amount * 3);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM ����", "�������� ���� �� �����\n�������� ����� �� ����\n�������� ���� ������", "��", "������");
		}
		case DIALOG_DMPOINTS_GIVE:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ID ������, �������� ������ �������� ����:", "��", "�����");
				PlayerInfo[playerid][pPointsId] = strval(inputtext);
				if(!IsPlayerConnected(PlayerInfo[playerid][pPointsId]))
				{
					SendClientMessage(playerid, COLOR_RED, "������ ����� �������!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ID ������, �������� ������ �������� ����:", "��", "�����");
					return 1;
				}
				ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ���������� �����, ������� ������ ��������:", "��", "�����");
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM ����", "�������� ���� �� �����\n�������� ����� �� ����\n�������� ���� ������", "��", "������");
		}
		case DIALOG_DMPOINTS_GIVE_2:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ���������� �����, ������� ������ ��������:", "��", "�����");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED, "�� ������� �������� ���������� �����!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ���������� �����, ������� ������ ��������:", "��", "�����");
					return 1;
				}
				if(PlayerInfo[playerid][pDmPoints] < amount)
				{
					SendClientMessage(playerid, COLOR_RED, "� ��� �� ������� �����!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ���������� �����, ������� ������ ��������:", "��", "�����");
					return 1;
				}
				PlayerInfo[playerid][pDmPoints] -= amount;
				PlayerInfo[PlayerInfo[playerid][pPointsId]][pDmPoints] += amount;
				format(string, sizeof string, "�� �������� %s(ID: %d), %d DM-�����.", PlayerInfo[PlayerInfo[playerid][pPointsId]][pName], PlayerInfo[playerid][pPointsId], amount);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof string, "�� �������� %d DM-����� �� %s(ID: %d).", amount, PlayerInfo[playerid][pName], playerid);
				SendClientMessage(PlayerInfo[playerid][pPointsId], COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����", "������� ID ������, �������� ������ �������� ����:", "��", "�����");
		}
		case DIALOG_PM:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_PM, DIALOG_STYLE_INPUT, "{FFFF00}�������� PM", "�������� ���� ��������� ����:", "��", "�����");
				format(string, sizeof string, "/pm %d %s", PlayerInfo[playerid][pClickedId], inputtext);
				OnPlayerCommandText(playerid, string);
			}
			else
			{
				format(string, sizeof string, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClickedId]][pName], PlayerInfo[playerid][pClickedId]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, string, "�������� PM\n�������� ������\n���������� �� PVP\n�������� ������\n���������� � �����\n���������� ����������\n�������� DM-����", "�������", "������");
			}
		}
		case DIALOG_GIVE_MONEY:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_PM, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "������� ���� ������ ����� ��� ��������:", "��", "�����");
				format(string, sizeof string, "/givemoney %d %d", PlayerInfo[playerid][pClickedId], strval(inputtext));
				OnPlayerCommandText(playerid, string);
			}
			else
			{
				format(string, sizeof string, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClickedId]][pName], PlayerInfo[playerid][pClickedId]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, string, "�������� PM\n�������� ������\n���������� �� PVP\n�������� ������\n���������� � �����\n���������� ����������\n�������� DM-����", "�������", "������");
			}
		}
		case DIALOG_REPORT:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_REPORT, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "�������� ����� ������ ����:", "��", "�����");
				format(string, sizeof string, "/report %d %s", PlayerInfo[playerid][pClickedId], inputtext);
				OnPlayerCommandText(playerid, string);
			}
			else
			{
				format(string, sizeof string, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClickedId]][pName], PlayerInfo[playerid][pClickedId]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, string, "�������� PM\n�������� ������\n���������� �� PVP\n�������� ������\n���������� � �����\n���������� ����������\n�������� DM-����", "�������", "������");
			}
		}
		case DIALOG_PVP_INVITE_1:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ID ������ ����:", "��", "�����");
				PlayerInfo[playerid][pPvpWeapon] = strval(inputtext);
				switch(PlayerInfo[playerid][pPvpWeapon])
				{
					case 16, 24, 25, 27, 29, 31, 34: ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ������� ����� (1/0) ����:", "��", "�����");
					default:
					{
						SendClientMessage(playerid, -1, "�� ����� �������� id ������. ��������� id: 16, 24, 25, 27, 29, 31, 34");
						ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ID ������ ����:", "��", "�����");
						return 1;
					}
				}
			}
			else
			{
				format(string, sizeof string, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClickedId]][pName], PlayerInfo[playerid][pClickedId]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, string, "�������� PM\n�������� ������\n���������� �� PVP\n�������� ������\n���������� � �����\n���������� ����������\n�������� DM-����", "�������", "������");
			}
		}
		case DIALOG_PVP_INVITE_2:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ������� ����� (1/0) ����:", "��", "�����");
				PlayerInfo[playerid][pPvpArmour] = strval(inputtext);
				if(!(0 <= PlayerInfo[playerid][pPvpArmour] <= 1))
				{
					SendClientMessage(playerid, -1, "�� ����� �������� ������� �����. ��������� 1/0");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ������� ����� (1/0) ����:", "��", "�����");
					return 1;
				}
				ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� (1-5) ����:", "��", "�����");
			}
			else ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ID ������ ����:", "��", "�����");
		}
		case DIALOG_PVP_INVITE_3:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� (1-5) ����:", "��", "�����");
				PlayerInfo[playerid][pPvpPlace] = strval(inputtext) - 1;
				if(!(0 <= PlayerInfo[playerid][pPvpPlace] <= 4))
				{
					SendClientMessage(playerid, -1, "�� ����� �������� �����. ����������� ����� �� 1 �� 5");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� (1-5) ����:", "��", "�����");
					return 1;
				}
				if(PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]])
				{
					SendClientMessage(playerid, -1, "PvP-����� ������.");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� (1-5) ����:", "��", "�����");
					return 1;
				}
				ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� ������ ����:", "��", "�����");
			}
			else ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ������� ����� (1/0) ����:", "��", "�����");
		}
		case DIALOG_PVP_INVITE_4:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� ������ ����:", "��", "�����");
				PlayerInfo[playerid][pPvpMoney] = strval(inputtext);
				if(!(1 <= PlayerInfo[playerid][pPvpMoney] <= 100000))
				{
					SendClientMessage(playerid, -1, "�� ����� �������� ����� ������. ����������� ����� �� 1$ �� 100000$");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� ������ ����:", "��", "�����");
					return 1;
				}
				if(PlayerInfo[playerid][pPvpMoney] > PlayerInfo[playerid][pMoney])
				{
					SendClientMessage(playerid, -1, "� ��� ��������� �����.");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� ������ ����:", "��", "�����");
					return 1;
				}
				if(PlayerInfo[playerid][pPvpMoney] > PlayerInfo[PlayerInfo[playerid][pClickedId]][pMoney])
				{
					SendClientMessage(playerid, -1, "� ���������� ��������� �����.");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� ������ ����:", "��", "�����");
					return 1;
				}
				PlayerInfo[PlayerInfo[playerid][pClickedId]][pPvpCreate] = playerid;
				format(string, sizeof string, "�� ������� ���������� ������ {9DDAF2}%s{FFFFFF} �� PVP! ��������� ������.", PlayerInfo[PlayerInfo[playerid][pClickedId]][pName]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "����� %s ���������� ���� �� PVP.\n\n������: %d\n�����: %d\n�����: %d\n������: %d$", PlayerInfo[playerid][pName], PlayerInfo[playerid][pPvpWeapon], PlayerInfo[playerid][pPvpArmour], PlayerInfo[playerid][pPvpPlace], PlayerInfo[playerid][pPvpMoney]);
				ShowPlayerDialog(PlayerInfo[playerid][pClickedId], DIALOG_PVP, DIALOG_STYLE_MSGBOX, "{FFFF00}����������� �� PVP", string, "��", "���");
			}
			else ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}���������� �� PVP", "������� ����� (1-5) ����:", "��", "�����");
		}
		case DIALOG_TUNING:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0:
					{
						AddVehicleComponent(vehid, 1010);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
					}
					case 1: ShowPlayerDialog(playerid, DIALOG_TUNING_COLOR, DIALOG_STYLE_LIST, "{FFFF00}���� ���� 1", "�����\n׸����\n���������\n�������\nҸ��� �����\n����������\n������\nҸ��� �������\n�����", "��", "�����");
					case 2: ShowPlayerDialog(playerid, DIALOG_TUNING_WHEELS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Shadow\nMega\nRimshine\nWires\nClassic\nTwist\nCutter\nSwitch\nGrove\nImport\nDollar\nTrance\nAtomic\nAhab\nVirtual\nAcces", "��", "�����");
					case 3:
					{
						AddVehicleComponent(vehid, 1086);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
					}
					case 4:
					{
						AddVehicleComponent(vehid, 1087);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
					}
					case 5:
					{
						switch(GetVehicleModel(vehid))
						{
							case 558..562, 565: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_1, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob\nAlien\nX-Flow", "�������", "�����");
							case 535, 575, 576: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_2, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob\nChrome\nSlamin", "�������", "�����");
							case 536, 567: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_3, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob\nChrome\nSlamin\nHardtop Roof\nSofttop Roof", "�������", "�����");
							case 534: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_4, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob\nChrome\nSlamin\nFlame Sideskirt\nArches Sideskirt Roof", "�������", "�����");
							case 401, 410, 415, 418, 420, 436, 439, 458, 489, 491, 492, 496, 505, 516, 517, 518, 527, 529, 540, 546, 547, 549, 550, 551, 580, 585, 587, 589, 600, 603: RegularCarDialog(playerid);
							default: SendClientMessage(playerid, COLOR_RED, "��� ����� ���� ������ ������ �� ��������!");
						}
					}
				}
			}
		}
		case DIALOG_TUNING_COLOR:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
			new color1, color2, vehid = GetPlayerVehicleID(playerid);
			GetVehicleColor(vehid, color1, color2);
			ChangeVehicleColor(vehid, ColorsArray[listitem], color2);
			ShowPlayerDialog(playerid, DIALOG_TUNING_COLOR_2, DIALOG_STYLE_LIST, "{FFFF00}���� ���� 2", "�����\n׸����\n���������\n�������\nҸ��� �����\n����������\n������\nҸ��� �������\n�����", "��", "�����");
		}
		case DIALOG_TUNING_COLOR_2:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_TUNING_COLOR, DIALOG_STYLE_LIST, "{FFFF00}���� ���� 1", "�����\n׸����\n���������\n�������\nҸ��� �����\n����������\n������\nҸ��� �������\n�����", "��", "�����");
			new color1, color2, vehid = GetPlayerVehicleID(playerid);
			GetVehicleColor(vehid, color1, color2);
			ChangeVehicleColor(vehid, color1, ColorsArray[listitem]);
			ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
		}
		case DIALOG_TUNING_WHEELS:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), WheelsArray[listitem]);
			ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
		}
		case DIALOG_TUNING_PAINTJOB_1:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob 1\nPaintjob 2\nPaintjob 3", "��", "�����");
					case 1:
					{
						switch(GetVehicleModel(vehid))
						{
							case 558:
							{
								AddVehicleComponent(vehid, 1090);
								AddVehicleComponent(vehid, 1094);
								AddVehicleComponent(vehid, 1092);
								AddVehicleComponent(vehid, 1088);
								AddVehicleComponent(vehid, 1164);
								AddVehicleComponent(vehid, 1168);
								AddVehicleComponent(vehid, 1166);
							}
							case 559:
							{
								AddVehicleComponent(vehid, 1069);
								AddVehicleComponent(vehid, 1071);
								AddVehicleComponent(vehid, 1065);
								AddVehicleComponent(vehid, 1067);
								AddVehicleComponent(vehid, 1162);
								AddVehicleComponent(vehid, 1159);
								AddVehicleComponent(vehid, 1160);
							}
							case 560:
							{
								AddVehicleComponent(vehid, 1026);
								AddVehicleComponent(vehid, 1027);
								AddVehicleComponent(vehid, 1028);
								AddVehicleComponent(vehid, 1032);
								AddVehicleComponent(vehid, 1138);
								AddVehicleComponent(vehid, 1141);
								AddVehicleComponent(vehid, 1169);
							}
							case 561:
							{
								AddVehicleComponent(vehid, 1056);
								AddVehicleComponent(vehid, 1062);
								AddVehicleComponent(vehid, 1064);
								AddVehicleComponent(vehid, 1055);
								AddVehicleComponent(vehid, 1058);
								AddVehicleComponent(vehid, 1154);
								AddVehicleComponent(vehid, 1155);
							}
							case 562:
							{
								AddVehicleComponent(vehid, 1036);
								AddVehicleComponent(vehid, 1040);
								AddVehicleComponent(vehid, 1034);
								AddVehicleComponent(vehid, 1038);
								AddVehicleComponent(vehid, 1147);
								AddVehicleComponent(vehid, 1171);
								AddVehicleComponent(vehid, 1149);
							}
							case 565:
							{
								AddVehicleComponent(vehid, 1047);
								AddVehicleComponent(vehid, 1051);
								AddVehicleComponent(vehid, 1046);
								AddVehicleComponent(vehid, 1054);
								AddVehicleComponent(vehid, 1049);
								AddVehicleComponent(vehid, 1150);
								AddVehicleComponent(vehid, 1153);
							}
						}
					}
					case 2:
					{
						switch(GetVehicleModel(vehid))
						{
							case 558:
							{
								AddVehicleComponent(vehid, 1093);
								AddVehicleComponent(vehid, 1095);
								AddVehicleComponent(vehid, 1089);
								AddVehicleComponent(vehid, 1091);
								AddVehicleComponent(vehid, 1163);
								AddVehicleComponent(vehid, 1167);
								AddVehicleComponent(vehid, 1165);
							}
							case 559:
							{
								AddVehicleComponent(vehid, 1070);
								AddVehicleComponent(vehid, 1072);
								AddVehicleComponent(vehid, 1066);
								AddVehicleComponent(vehid, 1068);
								AddVehicleComponent(vehid, 1158);
								AddVehicleComponent(vehid, 1161);
								AddVehicleComponent(vehid, 1173);
							}
							case 560:
							{
								AddVehicleComponent(vehid, 1031);
								AddVehicleComponent(vehid, 1030);
								AddVehicleComponent(vehid, 1029);
								AddVehicleComponent(vehid, 1033);
								AddVehicleComponent(vehid, 1139);
								AddVehicleComponent(vehid, 1140);
								AddVehicleComponent(vehid, 1170);
							}
							case 561:
							{
								AddVehicleComponent(vehid, 1057);
								AddVehicleComponent(vehid, 1063);
								AddVehicleComponent(vehid, 1059);
								AddVehicleComponent(vehid, 1061);
								AddVehicleComponent(vehid, 1060);
								AddVehicleComponent(vehid, 1154);
								AddVehicleComponent(vehid, 1157);
							}
							case 562:
							{
								AddVehicleComponent(vehid, 1041);
								AddVehicleComponent(vehid, 1039);
								AddVehicleComponent(vehid, 1037);
								AddVehicleComponent(vehid, 1035);
								AddVehicleComponent(vehid, 1146);
								AddVehicleComponent(vehid, 1148);
								AddVehicleComponent(vehid, 1172);
							}
							case 565:
							{
								AddVehicleComponent(vehid, 1048);
								AddVehicleComponent(vehid, 1045);
								AddVehicleComponent(vehid, 1053);
								AddVehicleComponent(vehid, 1050);
								AddVehicleComponent(vehid, 1152);
								AddVehicleComponent(vehid, 1151);
								AddVehicleComponent(vehid, 1052);
							}
						}
					}
				}
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
			}
		}
		case DIALOG_TUNING_PAINTJOB_2:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob 1\nPaintjob 2\nPaintjob 3", "��", "�����");
					case 1:
					{
						switch(GetVehicleModel(vehid))
						{
							case 535:
							{
								AddVehicleComponent(vehid, 1109);
								AddVehicleComponent(vehid, 1113);
								AddVehicleComponent(vehid, 1115);
								AddVehicleComponent(vehid, 1117);
								AddVehicleComponent(vehid, 1118);
								AddVehicleComponent(vehid, 1120);
							}
							case 575:
							{
								AddVehicleComponent(vehid, 1042);
								AddVehicleComponent(vehid, 1044);
								AddVehicleComponent(vehid, 1099);
								AddVehicleComponent(vehid, 1174);
								AddVehicleComponent(vehid, 1176);
							}
							case 576:
							{
								AddVehicleComponent(vehid, 1134);
								AddVehicleComponent(vehid, 1136);
								AddVehicleComponent(vehid, 1137);
								AddVehicleComponent(vehid, 1191);
								AddVehicleComponent(vehid, 1192);
							}
						}
					}
					case 2:
					{
						switch(GetVehicleModel(vehid))
						{
							case 535:
							{
								AddVehicleComponent(vehid, 1110);
								AddVehicleComponent(vehid, 1114);
								AddVehicleComponent(vehid, 1116);
								AddVehicleComponent(vehid, 1119);
								AddVehicleComponent(vehid, 1121);
							}
							case 575:
							{
								AddVehicleComponent(vehid, 1177);
								AddVehicleComponent(vehid, 1175);
								AddVehicleComponent(vehid, 1143);
							}
							case 576:
							{
								AddVehicleComponent(vehid, 1135);
								AddVehicleComponent(vehid, 1190);
								AddVehicleComponent(vehid, 1193);
							}
						}
					}
				}
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
			}
		}
		case DIALOG_TUNING_PAINTJOB_3:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob 1\nPaintjob 2\nPaintjob 3", "��", "�����");
					case 1:
					{
						switch(GetVehicleModel(vehid))
						{
							case 536:
							{
								AddVehicleComponent(vehid, 1104);
								AddVehicleComponent(vehid, 1107);
								AddVehicleComponent(vehid, 1108);
								AddVehicleComponent(vehid, 1182);
								AddVehicleComponent(vehid, 1184);
							}
							case 567:
							{
								AddVehicleComponent(vehid, 1129);
								AddVehicleComponent(vehid, 1133);
								AddVehicleComponent(vehid, 1102);
								AddVehicleComponent(vehid, 1187);
								AddVehicleComponent(vehid, 1189);
							}
						}
					}
					case 2:
					{
						switch(GetVehicleModel(vehid))
						{
							case 536:
							{
								AddVehicleComponent(vehid, 1105);
								AddVehicleComponent(vehid, 1183);
								AddVehicleComponent(vehid, 1181);
							}
							case 567:
							{
								AddVehicleComponent(vehid, 1188);
								AddVehicleComponent(vehid, 1186);
								AddVehicleComponent(vehid, 1132);
							}
						}
					}
					case 3:
					{
						switch(GetVehicleModel(vehid))
						{
							case 536: AddVehicleComponent(vehid, 1128);
							case 567: AddVehicleComponent(vehid, 1130);
						}
					}
					case 4:
					{
						switch(GetVehicleModel(vehid))
						{
							case 536: AddVehicleComponent(vehid, 1103);
							case 567: AddVehicleComponent(vehid, 1131);
						}
					}
				}
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
			}
		}
		case DIALOG_TUNING_PAINTJOB_4:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Paintjob 1\nPaintjob 2\nPaintjob 3", "��", "�����");
					case 1:
					{
						AddVehicleComponent(vehid, 1100);
						AddVehicleComponent(vehid, 1122);
						AddVehicleComponent(vehid, 1123);
						AddVehicleComponent(vehid, 1125);
						AddVehicleComponent(vehid, 1126);
						AddVehicleComponent(vehid, 1179);
						AddVehicleComponent(vehid, 1180);
					}
					case 2:
					{
						AddVehicleComponent(vehid, 1185);
						AddVehicleComponent(vehid, 1178);
						AddVehicleComponent(vehid, 1127);
					}
					case 3:
					{
						AddVehicleComponent(vehid, 1122);
						AddVehicleComponent(vehid, 1101);
					}
					case 4:
					{
						AddVehicleComponent(vehid, 1106);
						AddVehicleComponent(vehid, 1124);
					}
				}
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
			}
		}
		case DIALOG_TUNING_PAINTJOB_5:
		{
			if(response && 0 <= listitem <= 2) ChangeVehiclePaintjob(GetPlayerVehicleID(playerid), listitem);
			RegularCarDialog(playerid);
		}
		case DIALOG_TUNING_COMPONENTS:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
			else
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_TUNING_SPOILERS_1, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Pro\nWin\nDrag\nAlpha\nChamp\nRace\nWorx\nFury", "�������", "�����");
					case 1:
					{
						switch(GetVehicleModel(vehid))
						{
							case 418, 527, 580, 585, 603:
							{
								AddVehicleComponent(vehid, 1006);
								RegularCarDialog(playerid);
							}
							case 439, 458, 491, 517, 547: ShowPlayerDialog(playerid, DIALOG_TUNING_VENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Oval\nSquare", "�������", "�����");
							case 415:
							{
								AddVehicleComponent(vehid, 1007);
								AddVehicleComponent(vehid, 1071);
								RegularCarDialog(playerid);
							}
							default:
							{
								AddVehicleComponent(vehid, 1006);
								RegularCarDialog(playerid);
							}
						}
					}
					case 2:
					{
						switch(GetVehicleModel(vehid))
						{
							case 549, 585, 603: ShowPlayerDialog(playerid, DIALOG_TUNING_VENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Oval\nSquare", "�������", "�����");
							case 410, 418, 436, 439, 458, 491, 516, 517, 527, 580:
							{
								AddVehicleComponent(vehid, 1007);
								AddVehicleComponent(vehid, 1071);
								RegularCarDialog(playerid);
							}
							default: ShowPlayerDialog(playerid, DIALOG_TUNING_SPOILERS_2, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Champ\nFury\nRace\nWorx", "�������", "�����");
						}
					}
					case 3:
					{
						switch(GetVehicleModel(vehid))
						{
							case 492, 529, 549, 551, 585, 603:
							{
								AddVehicleComponent(vehid, 1007);
								AddVehicleComponent(vehid, 1071);
								RegularCarDialog(playerid);
							}
							case 410, 436, 439, 458, 489, 505: ShowPlayerDialog(playerid, DIALOG_TUNING_LIGHTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Round Fog\nSquare Fog", "�������", "�����");
							default: ShowPlayerDialog(playerid, DIALOG_TUNING_VENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Oval\nSquare", "�������", "�����");
						}
					}
					case 4:
					{
						switch(GetVehicleModel(vehid))
						{
							case 549, 550, 585, 603: ShowPlayerDialog(playerid, DIALOG_TUNING_LIGHTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Round Fog\nSquare Fog", "�������", "�����");
							default:
							{
								AddVehicleComponent(vehid, 1007);
								AddVehicleComponent(vehid, 1071);
								RegularCarDialog(playerid);
							}
						}
					}
					case 5: ShowPlayerDialog(playerid, DIALOG_TUNING_LIGHTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "Round Fog\nSquare Fog", "�������", "�����");
				}
			}
		}
		case DIALOG_TUNING_SPOILERS_1:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), SpoilersArray[listitem]);
			RegularCarDialog(playerid);
		}
		case DIALOG_TUNING_SPOILERS_2:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), HoodsArray[listitem]);
			RegularCarDialog(playerid);
		}
		case DIALOG_TUNING_LIGHTS:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), LampsArray[listitem]);
			RegularCarDialog(playerid);
		}
		case DIALOG_TUNING_VENTS:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0:
					{
						AddVehicleComponent(vehid, 1142);
						AddVehicleComponent(vehid, 1143);
					}
					case 1:
					{
						AddVehicleComponent(vehid, 1144);
						AddVehicleComponent(vehid, 1145);
					}
				}
			}
			RegularCarDialog(playerid);
		}
		case DIALOG_ELEVATOR:
		{
			if(response)
			{
				if(FloorRequestedBy[listitem] != INVALID_PLAYER_ID || IsFloorInQueue(listitem)) GameTextForPlayer(playerid, "~r~The floor is already in the queue", 3500, 4);
				else if(DidPlayerRequestElevator(playerid)) GameTextForPlayer(playerid, "~r~You already requested the elevator", 3500, 4);
				else CallElevator(playerid, listitem);
			}
		}
		case DIALOG_GANG:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						if(PlayerInfo[playerid][pGang] <= 0 && PlayerInfo[playerid][pKills] >= 300 && PlayerInfo[playerid][pMoney] >= 300000) ShowPlayerDialog(playerid, DIALOG_GANG_CREATE, DIALOG_STYLE_INPUT, "{FF0000}�������� �����", "������� �������� �����:", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ ����� �� ����� �����, � � ��� ������ ���� ��� ������� 300 ����� � 300.000$");
					}
					case 1:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_SKIN_LEVEL, DIALOG_STYLE_LIST, "{FF0000}���������� ������", "���\n�����\n�������\n�����\n��� ������\n�����", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ������� ������.");
					}
					case 2:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pMoney] >= 300000 && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_SPAWN, DIALOG_STYLE_MSGBOX, "{FF0000}���������� ������", "�� ����� ������ ��������� ����� ������ �� ���� �����?", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "��� ����� ������ ���������: ������� ������ � 300.000$");
					}
					case 3:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}���������� ������", "������� id ������, �������� ������ ��������� �������:", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ������� ������.");
					}
					case 4:
					{
						if(PlayerInfo[playerid][pGang] > 0)
						{
							format(string, sizeof string, "{FFFF00}����� ����� \"%s\"", GangName[PlayerInfo[playerid][pGang]]);
							ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "���������� �����\n�������� ������\n����� ������\n�������� DM-����\n����� DM-����", "�������", "�����");
						}
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����.");
					}
					case 5:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pGangLvl] >= 4) ShowPlayerDialog(playerid, DIALOG_GANG_INVITE, DIALOG_STYLE_INPUT, "{FF0000}����������� � �����", "������� id ������, �������� ������ ����������:", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ��� ������� 4 �������.");
					}
					case 6:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pGangLvl] >= 5) ShowPlayerDialog(playerid, DIALOG_GANG_KICK, DIALOG_STYLE_INPUT, "{FF0000}������� �� �����", "������� id ������, �������� ������ �������:", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ��� ������� 5 �������.");
					}
					case 7:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_COLOR, DIALOG_STYLE_INPUT, "{FF0000}����� �����", "������� 6 �������� ������� RRGGBB:", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ������� ������.");
					}
					case 8:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pMoney] >= 300000 && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_NAME, DIALOG_STYLE_INPUT, "{FF0000}����� ��������", "������� ����� �������� �����\n� ���� ����:", "�������", "������");
						else SendClientMessage(playerid, COLOR_RED_GANG, "��� ����� �������� ���������: ������� ������ � 300.000$");
					}
					case 9:
					{
						if(PlayerInfo[playerid][pGang] > 0 && PlayerInfo[playerid][pGangLvl] == 6)
						{
							format(string, sizeof string, "�� %s ��� ����� �����", GangTag[PlayerInfo[playerid][pGang]] ? ("���������") : ("��������"));
							SendClientMessage(playerid, COLOR_YELLOW_2, string);
							GangTag[PlayerInfo[playerid][pGang]] = !GangTag[PlayerInfo[playerid][pGang]];
							format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
							new iniFile = ini_openFile(string);
							if(iniFile >= INI_OK)
							{
								ini_setInteger(iniFile, "Tag", GangTag[PlayerInfo[playerid][pGang]]);
								ini_closeFile(iniFile);
							}
						}
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ������� ������.");
					}
					case 10:
					{
						if(PlayerInfo[playerid][pGang] > 0) ShowPlayerDialog(playerid, DIALOG_GANG_EXIT, DIALOG_STYLE_MSGBOX, "{FF0000}����� �� �����", "�� ����� ������ ���� �� �����?", "��", "���");
						else SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����.");
					}
				}
			}
		}
		case DIALOG_GANG_CREATE:
		{
			if(response)
			{
				CheckDialogColor(inputtext);
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_CREATE, DIALOG_STYLE_INPUT, "{FF0000}�������� �����", "������� �������� �����:", "�������", "������");
				format(GangTempName[playerid], sizeof GangTempName[], inputtext);
				ShowPlayerDialog(playerid, DIALOG_GANG_CREATE_COLOR, DIALOG_STYLE_INPUT, "{FF0000}�������� �����", "������� ���� �����:", "�������", "������");
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_SKIN:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_SKIN, DIALOG_STYLE_INPUT, "{FF0000}���������� ������", "������� ID �����, ������� ������ ���������:", "�������", "������");
				new skin = strval(inputtext);
				if(!(0 <= skin <= 311)) return SendClientMessage(playerid, COLOR_RED_GANG, "������������ ID �����!");
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					format(string, sizeof string, "Skin%d", PlayerInfo[playerid][pGangSkin]);
					ini_setInteger(iniFile, string, skin);
					ini_closeFile(iniFile);
					format(string, sizeof string, "���� ������� ����������! ID �����: %d", skin);
					SendClientMessage(playerid, COLOR_YELLOW_2, string);
					GangSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangSkin] - 1] = skin;
					for(new i = GetPlayerPoolSize(); i >= 0; --i)
					{
						if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == PlayerInfo[playerid][pGang] && PlayerInfo[i][pGangLvl] == PlayerInfo[playerid][pGangSkin]) SetPlayerSkin(i, skin);
					}
					PlayerInfo[playerid][pGangSkin] = -1;
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG_SKIN_LEVEL, DIALOG_STYLE_LIST, "{FF0000}���������� ������", "���\n�����\n�������\n�����\n��� ������\n�����", "�������", "������");
		}
		case DIALOG_GANG_INVITE:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_INVITE, DIALOG_STYLE_INPUT, "{FF0000}����������� � �����", "������� id ������, �������� ������ ����������:", "�������", "������");
				new player = strval(inputtext);
				if(!IsPlayerConnected(player)) return SendClientMessage(playerid, -1, "���� ����� �� � ����!");
				if(PlayerInfo[player][pGang] > 0) return SendClientMessage(playerid, -1, "���� ����� ��� � �����!");
				format(string, sizeof string, "����� %s ��������� ��� � ����� '%s'", PlayerInfo[playerid][pName], GangName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(player, DIALOG_GANG_INV_ACCEPT, DIALOG_STYLE_MSGBOX, "{FF0000}����������� � �����", string, "�������", "��������");
				format(string, sizeof string, "����� '%s' ������ ����������� ������ '%s'", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
				SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_RED_GANG, string);
				PlayerInfo[player][pTempGang] = PlayerInfo[playerid][pGang];
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_EXIT:
		{
			if(response)
			{
				format(string, sizeof string, "{FFFF00}'{FFFFFF}%s{FFFF00}' ���� �� �����!", PlayerInfo[playerid][pName]);
				for(new i = GetPlayerPoolSize(); i >= 0; --i)
				{
					if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == PlayerInfo[playerid][pGang] && i != playerid) SendClientMessage(i, COLOR_YELLOW_2, string);
				}
				if(PlayerInfo[playerid][pGangLvl] == 6)
				{
					printf("����� %s ������ ����� %s", PlayerInfo[playerid][pName], GangName[PlayerInfo[playerid][pGang]]);
					DestroyGang(PlayerInfo[playerid][pGang]);
					SendClientMessage(playerid, COLOR_YELLOW_2, "���� ����� ������� �������!");
					return 1;
				}
				PlayerInfo[playerid][pGang] = 0;
				PlayerInfo[playerid][pGangCheck] = 0;
				PlayerInfo[playerid][pGangLvl] = 0;
				SetPlayerHealth(playerid, 0.0);
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_SPAWN:
		{
			if(response)
			{
				for(new i = sizeof(TeamSpawns) - 1; i >= 0; --i)
				{
					if(IsPlayerInRangeOfPoint(playerid, 50.0, TeamSpawns[i][0], TeamSpawns[i][1], TeamSpawns[i][2])) return SendClientMessage(playerid, COLOR_RED_GANG, "������ ������������� ����� ����� ����� ������ ����!");
				}
				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				GangSpawn[PlayerInfo[playerid][pGang]][0] = x;
				GangSpawn[PlayerInfo[playerid][pGang]][1] = y;
				GangSpawn[PlayerInfo[playerid][pGang]][2] = z;
				GangSpawnInt[PlayerInfo[playerid][pGang]] = GetPlayerInterior(playerid);
				DestroyPickup(GangPick[PlayerInfo[playerid][pGang]]);
				Delete3DTextLabel(GangLabel[PlayerInfo[playerid][pGang]]);
				PlayerInfo[playerid][pMoney] -= 300000;
				format(string, sizeof string, "���� ����� .:: %s ::.", GangName[PlayerInfo[playerid][pGang]]);
				GangLabel[PlayerInfo[playerid][pGang]] = Create3DTextLabel(string, COLOR_LIME, x, y, z, 15.0, 0, 0);
				GangPick[PlayerInfo[playerid][pGang]] = CreatePickup(1559, 1, x, y, z, -1);
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "SpawnInt", GangSpawnInt[PlayerInfo[playerid][pGang]]);
					ini_setFloat(iniFile, "SpawnX", x);
					ini_setFloat(iniFile, "SpawnY", y);
					ini_setFloat(iniFile, "SpawnZ", z);
					ini_closeFile(iniFile);
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_LEVEL_ID:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}���������� ������", "������� id ������, �������� ������ ��������� �������:", "�������", "������");
				new player = strval(inputtext);
				if(PlayerInfo[player][pGang] != PlayerInfo[playerid][pGang])
				{
					SendClientMessage(playerid, COLOR_YELLOW_2, "����� �� � ����� �����!");
					ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}���������� ������", "������� id ������, �������� ������ ��������� �������:", "�������", "������");
					return 1;
				}
				if(playerid == player)
				{
					SendClientMessage(playerid, COLOR_YELLOW_2, "�� �� ������ ��������� ���� �������!");
					ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}���������� ������", "������� id ������, �������� ������ ��������� �������:", "�������", "������");
					return 1;
				}
				PlayerInfo[playerid][pId] = player;
				ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL, DIALOG_STYLE_LIST, "{FF0000}���������� ������", "���\n�����\n�������\n�����\n��� ������", "�������", "������");
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_LEVEL:
		{
			if(response)
			{
				if(0 <= listitem <= 4) PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl] = listitem + 1;
				format(string, sizeof string, "�� ������ ������ %s ������� %d", PlayerInfo[PlayerInfo[playerid][pId]][pName], PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl]);
				SendClientMessage(playerid, COLOR_YELLOW_2, string);
				format(string, sizeof string, "����� %s ����� ��� ������� %d", PlayerInfo[playerid][pName], PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl]);
				SendClientMessage(PlayerInfo[playerid][pId], COLOR_YELLOW_2, string);
				if(GangSkin[PlayerInfo[playerid][pGang]][PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl]] >= 0) SetPlayerSkin(PlayerInfo[playerid][pId], GangSkin[PlayerInfo[playerid][pGang]][PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl] - 1]);
				PlayerInfo[playerid][pId] = -1;
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}���������� ������", "������� id ������, �������� ������ ��������� �������:", "�������", "������");
		}
		case DIALOG_GANG_STOCK:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						static string2[64];
						format(string, sizeof string, "{FFFF00}����� ����� \"%s\"", GangName[PlayerInfo[playerid][pGang]]);
						format(string2, sizeof string2, "����� � ������: $%d\nDM ����� � ������: %d", GangMoney[PlayerInfo[playerid][pGang]], GangDmPoints[PlayerInfo[playerid][pGang]]);
						ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_AMOUNT, DIALOG_STYLE_MSGBOX, string, string2, "��", "");
					}
					case 1: ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "������� �����, ������� �� ������ �������� � �����:", "��", "�����");
					case 2:
					{
						if(PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}����� ������", "������� �����, ������� �� ������ ����� � ������:", "��", "�����");
						else SendClientMessage(playerid, COLOR_RED_GANG, "� ��� ������ ���� ������� ������.");
					}
					case 3: ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}�������� DM-����", "������� ���������� DM-�����, ������� �� ������ �������� � �����:", "��", "�����");
					case 4:
					{
						if(PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}����� DM-����", "������� ���������� DM-�����, ������� �� ������ ����� � ������:", "��", "�����");
						else SendClientMessage(playerid, COLOR_RED_GANG, "� ��� ������ ���� ������� ������.");
					}
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_STOCK_AMOUNT:
		{
			format(string, sizeof string, "{FFFF00}����� ����� \"%s\"", GangName[PlayerInfo[playerid][pGang]]);
			ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "���������� �����\n�������� ������\n����� ������\n�������� DM-����\n����� DM-����", "�������", "�����");
		}
		case DIALOG_GANG_STOCK_GIVE:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "������� �����, ������� �� ������ �������� � �����:", "��", "�����");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "�� ������� �������� �����!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "������� �����, ������� �� ������ �������� � �����:", "��", "�����");
				}
				if(amount > PlayerInfo[playerid][pMoney])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "� ��� ��������� �����!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}�������� ������", "������� �����, ������� �� ������ �������� � �����:", "��", "�����");
				}
				PlayerInfo[playerid][pMoney] -= amount;
				GangMoney[PlayerInfo[playerid][pGang]] += amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "Money", GangMoney[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "����� %s ������� $%d � ����� �����", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "�� ������� �������� $%d � ����� ����� �����", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				format(string, sizeof string, "{FFFF00}����� ����� \"%s\"", GangName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "���������� �����\n�������� ������\n����� ������\n�������� DM-����\n����� DM-����", "�������", "�����");
			}
		}
		case DIALOG_GANG_STOCK_TAKE:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}����� ������", "������� �����, ������� �� ������ ����� � ������:", "��", "�����");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "�� ������� �������� �����!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}����� ������", "������� �����, ������� �� ������ ����� � ������:", "��", "�����");
				}
				if(amount > GangMoney[PlayerInfo[playerid][pGang]])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "� ������ ��������� �����!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}����� ������", "������� �����, ������� �� ������ ����� � ������:", "��", "�����");
				}
				PlayerInfo[playerid][pMoney] += amount;
				GangMoney[PlayerInfo[playerid][pGang]] -= amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "Money", GangMoney[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "����� %s ���� $%d �� ������ �����", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "�� ������� ����� $%d �� ������ ����� �����", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				format(string, sizeof string, "{FFFF00}����� ����� \"%s\"", GangName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "���������� �����\n�������� ������\n����� ������\n�������� DM-����\n����� DM-����", "�������", "�����");
			}
		}
		case DIALOG_GANG_STOCK_GIVE_POINTS:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}�������� DM-����", "������� ���������� DM-�����, ������� �� ������ �������� � �����:", "��", "�����");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "�� ������� �������� ����������!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}�������� DM-����", "������� ���������� DM-�����, ������� �� ������ �������� � �����:", "��", "�����");
				}
				if(amount > PlayerInfo[playerid][pDmPoints])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "� ��� ��������� DM-�����!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}�������� DM-����", "������� ���������� DM-�����, ������� �� ������ �������� � �����:", "��", "�����");
				}
				PlayerInfo[playerid][pDmPoints] -= amount;
				GangDmPoints[PlayerInfo[playerid][pGang]] += amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "DMPoints", GangDmPoints[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "����� %s ������� %d DM-����� � ����� �����", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "�� ������� �������� %d DM-����� � ����� ����� �����", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				format(string, sizeof string, "{FFFF00}����� ����� \"%s\"", GangName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "���������� �����\n�������� ������\n����� ������\n�������� DM-����\n����� DM-����", "�������", "�����");
			}
		}
		case DIALOG_GANG_STOCK_TAKE_POINTS:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}����� DM-����", "������� ���������� DM-�����, ������� �� ������ ����� � ������:", "��", "�����");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "�� ������� �������� ����������!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}����� DM-����", "������� ���������� DM-�����, ������� �� ������ ����� � ������:", "��", "�����");
				}
				if(amount > GangDmPoints[PlayerInfo[playerid][pGang]])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "� ������ ��������� DM-�����!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}����� DM-����", "������� ���������� DM-�����, ������� �� ������ ����� � ������:", "��", "�����");
				}
				PlayerInfo[playerid][pDmPoints] += amount;
				GangDmPoints[PlayerInfo[playerid][pGang]] -= amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "DMPoints", GangDmPoints[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "����� %s ���� %d DM-����� �� ������ �����", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "�� ������� ����� %d DM-����� �� ������ ����� �����", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				format(string, sizeof string, "{FFFF00}����� ����� \"%s\"", GangName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "���������� �����\n�������� ������\n����� ������\n�������� DM-����\n����� DM-����", "�������", "�����");
			}
		}
		case DIALOG_GANG_KICK:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_KICK, DIALOG_STYLE_INPUT, "{FF0000}������� �� �����", "������� id ������, �������� ������ �������:", "�������", "������");
				new player = strval(inputtext);
				if(!IsPlayerConnected(player)) return SendClientMessage(playerid, -1, "���� ����� �� � ����!");
				if(PlayerInfo[player][pGang] != PlayerInfo[playerid][pGang]) return SendClientMessage(playerid, -1, "���� ����� �� � ����� �����!");
				if(playerid == player) return SendClientMessage(playerid, -1, "�� �� ������ ������� ������ ����!");
				PlayerInfo[player][pGang] = 0;
				PlayerInfo[player][pGangCheck] = 0;
				PlayerInfo[player][pGangLvl] = 0;
				format(string, sizeof string, "{FF0000}�� ���� ������� �� ����� ������� '{FFFFFF}%s{FF0000}'", PlayerInfo[playerid][pName]);
				SendClientMessage(player, COLOR_RED_GANG, string);
				SetPlayerHealth(player, 0.0);
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_COLOR:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_COLOR, DIALOG_STYLE_INPUT, "{FF0000}����� �����", "������� 6 �������� ������� RRGGBB:", "�������", "������");
				if(strlen(inputtext) != 6)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "�������� ������ ���� �� 6 �������� ������� RRGGBB!");
					ShowPlayerDialog(playerid, DIALOG_GANG_COLOR, DIALOG_STYLE_INPUT, "{FF0000}����� �����", "������� 6 �������� ������� RRGGBB:", "�������", "������");
					return 1;
				}
				LowerToUpper(inputtext);
				format(GangColor[PlayerInfo[playerid][pGang]], sizeof GangColor[], "%sFF", inputtext);
				SetPlayerColor(playerid, HexToInt(GangColor[PlayerInfo[playerid][pGang]]));
				format(string, sizeof string, "������ ���� ����� �����: {%s}%s", inputtext, GangColor[PlayerInfo[playerid][pGang]]);
				SendClientMessage(playerid, COLOR_LIME_GANG, string);
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setString(iniFile, "Color", GangColor[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_NAME:
		{
			if(response)
			{
				CheckDialogColor(inputtext);
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_NAME, DIALOG_STYLE_INPUT, "{FF0000}����� ��������", "������� ����� �������� �����\n� ���� ����:", "�������", "������");
				format(GangName[PlayerInfo[playerid][pGang]], sizeof GangName[], "%s", inputtext);
				format(string, sizeof string, "���� ����� .:: %s ::.", GangName[PlayerInfo[playerid][pGang]]);
				if(_:GangLabel[PlayerInfo[playerid][pGang]] != -1) Update3DTextLabelText(GangLabel[PlayerInfo[playerid][pGang]], COLOR_LIME, string);
				format(string, sizeof string, "{FFFF00}�� ������� �������� �������� �����!\n����� �������� �����: {FF0000}%s\n", inputtext);
				ShowPlayerDialog(playerid, DIALOG_GANG_NAME_CHANGED, DIALOG_STYLE_MSGBOX, "{FF0000}����� ��������", string, "��", "");
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				PlayerInfo[playerid][pMoney] -= 300000;
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setString(iniFile, "Name", GangName[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_SKIN_LEVEL:
		{
			if(response)
			{
				if(0 <= listitem <= 5) PlayerInfo[playerid][pGangSkin] = listitem + 1;
				ShowPlayerDialog(playerid, DIALOG_GANG_SKIN, DIALOG_STYLE_INPUT, "{FF0000}���������� ������", "������� ID �����, ������� ������ ���������:", "�������", "������");
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}���� �����", "������� �����\n��������� �����\n��������� ����� ������\n��������� �������\n����� �����\n���������� � �����\n������� �� �����\n�������� ���� �����\n�������� �������� �����\n���/���� ���� �����\n���� �� �����", "�������", "������");
		}
		case DIALOG_GANG_INV_ACCEPT:
		{
			if(response)
			{
				PlayerInfo[playerid][pGang] = PlayerInfo[playerid][pTempGang];
				PlayerInfo[playerid][pGangCheck] = GangCheck[PlayerInfo[playerid][pGang]];
				PlayerInfo[playerid][pGangLvl] = 1;
				SetPlayerColor(playerid, HexToInt(GangColor[PlayerInfo[playerid][pGang]]));
				format(string, sizeof string, "�� �������� � ����� '%s'", GangName[PlayerInfo[playerid][pGang]]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "%s ������� � �����!", PlayerInfo[playerid][pName]);
				SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW_2, string);
			}
			else
			{
				format(string, sizeof string, "%s ��������� �� ���������� � �����!", PlayerInfo[playerid][pName]);
				SendClientMessageToGang(PlayerInfo[playerid][pTempGang], COLOR_YELLOW_2, string);
				PlayerInfo[playerid][pTempGang] = 0;
			}
		}
		case DIALOG_GANG_CREATE_COLOR:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_GANG_CREATE_COLOR, DIALOG_STYLE_INPUT, "{FF0000}�������� �����", "������� ���� �����:", "�������", "������");
				if(strlen(inputtext) != 6)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "�������� ������ ���� �� 6 �������� ������� RRGGBB!");
					ShowPlayerDialog(playerid, DIALOG_GANG_CREATE_COLOR, DIALOG_STYLE_INPUT, "{FF0000}�������� �����", "������� ���� �����:", "�������", "������");
					return 1;
				}
				new year, month, day;
				getdate(year, month, day);
				new fgang = GetFreeGang();
				format(string, sizeof string, "Gangs/%d.ini", fgang);
				new iniFile = ini_createFile(string);
				if(iniFile >= INI_OK)
				{
					static string2[256];
					PlayerInfo[playerid][pGangLvl] = 6;
					PlayerInfo[playerid][pGang] = fgang;
					Gang[PlayerInfo[playerid][pGang]] = true;
					GangTag[PlayerInfo[playerid][pGang]] = true;
					PlayerInfo[playerid][pGangCheck] = gettime();
					GangCheck[PlayerInfo[playerid][pGang]] = PlayerInfo[playerid][pGangCheck];
					format(GangName[PlayerInfo[playerid][pGang]], sizeof GangName[], GangTempName[playerid]);
					LowerToUpper(inputtext);
					format(GangColor[PlayerInfo[playerid][pGang]], sizeof GangColor[], "%sFF", inputtext);
					format(string, sizeof string, "%d/%d/%d", day, month, year);
					SetPlayerColor(playerid, HexToInt(GangColor[PlayerInfo[playerid][pGang]]));
					PlayerInfo[playerid][pMoney] -= 300000;
					GangPick[PlayerInfo[playerid][pGang]] = -1;
					GangLabel[PlayerInfo[playerid][pGang]] = Text3D:-1;
					printf("%s ������ ����� %s", PlayerInfo[playerid][pName], GangName[PlayerInfo[playerid][pGang]]);
					format(string2, sizeof string2, "{FFFF00}����� ������� �������!\r\n{FFFF00}�������� �����: %s\r\n{FFFF00}���� �����: {%s}%s\r\n{FFFF00}���� ���������: {FFFFFF}%s", GangName[PlayerInfo[playerid][pGang]], inputtext, GangColor[PlayerInfo[playerid][pGang]], string);
					ShowPlayerDialog(playerid, DIALOG_GANG_CREATED, DIALOG_STYLE_MSGBOX, "{FF0000}�������� �����", string2, "�������", "");
					ini_setString(iniFile, "Name", GangName[PlayerInfo[playerid][pGang]]);
					ini_setString(iniFile, "Color", GangColor[PlayerInfo[playerid][pGang]]);
					ini_setInteger(iniFile, "Check", GangCheck[PlayerInfo[playerid][pGang]]);
					ini_setInteger(iniFile, "Money", GangMoney[PlayerInfo[playerid][pGang]]);
					ini_setInteger(iniFile, "DMPoints", GangDmPoints[PlayerInfo[playerid][pGang]]);
					ini_setInteger(iniFile, "SpawnInt", 0);
					ini_setFloat(iniFile, "SpawnX", 0.0);
					ini_setFloat(iniFile, "SpawnY", 0.0);
					ini_setFloat(iniFile, "SpawnZ", 0.0);
					ini_setInteger(iniFile, "Skin1", -1);
					ini_setInteger(iniFile, "Skin2", -1);
					ini_setInteger(iniFile, "Skin2", -1);
					ini_setInteger(iniFile, "Skin3", -1);
					ini_setInteger(iniFile, "Skin4", -1);
					ini_setInteger(iniFile, "Skin5", -1);
					ini_setInteger(iniFile, "Skin6", -1);
					ini_setInteger(iniFile, "Tag", 1);
					ini_closeFile(iniFile);
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG_CREATE, DIALOG_STYLE_INPUT, "{FF0000}�������� �����", "������� �������� �����:", "�������", "������");
		}
		case DIALOG_GANGS:
		{
			if(response && listitem >= 0)
			{
				new sgang;
				for(new i, j = listitem + 1; i < j; i++)
				{
					sgang++;
					while(!Gang[sgang] && sgang < MAX_GANGS) sgang++;
					if(sgang >= MAX_GANGS)
					{
						OnPlayerCommandText(playerid, "/�����");
						return 1;
					}
				}
				PlayerInfo[playerid][pGangId] = sgang;
				format(string, sizeof string, "{FFFF00}����� \"%s\"", GangName[sgang]);
				ShowPlayerDialog(playerid, DIALOG_GANGS_MENU, DIALOG_STYLE_LIST, string, "����� ����� ������\n������� �� ��������", "�������", "�����");
			}
		}
		case DIALOG_GANGS_MENU:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						static string2[256];
						string2[0] = EOS;
						for(new i = GetPlayerPoolSize(); i >= 0; --i)
						{
							if(IsPlayerConnected(i) && PlayerInfo[playerid][pGangId] == PlayerInfo[i][pGang])
							{
								format(string, sizeof string, "%s [ID %d] [�������: %d]\n", PlayerInfo[i][pName], i, PlayerInfo[i][pGangLvl]);
								strcat(string2, string);
							}
						}
						if(!string2[0]) strcat(string2, "� ������ ������ ��� ������ ����� ������");
						ShowPlayerDialog(playerid, DIALOG_GANG_ONLINE, DIALOG_STYLE_MSGBOX, "{FFFF00}����� ����� ������", string2, "��", "");
					}
					case 1:
					{
						if(PlayerInfo[playerid][pGang] <= 0 || PlayerInfo[playerid][pGangLvl] < 6) return SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � �����, � � ��� ������ ���� ������� ������.");
						if(PlayerInfo[playerid][pGang] == PlayerInfo[playerid][pGangId]) return SendClientMessage(playerid, COLOR_RED_GANG, "�� ������ �������� � ������ �����.");
						if(GetGangLeader(PlayerInfo[playerid][pGangId]) == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_GANG, "����� ��������������� ����� �������.");
						format(string, sizeof string, "�� ������������� ������ ������� �� �������� ����� \"%s\"?", GangName[PlayerInfo[playerid][pGangId]]);
						ShowPlayerDialog(playerid, DIALOG_GANG_BATTLE, DIALOG_STYLE_MSGBOX, "{FFFF00}������� �� ��������", string, "��", "�����");
					}
				}
			}
			else OnPlayerCommandText(playerid, "/�����");
		}
		case DIALOG_GANG_ONLINE:
		{
			format(string, sizeof string, "{FFFF00}����� \"%s\"", GangName[PlayerInfo[playerid][pGangId]]);
			ShowPlayerDialog(playerid, DIALOG_GANGS_MENU, DIALOG_STYLE_LIST, string, "����� ����� ������\n������� �� ��������", "�������", "�����");
		}
		case DIALOG_GANG_BATTLE:
		{
			if(response)
			{
				new gleader = GetGangLeader(PlayerInfo[playerid][pGangId]);
				if(gleader == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_GANG, "����� ��������������� ����� �������.");
				format(string, sizeof string, "����� \"%s\" ���������� ���� ����� �� ��������.\n����������� �� ��������?", GangName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(gleader, DIALOG_GANG_BATTLE_ACCEPT, DIALOG_STYLE_MSGBOX, "{FFFF00}����� �� ��������", string, "��", "������");
				PlayerInfo[gleader][pBattleId] = PlayerInfo[playerid][pGang];
				SendClientMessage(playerid, -1, "����������� �� �������� ����������.");
			}
			else
			{
				format(string, sizeof string, "{FFFF00}����� \"%s\"", GangName[PlayerInfo[playerid][pGangId]]);
				ShowPlayerDialog(playerid, DIALOG_GANGS_MENU, DIALOG_STYLE_LIST, string, "����� ����� ������\n������� �� ��������", "�������", "�����");
			}
		}
		case DIALOG_GANG_BATTLE_ACCEPT:
		{
			if(response)
			{
				new gleader = GetGangLeader(PlayerInfo[playerid][pBattleId]);
				if(gleader == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_GANG, "����� ��������������� ����� �����.");
				new Float:pX, Float:pY, Float:pZ, pInt = GetPlayerInterior(gleader), pVw = GetPlayerVirtualWorld(gleader);
				GetPlayerPos(gleader, pX, pY, pZ);
				for(new i = GetPlayerPoolSize(); i >= 0; --i)
				{
					if(IsPlayerConnected(i) && i != gleader && (PlayerInfo[i][pGang] == PlayerInfo[playerid][pGang] || PlayerInfo[i][pGang] == PlayerInfo[playerid][pBattleId]))
					{
						SetPlayerPos(i, pX + random(4), pY + random(4), pZ + 1.0);
						SetPlayerVirtualWorld(i, pVw);
						SetPlayerInterior(i, pInt);
					}
				}
				SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_BLUE, "��� ����� ����� ��������������� � ���� ���������");
				SendClientMessageToGang(PlayerInfo[playerid][pBattleId], COLOR_BLUE, "��� ����� ����� ��������������� � ���� ���������");
			}
			else
			{
				new gleader = GetGangLeader(PlayerInfo[playerid][pBattleId]);
				format(string, sizeof string, "�� ���������� �� ������� � �������� � ������ \"%s\"", GangName[PlayerInfo[playerid][pBattleId]]);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				if(gleader == INVALID_PLAYER_ID) return 1;
				format(string, sizeof string, "����� \"%s\" ���������� �� ������� � ��������!", GangName[PlayerInfo[gleader][pGangId]]);
				SendClientMessageToGang(PlayerInfo[playerid][pBattleId], COLOR_YELLOW, string);
			}
		}
		case DIALOG_AVTO:
		{
			if(response)
			{
				new veh = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
				GetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, boot, objective);
				switch(listitem)
				{
					case 0: SetVehicleParamsEx(veh, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
					case 1: SetVehicleParamsEx(veh, engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
					case 2: SetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
					case 3: SetVehicleParamsEx(veh, engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
					case 4: SetVehicleParamsEx(veh, engine, lights, VEHICLE_PARAMS_ON, doors, bonnet, boot, objective);
					case 5: SetVehicleParamsEx(veh, engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
					case 6: SetVehicleParamsEx(veh, engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
					case 7: SetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
					case 8: SetVehicleParamsEx(veh, engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
					case 9: SetVehicleParamsEx(veh, engine, lights, VEHICLE_PARAMS_OFF, doors, bonnet, boot, objective);
					case 10: SetVehicleParamsEx(veh, engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
					case 11: SetVehicleParamsEx(veh, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					case 12:
					{
						if(!IsACar(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_RED, "���� ���������� ��� ����� ����������!");
						ShowPlayerDialog(playerid, DIALOG_NEON, DIALOG_STYLE_LIST, "{FFFF00}����", "{004DFF}�����\n{ff0000}�������\n{14ff00}�������\n{ffffff}�����\n{ffcbdb}�������\n{ffff00}������\n{fa8072}������� ����", "�������", "�����");
					}
					case 13: ShowPlayerDialog(playerid, DIALOG_CHANGE_NUMBER, DIALOG_STYLE_INPUT, "{FFFF00}����� ������", "������� ����� ����� ����������:", "�������", "������");
				}
			}
		}
		case DIALOG_CHANGE_NUMBER:
		{
			if(response)
			{
				if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_CHANGE_NUMBER, DIALOG_STYLE_INPUT, "{FFFF00}����� ������", "������� ����� ����� ����������:", "�������", "������");
				new veh = GetPlayerVehicleID(playerid), Float:x, Float:y, Float:z, Float:a;
				SetVehicleNumberPlate(veh, inputtext);
				GetVehiclePos(veh, x, y, z);
				GetVehicleZAngle(veh, a);
				SetVehicleToRespawn(veh);
				SetVehiclePos(veh, x, y, z);
				SetVehicleVirtualWorld(veh, GetPlayerVirtualWorld(playerid));
				LinkVehicleToInterior(veh, GetPlayerInterior(playerid));
				PutPlayerInVehicle(playerid, veh, 0);
				SetVehicleZAngle(veh, a);
			}
		}
		case DIALOG_NEON:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_AVTO, DIALOG_STYLE_LIST, "{FFFF00}����-����", AvtoStr, "�������", "������");
			switch(listitem)
			{
				case 0:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeonObj][0]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][1]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][2]);
					PlayerInfo[playerid][pNeonObj][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][3]);
					PlayerInfo[playerid][pNeonObj][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][4]);
					PlayerInfo[playerid][pNeonObj][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][5]);
					PlayerInfo[playerid][pNeonObj][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][6]);
					PlayerInfo[playerid][pNeonObj][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][7]);
					PlayerInfo[playerid][pNeonObj][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][8]);
					PlayerInfo[playerid][pNeonObj][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][9]);
					PlayerInfo[playerid][pNeonObj][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][10]);
					PlayerInfo[playerid][pNeonObj][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][11]);
					PlayerInfo[playerid][pNeonObj][11] = 0;
					PlayerInfo[playerid][pNeonObj][0] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					PlayerInfo[playerid][pNeonObj][1] = CreateObject(18648, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 1:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeonObj][0]);
					PlayerInfo[playerid][pNeonObj][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][1]);
					PlayerInfo[playerid][pNeonObj][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][2]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][3]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][4]);
					PlayerInfo[playerid][pNeonObj][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][5]);
					PlayerInfo[playerid][pNeonObj][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][6]);
					PlayerInfo[playerid][pNeonObj][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][7]);
					PlayerInfo[playerid][pNeonObj][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][8]);
					PlayerInfo[playerid][pNeonObj][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][9]);
					PlayerInfo[playerid][pNeonObj][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][10]);
					PlayerInfo[playerid][pNeonObj][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][11]);
					PlayerInfo[playerid][pNeonObj][11] = 0;
					PlayerInfo[playerid][pNeonObj][2] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					PlayerInfo[playerid][pNeonObj][3] = CreateObject(18647, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][2], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][3], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 2:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeonObj][0]);
					PlayerInfo[playerid][pNeonObj][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][1]);
					PlayerInfo[playerid][pNeonObj][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][2]);
					PlayerInfo[playerid][pNeonObj][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][3]);
					PlayerInfo[playerid][pNeonObj][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][4]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][5]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][6]);
					PlayerInfo[playerid][pNeonObj][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][7]);
					PlayerInfo[playerid][pNeonObj][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][8]);
					PlayerInfo[playerid][pNeonObj][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][9]);
					PlayerInfo[playerid][pNeonObj][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][10]);
					PlayerInfo[playerid][pNeonObj][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][11]);
					PlayerInfo[playerid][pNeonObj][11] = 0;
					PlayerInfo[playerid][pNeonObj][4] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					PlayerInfo[playerid][pNeonObj][5] = CreateObject(18649, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][4], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][5], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 3:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeonObj][0]);
					PlayerInfo[playerid][pNeonObj][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][1]);
					PlayerInfo[playerid][pNeonObj][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][2]);
					PlayerInfo[playerid][pNeonObj][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][3]);
					PlayerInfo[playerid][pNeonObj][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][4]);
					PlayerInfo[playerid][pNeonObj][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][5]);
					PlayerInfo[playerid][pNeonObj][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][6]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][7]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][8]);
					PlayerInfo[playerid][pNeonObj][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][9]);
					PlayerInfo[playerid][pNeonObj][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][10]);
					PlayerInfo[playerid][pNeonObj][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][11]);
					PlayerInfo[playerid][pNeonObj][11] = 0;
					PlayerInfo[playerid][pNeonObj][6] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					PlayerInfo[playerid][pNeonObj][7] = CreateObject(18652, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][6], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][7], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 4:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeonObj][0]);
					PlayerInfo[playerid][pNeonObj][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][1]);
					PlayerInfo[playerid][pNeonObj][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][2]);
					PlayerInfo[playerid][pNeonObj][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][3]);
					PlayerInfo[playerid][pNeonObj][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][4]);
					PlayerInfo[playerid][pNeonObj][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][5]);
					PlayerInfo[playerid][pNeonObj][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][6]);
					PlayerInfo[playerid][pNeonObj][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][7]);
					PlayerInfo[playerid][pNeonObj][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][8]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][9]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][10]);
					PlayerInfo[playerid][pNeonObj][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][11]);
					PlayerInfo[playerid][pNeonObj][11] = 0;
					PlayerInfo[playerid][pNeonObj][8] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					PlayerInfo[playerid][pNeonObj][9] = CreateObject(18651, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][8], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][9], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 5:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeonObj][0]);
					PlayerInfo[playerid][pNeonObj][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][1]);
					PlayerInfo[playerid][pNeonObj][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][2]);
					PlayerInfo[playerid][pNeonObj][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][3]);
					PlayerInfo[playerid][pNeonObj][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][4]);
					PlayerInfo[playerid][pNeonObj][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][5]);
					PlayerInfo[playerid][pNeonObj][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][6]);
					PlayerInfo[playerid][pNeonObj][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][7]);
					PlayerInfo[playerid][pNeonObj][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][8]);
					PlayerInfo[playerid][pNeonObj][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][9]);
					PlayerInfo[playerid][pNeonObj][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][10]);
					DestroyObject(PlayerInfo[playerid][pNeonObj][11]);
					PlayerInfo[playerid][pNeonObj][10] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					PlayerInfo[playerid][pNeonObj][11] = CreateObject(18650, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][10], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeonObj][11], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 6:
				{
					DestroyObject(PlayerInfo[playerid][pNeonObj][0]);
					PlayerInfo[playerid][pNeonObj][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][1]);
					PlayerInfo[playerid][pNeonObj][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][2]);
					PlayerInfo[playerid][pNeonObj][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][3]);
					PlayerInfo[playerid][pNeonObj][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][4]);
					PlayerInfo[playerid][pNeonObj][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][5]);
					PlayerInfo[playerid][pNeonObj][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][6]);
					PlayerInfo[playerid][pNeonObj][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][7]);
					PlayerInfo[playerid][pNeonObj][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][8]);
					PlayerInfo[playerid][pNeonObj][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][9]);
					PlayerInfo[playerid][pNeonObj][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][10]);
					PlayerInfo[playerid][pNeonObj][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeonObj][11]);
					PlayerInfo[playerid][pNeonObj][11] = 0;
					PlayerInfo[playerid][pNeonStatus] = false;
				}
			}
		}
		case DIALOG_RACE_CREATE:
		{
			if(!response) return BuildRace = 0;
			switch(listitem)
			{
				case 0: BuildRaceType = 0;
				case 1: BuildRaceType = 3;
			}
			ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_1, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����� ����� (���� 1/4)", "���� 1:\n********\n����� ���������� � ������ '�������� ����� �����'.\n����� �������, ��� ����� ������ ��� ����� (��������, SFRace) ��� � ����������.\n\n>> ������� ��� ���� � ������� '�����' ��� �����������.", "�����", "�����");
		}
		case DIALOG_RACE_CREATE_1, DIALOG_RACE_CREATE_1_ERROR:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE, DIALOG_STYLE_LIST, "{FFFF00}�������� ����� �����", "������� �����\n��������� �����", "�����", "�����");
			if(!(1 <= strlen(inputtext) <= 20)) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_1_ERROR, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����� ����� (���� 1/4)", "������: ��� ������� ������� ���� ������� ��������! (���. 1 - ����. 20)\n\n\n\
			���� 1:\n********\n����� ���������� � ������ '�������� ����� �����'.\n����� �������, ��� ����� ������ ��� ����� (��������, SFRace) ��� � ����������.\n\n>> ������� ��� ���� � ������� '�����' ��� �����������.", "�����", "�����");
			strmid(BuildName, inputtext, 0, strlen(inputtext), sizeof BuildName);
			ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����� ����� (���� 2/4)", "���� 2:\n********\n����������, ������� ID ��� ��� ����������, ������� ����� �������������� � ���� �����.\n\n>> ������� ID ��� ��� ���������� ���� � ������� '�����' ��� �����������. '�����', ����� ���-�� ��������.", "�����", "�����");
		}
		case DIALOG_RACE_CREATE_2, DIALOG_RACE_CREATE_2_ERROR:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_1, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����� ����� (���� 1/4)", "���� 1:\n********\n����� ���������� � ������ '�������� ����� �����'.\n����� �������, ��� ����� ������ ��� ����� (��������, SFRace) ��� � ����������.\n\n>> ������� ��� ���� � ������� '�����' ��� �����������.", "�����", "�����");
			if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2_ERROR, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����� ����� (���� 2/4)", "������: �������� ID/��� ����������\n\n\n���� 2:\n********\n\
			����������, ������� ID ��� ��� ����������, ������� ����� �������������� � ���� �����.\n\n>> ������� ID ��� ��� ���������� ���� � ������� '�����' ��� �����������. '�����', ����� ���-�� ��������.", "�����", "�����");
			new model;
			if(IsNumeric(inputtext)) model = strval(inputtext);
			else model = ReturnVehicleID(inputtext);
			if(!(400 <= model <= 611)) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2_ERROR, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����� ����� (���� 2/4)", "������: �������� ID/��� ����������\n\n\n���� 2:\n********\n\
			����������, ������� ID ��� ��� ����������, ������� ����� �������������� � ���� �����.\n\n>> ������� ID ��� ��� ���������� ���� � ������� '�����' ��� �����������. '�����', ����� ���-�� ��������.", "�����", "�����");
			new Float:pPosX, Float:pPosY, Float:pPosZ, Float:pPosA;
			GetPlayerPos(playerid, pPosX, pPosY, pPosZ);
			GetPlayerFacingAngle(playerid, pPosA);
			BuildModeVID = model;
			DestroyVehicle(BuildVehicle);
			BuildVehicle = CreateVehicle(model, pPosX, pPosY, pPosZ, pPosA, random(126), random(126), 60 * 60);
			PutPlayerInVehicle(playerid, BuildVehicle, 0);
			ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_3, DIALOG_STYLE_MSGBOX, "{FFFF00}�������� ����� ����� (���� 3/4)", RaceCreate3Str, "��", "�����");
		}
		case DIALOG_RACE_CREATE_3:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2, DIALOG_STYLE_INPUT, "{FFFF00}�������� ����� ����� (���� 2/4)", "���� 2:\n********\n����������, ������� ID ��� ��� ����������, ������� ����� �������������� � ���� �����.\n\n>> ������� ID ��� ��� ���������� ���� � ������� '�����' ��� �����������. '�����', ����� ���-�� ��������.", "�����", "�����");
			SendClientMessage(playerid, COLOR_GREEN_RACE, "RACE: ��������� � ����� ������ �� ����� ������ � ������� 'KEY_FIRE', �������� ���� ����� � �� ������ ������.");
			SendClientMessage(playerid, COLOR_GREEN_RACE, " - ����� ��� ����� �������, �� ������� ���������� ���� �����������.");
			BuildTakeVehPos = true;
			BuildVehPosCount = 0;
		}
		case DIALOG_RACE_CREATE_4:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_3, DIALOG_STYLE_MSGBOX, "{FFFF00}�������� ����� ����� (���� 3/4)", RaceCreate3Str, "��", "�����");
			SendClientMessage(playerid, COLOR_GREEN_RACE, "RACE: ����� ������� ��������, ������� 'KEY_FIRE'.");
			SendClientMessage(playerid, COLOR_GREEN_RACE, " - �����: ������� 'ENTER', ����� �� ���������! ���� �� �� ���������, ������� ��� ����� � �����.");
			BuildTakeCPs = true;
			BuildCPCount = 0;
		}
		case DIALOG_RACE_CREATE_DONE:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_DONE, DIALOG_STYLE_MSGBOX, "{FFFF00}�������� ����� ����� (������)", "�� ������� ����� � ��� ������ ��� ������ � �������������.\n\n>> ������� '������' ��� ����������. '�����' - ��� ������.", "������", "�����");
			printf("����� %s ������ ����� ����� %s", PlayerInfo[playerid][pName], BuildName);
			DestroyVehicle(BuildVehicle);
			BuildCPCount = 0;
			BuildTakeCPs = false;
			BuildTakeVehPos = false;
			BuildVehPosCount = 0;
			BuildVehicle = 0;
			BuildRace = 0;
		}
	}
	return 1;
}

public OnObjectMoved(objectid)
{
	if(objectid == FerrisWheelObj[10])
	{
		SetTimer("RotateFerrisWheel", FERRIS_WHEEL_WAIT_TIME, 0);
		return 1;
	}
	if(objectid == BalloonObj)
	{
		switch(BalloonStage)
		{
			case 1: MoveObject(BalloonObj, 908.4518, -2037.1908, 64.0458, 5.0);
			case 2: MoveObject(BalloonObj, 994.5233, -2053.7102, 98.6453, 5.0);
			case 3: MoveObject(BalloonObj, 1141.4609, -2061.4761, 116.945, 5.0);
			case 4: MoveObject(BalloonObj, 1250.7042, -2025.9906, 119.145, 5.0);
			case 5: MoveObject(BalloonObj, 1154.7401, -1884.9833, 109.8451, 5.0);
			case 6: MoveObject(BalloonObj, 1010.0747, -1925.0986, 100.6452, 5.0);
			case 7: MoveObject(BalloonObj, 919.6353, -1966.6344, 75.6456, 5.0);
			case 8: MoveObject(BalloonObj, 875.8741, -1994.6158, 45.8461, 5.0);
			case 9: MoveObject(BalloonObj, 836.08, -2000.51, 13.6, 5.0);
			case 10:
			{
				BalloonLabel = Create3DTextLabel("��� ������� ���������� ����\n������� /start", COLOR_ELEVATOR, 836.1572, -2000.5112, 14.7462, 15.0, 0, 0);
				BalloonIsStarted = false;
			}
		}
		BalloonStage++;
		return 1;
	}
	new Float:x, Float:y, Float:z;
	if(objectid == ElevatorObj)
	{
		KillTimer(ElevatorBoostTmr);
		FloorRequestedBy[ElevatorFloor] = INVALID_PLAYER_ID;
		ElevatorOpenDoors();
		FloorOpenDoors(ElevatorFloor);
		GetObjectPos(ElevatorObj, x, y, z);
		ElevatorLabel = Create3DTextLabel("������� '~k~~CONVERSATION_YES~' ��� ������������� �����", COLOR_ELEVATOR, 1784.9822, -1302.0426, z - 0.9, 4.0, 0, 1);
		ElevatorState = 1;
		SetTimer("ElevatorTurnToIdle", ELEVATOR_WAIT_TIME, 0);
		return 1;
	}
	for(new i; i < sizeof FloorDoorsObj; i++)
	{
		if(objectid == FloorDoorsObj[i][0])
		{
			GetObjectPos(FloorDoorsObj[i][0], x, y, z);
			if(x < 1788.2276 - 0.5)
			{
				ElevatorMoveToFloor(ElevatorQueue[0]);
				RemoveFirstQueueFloor();
			}
		}
	}
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == TpLSPick || pickupid == TpSFPick || pickupid == TpLVPick) return ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}���� ����������", "Los Santos\nSan Fierro\nLas Venturas\n������", "��", "������");
	if(pickupid == TpChinaPick)
	{
		SetPlayerPos(playerid, 1051.3702, -1290.4711, 13.8372);
		SetPlayerFacingAngle(playerid, 267.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		return 1;
	}
	for(new i = GetPlayerPoolSize(), Float:X, Float:Y, Float:Z; i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pMineStatus] > 0 && PlayerInfo[i][pMinePick] == pickupid)
		{
			GetObjectPos(PlayerInfo[i][pMineObj][0], X, Y, Z);
			CreateExplosion(X, Y, Z, 7, 1.0);
			DestroyPickup(PlayerInfo[i][pMinePick]);
			DestroyObject(PlayerInfo[i][pMineObj][0]);
			DestroyObject(PlayerInfo[i][pMineObj][1]);
			PlayerInfo[i][pMinePick] = -1;
			PlayerInfo[i][pMineStatus] = 0;
			break;
		}
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	if(!success)
	{
		for(new i = GetPlayerPoolSize(), ips[16]; i >= 0; --i)
		{
			if(IsPlayerConnected(i))
			{
				GetPlayerIp(i, ips, sizeof ips);
				if(!strcmp(ip, ips, true))
				{
					printf("����� %s ������ �� ���� ������������� RCON ������", PlayerInfo[i][pName]);
					return Kick(i);
				}
			}
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(newkeys & KEY_SUBMISSION)
			{
				new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
				GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehid, engine, !lights, alarm, doors, bonnet, boot, objective);
				if(PlayerInfo[playerid][pMoney] >= 500 && IsACar(vehid))
				{
					ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}���� �������", "�����\n���� ����\n�����\nStereo\n����������\n���������� ����", "�������", "�����");
					GameTextForPlayer(playerid, "~r~-500$", 1000, 1);
					PlayerInfo[playerid][pMoney] -= 500;
				}
			}
			else if(newkeys & KEY_ANALOG_LEFT)
			{
				new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
				GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehid, engine, lights, alarm, doors, !bonnet, boot, objective);
			}
			else if(newkeys & KEY_ANALOG_RIGHT)
			{
				new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
				GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, !boot, objective);
			}
		}
	}
	else
	{
		if(PlayerInfo[playerid][pLoopingAnim] && newkeys & KEY_SPRINT) StopLoopingAnim(playerid);
		if(newkeys & KEY_YES)
		{
			new Float:posX, Float:posY, Float:posZ;
			GetPlayerPos(playerid, posX, posY, posZ);
			if(-1303.2417 < posY < -1301.4 && 1784.1555 < posX < 1786.2131)
			{
				static string2[400];
				string2[0] = EOS;
				for(new i; i < sizeof ElevatorQueue; i++)
				{
					if(FloorRequestedBy[i] != INVALID_PLAYER_ID) strcat(string2, "{FF0000}");
					strcat(string2, FloorNames[i]);
				}
				ShowPlayerDialog(playerid, DIALOG_ELEVATOR, DIALOG_STYLE_LIST, "{FFFF00}����", string2, "�������", "������");
			}
			else
			{
				if(-1301.4 < posY < -1299.1447 && 1781.9902 < posX < 1785.6147)
				{
					new i = 20;
					while(posZ < GetDoorsZCoordForFloor(i) + 3.5 && i > 0) i--;
					if(i == 0 && posZ < GetDoorsZCoordForFloor(0) + 2.0) i = -1;
					if(i <= 19)
					{
						CallElevator(playerid, i + 1);
						GameTextForPlayer(playerid, "~r~Elevator called", 3500, 4);
					}
				}
			}
		}
		if(newkeys & KEY_CROUCH && oldkeys & KEY_SPRINT)
		{
			switch(GetPlayerWeapon(playerid))
			{
				case 24, 25, 27, 33, 34: ApplyAnimation(playerid, "PED", "getup_front", 4.1, 0, 0, 1, 0, 0);
			}
		}
	}
	static string[64];
	if(newkeys & KEY_FIRE && BuildRace == playerid + 1)
	{
		if(BuildTakeVehPos)
		{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: �� ������ ���� � ����������");
			new vehid = GetPlayerVehicleID(playerid), Float:vPosX, Float:vPosY, Float:vPosZ, Float:vPosA;
			GetVehiclePos(vehid, vPosX, vPosY, vPosZ);
			GetVehicleZAngle(vehid, vPosA);
			format(string, sizeof string, "/rRaceSystem/%s.RRACE", BuildName);
			new iniFile = ini_createFile(string);
			if(iniFile < 0) iniFile = ini_openFile(string);
			if(iniFile >= INI_OK)
			{
				ini_setInteger(iniFile, "vModel", BuildModeVID);
				ini_setInteger(iniFile, "rType", BuildRaceType);
				format(string, sizeof string, "vPosX_%d", BuildVehPosCount);
				ini_setFloat(iniFile, string, vPosX);
				format(string, sizeof string, "vPosY_%d", BuildVehPosCount);
				ini_setFloat(iniFile, string, vPosY);
				format(string, sizeof string, "vPosZ_%d", BuildVehPosCount);
				ini_setFloat(iniFile, string, vPosZ);
				format(string, sizeof string, "vAngle_%d", BuildVehPosCount);
				ini_setFloat(iniFile, string, vPosA);
				ini_closeFile(iniFile);
				format(string, sizeof string, "RACE: ������� ������ '%d' �����������.", BuildVehPosCount + 1);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				BuildVehPosCount++;
			}
		}
		if(BuildVehPosCount > 1)
		{
			BuildVehPosCount = 0;
			BuildTakeVehPos = false;
			ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_4, DIALOG_STYLE_MSGBOX, "{FFFF00}�������� ����� ����� (���� 4/4)", RaceCreate4Str, "��", "�����");
		}
		if(BuildTakeCPs)
		{
			if(BuildCPCount > MAX_RACE_CP_EACH_RACE) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: �� �������� ������������� ���������� ����������!");
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: �� ������ ���� � ����������");
			new Float:vPosX, Float:vPosY, Float:vPosZ;
			GetVehiclePos(GetPlayerVehicleID(playerid), vPosX, vPosY, vPosZ);
			format(string, sizeof string, "/rRaceSystem/%s.RRACE", BuildName);
			new iniFile = ini_createFile(string);
			if(iniFile < 0) iniFile = ini_openFile(string);
			if(iniFile >= INI_OK)
			{
				format(string, sizeof string, "CP_%d_PosX", BuildCPCount);
				ini_setFloat(iniFile, string, vPosX);
				format(string, sizeof string, "CP_%d_PosY", BuildCPCount);
				ini_setFloat(iniFile, string, vPosY);
				format(string, sizeof string, "CP_%d_PosZ", BuildCPCount);
				ini_setFloat(iniFile, string, vPosZ);
				ini_closeFile(iniFile);
				format(string, sizeof string, "RACE: �������� '%d' ��� ������!", BuildCPCount + 1);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				BuildCPCount++;
			}
		}
	}
	if(newkeys & KEY_SECONDARY_ATTACK && BuildTakeCPs)
	{
		ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_DONE, DIALOG_STYLE_MSGBOX, "{FFFF00}�������� ����� ����� (������)", "�� ������� ����� � ��� ������ ��� ������ � �������������.\n\n>> ������� '������' ��� ����������. '�����' - ��� ������.", "������", "�����");
		new iniFile = ini_openFile("/rRaceSystem/RaceNames/RaceNames.txt");
		if(iniFile >= INI_OK)
		{
			ini_getInteger(iniFile, "TotalRaces", TotalRaces);
			TotalRaces++;
			ini_setInteger(iniFile, "TotalRaces", TotalRaces);
			format(string, sizeof string, "Race_%d", TotalRaces - 1);
			ini_setString(iniFile, string, BuildName);
			ini_closeFile(iniFile);
		}
		format(string, sizeof string, "/rRaceSystem/%s.RRACE", BuildName);
		iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			ini_setInteger(iniFile, "TotalCP", BuildCPCount);
			for(new i; i < 5; i++)
			{
				format(string, sizeof string, "BestRacerTime_%d", i);
				ini_setInteger(iniFile, string, 0);
				format(string, sizeof string, "BestRacer_%d", i);
				ini_setString(iniFile, string, "noone");
			}
			ini_closeFile(iniFile);
		}
	}
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(PlayerInfo[playerid][pInRace])
	{
		static string[145];
		new modelid = GetVehicleModel(GetPlayerVehicleID(playerid));
		if(modelid != RaceVehicle)
		{
			format(string, sizeof string, "RACE: %s(%d) ����������������� �� ����� ����������! ������ � �����: %d, � ������: %d", PlayerInfo[playerid][pName], playerid, RaceVehicle, modelid);
			SendClientMessageToAll(COLOR_RED_RACE, string);
			SendClientMessage(playerid, COLOR_RED_RACE, "RACE: �� ������������������ �� ����� ����������!");
			StopPlayerRace(playerid);
			RaceJoinCount--;
		}
		else if(PlayerInfo[playerid][pRaceCPProgess] == TotalRaceCP - 1)
		{
			new TimeStamp = GetTickCount(), TotalRaceTime;
			TotalRaceTime = TimeStamp - RaceTick;
			new rTime0, rTime1, rTime2;
			ConvertTime(var, TotalRaceTime, rTime0, rTime1, rTime2);
			new Prize0, Prize1;
			switch(RaceTimeProgress + 1)
			{
				case 1:
				{
					Prize0 = random(random(5000)) + 10000;
					Prize1 = 3;
				}
				case 2:
				{
					Prize0 = random(random(4500)) + 9000;
					Prize1 = 2;
				}
				case 3:
				{
					Prize0 = random(random(4000)) + 8000;
					Prize1 = 1;
				}
				case 4: Prize0 = random(random(3500)) + 7000;
				case 5: Prize0 = random(random(3000)) + 6000;
			}
			format(string, sizeof string, "{FF0000}RACE: {FFFF00}\"%s\" {00FF7F}�������� �����. �����: {FFFF00}\"%d\"", PlayerInfo[playerid][pName], RaceTimeProgress + 1);
			SendClientMessageToAll(-1, string);
			format(string, sizeof string, "{FF0000}RACE: {00FF7F}�����: {FFFF00}\"%02d:%02d.%d\"{00FF7F}. ������� - {FFFF00}\"$%d\"{00FF7F}. ���� - {FFFF00}\"%d\"", rTime0, rTime1, rTime2, Prize0, Prize1);
			SendClientMessageToAll(-1, string);
			if(RaceFinishCount <= 5)
			{
				format(string, sizeof string, "/rRaceSystem/%s.RRACE", RaceName);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					new TempTotalTime;
					format(string, sizeof string, "BestRacerTime_%d", RaceTimeProgress);
					ini_getInteger(iniFile, string, TempTotalTime);
					new TempTime0, TempTime1, TempTime2, time2 = TempTotalTime - TotalRaceTime;
					ConvertTime(var1, time2, TempTime0, TempTime1, TempTime2);
					if(TotalRaceTime <= TempTotalTime || TempTotalTime < 1)
					{
						ini_setInteger(iniFile, string, TotalRaceTime);
						if(TempTotalTime > 0)
						{
							static racer[MAX_PLAYER_NAME + 1];
							format(string, sizeof string, "BestRacer_%d", RaceTimeProgress);
							ini_getString(iniFile, string, racer);
							format(string, sizeof string, "RACE: \"%s\" ��������� ����� ������ � ��� �� \"%02d:%02d.%d\" ������ ������� ����������� ���������� \"%s\"! �����������: \"%d\" �����!", PlayerInfo[playerid][pName], TempTime0, TempTime1, TempTime2, racer, RaceTimeProgress + 1);
						}
						else format(string, sizeof string, "RACE: \"%s\" ��������� ����� ������! �����������: \"%d\" �����!", PlayerInfo[playerid][pName], RaceTimeProgress + 1);
						SendClientMessageToAll(COLOR_LIME, string);
						format(string, sizeof string, "BestRacer_%d", RaceTimeProgress);
						ini_setString(iniFile, string, PlayerInfo[playerid][pName]);
						RaceTimeProgress++;
					}
					ini_closeFile(iniFile);
				}
			}
			RaceFinishCount++;
			PlayerInfo[playerid][pMoney] += Prize0;
			PlayerInfo[playerid][pPoints] += Prize1;
			DisablePlayerRaceCheckpoint(playerid);
			PlayerInfo[playerid][pRaceCPProgess]++;
			if(RaceFinishCount >= RaceJoinCount) return StopRace();
		}
		else
		{
			PlayerInfo[playerid][pRaceCPProgess]++;
			RaceCPCoords[PlayerInfo[playerid][pRaceCPProgess]][3]++;
			PlayerInfo[playerid][pRacePos] = floatround(RaceCPCoords[PlayerInfo[playerid][pRaceCPProgess]][3], floatround_floor);
			SetCP(playerid, PlayerInfo[playerid][pRaceCPProgess], PlayerInfo[playerid][pRaceCPProgess] + 1, TotalRaceCP, RaceType);
			PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	static message[145];
	format(message, sizeof message, "You clicked on player %s (ID: %d)", PlayerInfo[clickedplayerid][pName], clickedplayerid);
	SendClientMessage(playerid, -1, message);
	format(message, sizeof message, "{FFFF00}%s(ID: %d)", PlayerInfo[clickedplayerid][pName], clickedplayerid);
	if(playerid != clickedplayerid) ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, message, "�������� PM\n�������� ������\n���������� �� PVP\n�������� ������\n���������� � �����\n���������� ����������\n�������� DM-����", "�������", "������");
	PlayerInfo[playerid][pClickedId] = clickedplayerid;
	return 1;
}

fpublic RotateFerrisWheel()
{
	FerrisWheelAngle += 36.0;
	if(FerrisWheelAngle >= 360.0) FerrisWheelAngle = 0.0;
	if(FerrisWheelAlternate) FerrisWheelAlternate = false;
	else FerrisWheelAlternate = true;
	new Float:FerrisWheelModZPos;
	if(FerrisWheelAlternate) FerrisWheelModZPos = 0.05;
	MoveObject(FerrisWheelObj[10], 389.7734, -2028.4688, 22.0 + FerrisWheelModZPos, FERRIS_WHEEL_SPEED, 0.0, FerrisWheelAngle, 90.0);
	return 1;
}

fpublic Jail(playerid, time, jcount)
{
	new Float:x, Float:y, Float:z;
	switch(jcount)
	{
		case 1:
		{
			TogglePlayerControllable(playerid, 0);
			GetPlayerPos(playerid, x, y, z);
			SetPlayerCameraPos(playerid, x + 10.0, y, z + 10.0);
			SetPlayerCameraLookAt(playerid, x, y, z);
			SetTimerEx("Jail", 1000, 0, "iii", playerid, time, 2);
		}
		case 2:
		{
			GetPlayerPos(playerid, x, y, z);
			SetPlayerCameraPos(playerid, x + 7.0, y, z + 5.0);
			SetPlayerCameraLookAt(playerid, x, y, z);
			if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
			SetTimerEx("Jail", 1000, 0, "iii", playerid, time, 3);
		}
		case 3:
		{
			GetPlayerPos(playerid, x, y, z);
			SetPlayerCameraPos(playerid, x + 3.0, y, z);
			SetPlayerCameraLookAt(playerid, x, y, z);
			GameTextForPlayer(playerid, "~r~Busted By Admins", 3000, 3);
			SetTimerEx("Jail", 3000, 0, "iii", playerid, time, 4);
		}
		case 4:
		{
			TogglePlayerControllable(playerid, 1);
			SetPlayerAttachedObject(playerid, 8, 19418, 6, -0.011, 0.028, -0.022, -15.6, -33.6999, -81.7, 0.8919, 1.0, 1.168);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CUFFED);
			SetPlayerPos(playerid, 265.0318, 77.4488, 1001.0391);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerInterior(playerid, 6);
			ResetPlayerWeapons(playerid);
			SetPlayerSkin(playerid, 268);
			PlayerInfo[playerid][pJail] = true;
			PlayerInfo[playerid][pJailTime] = time * 60;
			PlayAudioStreamForPlayer(playerid, "http://shoutcast.byfly.by:88/shanson.m3u");
		}
	}
	return 1;
}

fpublic MineCount(playerid)
{
	PlayerInfo[playerid][pMineTmr] = SetTimerEx("MineCount", 1000, 0, "i", playerid);
	new Float:X, Float:Y, Float:Z;
	GetObjectPos(PlayerInfo[playerid][pMineObj][0], X, Y, Z);
	switch(PlayerInfo[playerid][pMineCount])
	{
		case 11: PlayerInfo[playerid][pMineLabel] = Create3DTextLabel("�� ��������� ��������: \n10 c�����!", COLOR_MINE_10, X, Y, Z + 1, 40.0, 0);
		case 10: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_9, "�� ��������� ��������: \n9 c�����!");
		case 9: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_8, "�� ��������� ��������: \n8 c�����!");
		case 8: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_7, "�� ��������� ��������: \n7 c�����!");
		case 7: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_6, "�� ��������� ��������: \n6 c�����!");
		case 6: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_5, "�� ��������� ��������: \n5 c�����!");
		case 5: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_4, "�� ��������� ��������: \n4 c������!");
		case 4: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_3, "�� ��������� ��������: \n3 c������!");
		case 3: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_2, "�� ��������� ��������: \n2 c������!");
		case 2: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_1, "�� ��������� ��������: \n1 c������!");
		case 1:
		{
			KillTimer(PlayerInfo[playerid][pMineTmr]);
			DestroyObject(PlayerInfo[playerid][pMineObj][1]);
			Delete3DTextLabel(PlayerInfo[playerid][pMineLabel]);
			PlayerInfo[playerid][pMinePick] = CreatePickup(0, 1, X, Y, Z, -1);
			PlayerInfo[playerid][pMineLabel] = Text3D:-1;
			PlayerInfo[playerid][pMineStatus] = 2;
		}
	}
	PlayerInfo[playerid][pMineCount]--;
	return 1;
}

fpublic SetupRaceForPlayer(playerid)
{
	RaceCPCoords[playerid][3] = 0;
	TogglePlayerControllable(playerid, 0);
	PlayerInfo[playerid][pRaceCPProgess] = 0;
	SetCP(playerid, PlayerInfo[playerid][pRaceCPProgess], PlayerInfo[playerid][pRaceCPProgess] + 1, TotalRaceCP, RaceType);
	if(IsOdd(playerid))
	{
		if(RacePlayersCount[1] == 1)
		{
			RaceVehCoords[1][0] -= (6 * floatsin(-RaceVehCoords[1][3], degrees));
			RaceVehCoords[1][1] -= (6 * floatcos(-RaceVehCoords[1][3], degrees));
			PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2, RaceVehCoords[1][3], random(126), random(126), (60 * 60));
			SetPlayerPos(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2.0);
			SetPlayerFacingAngle(playerid, RaceVehCoords[1][3]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
			SetCamera(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2], RaceVehCoords[1][3], 20.0);
		}
		else
		{
			PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2, RaceVehCoords[1][3], random(126), random(126), (60 * 60));
			SetPlayerPos(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2.0);
			SetPlayerFacingAngle(playerid, RaceVehCoords[1][3]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
			SetCamera(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2], RaceVehCoords[1][3], 20.0);
			RacePlayersCount[1] = 1;
		}
	}
	else
	{
		if(RacePlayersCount[0] == 1)
		{
			RaceVehCoords[0][0] -= (6 * floatsin(-RaceVehCoords[0][3], degrees));
			RaceVehCoords[0][1] -= (6 * floatcos(-RaceVehCoords[0][3], degrees));
			PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2, RaceVehCoords[0][3], random(126), random(126), (60 * 60));
			SetPlayerPos(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2.0);
			SetPlayerFacingAngle(playerid, RaceVehCoords[0][3]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
			SetCamera(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2], RaceVehCoords[0][3], 20.0);
		}
		else
		{
			PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2, RaceVehCoords[0][3], random(126), random(126), (60 * 60));
			SetPlayerPos(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2.0);
			SetPlayerFacingAngle(playerid, RaceVehCoords[0][3]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
			SetCamera(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2], RaceVehCoords[0][3], 20.0);
			RacePlayersCount[0] = 1;
		}
	}
	PlayerInfo[playerid][pInfoTmr] = SetTimerEx("TextInfo", 500, 1, "i", playerid);
	static string[145], tmp[16];
	TimeConvert(RaceTime, tmp, sizeof tmp);
	format(string, sizeof string, "RaceName: ~w~%s~n~~p~~h~Checkpoint: ~w~%d/%d~n~~b~~h~RaceTime: ~w~%s~n~~y~RacePosition: ~w~%d/%d~n~ ", RaceName, PlayerInfo[playerid][pRaceCPProgess], TotalRaceCP, tmp, PlayerInfo[playerid][pRacePos], RaceJoinCount);
	PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pRaceInfo], string);
	PlayerTextDrawShow(playerid, PlayerInfo[playerid][pRaceInfo]);
	RaceJoinCount++;
	return 1;
}

fpublic CountTillRace()
{
	static string[145];
	switch(RaceCountAmount)
	{
		case 0:
		{
			for(new i = GetPlayerPoolSize(); i >= 0; --i)
			{
				if(IsPlayerConnected(i) && !PlayerInfo[i][pInRace]) SendClientMessage(i, COLOR_YELLOW, "RACE: ����� ��������!");
			}
			StartRace();
		}
		case 1..5:
		{
			format(string, sizeof string, "~b~%d", RaceCountAmount);
			for(new i = GetPlayerPoolSize(); i >= 0; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pInRace])
				{
					GameTextForPlayer(i, string, 1000, 5);
					PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
				}
			}
		}
		case 60, 50, 40, 30, 20, 10:
		{
			format(string, sizeof string, "RACE: \"%d\" ������ �������� �� ������ ����� \"%s\"! ������� \"/joinrace\", ����� �������� � ����� ��� \"/exitrace\", ����� �����.", RaceCountAmount, RaceName);
			SendClientMessageToAll(COLOR_GREEN_RACE, string);
		}
	}
	return RaceCountAmount--;
}

fpublic PayDay(playerid)
{
	PlayerInfo[playerid][pMoney] += 5000;
	SendClientMessage(playerid, COLOR_CYAN, "��������: 5000$");
	return 1;
}

fpublic SaveAccounts()
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && SaveAccount(i)) SendClientMessage(i, COLOR_SPRINGGREEN, "������ �������� ���������!");
	}
	return 1;
}

fpublic OnPlayerKick(playerid) return Kick(playerid);

fpublic OnPlayerBan(playerid) return Ban(playerid);

fpublic AntiSpawnKill(playerid)
{
	SetPlayerHealth(playerid, 100.0);
	SendClientMessage(playerid, COLOR_RED, "Anti-Spawnkill ������ ���������.");
	return 1;
}

fpublic GiveMoney(playerid)
{
	PlayerInfo[playerid][pGiveMoney] = true;
	SendClientMessage(playerid, COLOR_GREEN, "*** �� ����� ������ ������������ ������� /givemoney");
	return 1;
}

fpublic Promise(playerid)
{
	PlayerInfo[playerid][pPromise] = true;
	SendClientMessage(playerid, COLOR_GREEN, "*** �� ����� ������ ������������ ������� /porvu");
	return 1;
}

fpublic PvpStarting(playerid)
{
	PlayerInfo[playerid][pPvpCount]--;
	SetPlayerHealth(playerid, 100.0);
	if(PlayerInfo[playerid][pPvpCount] < 1)
	{
		GameTextForPlayer(playerid, "~g~GO!", 3000, 3);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		TogglePlayerControllable(playerid, 1);
		KillTimer(PlayerInfo[playerid][pCountPvpTmr]);
		return 1;
	}
	static string[10];
	format(string, sizeof string, "~w~%d", PlayerInfo[playerid][pPvpCount]);
	GameTextForPlayer(playerid, string, 1000, 3);
	PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	return 1;
}

fpublic RandomMessages()
{
	new i;
	SendClientMessageToAll(COLOR_PINK, "***********************************************************************************");
	switch(random(14))
	{
		case 0: for( ; i < sizeof RandMsg1; i++) SendClientMessageToAll(COLOR_PINK, RandMsg1[i]);
		case 1: for( ; i < sizeof RandMsg2; i++) SendClientMessageToAll(COLOR_PINK, RandMsg2[i]);
		case 2: for( ; i < sizeof RandMsg3; i++) SendClientMessageToAll(COLOR_PINK, RandMsg3[i]);
		case 3: for( ; i < sizeof RandMsg4; i++) SendClientMessageToAll(COLOR_PINK, RandMsg4[i]);
		case 4: for( ; i < sizeof RandMsg5; i++) SendClientMessageToAll(COLOR_PINK, RandMsg5[i]);
		case 5: for( ; i < sizeof RandMsg6; i++) SendClientMessageToAll(COLOR_PINK, RandMsg6[i]);
		case 6: for( ; i < sizeof RandMsg7; i++) SendClientMessageToAll(COLOR_PINK, RandMsg7[i]);
		case 7: for( ; i < sizeof RandMsg8; i++) SendClientMessageToAll(COLOR_PINK, RandMsg8[i]);
		case 8: for( ; i < sizeof RandMsg9; i++) SendClientMessageToAll(COLOR_PINK, RandMsg9[i]);
		case 9: for( ; i < sizeof RandMsg10; i++) SendClientMessageToAll(COLOR_PINK, RandMsg10[i]);
		case 10: for( ; i < sizeof RandMsg11; i++) SendClientMessageToAll(COLOR_PINK, RandMsg11[i]);
		case 11: for( ; i < sizeof RandMsg12; i++) SendClientMessageToAll(COLOR_PINK, RandMsg12[i]);
		case 12: for( ; i < sizeof RandMsg13; i++) SendClientMessageToAll(COLOR_PINK, RandMsg13[i]);
		case 13: for( ; i < sizeof RandMsg14; i++) SendClientMessageToAll(COLOR_PINK, RandMsg14[i]);
	}
	SendClientMessageToAll(COLOR_PINK, "***********************************************************************************");
	return 1;
}

fpublic Speedometer()
{
	for(new i = GetPlayerPoolSize(), string[16]; i >= 0; --i)
	{
		if(IsPlayerConnected(i))
		{
			format(string, sizeof string, "%d Km/h", GetPlayerSpeed(i));
			PlayerTextDrawSetString(i, PlayerInfo[i][pVehSpeed], string);
		}
	}
	return 1;
}

fpublic UpdateTimer()
{
	gettime(gHour, gMinute, gSecond);
	format(TimeStr, sizeof TimeStr, "%02d:%02d:%02d", gHour, gMinute, gSecond);
	TextDrawSetString(TDTime, TimeStr);
	for(new i = GetPlayerPoolSize(), string[145], string2[32], temp; i >= 0; --i)
	{
		if(IsPlayerConnected(i))
		{
			temp = GetPlayerPing(i);
			if(temp != 65535)
			{
				if(AveragePing == 0) AveragePing = temp;
				else AveragePing = floatround((AveragePing + temp) / 2);
				if(temp > MaxPing)
				{
					printf("����� %s ������ �� ������� ���� (%d)", PlayerInfo[i][pName], temp);
					format(string, sizeof string, "%s ������ � �������. (�������: ������� ���� (%d) | � ������� (%d) | ������������ (%d))", PlayerInfo[i][pName], temp, AveragePing, MaxPing);
					SendClientMessageToAll(COLOR_GRAY, string);
					Kick2(i);
				}
			}
			temp = GetPlayerWeapon(i);
			switch(temp)
			{
				case 18, 22, 26, 28, 32, 35..39:
				{
					GetWeaponName(temp, string2, sizeof string2);
					LowerToUpper(string2);
					printf("����� %s ������� �� CHEAT %s", PlayerInfo[i][pName], string2);
					format(string, sizeof string, "����� %s(ID: %d) ������� �� CHEAT %s!", PlayerInfo[i][pName], i, string2);
					SendClientMessageToAll(COLOR_BORDO, string);
					Ban2(i);
				}
			}
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER && GetPlayerSpeed(i, false) > 350)
			{
				printf("����� %s ������� �� SpeedHack", PlayerInfo[i][pName]);
				format(string, sizeof string, "����� %s(ID: %d) ������� �� SpeedHack!", PlayerInfo[i][pName], i);
				SendClientMessageToAll(COLOR_BORDO, string);
				Ban2(i);
			}
			if(1538 <= GetPlayerAnimationIndex(i) <= 1544 && GetPlayerSpeed(i) > 50)
			{
				printf("����� %s ������ �� FlyHack", PlayerInfo[i][pName]);
				format(string, sizeof string, "����� %s(ID: %d) ������ �� FlyHack!", PlayerInfo[i][pName], i);
				SendClientMessageToAll(COLOR_BORDO, string);
				Kick2(i);
			}
			if(++PlayerInfo[i][pAFKTime] >= 3)
			{
				if(PlayerInfo[i][pAFKTime] - 3 >= 600)
				{
					printf("����� %s ������ �� ���������� ���������� � AFK", PlayerInfo[i][pName]);
					format(string, sizeof string, "*** [ %s ] ������ �� ���������� ���������� � ���.", PlayerInfo[i][pName]);
					SendClientMessageToAll(COLOR_GRAY, string);
					Kick2(i);
				}
				else
				{
					format(string, sizeof string, "��� [%d:%02d]", floatround((PlayerInfo[i][pAFKTime] - 3) / 60, floatround_tozero), (PlayerInfo[i][pAFKTime] - 3) % 60);
					SetPlayerChatBubble(i, string, -1, 30.0, 1500);
				}
			}
			if(PlayerInfo[i][pGodMode]) SetPlayerHealth(i, 99999.0);
			if(PlayerInfo[i][pMoney] != GetPlayerMoney(i))
			{
				temp = PlayerInfo[i][pMoney];
				ResetPlayerMoney(i);
				GivePlayerMoney(i, temp);
			}
			if(PlayerInfo[i][pFloodCount] > 0) PlayerInfo[i][pFloodCount]--;
			if(PlayerInfo[i][pLogged])
			{
				PlayerInfo[i][pSeconds]++;
				if(PlayerInfo[i][pMute])
				{
					PlayerInfo[i][pMuteTime]--;
					if(PlayerInfo[i][pMuteTime] < 1)
					{
						PlayerInfo[i][pMute] = false;
						PlayerTextDrawHide(i, PlayerInfo[i][pMutedTime]);
					}
					else
					{
						format(string, sizeof string, "MuteTime: ~w~%02d:%02d", floatround(PlayerInfo[i][pMuteTime] / 60, floatround_tozero), PlayerInfo[i][pMuteTime] % 60);
						PlayerTextDrawSetString(i, PlayerInfo[i][pMutedTime], string);
						PlayerTextDrawShow(i, PlayerInfo[i][pMutedTime]);
					}
				}
				else PlayerTextDrawHide(i, PlayerInfo[i][pMutedTime]);
				if(PlayerInfo[i][pJail])
				{
					PlayerInfo[i][pJailTime]--;
					if(PlayerInfo[i][pJailTime] < 1) UnJail(i);
				}
				if(PlayerInfo[i][pPunish])
				{
					PlayerInfo[i][pPunishTime]--;
					if(PlayerInfo[i][pPunishTime] < 1)
					{
						PlayerInfo[i][pPunish] = false;
						SetPlayerHealth(i, 0.0);
					}
				}
			}
		}
	}
	return 1;
}

fpublic TextInfo(playerid)
{
	static string[145], tmp[16];
	TimeConvert(RaceTime, tmp, sizeof tmp);
	format(string, sizeof string, "RaceName: ~w~%s~n~~p~~h~Checkpoint: ~w~%d/%d~n~~b~~h~RaceTime: ~w~%s~n~~y~RacePosition: ~w~%d/%d~n~", RaceName, PlayerInfo[playerid][pRaceCPProgess], TotalRaceCP, tmp, PlayerInfo[playerid][pRacePos], RaceJoinCount);
	PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pRaceInfo], string);
	PlayerTextDrawShow(playerid, PlayerInfo[playerid][pRaceInfo]);
	return 1;
}

fpublic RaceCounter()
{
	if(RaceStarted)
	{
		RaceTime--;
		if(RaceJoinCount < 2)
		{
			if(!RaceChecked) SendClientMessageToAll(COLOR_RED_RACE, "RACE: ����� ���������... �� ��������� ����������� ���������� ����������.");
			else SendClientMessageToAll(COLOR_RED_RACE, "RACE: ����� ���������... ��� ��������� �������� �����.");
			StopRace();
			return 1;
		}
		else RaceChecked = true;
		if(RaceTime < 1)
		{
			SendClientMessageToAll(COLOR_RED_RACE, "RACE: ����� ���������... ����� ����� �������.");
			StopRace();
			return 1;
		}
	}
	return 1;
}

fpublic CountFunc()
{
	CountCmd--;
	if(CountCmd > 0)
	{
		static string[32];
		format(string, sizeof string, "~y~%d", CountCmd);
		PlaySoundForAll(1056, 0.0, 0.0, 0.0);
		GameTextForAll(string, 1000, 3);
		SetTimer("CountFunc", 1000, 0);
	}
	else
	{
		GameTextForAll("~g~GO GO GO!", 1000, 3);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		CountStarted = false;
	}
	return 1;
}

fpublic ElevatorBoost(floorid)
{
	StopObject(ElevatorObj);
	StopObject(ElevatorDoorsObj[0]);
	StopObject(ElevatorDoorsObj[1]);
	MoveObject(ElevatorObj, 1786.6781, -1303.4594, GetElevatorZCoordForFloor(floorid), ELEVATOR_SPEED);
	MoveObject(ElevatorDoorsObj[0], 1786.6276, -1303.4594, GetDoorsZCoordForFloor(floorid), ELEVATOR_SPEED);
	MoveObject(ElevatorDoorsObj[1], 1786.6276, -1303.4594, GetDoorsZCoordForFloor(floorid), ELEVATOR_SPEED);
	return 1;
}

fpublic ElevatorTurnToIdle()
{
	ElevatorState = 0;
	ReadNextFloorInQueue();
	return 1;
}

fpublic OnPlayerBanEx(playerid)
{
	new i = -1;
	static reason[145];
	GetPVarString(playerid, "BanExReason", reason, sizeof reason);
	DeletePVar(playerid, "BanExReason");
	while((reason[++i] &= 0xFF) != '\0'){}
	BanEx(playerid, reason);
	return 1;
}

BanEx2(playerid, reason[])
{
	SetPVarString(playerid, "BanExReason", reason);
	SetTimerEx("OnPlayerBanEx", 150, 0, "i", playerid);
	return 1;
}

ElevatorInitialize()
{
	static string[145];
	ElevatorObj = CreateObject(18755, 1786.6781, -1303.4594, 14.5114 + 0.0595, 0.0, 0.0, 270.0);
	ElevatorDoorsObj[0] = CreateObject(18757, 1786.6276, -1303.4594, 14.5114, 0.0, 0.0, 270.0);
	ElevatorDoorsObj[1] = CreateObject(18756, 1786.6276, -1303.4594, 14.5114, 0.0, 0.0, 270.0);
	ElevatorLabel = Create3DTextLabel("������� '~k~~CONVERSATION_YES~' ��� ������������� �����", COLOR_ELEVATOR, 1784.9822, -1302.0426, 13.6491, 4.0, 0, 1);
	for(new i, Float:z; i < sizeof FloorDoorsObj; i++)
	{
		FloorDoorsObj[i][0] = CreateObject(18757, 1786.6276, -1303.1711, GetDoorsZCoordForFloor(i), 0.0, 0.0, 270.0);
		FloorDoorsObj[i][1] = CreateObject(18756, 1786.6276, -1303.1711, GetDoorsZCoordForFloor(i), 0.0, 0.0, 270.0);
		format(string, sizeof string, "%s\n������� '~k~~CONVERSATION_YES~' ��� ������ �����", FloorNames[i]);
		if(i == 0) z = 13.4713;
		else z = 13.4713 + 8.7396 + ((i - 1) * 5.4515);
		FloorsLabel[i] = Create3DTextLabel(string, COLOR_ELEVATOR, 1783.9799, -1300.766, z, 10.5, 0, 1);
	}
	FloorOpenDoors(0);
	ElevatorOpenDoors();
	return 1;
}

ElevatorDestroy()
{
	DestroyObject(ElevatorObj);
	DestroyObject(ElevatorDoorsObj[0]);
	DestroyObject(ElevatorDoorsObj[1]);
	Delete3DTextLabel(ElevatorLabel);
	for(new i = sizeof(FloorDoorsObj) - 1; i >= 0; --i)
	{
		DestroyObject(FloorDoorsObj[i][0]);
		DestroyObject(FloorDoorsObj[i][1]);
		Delete3DTextLabel(FloorsLabel[i]);
	}
	return 1;
}

ElevatorOpenDoors()
{
	new Float:x, Float:y, Float:z;
	GetObjectPos(ElevatorDoorsObj[0], x, y, z);
	MoveObject(ElevatorDoorsObj[0], 1788.2276, y, z, DOORS_SPEED);
	MoveObject(ElevatorDoorsObj[1], 1785.0276, y, z, DOORS_SPEED);
	return 1;
}

ElevatorCloseDoors()
{
	if(ElevatorState == 2) return 0;
	new Float:x, Float:y, Float:z;
	GetObjectPos(ElevatorDoorsObj[0], x, y, z);
	MoveObject(ElevatorDoorsObj[0], 1786.6276, y, z, DOORS_SPEED);
	MoveObject(ElevatorDoorsObj[1], 1786.6276, y, z, DOORS_SPEED);
	return 1;
}

FloorOpenDoors(floorid)
{
	MoveObject(FloorDoorsObj[floorid][0], 1788.2276, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	MoveObject(FloorDoorsObj[floorid][1], 1785.0276, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	PlaySoundForPlayersInRange(6401, 50.0, 1786.6276, -1303.1711, GetDoorsZCoordForFloor(floorid) + 5.0);
	return 1;
}

FloorCloseDoors(floorid)
{
	MoveObject(FloorDoorsObj[floorid][0], 1786.6276, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	MoveObject(FloorDoorsObj[floorid][1], 1786.6276, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	PlaySoundForPlayersInRange(6401, 50.0, 1786.6276, -1303.1711, GetDoorsZCoordForFloor(floorid) + 5.0);
	return 1;
}

ElevatorMoveToFloor(floorid)
{
	ElevatorState = 2;
	ElevatorFloor = floorid;
	MoveObject(ElevatorObj, 1786.6781, -1303.4594, GetElevatorZCoordForFloor(floorid), 0.25);
	MoveObject(ElevatorDoorsObj[0], 1786.6276, -1303.4594, GetDoorsZCoordForFloor(floorid), 0.25);
	MoveObject(ElevatorDoorsObj[1], 1786.6276, -1303.4594, GetDoorsZCoordForFloor(floorid), 0.25);
	ElevatorBoostTmr = SetTimerEx("ElevatorBoost", 2000, 0, "i", floorid);
	Delete3DTextLabel(ElevatorLabel);
	return 1;
}

RemoveFirstQueueFloor()
{
	for(new i; i < sizeof(ElevatorQueue) - 1; i++) ElevatorQueue[i] = ElevatorQueue[i + 1];
	ElevatorQueue[sizeof(ElevatorQueue) - 1] = -1;
	return 1;
}

AddFloorToQueue(floorid)
{
	new slot = -1;
	for(new i; i < sizeof ElevatorQueue; i++)
	{
		if(ElevatorQueue[i] == -1)
		{
			slot = i;
			break;
		}
	}
	if(slot != -1)
	{
		ElevatorQueue[slot] = floorid;
		if(ElevatorState == 0) ReadNextFloorInQueue();
		return 1;
	}
	return 0;
}

ResetElevatorQueue()
{
	for(new i = sizeof(ElevatorQueue) - 1; i >= 0; --i)
	{
		ElevatorQueue[i] = -1;
		FloorRequestedBy[i] = INVALID_PLAYER_ID;
	}
	return 1;
}

IsFloorInQueue(floorid)
{
	for(new i = sizeof(ElevatorQueue) - 1; i >= 0; --i)
	{
		if(ElevatorQueue[i] == floorid) return 1;
	}
	return 0;
}

ReadNextFloorInQueue()
{
	if(ElevatorState > 0 || ElevatorQueue[0] == -1) return 0;
	ElevatorCloseDoors();
	FloorCloseDoors(ElevatorFloor);
	return 1;
}

DidPlayerRequestElevator(playerid)
{
	for(new i = sizeof(FloorRequestedBy) - 1; i >= 0; --i)
	{
		if(FloorRequestedBy[i] == playerid) return 1;
	}
	return 0;
}

CallElevator(playerid, floorid)
{
	if(FloorRequestedBy[floorid] != INVALID_PLAYER_ID || IsFloorInQueue(floorid)) return 0;
	FloorRequestedBy[floorid] = playerid;
	AddFloorToQueue(floorid);
	return 1;
}

SaveAccount(playerid)
{
	if(PlayerInfo[playerid][pLogged])
	{
		static string[64];
		format(string, sizeof string, "Users/%s.ini", PlayerInfo[playerid][pName]);
		new iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			new Float:health;
			ini_setString(iniFile, "Pass", PlayerInfo[playerid][pPass]);
			ini_setInteger(iniFile, "Money", PlayerInfo[playerid][pMoney]);
			GetPlayerHealth(playerid, health);
			if(health > 100.0) health = 100.0;
			ini_setFloat(iniFile, "Health", health);
			GetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
			ini_setFloat(iniFile, "Armour", PlayerInfo[playerid][pArmour]);
			ini_setInteger(iniFile, "Kills", PlayerInfo[playerid][pKills]);
			ini_setInteger(iniFile, "Deaths", PlayerInfo[playerid][pDeaths]);
			ini_setInteger(iniFile, "Points", PlayerInfo[playerid][pPoints]);
			ini_setInteger(iniFile, "DmPoints", PlayerInfo[playerid][pDmPoints]);
			ini_setInteger(iniFile, "Skin", PlayerInfo[playerid][pSkin]);
			ini_setInteger(iniFile, "Gang", PlayerInfo[playerid][pGang]);
			ini_setInteger(iniFile, "GangCheck", PlayerInfo[playerid][pGangCheck]);
			ini_setInteger(iniFile, "GangLvl", PlayerInfo[playerid][pGangLvl]);
			ini_setInteger(iniFile, "Mute", PlayerInfo[playerid][pMute]);
			ini_setInteger(iniFile, "MuteTime", PlayerInfo[playerid][pMuteTime]);
			ini_setInteger(iniFile, "Jail", PlayerInfo[playerid][pJail]);
			ini_setInteger(iniFile, "JailTime", PlayerInfo[playerid][pJailTime]);
			ini_setInteger(iniFile, "Punish", PlayerInfo[playerid][pPunish]);
			ini_setInteger(iniFile, "PunishTime", PlayerInfo[playerid][pPunishTime]);
			ini_setInteger(iniFile, "TimeCount", PlayerInfo[playerid][pSeconds]);
			ini_setInteger(iniFile, "ConnectCount", PlayerInfo[playerid][pConnectCount]);
			ini_setInteger(iniFile, "Ban", PlayerInfo[playerid][pBan]);
			ini_setInteger(iniFile, "BanTime", PlayerInfo[playerid][pBanTime]);
			ini_setInteger(iniFile, "PvpAccept", PlayerInfo[playerid][pPvpAccept]);
			ini_setInteger(iniFile, "FightStyle", PlayerInfo[playerid][pFightStyle]);
			ini_setInteger(iniFile, "Admin", PlayerInfo[playerid][pAdmin]);
			ini_closeFile(iniFile);
			return 1;
		}
	}
	return 0;
}

LoadRace(const racename[], playerid = INVALID_PLAYER_ID)
{
	static string[64];
	format(string, sizeof string, "/rRaceSystem/%s.RRACE", racename);
	if(!fexist(string))
	{
		if(playerid != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: ����� �� ����������!");
		return printf("����� \"%s\" �� ����������!", racename);
	}
	strmid(RaceName, racename, 0, strlen(racename), sizeof RaceName);
	new iniFile = ini_openFile(string), i;
	if(iniFile >= INI_OK)
	{
		ini_getInteger(iniFile, "vModel", RaceVehicle);
		ini_getInteger(iniFile, "rType", RaceType);
		ini_getInteger(iniFile, "TotalCP", TotalRaceCP);
		for(i = 0; i < 2; i++)
		{
			format(string, sizeof string, "vPosX_%d", i);
			ini_getFloat(iniFile, string, RaceVehCoords[i][0]);
			format(string, sizeof string, "vPosY_%d", i);
			ini_getFloat(iniFile, string, RaceVehCoords[i][1]);
			format(string, sizeof string, "vPosZ_%d", i);
			ini_getFloat(iniFile, string, RaceVehCoords[i][2]);
			format(string, sizeof string, "vAngle_%d", i);
			ini_getFloat(iniFile, string, RaceVehCoords[i][3]);
		}
		for(i = 0; i < TotalRaceCP; i++)
		{
			format(string, sizeof string, "CP_%d_PosX", i);
			ini_getFloat(iniFile, string, RaceCPCoords[i][0]);
			format(string, sizeof string, "CP_%d_PosY", i);
			ini_getFloat(iniFile, string, RaceCPCoords[i][1]);
			format(string, sizeof string, "CP_%d_PosZ", i);
			ini_getFloat(iniFile, string, RaceCPCoords[i][2]);
			RaceCPCoords[i][3] = 0;
		}
		ini_closeFile(iniFile);
	}
	RaceJoinCount = 0;
	RaceFinishCount = 0;
	RaceTimeProgress = 0;
	RacePlayersCount[0] = 0;
	RacePlayersCount[1] = 0;
	RaceCountAmount = COUNTDOWN_TILL_RACE_START;
	RaceTime = MAX_RACE_TIME;
	RaceBusy = true;
	if(playerid != INVALID_PLAYER_ID)
	{
		PlayerInfo[playerid][pInRace] = true;
		SetupRaceForPlayer(playerid);
	}
	CountTmr = SetTimer("CountTillRace", 1000, 1);
	return 1;
}

DeleteRace(const racename[], playerid = INVALID_PLAYER_ID)
{
	static string[64];
	format(string, sizeof string, "/rRaceSystem/%s.RRACE", racename);
	if(!fexist(string))
	{
		if(playerid != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: ����� �� ����������!");
		return printf("����� \"%s\" �� ����������!", racename);
	}
	fremove(string);
	SendClientMessage(playerid, COLOR_YELLOW, "RACE: ����� �������!");
	new iniFile = ini_openFile("/rRaceSystem/RaceNames/RaceNames.txt");
	if(iniFile >= INI_OK)
	{
		static rname[21];
		ini_getInteger(iniFile, "TotalRaces", TotalRaces);
		for(new i, krace = -1; i < TotalRaces; i++)
		{
			if(krace == -1)
			{
				format(string, sizeof string, "Race_%d", i);
				ini_getString(iniFile, string, rname);
				if(!strcmp(racename, rname))
				{
					ini_removeKey(iniFile, string);
					format(string, sizeof string, "Race_%d", i + 1);
					ini_getString(iniFile, string, rname);
					format(string, sizeof string, "Race_%d", i);
					ini_setString(iniFile, string, rname);
					krace = i;
				}
			}
			else if(i + 1 < TotalRaces)
			{
				format(string, sizeof string, "Race_%d", i + 1);
				ini_getString(iniFile, string, rname);
				format(string, sizeof string, "Race_%d", i);
				ini_setString(iniFile, string, rname);
			}
		}
		TotalRaces--;
		ini_setInteger(iniFile, "TotalRaces", TotalRaces);
		format(string, sizeof string, "Race_%d", TotalRaces);
		ini_removeKey(iniFile, string);
		ini_closeFile(iniFile);
	}
	return 1;
}

LoadRaceNames()
{
	new iniFile = ini_openFile("/rRaceSystem/RaceNames/RaceNames.txt");
	if(iniFile >= INI_OK)
	{
		static string[64], rname[21];
		ini_getInteger(iniFile, "TotalRaces", TotalRaces);
		for(new i; i < TotalRaces; i++)
		{
			format(string, sizeof string, "Race_%d", i);
			ini_getString(iniFile, string, rname);
			strmid(RaceNames[i], rname, 0, 20);
		}
		ini_closeFile(iniFile);
	}
	return 1;
}

StartRace()
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pInRace])
		{
			TogglePlayerControllable(i, true);
			PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
			GameTextForPlayer(i, "~g~GO GO GO", 2000, 5);
			SetCameraBehindPlayer(i);
		}
	}
	RaceStarted = true;
	RaceChecked = false;
	rCounterTmr = SetTimer("RaceCounter", 900, 1);
	RaceTick = GetTickCount();
	KillTimer(CountTmr);
	return 1;
}

StopRace()
{
	KillTimer(rCounterTmr);
	RaceStarted = false;
	RaceBusy = false;
	RaceTick = 0;
	RaceJoinCount = 0;
	RaceFinishCount = 0;
	RaceTimeProgress = 0;
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pInRace]) StopPlayerRace(i);
	}
	SendClientMessageToAll(COLOR_YELLOW, "RACE: ����� ���������!");
	if(AutomaticRace)
	{
		LoadRaceNames();
		LoadRace(RaceNames[random(TotalRaces)]);
	}
	return 1;
}

StopPlayerRace(playerid)
{
	PlayerInfo[playerid][pInRace] = false;
	DisablePlayerRaceCheckpoint(playerid);
	PlayerInfo[playerid][pRaceCPProgess] = 0;
	DestroyVehicle(PlayerInfo[playerid][pCreatedRaceVeh]);
	PlayerTextDrawHide(playerid, PlayerInfo[playerid][pRaceInfo]);
	KillTimer(PlayerInfo[playerid][pInfoTmr]);
	return 1;
}

SetCP(playerid, PrevCP, NextCP, MaxCP, Type)
{
	if(NextCP == MaxCP) return SetPlayerRaceCheckpoint(playerid, Type + 1, RaceCPCoords[PrevCP][0], RaceCPCoords[PrevCP][1], RaceCPCoords[PrevCP][2], RaceCPCoords[NextCP][0], RaceCPCoords[NextCP][1], RaceCPCoords[NextCP][2], RACE_CP_SIZE);
	SetPlayerRaceCheckpoint(playerid, Type, RaceCPCoords[PrevCP][0], RaceCPCoords[PrevCP][1], RaceCPCoords[PrevCP][2], RaceCPCoords[NextCP][0], RaceCPCoords[NextCP][1], RaceCPCoords[NextCP][2], RACE_CP_SIZE);
	return 1;
}

TimeConvert(seconds, tmp[], tmpsize)
{
	new minutes = floatround(seconds / 60);
	seconds -= minutes * 60;
	format(tmp, tmpsize, "%d:%02d", minutes, seconds);
	return 1;
}

ReturnVehicleID(const vName[])
{
	for(new i = 211; i >= 0; --i)
	{
		if(strfind(VehicleNames[i], vName, true) != -1) return i + 400;
	}
	return -1;
}

RegularCarDialog(playerid)
{
	switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
	{
		case 549: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[1], "�������", "�����");
		case 550: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[2], "�������", "�����");
		case 585, 603: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[3], "�������", "�����");
		case 410, 436: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[4], "�������", "�����");
		case 439, 458: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[5], "�������", "�����");
		case 492, 529, 551: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[6], "�������", "�����");
		case 489, 505: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[7], "�������", "�����");
		case 516: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[8], "�������", "�����");
		case 491, 517: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[9], "�������", "�����");
		case 418, 527, 580: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[10], "�������", "�����");
		case 420, 587: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[11], "�������", "�����");
		case 547: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[12], "�������", "�����");
		case 415: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[13], "�������", "�����");
		default: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}���� �������", RegularCarStr[0], "�������", "�����");
	}
	return 1;
}

Punish(playerid)
{
	SendClientMessage(playerid, COLOR_YELLOW, "�� ���� �������� �� ������� �������� �� ������!");
	SetPlayerPos(playerid, -1350.1162, 994.3682, 1024.0056);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 15);
	PlayerInfo[playerid][pPunish] = true;
	PlayerInfo[playerid][pPunishTime] = SPAWN_KILL_JAIL_TIME * 60;
	return 1;
}

UnJail(playerid)
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	SetPlayerPos(playerid, 1552.4484, -1674.9886, 16.1953);
	SetPlayerSkin(playerid, TeamSkins[PlayerInfo[playerid][pClass]]);
	if(PlayerInfo[playerid][pSkin] >= 0) SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	if(PlayerInfo[playerid][pGang] > 0 && GangSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1] >= 0) SetPlayerSkin(playerid, GangSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1]);
	RemovePlayerAttachedObject(playerid, 8);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerVirtualWorld(playerid, 0);
	SetCameraBehindPlayer(playerid);
	SetPlayerInterior(playerid, 0);
	PlayerInfo[playerid][pJail] = false;
	PlayerInfo[playerid][pJailTime] = 0;
	StopAudioStreamForPlayer(playerid);
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	GameTextForPlayer(playerid, "~g~Released ~n~From Jail", 3000, 3);
	return 1;
}

GangLoad()
{
	for(new i = MAX_GANGS - 1, j, iniFile, string[64]; i >= 0; --i)
	{
		for(j = sizeof(GangSkin[]) - 1; j >= 0; --j) GangSkin[i][j] = -1;
		format(string, sizeof string, "Gangs/%d.ini", i);
		iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			ini_getString(iniFile, "Name", GangName[i]);
			ini_getString(iniFile, "Color", GangColor[i]);
			ini_getInteger(iniFile, "Check", GangCheck[i]);
			ini_getInteger(iniFile, "Money", GangMoney[i]);
			ini_getInteger(iniFile, "DMPoints", GangDmPoints[i]);
			ini_getInteger(iniFile, "SpawnInt", GangSpawnInt[i]);
			ini_getFloat(iniFile, "SpawnX", GangSpawn[i][0]);
			ini_getFloat(iniFile, "SpawnY", GangSpawn[i][1]);
			ini_getFloat(iniFile, "SpawnZ", GangSpawn[i][2]);
			ini_getInteger(iniFile, "Skin1", GangSkin[i][0]);
			ini_getInteger(iniFile, "Skin2", GangSkin[i][1]);
			ini_getInteger(iniFile, "Skin3", GangSkin[i][2]);
			ini_getInteger(iniFile, "Skin4", GangSkin[i][3]);
			ini_getInteger(iniFile, "Skin5", GangSkin[i][4]);
			ini_getInteger(iniFile, "Skin6", GangSkin[i][5]);
			ini_getInteger(iniFile, "Tag", GangTag[i]);
			ini_closeFile(iniFile);
			if(GangSpawn[i][0] && GangSpawn[i][1] && GangSpawn[i][2])
			{
				format(string, sizeof string, "���� ����� .:: %s ::.", GangName[i]);
				GangLabel[i] = Create3DTextLabel(string, COLOR_LIME, GangSpawn[i][0], GangSpawn[i][1], GangSpawn[i][2], 15.0, 0, 0);
				GangPick[i] = CreatePickup(1559, 1, GangSpawn[i][0], GangSpawn[i][1], GangSpawn[i][2], -1);
			}
			else
			{
				GangLabel[i] = Text3D:-1;
				GangPick[i] = -1;
			}
			Gang[i] = true;
		}
	}
	return 1;
}

DestroyGang(gangid)
{
	new i;
	static string[32];
	format(string, sizeof string, "Gangs/%d.ini", gangid);
	fremove(string);
	GangCheck[gangid] = 0;
	GangKills[gangid] = 0;
	GangMoney[gangid] = 0;
	GangDmPoints[gangid] = 0;
	DestroyPickup(GangPick[gangid]);
	Delete3DTextLabel(GangLabel[gangid]);
	for(i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == gangid)
		{
			PlayerInfo[i][pGang] = 0;
			PlayerInfo[i][pGangCheck] = 0;
			PlayerInfo[i][pGangLvl] = 0;
			SetPlayerHealth(i, 0.0);
		}
	}
	for(i = sizeof(GangSkin[]) - 1; i >= 0; --i) GangSkin[gangid][i] = -1;
	for(i = sizeof(GangSpawn[]) - 1; i >= 0; --i) GangSpawn[gangid][i] = 0.0;
	GangLabel[gangid] = Text3D:-1;
	GangColor[gangid][0] = EOS;
	GangName[gangid][0] = EOS;
	GangSpawnInt[gangid] = 0;
	Gang[gangid] = false;
	GangTag[gangid] = true;
	GangPick[gangid] = -1;
	return 1;
}

GetFreeGang()
{
	for(new i = 1; i < MAX_GANGS; i++)
	{
		if(!Gang[i]) return i;
	}
	return 0;
}

GetGangLeader(gangid)
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == gangid && PlayerInfo[i][pGangLvl] == 6) return i;
	}
	return INVALID_PLAYER_ID;
}

PlaySoundForAll(soundid, Float:x, Float:y, Float:z)
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i)) PlayerPlaySound(i, soundid, x, y, z);
	}
	return 1;
}

PlaySoundForPlayersInRange(soundid, Float:range, Float:x, Float:y, Float:z)
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && IsPlayerInRangeOfPoint(i, range, x, y, z)) PlayerPlaySound(i, soundid, x, y, z);
	}
	return 1;
}

IsPlayerAdminEx(playerid, adminlvl)
{
	if(PlayerInfo[playerid][pAdmin] < adminlvl && PlayerInfo[playerid][pTempAdmin] < adminlvl) return 0;
	return 1;
}

GetPlayerAdmin(playerid)
{
	if(PlayerInfo[playerid][pAdmin] > PlayerInfo[playerid][pTempAdmin]) return PlayerInfo[playerid][pAdmin];
	return PlayerInfo[playerid][pTempAdmin];
}

LoopingAnim(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
	PlayerInfo[playerid][pLoopingAnim] = true;
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
	TextDrawShowForPlayer(playerid, TDAnimHelper);
	return 1;
}

StopLoopingAnim(playerid)
{
	PlayerInfo[playerid][pLoopingAnim] = false;
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, 0);
	TextDrawHideForPlayer(playerid, TDAnimHelper);
	return 1;
}

PreloadAnimLib(playerid, animlib[]) ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);

GetPlayerSpeed(playerid, bool:speed3d = true)
{
	new Float:pX, Float:pY, Float:pZ;
	if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid), pX, pY, pZ);
	else GetPlayerVelocity(playerid, pX, pY, pZ);
	if(speed3d) return floatround(VectorSize(pX, pY, pZ) * 179.28625);
	return floatround(VectorSize(pX, pY, 0.0) * 179.28625);
}

SendClientMessageToAdmins(color, const message[])
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && IsPlayerAdminEx(i, 1)) SendClientMessage(i, color, message);
	}
	return 1;
}

SendClientMessageWithoutPlayer(playerid, color, const message[])
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && i != playerid) SendClientMessage(i, color, message);
	}
	return 1;
}

SendClientMessageToGang(gangid, color, const message[])
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == gangid) SendClientMessage(i, color, message);
	}
	return 1;
}

SendClientMessageToTeam(teamid, color, const message[])
{
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pTeam] == teamid) SendClientMessage(i, color, message);
	}
	return 1;
}

SetCamera(playerid, Float:X, Float:Y, Float:Z, Float:angle, Float:dist)
{
	SetPlayerCameraLookAt(playerid, X, Y, Z);
	return SetPlayerCameraPos(playerid, X + (dist * floatsin(-angle, degrees)), Y + (dist * floatcos(-angle, degrees)), Z + 6.0);
}

IsACar(vehicleid)
{
	switch(GetVehicleModel(vehicleid))
	{
		case 416, 445, 602, 485, 568, 429, 499, 424, 536, 496, 504, 422, 609,
		498, 401, 575, 518, 402, 541, 482, 431, 438, 457, 527, 483, 524, 415,
		542, 589, 480, 596, 599, 597, 598, 578, 486, 507, 562, 585, 427, 419,
		587, 490, 528, 533, 544, 407, 565, 455, 530, 526, 466, 604, 492, 474,
		434, 502, 503, 494, 579, 545, 411, 546, 559, 508, 571, 400, 403, 517,
		410, 551, 500, 418, 572, 423, 516, 582, 467, 404, 514, 603, 600, 413,
		426, 436, 547, 489, 441, 594, 564, 515, 479, 534, 505, 442, 440, 475,
		543, 605, 495, 567, 428, 405, 535, 458, 580, 439, 561, 409, 560, 550,
		506, 601, 574, 566, 549, 420, 459, 576, 583, 451, 558, 552, 540, 491,
		412, 478, 421, 529, 555, 456, 554, 477: return 1;
	}
	return 0;
}

encode_tires(tires1, tires2, tires3, tires4) return tires1 | (tires2 << 1) | (tires3 << 2) | (tires4 << 3);

LowerToUpper(text[])
{
	for(new i = strlen(text) - 1; i >= 0; --i)
	{
		switch(text[i])
		{
			case 'a'..'z', '�'..'�': text[i] -= 32;
			case '�': text[i] = '�';
		}
	}
	return 1;
}

UpperToLower(text[])
{
	for(new i = strlen(text) - 1; i >= 0; --i)
	{
		switch(text[i])
		{
			case 'A'..'Z', '�'..'�': text[i] += 32;
			case '�': text[i] = '�';
		}
	}
	return 1;
}

IsNumeric(const string[])
{
	for(new i, j = strlen(string); i < j; i++)
	{
		if(!('0' <= string[i] <= '9')) return 0;
	}
	return 1;
}

IsEmptyMessage(const string[])
{
	for(new i; string[i] != 0; i++)
	{
		switch(string[i])
		{
			case ' ': continue;
			default: return 0;
		}
	}
	return 1;
}

GetNumberOfPlayersOnThisIP(const test_ip[])
{
	new ip_count;
	static against_ip[16];
	for(new i = GetPlayerPoolSize(); i >= 0; --i)
	{
		if(IsPlayerConnected(i))
		{
			GetPlayerIp(i, against_ip, sizeof against_ip);
			if(!strcmp(against_ip, test_ip)) ip_count++;
		}
	}
	return ip_count;
}

CheckAnyIP(const string[])
{
	new digits, digitGroups;
	for(new pos1, pos2, ip[16], len = strlen(string); pos1 < len; pos1++)
	{
		if('0' <= string[pos1] <= '9')
		{
			pos2 = pos1 + 1;
			while('0' <= string[pos2] <= '9') pos2++;
			strmid(ip, string, pos1, pos2);
			if(0 <= strval(ip) <= 255) digits++;
			pos1 = pos2 - 1;
		}
		else if(digits >= 1)
		{
			digitGroups++;
			digits = 0;
		}
	}
	if(digits >= 1) digitGroups++;
	if(digitGroups >= 4) return 1;
	return 0;
}

strfuzzyfind(const string[], const sub[], pos = 0, &start = -1, &end = -1)
{
	pos--;
	new s[2], len = strlen(string), sublen = strlen(sub), i, j, l;
	s[0] = sub[0];
	while((pos = strfind(string, s, true, ++pos)) != -1)
	{
		l = -1;
		for(i = pos, j = 0; i < len; i++)
		{
			switch(string[i])
			{
				case 'A'..'Z', 'a'..'z', '�', '�', '�'..'�', '�'..'�':
				{
					if(string[i] == l) continue;
					if(string[i] != sub[j++]) break;
					if(j == sublen)
					{
						start = pos;
						end = i;
						return pos;
					}
					l = string[i];
				}
			}
		}
	}
	return -1;
}

CheckDialogColor(text[])
{
	if(strlen(text) < 8) return 0;
	new i, j;
	do
	{
		if(text[i] == '{' && strlen(text[i]) >= 7 && text[i + 7] == '}')
		{
			for(j = i + 1; j < i + 7; j++)
			{
				if(!('A' <= text[j] <= 'F' || 'a' <= text[j] <= 'f' || '0' <= text[j] <= '9'))
				{
					i += 8;
					j = -1;
					break;
				}
			}
			if(j != -1) strdel(text, i, i + 8);
		}
		else if(text[i] == '}' && i >= 7 && text[i - 7] == '{') i -= 7;
		else i++;
	}
	while(text[i]);
	return 1;
}

HexToInt(const string[])
{
	if(!string[0]) return 0;
	new res = 0;
	for(new i = strlen(string), cur = 1; i > 0; i--)
	{
		res += cur * (string[i - 1] - ((string[i - 1] < 58) ? (48) : (55)));
		cur = cur * 16;
	}
	return res;
}

strtok(string[], &index)
{
	new length = strlen(string);
	while((index < length) && (string[index] <= ' ')) index++;
	new offset = index, result[20];
	while((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
