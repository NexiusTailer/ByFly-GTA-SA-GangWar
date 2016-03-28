/*==============================================================================
			----------------------------------------------------------
								ByFly GTA: SA GangWar
							A TDM gamemode for SA-MP 0.3.7
			----------------------------------------------------------

								Original: Lethal

								Modified by Nexius
										r4

==============================================================================*/

#include <a_samp>
#include <GetVehicleColor>
#include <mxINI>

#undef MAX_PLAYERS
#define MAX_PLAYERS		100

#define COLOR_BLACK						0x000000AA
#define COLOR_DARKBROWN					0x80400096
#define COLOR_DARKRED					0x660000AA
#define COLOR_BORDO						0xB00000AA
#define COLOR_RED						0xFF0000AA
#define COLOR_PURPLE					0x800080AA
#define COLOR_PINK						0xFC0FC0FF
#define COLOR_DARKORANGE				0xFF5300AA
#define COLOR_ORANGE					0xFF9900AA
#define COLOR_YELLOW					0xFFFF00AA
#define COLOR_YELLOW_2					0xFFFF00FF
#define COLOR_SALMON					0xFA8072FF
#define COLOR_BLUE						0x004DFFAA
#define COLOR_CYAN						0x00FFFFFF
#define COLOR_LIGHTBLUE					0x33CCFFAA
#define COLOR_GREEN						0x33AA33AA
#define COLOR_SPRINGGREEN				0x00FF7FAA
#define COLOR_LIME						0x10F441AA
#define COLOR_LIME_2					0x00FF00FF
#define COLOR_GRAY						0xAFAFAFAA
#define COLOR_WHITE						0xFFFFFFAA

#define COLOR_RED_RACE					0xE60000FF
#define COLOR_GREEN_RACE				0x9FFF00FF
#define COLOR_RED_GANG					0xFF0000FF
#define COLOR_LIME_GANG					0xCCFF00FF
#define COLOR_BLUE_TEAM					0x0000BBAA

#define COLOR_MINE_1					0xFF0F0FAA
#define COLOR_MINE_2					0xFA421BAA
#define COLOR_MINE_3					0xFA6F1BAA
#define COLOR_MINE_4					0xFBA71AAA
#define COLOR_MINE_5					0xFCCE18AA
#define COLOR_MINE_6					0xFCEB18AA
#define COLOR_MINE_7					0xDAF900AA
#define COLOR_MINE_8					0xBAF801AA
#define COLOR_MINE_9					0x64F801AA
#define COLOR_MINE_10					0x00F900AA

#define COLOR_ELEVATOR					0x00FFFFCC

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

#define TEAM_GROVE						0
#define TEAM_BALLAS						1
#define TEAM_AZTEC						2
#define TEAM_NANG						3
#define TEAM_VAGOS						4
#define TEAM_COPS						5
#define TEAM_MAFIA						6
#define TEAM_BIKER						7
#define TEAM_TRIAD						8
#define	TEAM_ADMIN						9
#define TEAM_ARMY						10
#define TEAM_BANDIT						11

#define MAX_GANGS						512
#define MAX_PASSWORD_LENGTH				32
#define PVP_WORLD						1000

#define MAX_CONNECTIONS_FROM_IP			3
#define MAX_PASSWORD_ATTEMPTS			3
#define MAX_TEAMKILLS					3
#define REOWN_TURF						4
#define GANGAREA_TAKE					4
#define GANGAREA_WARNINGS				2

#define MAX_RACES						100
#define MAX_RACE_CHECKPOINTS_EACH_RACE	124
#define COUNT_DOWN_TILL_RACE_START		30
#define MAX_RACE_TIME					300
#define RACE_CHECKPOINT_SIZE			12.0

#define ELEVATOR_SPEED					5.0
#define DOORS_SPEED						5.0
#define ELEVATOR_WAIT_TIME				5000
#define X_DOOR_CLOSED					1786.6276
#define X_DOOR_R_OPENED					1785.0276
#define X_DOOR_L_OPENED					1788.2276
#define GROUND_Z_COORD					14.5114
#define ELEVATOR_OFFSET					0.0595

#define FERRIS_WHEEL_WAIT_TIME			3000
#define FERRIS_WHEEL_SPEED				0.005

#define JAIL_FOR_SPAWN_KILL				5

#define ConvertTime(%0,%1,%2,%3,%4) \
	new Float:%0 = floatdiv(%1, 60000); \
	%2 = floatround(%0, floatround_tozero); \
	%3 = floatround(floatmul(%0 - %2, 60), floatround_tozero); \
	%4 = floatround(floatmul(floatmul(%0 - %2, 60) - %3, 1000), floatround_tozero)

#define fpublic%0(%1) forward %0(%1); public %0(%1)
#define Kick2(%0) SetTimerEx("OnPlayerKick", 150, 0, "i", %0)
#define Ban2(%0) SetTimerEx("OnPlayerBan", 150, 0, "i", %0)

#define IsOdd(%1) ((%1) & 1)

new const DisReasons[][] =
{
	"Вылет",
	"Выход",
	"Кикнут либо забанен"
},

Ranks[][][] =
{
	{"Школьник", 50},
	{"Студент", 100},
	{"Силач", 150},
	{"Стрелок", 200},
	{"Киллер", 250},
	{"Наёмник", 500},
	{"Убийца", 750},
	{"Снайпер", 1000},
	{"Головорез", 2000},
	{"Рэмбо", 3000},
	{"Камикадзе", 4000},
	{"Легенда 5 Дан", 5000},
	{"Легенда 6 Дан", 6000},
	{"Легенда 7 Дан", 7000},
	{"Легенда 8 Дан", 8000},
	{"Легенда 9 Дан", 9000},
	{"Легенда 10 Дан", 10000}
},

DefaultGangNames[][] =
{
	"Грув",
	"Баллас",
	"Ацтеки",
	"Nang",
	"Вагос",
	"Копы",
	"Мафия",
	"Байкеры",
	"Триада",
	"Админы",
	"Армия",
	"Bandit"
},

RulesMsg[][] =
{
	"{FF00FF}Внимание!!! Незнание данных правил и не желание их читать не освобождает вас от ответственности и отягощает вашу вину\n",
	"Игрок, зашедший на сервер, автоматически соглашается с нижеперечисленными правилами и обязуется их выполнять\n\n",
	"{00FFFF}1. Правила общения:\n",
	"{FFFF00}1.1 Запрещена любая форма нецензурной лексики (мата), в том числе завуалированная\n",
	"1.2 Запрещаются любые оскорбления порочащие честь и достоинство других игроков\n",
	"1.3 Запрещается в какой-либо степени дерзкое, нахальное обращение с администрацией игры\n",
	"1.4 Запрещается любой вид флуда в общем чате\n",
	"1.5 Запрещается чрезмерное использование ВЕРХНЕГО регистра т.е. Caps Lock\n",
	"1.6 Запрещена реклама в любом её проявление: серверов не имеющих отношения к GTA ByFly серверам, любых сайтов и т.д.\n",
	"1.7 Запрещается использование ников включающие часть или полностью состоящие из нецензурного слова или состоящие из набора букв и цифр\n",
	"1.8 Запрещается создание другого аккаунта в случае бана первого за маты, оскорбления, использование читов и т.д.\n",
	"1.9 Запрещается любое обсуждение действий администрации в общем чате.\n",
	"Все претензии можете высказать администратору в личном сообщении /pm или в соответствующей теме на форуме\n",
	"{00FFFF}2. Правила игры\n",
	"{FFFF00}2.1 Запрещено использование каких-либо скриптов, чит-модов и программ для упрощения ввода команд\n",
	"2.3 Запрещено использовать баги, лаги, ошибки, недоработки, а так же любое их обсуждение в чате. В том числе:\n",
	"* Заведомо нечестная прокачка на деньги специальными возможностями персонажей\n",
	"* АФК более 10 минут (нахождения на сервере более 10 минут без участия в игровом процессе)\n",
	"* Драйвбай (ДБ) - стрельба с места водителя по пешеходам или давить транспортом\n",
	"* Уход от погони/смерти, посредством ухода в эскейп\n",
	"2.4 Запрещена стрельба по участникам гонки до и после старта, либо порча транспорта любыми средствами\n",
	"2.5 Запрещены любые стычки на респаунах. Под любыми следует понимать, как стрельбу из оружия или кулачные бои\n",
	"2.6 Запрещены драки, стрельба у/в аммо. Драки в магазине 24/7, в тюрьме или в форте и прочих зданиях\n",
	"2.7 Запрещено создание мультиаккаунтов\n",
	"{00FFFF}3. Правила администрирования:\n",
	"{FFFF00}3.1 Администраторы обязаны соблюдать все выше перечисленные правила\n",
	"3.5 Запрещено копирование ников, либо символики администраторов, запрещено выдавать себя за администраторов игры\n",
	"3.7 {FF0000}Главные Администраторы никому ничего не обязаны и не должны\n",
	"{00FFFF}4. Общие правила\n",
	"{FFFF00}4.1 По поводу любых нарушений в игре писать только Администрации в /pm id_нарушителя нарушение или /report id_нарушителя нарушение\n\n",
	"{33AA33}Заходите на наш форум: {964B00}forum.gameplanet.by\n"
},

RaceAboutMsg[][] =
{
	"Для того чтобы начать создавать гонку (для админов), наберите: /buildrace\n",
	"Далее руководствуйтесь подсказками диалогового окна\n",
	"Просмотр победителей гонки: /toprace [имя гонки]\n",
	"Чтобы удалить гонку (для админов), наберите: /delrace [имя гонки]\n",
	"Чтобы обнулить результаты гонки (для админов), наберите: /deltoprace [имя гонки]\n",
	"Чтобы запустить гонку наберите: /startrace [имя гонки]\n",
	"Остановить гонку может только админ\n",
	"Присоединиться к гонке: /joinrace\n",
	"Выйти из гонки: /exitrace\n",
	"Посмотреть список доступных гонок: /listrace\n",
	"Максимальное количество чекпоинтов для создания своей гонки - 124\n",
	"Максимальное количество гонок - 100\n",
	"Максимальное время гонки - 5 минут\n",
	"Перед тем, как дать имя своей гонке, посмотрите список существующих гонок\n",
	"Гонки с названиями - 1, 3, 66, bb, aaa и т.п. будут удалены\n",
	"Старайтесь названием гонки выразить её тип\n",
	"Не создавайте гонки с одинаковыми названиями\n",
	"Победители гонки получают денежные призы"
},

AvtoAboutMsg[][] =
{
	"{FFFFFF}Запустить / остановить двигатель - {FFE4C4}/engine\n",
	"{FFFFFF}Открыть / закрыть капот - {FFE4C4}/bonnet {00FF00}(Num 4)\n",
	"{FFFFFF}Открыть / закрыть багажник - {FFE4C4}/boot {00FF00}(Num 6)\n",
	"{FFFFFF}Открыть / закрыть двери - {FFE4C4}/lock /unlock\n",
	"{FFFFFF}Включить / выключить фары - {FFE4C4}/lights {00FF00}(Num +)\n",
	"{FFFFFF}Включить / выключить сигнализацию - {FFE4C4}/alarm\n",
	"{FFFFFF}Сменить номер авто (не более 32 символов) - {FFE4C4}/nomer\n",
	"{FFFFFF}Установить / убрать неоновую подстветку - {FFE4C4}команды нет\n",
	"{FFFFFF}Установить / убрать указатель над авто (только командой) - {FFE4C4}/objective\n",
	"{00FF7F}Примечание: чтобы включить опцию - наберите соответствующую команду для опции\n",
	"чтобы отключить опцию - наберите соответствующую команду для опции ещё раз\n\n",
	"{FFFFFF}Все команды доступны как в виде диалогового окна ({FFE4C4}/avto{FFFFFF})\n",
	"так и просто как обычные команды\n",
	"Вызов диалогового окна по управлению трнспортом: {FFE4C4}/avto"
},

PvpAboutMsg[][] =
{
	"Для того, чтобы назначить пвп с другим игроком, надо ввести команду\n",
	"/pvp [id игрока] [id оружия] [1/0 наличие брони] [1-5 место] [$1-10000 ставка]\n\n",
	"[id оружия] - Desert Eagle-24 | Shotgun-25 | SMG (MP5)-29\n",
	"M4-31 | Sniper Rifle-34 | Grenades-16\n",
	"[1/0 armour] - если 1, то пвп будет проходить с бронью\n",
	"[place 1/6] - место пвп от одного до шести\n",
	"place 1 - East Los Santos\n",
	"place 2 - Ocean Docks\n",
	"place 3 - LV\n",
	"place 4 - Liberty City Bar\n",
	"place 5 - LV Pirs\n",
	"Place 6 - Covering\n",
	"Для участия в PVP игроки должны находиться вне транспорта\n\n",
	"Для отключения возможности приглаения Вас на PVP наберите /nopvp\n",
	"Для включения возможности приглашения Вас на PVP наберите /nopvp ещё раз"
},

CmdsMsg[][] =
{
	"/stats - показать свою статистику\n",
	"/stats [id] - показать статистику игрока\n\
	/rules - правила сервера\n",
	"/help - помощь\n",
	"/givemoney [id] [summa] - передать деньги игроку\n",
	"/kill - самоубийство\n",
	"/report [id] [причина] - написать жалобу на игрока\n",
	"/tune - меню тюнинга\n",
	"/очки - меню выбора очков\n",
	"/avto - авто-меню\n",
	"/skin [id скина] - изменить свой скин\n",
	"/noskin - отказаться от сохранённого скина\n",
	"/drink - меню выпивки\n",
	"/skydive - прыгнуть с парашютом\n",
	"/count [1-5] - запустить отсчёт\n",
	"/vip - телепортироваться на vip-остров\n",
	"/mine - установить мину\n",
	"/actions - меню специальных действий\n",
	"/pm [id] [сообщение] - отправить PM\n",
	"/ky - поприветствовать всех\n",
	"/hi [id] - поприветствовать игрока\n",
	"/bb - попрощаться со всеми\n",
	"/by [id] - попрощаться с игроком\n",
	"/porvu - обещать всех порвать\n",
	"/radio - список радиостанций\n",
	"/changepass [пароль] - изменить пароль\n",
	"/resetstats - сбросить свою статистику\n",
	"/dance [1-4] - танцевать\n",
	"/dmpoints - меню DM-очков\n",
	"/gang - меню банды\n",
	"/банды - список банд"
},

AvtoMsg[][] =
{
	"{00FF7F}Запустить мотор\n",
	"{00FF7F}Открыть капот\tNum 4\n",
	"{00FF7F}Открыть багажник\tNum 6\n",
	"{00FF7F}Включить свет\tNum +\n",
	"{00FF7F}Включить сигнализацию\n",
	"{00FF7F}Закрыть двери\n",
	"{FA8072}Закрыть капот\tNum 4\n",
	"{FA8072}Закрыть багажник\tNum 6\n",
	"{FA8072}Выключить свет\tNum +\n",
	"{FA8072}Выключить сигнализацию\n",
	"{FA8072}Открыть двери\n",
	"{FA8072}Заглушить мотор\n",
	"{FF0000}Н{004DFF}е{10F441}о{FFFF00}н\n",
	"{33CCFF}Сменить номер"
},

RegularCarStr[][] =
{
	"Спойлер\nКрыша\nКапот\nВентиляция\nБоковые юбки\nФары",
	"Спойлер\nКрыша\nВентиляция\nБоковые юбки\nФары",
	"Спойлер\nКрыша\nКапот\nВентиляция\nФары",
	"Спойлер\nКрыша\nВентиляция\nБоковые юбки\nФары",
	"Спойлер\nКрыша\nБоковые юбки\nФары",
	"Спойлер\nВентиляция\nБоковые юбки\nФары",
	"Спойлер\nКрыша\nКапот\nБоковые юбки",
	"Спойлер\nКрыша\nКапот\nФары",
	"Спойлер\nКрыша\nБоковые юбки",
	"Спойлер\nВентиляция\nБоковые юбки",
	"Спойлер\nКрыша\nБоковые юбки",
	"Спойлер\nКрыша",
	"Спойлер\nВентиляция",
	"Спойлер\nБоковые юбки"
},

RaceCreate3Msg[][] =
{
	"Этап 3:\n",
	"********\n",
	"Мы почти закончили! Теперь перейдите к линии старта, где должны стоять первый и второй автомобили.\n",
	"Примечание: после нажатия 'Ок' Вы будете свободны. Используйте 'KEY_FIRE', чтобы установить первую и вторую позицию.\n",
	"Примечание: После того, как Вы получите эти позиции, Вы автоматически увидите диалоговое окно для продолжения настройки.\n\n",
	">> Нажмите 'Ок', чтобы сделать описанные выше действия. 'Назад', чтобы что-то изменить."
},

RaceCreate4Msg[][] =
{
	"Этап 4:\n",
	"********\n",
	"Добро пожаловать в последний этап. В этом этапе Вы должны установить чекпоинты; так что если Вы выберите 'Ок', Вы сможете устанавливать чекпоинты.\n",
	"Вы можете устанавливать чекпоинты нажатием 'KEY_FIRE'. Каждый установленный чекпоинт сохраняется.\n",
	"Нажмите клавишу 'ENTER', когда Вы закончите со всем. После этого ваша гонка будет доступна!\n\n",
	">> Нажмите 'Ок', чтобы сделать описанные выше действия. 'Назад', чтобы что-то изменить."
},

RandMsg1[][] =
{
	"Ознакомиться с правилами игры на форуме http://forum.gameplanet.by/",
	"Внимание!!! Не знание данных правил и не желание их читать не освобождает вас от ответственности и отягощает вашу вину.",
	"Игрок, зашедший на сервер, автоматически соглашается с вышеуказанными правилами и обязуется их выполнять."
},

RandMsg2[][] =
{
	"Заходите на веб панель сервера http://86.57.151.20/Gang/",
	"Там Вы сможете изменить свой ник, пароль, посмотрть статистику любого игрока,",
	"а также ещё много чего другого !!!"
},

RandMsg3[][] =
{
	"Наберите /help чтобы узнать все доступные команды сервера"
},

RandMsg4[][] =
{
	"Читы/хаки/различные паркур и cleo моды (наказание: kick/ban)",
	"Ненормативная лексика/брань/флуд/ (наказание: kick/ban)",
	"Комментировать/обсуждать действия админа, наезды/унижения, оскорбления, нецензурная брань и т.д. (наказание: ban)"
},

RandMsg5[][] =
{
	"Используйте команду /skydive чтобы выполнить прыжок с парашютом"
},

RandMsg6[][] =
{
	"                               Приятной игры!!!"
},

RandMsg7[][] =
{
	"На серверее установлена система автоотсчёта, наберите /count [time], чтобы запустить отсчёт, время указывайте в секундах.",
	"Используйте эту команду для начала отсчёта во время гонок или дуэли. За использование команды ради баловства - кик."
},

RandMsg8[][] =
{
	"Для общения игроков, создан канал GangWar сервера в TeamSpeak3 GamePlanet.by",
	"Адрес ТС: 86.57.151.20 порт:9987",
	"Приятного общения !!!"
},

RandMsg9[][] =
{
	"Не забывайте посещать наш форум http://forum.gameplanet.by/index.php?showforum=821",
	"Так же рады Вас видеть в IRC на канале #gta.gangwar"
},

RandMsg10[][] =
{
	"Наберите /lock чтобы закрыть двери своего транспорта и /unlock для того что бы их открыть."
},

RandMsg11[][] =
{
	"Используйте команду /givemoney id summa для передачи денег"
},

RandMsg12[][] =
{
	"Для смены пароля аккаунта наберите /changepass"
},

RandMsg13[][] =
{
	"О читерах пишите админам /report id_читера причина или в /pm... Жалобы в общий чат рассматриваться не будут!!!"
},

RandMsg14[][] =
{
	"В данный момент на сервере включена система автобана игрока за использование Micro SMG, Sawn off Shotgun, TEC9.",
	"При покупке оружия будьте внимательны, чтоб потом не возникало глупых вопросов."
},

Swears[][] =
{
	"сук", "пидор", "пизд", "хуй", "бля", "пидр",
	"шлюх", "лох", "ебан", "ебал", "чмо"
},

Carray[] =
{
	1, 0, 6, 2, 79, 149, 151, 3, 34
},

Warray[] =
{
	1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080,
	1081, 1082, 1083, 1084, 1085, 1096, 1097, 1098
},

Xarray1[] =
{
	1000, 1001, 1002, 1003, 1014, 1015, 1016, 1023
},

Xarray2[] =
{
	1004, 1005, 1011, 1012
},

Xarray3[] =
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
	{2793.918, -2456.878, 13.63217},
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
	pName[MAX_PLAYER_NAME],
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
	pClicked,
	pAFKTime,
	pBanTime,
	pSeconds,
	pGangId,
	pTgang,
	pSpec,
	pId,
	pInDm,
	pGang,
	pGangLvl,
	pGangSkin,
	pMineCount,
	pGangCheck,
	Text:pRaceInfo,
	Text3D:pMineLabel,
	PlayerText:pVehSpeed,
	PlayerText:pMutedTime,
	pRacePos,
	pPointsId,
	pSpikes,
	pMine[2],
	pNeon[12],
	pMinePickup,
	pCreatedRaceVeh,
	pMineStatus,
	pCPProgess,
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

	iGate,
	iGate2,
	iGate3,
	iGate4,
	VipGates,

	Dumper,
	Hydra1,
	Hydra2,
	Panzer,
	TunVehs[22],

	TPls,
	TPsf,
	TPlv,
	TPChina,

	CountTmr,
	rCounterTmr,
	ElevatorBoostTmr,

	bool:PvpPlaceVisit[5],

	GangName[MAX_PLAYERS][32],
	Gang[MAX_GANGS],
	GPick[MAX_GANGS],
	Text3D:GLabel[MAX_GANGS],
	GName[MAX_GANGS][32],
	GCheck[MAX_GANGS],
	GColor[MAX_GANGS][10],
	Float:GSpawn[MAX_GANGS][3],
	GSpawnInt[MAX_GANGS],
	bool:GTag[MAX_GANGS],
	GSkin[MAX_GANGS][7],
	GDMPoints[MAX_GANGS],
	GMoney[MAX_GANGS],
	GKills[MAX_GANGS],

	BuildRace,
	BuildRaceType,
	BuildVehicle,
	BuildModeVID,
	BuildName[30],
	bool:BuildTakeVehPos,
	BuildVehPosCount,
	bool:BuildTakeCheckpoints,
	BuildCheckPointCount,
	bool:RaceBusy,
	RaceName[30],
	RaceVehicle,
	RaceType,
	TotalCP,
	Float:RaceVehCoords[2][4],
	Float:CPCoords[MAX_RACE_CHECKPOINTS_EACH_RACE][4],
	Index,
	PlayersCount[2],
	CountAmount,
	RaceTick,
	bool:RaceStarted,
	bool:RaceChecked,
	FinishCount,
	JoinCount,
	RaceTime,
	RaceNames[MAX_RACES][64],
	TotalRaces,
	bool:AutomaticRace,
	TimeProgress,

	ObjElevator,
	ObjElevatorDoors[2],
	ObjFloorDoors[21][2],
	Text3D:LabelElevator,
	Text3D:LabelFloors[21],
	ElevatorState,
	ElevatorFloor,
	ElevatorQueue[21],
	FloorRequestedBy[21],

	FerrisWheelObjects[12],
	Float:FerrisWheelAngle,
	FerrisWheelAlternate,

	Fire,
	Fire1,
	Balloon,
	BalloonStage,
	bool:BalloonIsStarted,
	Text3D:BalloonLabel,

	CountCmd,
	bool:CountStarted,

	MaxPing = 300,
	AveragePing,

	Flasher[MAX_VEHICLES],

	RulesStr[2800],
	RaceCreate3Str[457],
	RaceCreate4Str[456],
	RaceAboutStr[951],
	AvtoAboutStr[967],
	PvpAboutStr[690],
	CmdsStr[1000],
	AvtoStr[412],

	bool:EarsIsEnabled;

Float:GetElevatorZCoordForFloor(floorid) return (GROUND_Z_COORD + FloorZOffsets[floorid] + ELEVATOR_OFFSET);

Float:GetDoorsZCoordForFloor(floorid) return (GROUND_Z_COORD + FloorZOffsets[floorid]);

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

main(){}

public OnGameModeInit()
{
	SetWeather(2);
	SetGameModeText("GangWar v3.9");
	SetNameTagDrawDistance(40.0);
	ShowPlayerMarkers(1);
	UsePlayerPedAnims();
	SetWorldTime(11);

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
	TextDrawSetProportional(TDLogo, 1);

	TDLogo2 = TextDrawCreate(314.0, 387.0, "Gang War~n~www.gameplanet.by");
	TextDrawAlignment(TDLogo2, 2);
	TextDrawBackgroundColor(TDLogo2, 65380);
	TextDrawLetterSize(TDLogo2, 1.02, 2.2);
	TextDrawColor(TDLogo2, -65281);
	TextDrawSetProportional(TDLogo2, 1);
	TextDrawSetShadow(TDLogo2, 3);
	TextDrawUseBox(TDLogo2, 1);
	TextDrawBoxColor(TDLogo2, 65350);
	TextDrawTextSize(TDLogo2, 0.0, 400.0);

	gettime(gHour, gMinute, gSecond);
	format(TimeStr, sizeof TimeStr, "%02d:%02d:%02d", gHour, gMinute, gSecond);
	TDTime = TextDrawCreate(499.0, 118.0, TimeStr);
	TextDrawLetterSize(TDTime, 0.3, 1.0);
	TextDrawBackgroundColor(TDTime, 255);
	TextDrawSetProportional(TDTime, 1);
	TextDrawSetOutline(TDTime, 1);
	TextDrawColor(TDTime, -1);
	TextDrawFont(TDTime, 3);

	TDAnimHelper = TextDrawCreate(610.0, 400.0, "~r~~k~~PED_SPRINT~ ~w~to stop the animation");
	TextDrawUseBox(TDAnimHelper, 0);
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

	AddPlayerClassEx(TEAM_BIKER, TeamSkins[27], TeamSpawns[TEAM_BIKER][0], TeamSpawns[TEAM_BIKER][1], TeamSpawns[TEAM_BIKER][2], 90, 0, 0, 24, 50, 31, 150);
	AddPlayerClassEx(TEAM_BIKER, TeamSkins[28], TeamSpawns[TEAM_BIKER][0], TeamSpawns[TEAM_BIKER][1], TeamSpawns[TEAM_BIKER][2], 90, 0, 0, 24, 50, 31, 150);
	AddPlayerClassEx(TEAM_BIKER, TeamSkins[29], TeamSpawns[TEAM_BIKER][0], TeamSpawns[TEAM_BIKER][1], TeamSpawns[TEAM_BIKER][2], 90, 0, 0, 24, 50, 31, 150);

	AddPlayerClassEx(TEAM_TRIAD, TeamSkins[30], TeamSpawns[TEAM_TRIAD][0], TeamSpawns[TEAM_TRIAD][1], TeamSpawns[TEAM_TRIAD][2], 176.9822, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_TRIAD, TeamSkins[31], TeamSpawns[TEAM_TRIAD][0], TeamSpawns[TEAM_TRIAD][1], TeamSpawns[TEAM_TRIAD][2], 176.9822, 0, 0, 24, 50, 29, 500);
	AddPlayerClassEx(TEAM_TRIAD, TeamSkins[32], TeamSpawns[TEAM_TRIAD][0], TeamSpawns[TEAM_TRIAD][1], TeamSpawns[TEAM_TRIAD][2], 176.9822, 0, 0, 24, 50, 29, 500);

	AddPlayerClassEx(TEAM_ADMIN, TeamSkins[33], TeamSpawns[TEAM_ADMIN][0], TeamSpawns[TEAM_ADMIN][1], TeamSpawns[TEAM_ADMIN][2], 272.0852, 24, 50, 25, 100, 29, 500);

	AddPlayerClassEx(TEAM_ARMY, TeamSkins[34], TeamSpawns[TEAM_ARMY][0], TeamSpawns[TEAM_ARMY][1], TeamSpawns[TEAM_ARMY][2], 90.0, 24, 50, 31, 150, 16, 7);

	AddPlayerClassEx(TEAM_BANDIT, TeamSkins[35], TeamSpawns[TEAM_BANDIT][0], TeamSpawns[TEAM_BANDIT][1], TeamSpawns[TEAM_BANDIT][2], 59.6, 4, 1, 24, 50, 31, 250);
	AddPlayerClassEx(TEAM_BANDIT, TeamSkins[36], TeamSpawns[TEAM_BANDIT][0], TeamSpawns[TEAM_BANDIT][1], TeamSpawns[TEAM_BANDIT][2], 59.6, 4, 1, 24, 50, 31, 250);

	BalloonLabel = Create3DTextLabel("Для запуска воздушного шара\nвведите /start", COLOR_ELEVATOR, 836.1572, -2000.5112, 14.7462, 15.0, 0, 0);
	Create3DTextLabel("Телепорт", COLOR_BORDO, 1969.2941, -2186.8699, 13.5469, 15.0, 0, 1);
	Create3DTextLabel("Телепорт", COLOR_BORDO, -1552.7843, -427.2818, 6.0163, 15.0, 0, 1);
	Create3DTextLabel("Телепорт", COLOR_BORDO, 1705.9359, 1599.4969, 10.115, 15.0, 0, 1);
	Create3DTextLabel("Выход", COLOR_BORDO, 1026.668, -1310.2712, -21.0671, 10.0, 0, 1);

	TPls = CreatePickup(1559, 2, 1969.2941, -2186.8699, 13.5469, -1);
	TPsf = CreatePickup(1559, 2, -1552.7843, -427.2818, 6.0163, -1);
	TPlv = CreatePickup(1559, 2, 1705.9359, 1599.4969, 10.115, -1);
	TPChina = CreatePickup(1559, 2, 1026.668, -1310.2712, -21.0671, -1);

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

	Dumper = AddStaticVehicle(406, 2723.81, -2392.658, 15.1371, 180.0, 1, 1);
	Hydra1 = AddStaticVehicle(520, 1193.8994, -2053.0, 69.9, 270.0, -1, -1);
	Hydra2 = AddStaticVehicle(520, 1193.7998, -2020.3994, 69.9, 270.0, -1, -1);
	Panzer = AddStaticVehicle(432, 1273.5, -2015.9, 59.1, 180.0, 95, 10);

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

	AddStaticVehicle(455, 2777.486, -2436.554, 14.07193, 90, -1, -1);
	AddStaticVehicle(433, 2742.381, -2431.647, 14.07699, -90, 55, 123);
	AddStaticVehicle(470, 2777.86, -2420.333, 13.51106, 90, -1, -1);
	AddStaticVehicle(470, 2777.084, -2415.052, 13.51399, 90, -1, -1);
	AddStaticVehicle(470, 2745.412, -2465.488, 13.52343, -90, -1, -1);
	AddStaticVehicle(573, 2745.412, -2471.488, 13.52343, -90, 55, 123);
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

	AddStaticVehicle(598, 2269.0366, 2460.2317, 8.2674, 181.9338, -1, -1);
	AddStaticVehicle(490, 2278.0327, 2459.1831, 8.9495, 1.6668, 0, 0);
	AddStaticVehicle(490, 2255.8301, 2443.1006, 8.2475, 179.7459, -1, -1);
	AddStaticVehicle(490, 2239.7317, 2456.6294, 1.4036, 88.4757, -1, -1);
	AddStaticVehicle(598, 2276.679, 2473.7705, 1.0201, 184.7489, -1, -1);
	AddStaticVehicle(598, 2315.3213, 2464.7903, 1.0219, 270.0937, -1, -1);
	AddStaticVehicle(523, 2297.498, 2464.5881, 1.0, 88.556, -1, -1);
	AddStaticVehicle(490, 2314.2158, 2484.8979, 3.3994, 92.8849, 0, 0);
	AddStaticVehicle(490, 2240.0923, 2436.7124, 3.4017, 91.8532, 0, 0);
	AddStaticVehicle(598, 2299.4771, 2451.7512, 3.0199, 270.3331, 0, 1);
	AddStaticVehicle(416, 1590.547, 1849.99, 10.969, 359.8599, 1, 3);
	AddStaticVehicle(544, 1769.6177, 2075.1941, 11.0567, 179.5683, 3, 1);
	AddStaticVehicle(544, 1750.6584, 2077.113, 11.0558, 180.044, 3, 1);
	AddStaticVehicle(544, 1763.4852, 2076.7075, 11.0525, 179.672, 3, 1);
	AddStaticVehicle(544, 1757.0782, 2075.0398, 11.0568, 177.5558, 3, 1);

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

	AddStaticVehicle(409, 1944.0602, 1346.0486, 8.9093, 180.2598, 0, 0);
	AddStaticVehicle(409, 1944.3724, 1335.7693, 8.9094, 178.7635, 1, 1);
	AddStaticVehicle(409, 2039.6443, 1008.3372, 10.4717, 178.7756, 0, 0);
	AddStaticVehicle(409, 2108.1514, 1440.6624, 10.6203, 268.1557, 0, 0);
	AddStaticVehicle(409, 2176.3467, 1676.1738, 10.6203, 179.9265, 1, 1);
	AddStaticVehicle(409, 2035.1099, 1917.6454, 11.9762, 180.5781, 1, 1);
	AddStaticVehicle(587, 2075.4963, 1490.6589, 10.3973, 0.9207, 10, 10);
	AddStaticVehicle(451, 2148.8706, 1398.3688, 10.5208, 359.6848, 78, 78);
	AddStaticVehicle(558, 2132.6252, 1409.2678, 10.4506, 180.3099, 36, 1);
	AddStaticVehicle(420, 2039.7207, 1335.4227, 10.4504, 178.9215, -1, -1);
	AddStaticVehicle(420, 2159.9783, 1687.9427, 10.5331, 15.707, -1, -1);
	AddStaticVehicle(420, 2217.604, 1838.1331, 10.598, 180.3272, -1, -1);
	AddStaticVehicle(420, 2040.199, 1344.9268, 10.4492, 178.6027, -1, -1);
	AddStaticVehicle(562, 2039.9257, 1019.8728, 10.3308, 179.779, 33, 33);
	AddStaticVehicle(562, 1881.7867, 964.0424, 10.4797, 89.3165, 33, 33);
	AddStaticVehicle(562, 1881.5303, 991.9349, 10.4789, 88.5594, 33, 33);
	AddStaticVehicle(562, 1881.8263, 1035.1031, 10.4788, 90.5642, 33, 33);
	AddStaticVehicle(562, 1882.0393, 1054.4159, 10.4798, 90.3892, 33, 33);
	AddStaticVehicle(543, 1665.9182, 900.6049, 10.6179, 154.1468, 66, 84);
	AddStaticVehicle(561, 1655.6388, 999.3278, 10.6343, 1.6394, 112, 112);
	AddStaticVehicle(516, 1677.3665, 988.1376, 10.6021, 359.7391, 16, 16);
	AddStaticVehicle(411, 1889.2765, 1934.0405, 13.5119, 180.0616, 4, 4);
	AddStaticVehicle(422, 2791.8364, 1997.4441, 10.8079, 358.2167, 8, 10);
	AddStaticVehicle(402, 2812.9854, 2026.3202, 10.587, 181.2861, 46, 46);
	AddStaticVehicle(401, 2822.0801, 2169.3892, 10.5975, 270.8597, 59, 59);
	AddStaticVehicle(402, 2582.8459, 2271.9075, 10.6526, 89.7938, 58, 58);
	AddStaticVehicle(561, 2764.5786, 1281.6991, 10.4819, 91.0993, 72, 72);
	AddStaticVehicle(405, 2782.1956, 1295.4828, 10.625, 179.4644, 65, 65);
	AddStaticVehicle(414, 2624.3726, 1104.119, 10.8045, 269.3916, 101, 101);
	AddStaticVehicle(463, 2437.9824, 2060.0774, 10.3605, 321.525, 66, 66);
	AddStaticVehicle(463, 2439.4592, 2059.3762, 10.3573, 317.0827, 125, 125);
	AddStaticVehicle(463, 2436.2813, 2060.595, 10.3597, 324.4647, 70, 70);
	AddStaticVehicle(533, 2444.2742, 1990.9354, 10.5294, 359.2699, 83, 83);
	AddStaticVehicle(480, 2458.2346, 1992.2141, 10.5043, 180.6471, 92, 92);
	AddStaticVehicle(482, 2170.9219, 1981.6818, 10.8809, 90.0917, 52, 52);
	AddStaticVehicle(402, 2231.9128, 1277.3851, 10.5745, 1.2022, 22, 22);
	AddStaticVehicle(451, 2182.8376, 1287.8752, 10.4708, 180.3702, 123, 1);
	AddStaticVehicle(415, 2171.9434, 1118.788, 12.3942, 333.4859, 36, 1);
	AddStaticVehicle(429, 2141.7615, 1022.6919, 10.5, 90.9348, 13, 13);
	AddStaticVehicle(436, 2150.9563, 987.4216, 10.5865, 180.8703, 87, 1);
	AddStaticVehicle(439, 2133.0083, 1006.8494, 10.716, 89.0048, 43, 21);
	AddStaticVehicle(561, 2163.032, 1006.4872, 10.6988, 270.5458, 101, 1);
	AddStaticVehicle(461, 2132.7266, 899.1528, 10.4046, 270.7793, 61, 1);
	AddStaticVehicle(462, 2132.7463, 906.0122, 10.4196, 268.0389, 2, 1);
	AddStaticVehicle(463, 2475.0217, 992.2781, 10.3602, 206.1178, 7, 7);
	AddStaticVehicle(474, 2197.8374, 936.0216, 10.5829, 185.2772, 105, 1);
	AddStaticVehicle(442, 2485.1379, 936.2085, 10.6624, 0.1062, 25, 109);
	AddStaticVehicle(587, 2460.3796, 918.7192, 10.5355, 90.4611, 53, 1);
	AddStaticVehicle(535, 2455.4519, 1275.5571, 10.5843, 270.0745, 28, 1);
	AddStaticVehicle(603, 2389.219, 1658.2742, 10.4453, 358.7758, 60, 1);
	AddStaticVehicle(560, 2039.5767, 1560.1608, 10.3773, 179.5952, 9, 39);
	AddStaticVehicle(545, 2075.7207, 1482.4139, 10.4829, 359.4229, 44, 96);
	AddStaticVehicle(579, 2168.6729, 1412.4142, 10.7456, 179.3802, 53, 53);
	AddStaticVehicle(581, 2353.115, 1405.48, 10.4148, 272.0892, 66, 1);
	AddStaticVehicle(477, 2352.6646, 1436.9703, 10.5496, 269.3466, 75, 1);
	AddStaticVehicle(603, 2300.3599, 1466.0364, 10.4462, 90.1237, 53, 53);
	AddStaticVehicle(558, 2300.8755, 1458.6439, 10.4778, 90.3777, 92, 1);
	AddStaticVehicle(480, 2292.5034, 1454.7678, 13.8155, 270.6444, 68, 1);
	AddStaticVehicle(558, 2285.866, 1518.0089, 16.9278, 0.2348, 77, 1);
	AddStaticVehicle(521, 2351.959, 1487.6743, 17.7851, 268.552, 92, 3);
	AddStaticVehicle(516, 2322.5889, 1423.0115, 22.1984, 89.6001, 122, 1);
	AddStaticVehicle(579, 2352.291, 1472.8545, 32.0779, 268.459, 28, 119);
	AddStaticVehicle(418, 2332.3298, 1387.9061, 36.5387, 179.0473, 64, 64);
	AddStaticVehicle(477, 2293.1245, 1455.2216, 39.5112, 270.0951, 22, 1);
	AddStaticVehicle(461, 2279.1494, 1387.7222, 42.4054, 181.3635, 61, 1);
	AddStaticVehicle(451, 2351.6416, 1415.7268, 42.5269, 269.3744, 123, 123);
	AddStaticVehicle(448, 2631.0559, 1845.8617, 10.4164, 264.5009, 3, 6);
	AddStaticVehicle(561, 2632.0137, 1858.2656, 10.6989, 270.9765, 113, 1);
	AddStaticVehicle(477, 2602.6128, 1846.6437, 10.5729, 90.5212, 121, 1);
	AddStaticVehicle(479, 2631.2253, 1794.812, 10.6166, 270.0366, 60, 35);
	AddStaticVehicle(581, 2600.0813, 1691.2465, 10.4108, 89.1784, 36, 1);
	AddStaticVehicle(496, 2631.7998, 1681.1658, 10.4784, 271.201, 31, 31);
	AddStaticVehicle(402, 2214.7441, 1512.2836, 10.6519, 269.6815, 39, 39);
	AddStaticVehicle(410, 2038.7775, 1588.8407, 10.3258, 179.604, 10, 1);
	AddStaticVehicle(418, 1742.2191, 1906.168, 10.9136, 90.2075, 117, 227);
	AddStaticVehicle(420, 1731.2715, 1974.9578, 10.5994, 273.0416, 6, 1);
	AddStaticVehicle(437, 1736.95, 1878.428, 10.9183, 269.9015, 47, 74);
	AddStaticVehicle(429, 1702.7047, 1804.3766, 10.5, 359.9712, 1, 2);
	AddStaticVehicle(421, 1602.3925, 1839.9454, 10.7028, 178.4762, 36, 1);
	AddStaticVehicle(402, 1471.5049, 1928.6152, 11.1104, 91.6437, 22, 22);
	AddStaticVehicle(482, 1450.1931, 2017.9884, 10.9038, 90.8726, 91, 1);
	AddStaticVehicle(426, 1453.9977, 1957.7761, 10.963, 179.0628, 62, 62);
	AddStaticVehicle(436, 1368.7289, 2020.8182, 11.2117, 88.9614, 92, 1);
	AddStaticVehicle(483, 1117.3785, 2112.5374, 10.8094, 0.4216, 1, 31);
	AddStaticVehicle(498, 1049.3367, 2135.9788, 10.8916, 87.9624, 20, 117);
	AddStaticVehicle(530, 980.7039, 2060.1577, 10.5856, 159.6553, 114, 1);
	AddStaticVehicle(542, 1023.1682, 2019.7904, 10.984, 272.45, 31, 93);
	AddStaticVehicle(554, 991.6675, 1886.8708, 11.329, 270.6092, 15, 32);
	AddStaticVehicle(558, 984.5507, 1719.9063, 8.2853, 270.4343, 24, 1);
	AddStaticVehicle(522, 949.3912, 1662.1198, 8.4159, 269.5886, 6, 25);
	AddStaticVehicle(541, 1113.0669, 1726.988, 10.4451, 179.9989, 22, 1);
	AddStaticVehicle(521, 1024.197, 1724.4652, 10.3911, 93.4605, 92, 3);
	AddStaticVehicle(506, 1041.7158, 1357.1357, 10.5246, 85.361, 7, 7);
	AddStaticVehicle(500, 1042.7311, 1346.4717, 10.923, 81.1408, 28, 119);
	AddStaticVehicle(496, 979.9923, 1080.0503, 10.5293, 91.2658, 53, 56);
	AddStaticVehicle(482, 979.7035, 1104.7273, 10.9448, 90.7615, 71, 71);
	AddStaticVehicle(414, 1425.6675, 1039.2936, 10.4327, 90.1854, 102, 65);
	AddStaticVehicle(414, 1451.7877, 976.0687, 10.4987, 0.3869, 67, 1);
	AddStaticVehicle(410, 2004.4067, 735.3056, 11.0296, 180.8574, 9, 1);
	AddStaticVehicle(418, 2168.8989, 695.7342, 11.4583, 182.7091, 117, 227);
	AddStaticVehicle(429, 2362.0627, 731.0701, 11.0945, 0.1727, 1, 3);
	AddStaticVehicle(439, 2362.4011, 648.3926, 11.2058, 358.5358, 43, 21);
	AddStaticVehicle(460, 2358.0769, 519.0576, 1.7602, 270.6638, 17, 23);
	AddStaticVehicle(493, 2292.9006, 518.9941, -0.2127, 269.6579, 36, 13);
	AddStaticVehicle(496, 2086.2354, 658.9543, 10.8917, 180.341, 66, 72);
	AddStaticVehicle(506, 1916.4235, 698.4152, 10.5369, 359.5925, 52, 52);
	AddStaticVehicle(516, 1852.8835, 698.9276, 11.0089, 92.2719, 119, 1);
	AddStaticVehicle(521, 1413.7998, 772.0428, 10.392, 92.6899, 87, 118);
	AddStaticVehicle(533, 1484.0516, 787.6008, 10.5294, 359.4022, 74, 1);
	AddStaticVehicle(545, 1535.0472, 787.3861, 10.6314, 0.839, 44, 96);
	AddStaticVehicle(578, 1645.1521, 740.4365, 11.4446, 357.8964, 1, 1);
	AddStaticVehicle(484, 1628.1273, 571.8071, 0.1587, 269.3263, 66, 36);
	AddStaticVehicle(477, 1544.6929, 2132.2334, 11.1514, 269.0969, 101, 1);
	AddStaticVehicle(480, 1613.6011, 2207.0527, 10.5919, 271.9736, 4, 4);
	AddStaticVehicle(479, 1519.2012, 2291.0112, 10.6331, 0.96, 49, 23);
	AddStaticVehicle(419, 1340.8719, 2246.3386, 10.6215, 92.0409, 21, 1);
	AddStaticVehicle(462, 1431.4543, 2237.344, 10.623, 267.7669, 3, 1);
	AddStaticVehicle(401, 1508.7909, 2091.1387, 10.6953, 271.2132, 39, 39);
	AddStaticVehicle(439, 1068.4608, 2185.2996, 16.6151, 91.1135, 25, 78);
	AddStaticVehicle(426, 1126.5607, 2323.6711, 16.4615, 90.085, 7, 7);
	AddStaticVehicle(421, 1135.4622, 2253.0496, 16.6012, 270.144, 30, 1);
	AddStaticVehicle(419, 1115.4999, 2310.4092, 10.6371, 267.7344, 33, 75);
	AddStaticVehicle(561, 990.2859, 2307.3047, 11.1294, 89.9585, 101, 101);
	AddStaticVehicle(400, 1108.1198, 1903.8445, 10.9125, 269.1945, 113, 1);
	AddStaticVehicle(403, 1059.6801, 1916.6881, 11.4272, 0.6038, 101, 1);
	AddStaticVehicle(402, 2039.0864, 1160.6543, 10.5033, 179.5146, 22, 22);
	AddStaticVehicle(411, 1844.4286, 1209.7379, 10.5596, 91.1955, 116, 1);
	AddStaticVehicle(522, 1843.6981, 1255.3601, 10.3902, 89.6382, 3, 8);
	AddStaticVehicle(439, 1866.8518, 1179.2153, 10.7348, 0.1707, 37, 78);
	AddStaticVehicle(587, 1552.6906, 1025.6267, 10.5356, 267.4064, 66, 1);
	AddStaticVehicle(543, 1332.6006, 1159.0437, 10.629, 270.0148, 8, 90);
	AddStaticVehicle(545, 1281.1134, 2545.5876, 10.6315, 90.4074, 30, 1);
	AddStaticVehicle(420, 1433.6541, 2608.7395, 10.6772, 89.2627, 6, 76);
	AddStaticVehicle(506, 1464.452, 2773.0771, 10.3764, 181.1781, 3, 3);
	AddStaticVehicle(546, 1475.371, 2839.5518, 10.6444, 181.0346, 11, 11);
	AddStaticVehicle(541, 1455.9503, 2878.8362, 10.4449, 0.1368, 51, 1);
	AddStaticVehicle(545, 1529.5756, 2867.6501, 10.6314, 268.0443, 39, 1);
	AddStaticVehicle(421, 1529.6301, 2835.7375, 10.6409, 269.9234, 62, 62);
	AddStaticVehicle(457, 1422.7972, 2830.8291, 10.4472, 91.4126, 13, 1);
	AddStaticVehicle(457, 1369.0237, 2784.1589, 10.447, 94.3731, 34, 1);
	AddStaticVehicle(457, 1423.0651, 2835.1399, 10.4471, 92.8884, 58, 1);
	AddStaticVehicle(572, 1420.3008, 2802.6375, 10.4002, 179.9108, 30, 1);
	AddStaticVehicle(561, 1618.5776, 2834.7361, 10.6343, 359.5821, 25, 78);
	AddStaticVehicle(581, 1737.6124, 2780.0356, 10.6454, 100.8438, 54, 1);
	AddStaticVehicle(579, 1673.0441, 2696.7334, 10.7646, 2.855, 37, 37);
	AddStaticVehicle(522, 1927.4393, 2729.9841, 10.3924, 182.5768, 6, 25);
	AddStaticVehicle(562, 1998.1213, 2758.4885, 10.4822, 0.3794, 116, 1);
	AddStaticVehicle(542, 2260.1184, 2737.8931, 10.5638, 271.1407, 24, 118);
	AddStaticVehicle(498, 2311.9609, 2763.3215, 10.888, 272.1044, 13, 120);
	AddStaticVehicle(421, 2143.1143, 2807.1777, 10.5765, 92.5022, 30, 72);
	AddStaticVehicle(480, 2167.2463, 2750.6987, 10.5948, 271.0785, 12, 12);
	AddStaticVehicle(419, 2349.0527, 2578.4849, 10.6135, 0.1656, 2, 39);
	AddStaticVehicle(448, 2363.0669, 2531.9736, 10.4173, 267.679, 3, 6);
	AddStaticVehicle(541, 2417.8662, 2529.0085, 10.445, 178.9855, 36, 8);
	AddStaticVehicle(415, 2455.1401, 2531.606, 21.6458, 179.4472, 0, 1);
	AddStaticVehicle(418, 2530.6252, 2535.9524, 21.9679, 268.5749, 81, 81);
	AddStaticVehicle(436, 2506.2002, 2515.6663, 21.6411, 88.9685, 11, 1);
	AddStaticVehicle(429, 2537.9023, 2397.2529, 3.8906, 0.5158, 10, 10);
	AddStaticVehicle(474, 2511.0984, 2394.394, 10.5828, 269.366, 97, 1);
	AddStaticVehicle(477, 2501.1006, 2131.041, 10.4987, 269.4453, 92, 1);
	AddStaticVehicle(518, 2589.0198, 2166.3142, 10.4839, 1.1502, 17, 1);
	AddStaticVehicle(533, 2620.0979, 2086.9114, 10.5281, 180.6504, 79, 1);
	AddStaticVehicle(535, 2567.6167, 2059.1948, 10.5846, 0.8758, 28, 1);
	AddStaticVehicle(541, 2075.6462, 1312.3136, 10.2966, 359.4287, 2, 1);
	AddStaticVehicle(546, 2183.697, 1878.7114, 10.5448, 359.9918, 78, 38);
	AddStaticVehicle(410, 2192.241, 1856.6902, 10.6209, 181.3348, 75, 1);
	AddStaticVehicle(480, 2203.4363, 1787.9412, 10.5034, 179.6947, 60, 1);
	AddStaticVehicle(541, 2181.531, 1821.7205, 10.4451, 0.6193, 51, 1);
	AddStaticVehicle(533, 2129.1848, 1810.272, 10.381, 332.941, 74, 1);
	AddStaticVehicle(477, 2118.6621, 1892.077, 10.3763, 181.2668, 6, 6);
	AddStaticVehicle(410, 2118.6233, 1910.1948, 10.7688, 180.4238, 40, 110);
	AddStaticVehicle(496, 2102.4214, 2066.0054, 10.5366, 270.8547, 66, 72);
	AddStaticVehicle(477, 2103.5483, 2089.0322, 10.5741, 269.2954, 101, 1);
	AddStaticVehicle(516, 2028.6848, 2155.9724, 10.6248, 264.3126, 2, 39);
	AddStaticVehicle(522, 1995.4116, 2185.7837, 10.3813, 183.3891, 36, 105);
	AddStaticVehicle(508, 2010.5963, 2137.1594, 11.1969, 270.061, 1, 1);
	AddStaticVehicle(414, 2005.9337, 2059.6008, 10.9941, 181.8287, 110, 93);
	AddStaticVehicle(414, 2060.3394, 2237.0127, 10.5447, 89.3482, 121, 93);
	AddStaticVehicle(448, 2077.0784, 2226.7166, 10.4142, 3.1701, 3, 6);
	AddStaticVehicle(420, 2107.7361, 2206.7979, 10.8238, 178.2615, 6, 76);
	AddStaticVehicle(516, 2094.553, 2206.6326, 10.5904, 178.8517, 119, 45);
	AddStaticVehicle(477, 2156.2788, 2188.8767, 10.3516, 358.4281, 14, 14);
	AddStaticVehicle(415, 2339.1323, 2114.0562, 10.4512, 177.1576, 20, 1);
	AddStaticVehicle(409, 2361.332, 2170.0618, 10.5251, 359.3094, 1, 1);
	AddStaticVehicle(461, 2380.3523, 2018.2645, 10.3403, 272.1906, 13, 1);
	AddStaticVehicle(587, 2338.759, 1943.9525, 10.4102, 182.174, 40, 1);
	AddStaticVehicle(482, 2221.3479, 1944.5293, 9.7951, 87.2554, 37, 37);
	AddStaticVehicle(479, 2272.5029, 1953.1041, 9.4899, 179.0292, 7, 7);
	AddStaticVehicle(541, 2244.7246, 1997.9194, 15.4282, 0.8475, 12, 32);
	AddStaticVehicle(541, 2222.4797, 1936.1879, 25.9241, 88.721, 68, 8);
	AddStaticVehicle(415, 2294.6262, 1952.2435, 26.0251, 268.4258, 7, 7);
	AddStaticVehicle(436, 2246.8062, 1939.5153, 31.5463, 179.6696, 33, 0);
	AddStaticVehicle(461, 2283.647, 1975.238, 28.4011, 180.9682, 62, 62);
	AddStaticVehicle(482, 2217.032, 2048.4802, 10.9456, 89.9095, 85, 85);
	AddStaticVehicle(479, 2296.6074, 2046.1454, 10.6169, 271.5167, 49, 23);
	AddStaticVehicle(461, 2259.0544, 2065.4905, 10.3873, 2.143, 61, 1);
	AddStaticVehicle(477, 2272.6033, 2326.2434, 10.5272, 88.5973, 61, 61);
	AddStaticVehicle(401, 2464.2083, 2236.9705, 10.5507, 88.6525, 39, 39);
	AddStaticVehicle(428, 2242.5024, 2231.3748, 10.901, 270.886, 4, 75);
	AddStaticVehicle(516, 2007.5071, 2263.2092, 17.6074, 2.4052, 13, 76);
	AddStaticVehicle(522, 2014.7938, 2244.958, 23.4848, 269.4012, 8, 82);
	AddStaticVehicle(436, 1907.2633, 2290.8406, 11.0, 180.4904, 84, 1);
	AddStaticVehicle(480, 1705.0334, 2242.9836, 10.5941, 179.6409, 12, 12);
	AddStaticVehicle(436, 1691.1774, 2131.1426, 11.08, 91.2325, 87, 1);
	AddStaticVehicle(414, 1842.6188, 2090.4556, 10.8907, 176.3065, 36, 36);
	AddStaticVehicle(436, 1908.1819, 2078.657, 10.5695, 270.3529, 53, 1);
	AddStaticVehicle(516, 1912.8295, 2158.5737, 10.6165, 271.8315, 47, 47);
	AddStaticVehicle(525, 1963.46, 2171.0208, 10.6913, 257.1353, 1, 1);
	AddStaticVehicle(496, 1993.2476, 2058.3521, 10.5367, 357.2019, 53, 56);
	AddStaticVehicle(535, 2075.9631, 1677.725, 10.4351, 0.1849, 118, 1);
	AddStaticVehicle(418, 2452.3093, 1357.8304, 10.9134, 359.7694, 61, 61);
	AddStaticVehicle(415, 2447.573, 1327.1135, 10.5908, 179.6456, 0, 1);
	AddStaticVehicle(414, 2612.0542, 1429.5336, 10.914, 183.779, 24, 1);
	AddStaticVehicle(420, 2488.5161, 1534.1761, 10.524, 231.4538, 6, 1);
	AddStaticVehicle(409, 2481.3877, 1544.0386, 10.5123, 202.9677, 1, 1);
	AddStaticVehicle(579, 2498.4194, 1676.3019, 10.5524, 1.3521, 101, 101);
	AddStaticVehicle(474, 2463.022, 1676.7267, 10.5831, 359.3129, 97, 1);
	AddStaticVehicle(518, 2788.6519, 2431.322, 10.4912, 314.8943, 2, 39);
	AddStaticVehicle(516, 2815.1465, 2406.8418, 10.6541, 315.8335, 119, 1);
	AddStaticVehicle(506, 2833.4592, 2309.875, 10.5247, 179.7437, 76, 76);
	AddStaticVehicle(516, 2891.356, 2379.1252, 10.623, 270.9466, 41, 29);
	AddStaticVehicle(417, 2093.3755, 2415.1582, 74.7678, 94.318, 2, 29);
	AddStaticVehicle(402, 2095.8645, 2410.8191, 45.0503, 267.7614, 110, 110);
	AddStaticVehicle(516, 2104.449, 2396.0525, 40.6341, 271.388, 119, 62);
	AddStaticVehicle(402, 2095.8438, 2398.7417, 27.8898, 268.8989, 99, 81);
	AddStaticVehicle(477, 2086.5784, 2416.6394, 23.4231, 90.8221, 3, 3);
	AddStaticVehicle(516, 2103.9829, 2419.3713, 14.8978, 270.8129, 24, 55);
	AddStaticVehicle(561, 2065.8535, 2479.7612, 10.6989, 359.7305, 4, 1);
	AddStaticVehicle(414, 2130.8403, 2514.2134, 10.914, 193.6682, 24, 1);
	AddStaticVehicle(410, 1900.4618, 2437.4229, 10.474, 92.5165, 45, 1);
	AddStaticVehicle(408, 1730.601, 2336.2703, 11.3685, 2.6346, 26, 26);
	AddStaticVehicle(486, 2707.1851, 822.1658, 10.7179, 2.5507, 1, 1);
	AddStaticVehicle(486, 2707.001, 908.6336, 10.898, 176.3525, 1, 1);
	AddStaticVehicle(482, 2697.6646, 885.6911, 10.3113, 271.488, 71, 71);
	AddStaticVehicle(554, 2701.6409, 828.374, 10.1758, 359.8369, 15, 32);
	AddStaticVehicle(524, 2635.2407, 848.0072, 6.7986, 311.172, 61, 27);
	AddStaticVehicle(524, 2630.124, 851.0532, 6.9725, 315.8478, 65, 31);
	AddStaticVehicle(530, 2687.1553, 909.9475, 10.4912, 199.4376, 111, 1);
	AddStaticVehicle(530, 2683.3469, 908.7888, 10.4567, 197.7386, 112, 1);
	AddStaticVehicle(455, 2685.8137, 864.3542, 10.3588, 358.5818, 84, 58);
	AddStaticVehicle(560, 2705.9065, 788.8524, 10.6037, 359.2399, 33, 0);
	AddStaticVehicle(403, 2873.092, 920.3176, 11.3572, 94.3495, 28, 1);
	AddStaticVehicle(403, 2873.2283, 913.3622, 11.7676, 85.7952, 24, 77);
	AddStaticVehicle(435, 2855.4207, 896.0324, 11.1716, 359.7548, 24, 77);
	AddStaticVehicle(435, 2818.0835, 897.6704, 11.3012, 359.2285, 24, 77);
	AddStaticVehicle(435, 2827.5466, 897.556, 11.2943, 0.9414, 24, 77);
	AddStaticVehicle(530, 2884.7034, 941.7674, 10.5161, 90.4367, 112, 1);
	AddStaticVehicle(530, 2833.1492, 996.5211, 10.5144, 173.6816, 13, 1);
	AddStaticVehicle(482, 2805.1533, 968.8243, 10.8708, 178.9079, 48, 48);
	AddStaticVehicle(560, 2817.4512, 941.4572, 10.4556, 0.9883, 9, 39);
	AddStaticVehicle(578, 2840.3525, 994.4778, 11.3743, 176.8262, 1, 1);

	AddStaticVehicle(470, -1493.2729, 466.8754, 7.1792, 359.6406, 43, 0);
	AddStaticVehicle(470, -1456.7275, 456.4803, 7.1827, 1.8612, 43, 0);
	AddStaticVehicle(470, -1433.3401, 455.8417, 7.1754, 359.285, 43, 0);
	AddStaticVehicle(433, -1424.8402, 457.6088, 7.6209, 359.6164, 43, 0);
	AddStaticVehicle(433, -1402.0039, 460.9283, 7.6209, 0.1365, 43, 0);
	AddStaticVehicle(470, -1387.754, 457.1161, 7.1786, 356.7607, 43, 0);
	AddStaticVehicle(548, -1269.9818, 501.54, 18.8272, 88.8878, 43, 0);
	AddStaticVehicle(548, -1415.524, 517.8834, 19.8976, 270.0524, 1, 1);
	AddStaticVehicle(497, -1679.7035, 706.0008, 30.7781, 89.8724, 0, 1);
	AddStaticVehicle(523, -1576.036, 673.7034, 6.7563, 174.5967, 0, 0);
	AddStaticVehicle(523, -1575.9231, 650.4584, 6.7582, 0.9076, 0, 0);
	AddStaticVehicle(597, -1593.6233, 651.7213, 6.9566, 1.3899, 0, 1);
	AddStaticVehicle(597, -1622.5198, 651.7484, 6.9555, 359.8126, 0, 1);
	AddStaticVehicle(427, -1634.3652, 653.23, 7.3195, 359.8379, 0, 1);
	AddStaticVehicle(597, -1573.972, 726.4003, -5.4722, 91.1968, 0, 1);
	AddStaticVehicle(523, -1612.2233, 674.1516, 6.7545, 184.0847, 0, 0);
	AddStaticVehicle(427, -1600.1411, 678.0489, -5.1103, 1.1345, 0, 1);
	AddStaticVehicle(597, -1596.5836, 749.3448, -5.4725, 178.5932, 0, 1);
	AddStaticVehicle(416, -2643.2285, 630.0392, 14.6034, 87.3837, 1, 3);
	AddStaticVehicle(416, -2683.8833, 628.2059, 14.6035, 272.5255, 1, 3);
	AddStaticVehicle(416, -2668.5364, 610.7019, 14.6043, 179.8035, 1, 3);
	AddStaticVehicle(416, -2639.3809, 609.7971, 14.602, 180.4547, 1, 3);
	AddStaticVehicle(544, -2053.1836, 75.5582, 28.6258, 91.8533, 3, 1);
	AddStaticVehicle(544, -2020.6779, 75.7322, 28.2849, 270.8804, 3, 1);
	AddStaticVehicle(544, -2020.4115, 92.3531, 28.1826, 271.5041, 3, 1);
	AddStaticVehicle(472, -1165.9481, 376.5309, 0.1491, 315.1259, 56, 53);
	AddStaticVehicle(472, -1421.6274, 285.5732, -0.2879, 265.8, 46, 26);
	AddStaticVehicle(472, -1653.0968, 254.7862, 0.2592, 268.0484, 112, 20);
	AddStaticVehicle(597, -1606.3083, 673.1804, 6.9553, 179.1846, 0, 1);
	AddStaticVehicle(427, -1582.2726, 672.2101, 7.3207, 180.9814, 0, 1);
	AddStaticVehicle(470, -1383.2446, 457.2296, 7.1794, 359.1241, 43, 0);
	AddStaticVehicle(597, -1610.8358, 651.5052, 6.9564, 359.9975, 0, 1);
	AddStaticVehicle(597, -1622.9977, 653.4961, -5.4742, 89.9343, 0, 1);
	AddStaticVehicle(597, -1639.4895, 677.989, -5.4743, 269.9376, 0, 1);
	AddStaticVehicle(548, -1415.3323, 492.7466, 19.8676, 271.5521, 1, 1);
	AddStaticVehicle(548, -1304.2273, 507.9386, 19.8769, 269.1332, 1, 1);
	AddStaticVehicle(433, -1362.9229, 458.9281, 7.6241, 357.4277, 43, 0);
	AddStaticVehicle(433, -1529.5907, 457.3813, 7.6238, 358.3718, 43, 0);

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

	AddStaticVehicle(415, -2089.7454, -85.3183, 34.9356, 0.09, 36, 1);
	AddStaticVehicle(415, -2076.7393, -84.4259, 34.8911, 357.8584, 116, 1);
	AddStaticVehicle(504, -2091.635, -106.7603, 35.1125, 179.5832, 45, 29);
	AddStaticVehicle(560, -2396.2222, -594.7454, 132.3533, 123.1677, 33, 0);
	AddStaticVehicle(411, -2414.5781, -586.8558, 132.3755, 215.3865, 112, 1);
	AddStaticVehicle(482, -2527.9175, -602.6952, 132.6175, 179.0378, 41, 20);
	AddStaticVehicle(451, -2517.0481, -601.8521, 132.269, 179.6375, 36, 36);
	AddStaticVehicle(522, -2494.29, -601.8505, 132.1326, 178.4421, 3, 8);
	AddStaticVehicle(522, -2622.9067, -509.657, 70.9034, 284.9871, 3, 8);
	AddStaticVehicle(405, -2747.2739, -306.4048, 6.9132, 50.7011, 24, 1);
	AddStaticVehicle(505, -2774.2708, -281.9049, 6.7476, 178.6849, 37, 0);
	AddStaticVehicle(409, -2738.0176, -322.898, 6.8391, 313.5169, 1, 1);
	AddStaticVehicle(457, -2657.9009, -290.844, 7.1044, 313.4402, 25, 25);
	AddStaticVehicle(457, -2652.5388, -295.5096, 7.1101, 312.409, 86, 86);
	AddStaticVehicle(457, -2644.5061, -290.4049, 7.1283, 139.4791, 8, 8);
	AddStaticVehicle(457, -2650.2507, -284.7023, 7.1297, 137.3287, 2, 1);
	AddStaticVehicle(475, -2718.7566, -181.6171, 3.9922, 269.6131, 68, 8);
	AddStaticVehicle(411, -2692.334, -83.6105, 4.7104, 90.7628, 1, 1);
	AddStaticVehicle(560, -2682.6699, -22.7128, 4.3281, 178.6174, 1, 31);
	AddStaticVehicle(560, -2627.3579, -34.825, 4.0417, 181.9431, 41, 29);
	AddStaticVehicle(482, -2729.5671, 76.7876, 4.4511, 87.5421, 32, 32);
	AddStaticVehicle(579, -2484.3, 5.7674, 25.5544, 91.3108, 42, 42);
	AddStaticVehicle(567, -2528.8882, -5.5797, 25.4875, 271.5341, 90, 96);
	AddStaticVehicle(429, -2592.7732, -110.842, 3.9306, 89.9971, 2, 1);
	AddStaticVehicle(415, -2615.9045, -178.3203, 4.1076, 269.3111, 40, 1);
	AddStaticVehicle(480, -2352.2312, -124.4615, 34.9708, 179.3509, 17, 1);
	AddStaticVehicle(448, -2319.5144, -150.8684, 35.1509, 176.9124, 3, 6);
	AddStaticVehicle(535, -2099.2341, -36.4293, 35.1021, 357.371, 77, 26);
	AddStaticVehicle(535, -2021.41, -47.6897, 35.1866, 184.1009, 69, 1);
	AddStaticVehicle(535, -2085.3667, 61.6716, 34.2269, 88.7158, 28, 1);
	AddStaticVehicle(567, -2357.8167, -43.2394, 35.1865, 90.6814, 97, 96);
	AddStaticVehicle(403, -1855.5707, -176.4486, 9.925, 270.1853, 25, 1);
	AddStaticVehicle(492, -1821.1146, -161.7525, 9.1874, 164.9686, 28, 56);
	AddStaticVehicle(530, -1694.7194, 8.6605, 3.3137, 348.2751, 111, 1);
	AddStaticVehicle(530, -1712.0934, 10.8106, 3.3879, 303.1499, 112, 1);
	AddStaticVehicle(530, -1716.6062, 19.1024, 3.3437, 273.4997, 119, 1);
	AddStaticVehicle(530, -1700.6174, 6.2953, 3.3148, 352.1077, 114, 1);
	AddStaticVehicle(522, -1697.899, 63.3702, 3.1263, 301.0493, 39, 106);
	AddStaticVehicle(522, -1682.4491, 41.4261, 3.1198, 338.2361, 51, 118);
	AddStaticVehicle(522, -1694.0885, 48.6863, 3.1207, 317.3058, 3, 3);
	AddStaticVehicle(493, -1760.9098, -193.8202, -0.1219, 266.358, 36, 13);
	AddStaticVehicle(426, -1669.5262, -33.8696, 3.3108, 314.152, 42, 42);
	AddStaticVehicle(403, -1837.5128, -15.2423, 15.6987, 271.1784, 54, 1);
	AddStaticVehicle(426, -1839.701, -21.5651, 14.8602, 265.8797, 42, 42);
	AddStaticVehicle(421, -1885.3856, -161.3161, 11.6546, 355.7335, 71, 72);
	AddStaticVehicle(482, -1861.0438, -140.4725, 12.0201, 87.6606, 66, 66);
	AddStaticVehicle(567, -2124.6743, -242.8083, 35.1864, 18.3731, 99, 81);
	AddStaticVehicle(545, -2485.9868, 97.9314, 34.968, 268.0125, 81, 81);
	AddStaticVehicle(533, -2484.7358, 65.7313, 25.3992, 358.7399, 79, 1);
	AddStaticVehicle(462, -2694.2021, 68.7381, 3.9321, 85.6921, 2, 1);
	AddStaticVehicle(424, -2941.3359, -794.7429, 6.857, 340.8897, 2, 2);
	AddStaticVehicle(424, -2938.8164, -818.2305, 7.0451, 13.5219, 2, 2);
	AddStaticVehicle(473, -2987.2434, -861.803, -0.8947, 144.9324, 56, 15);
	AddStaticVehicle(473, -2967.3806, -684.3901, 0.0677, 351.0859, 56, 15);
	AddStaticVehicle(473, -2954.7388, -498.1349, 0.0155, 5.6709, 56, 15);
	AddStaticVehicle(493, -2947.7612, -364.1319, -0.5123, 78.4238, 36, 13);
	AddStaticVehicle(461, -2068.542, -503.7956, 35.0035, 182.6852, 46, 46);
	AddStaticVehicle(483, -1906.4901, -611.7231, 24.5863, 319.5491, 17, 0);
	AddStaticVehicle(411, -2148.7424, -922.7524, 31.7505, 267.8838, 106, 1);
	AddStaticVehicle(411, -2125.3806, -885.7675, 31.7505, 270.2341, 104, 1);
	AddStaticVehicle(482, -1871.7642, -874.4785, 32.1329, 90.1095, 118, 118);
	AddStaticVehicle(411, -1872.5656, -957.2282, 31.7505, 88.9793, 80, 1);
	AddStaticVehicle(400, -1821.8348, -886.4156, 42.0592, 175.1724, 123, 1);
	AddStaticVehicle(512, -1431.6896, -954.0375, 201.2352, 273.5343, 15, 123);
	AddStaticVehicle(512, -1432.9872, -942.3373, 201.3756, 274.4437, 32, 112);
	AddStaticVehicle(461, -2205.1782, -310.5668, 35.2394, 330.2716, 46, 46);
	AddStaticVehicle(482, -2216.4529, -85.7872, 35.4346, 1.2615, 64, 64);
	AddStaticVehicle(498, -2115.4626, -3.3854, 35.3872, 269.2903, 13, 120);
	AddStaticVehicle(437, -2092.6289, -381.4249, 35.4662, 89.8969, 79, 7);
	AddStaticVehicle(437, -2201.6951, -406.7657, 35.4694, 228.5155, 79, 7);
	AddStaticVehicle(437, -2047.2311, -528.4994, 35.4647, 286.804, 79, 7);
	AddStaticVehicle(455, -1578.2035, 97.3175, 4.161, 135.9403, 37, 1);
	AddStaticVehicle(443, -1747.0641, -164.1042, 4.186, 39.5812, 20, 1);
	AddStaticVehicle(545, -2267.1362, 85.5752, 34.9679, 269.161, 67, 67);
	AddStaticVehicle(496, -2264.8977, 200.398, 34.8805, 89.9701, 66, 72);
	AddStaticVehicle(536, -2216.8618, 113.6911, 35.0595, 88.9417, 12, 1);
	AddStaticVehicle(409, -2414.7739, 331.6805, 34.7672, 331.1144, 1, 1);
	AddStaticVehicle(405, -2452.8604, 138.2975, 34.8354, 46.642, 24, 1);
	AddStaticVehicle(461, -2523.0012, 338.5651, 34.6932, 250.6181, 61, 1);
	AddStaticVehicle(439, -2502.73, 382.2403, 35.0181, 235.8174, 54, 38);
	AddStaticVehicle(400, -2470.8625, 407.1818, 27.8697, 139.4656, 123, 1);
	AddStaticVehicle(496, -2522.4219, 310.7949, 27.4816, 70.6665, 20, 20);
	AddStaticVehicle(428, -2440.998, 509.6792, 30.0563, 206.6596, 4, 75);
	AddStaticVehicle(428, -2437.76, 510.8553, 30.0507, 202.1894, 4, 75);
	AddStaticVehicle(560, -2425.644, 518.48, 29.6348, 216.9742, 9, 39);
	AddStaticVehicle(463, -2473.4978, 743.3479, 34.5559, 179.9892, 84, 84);
	AddStaticVehicle(561, -2412.373, 741.7964, 34.8297, 179.4121, 8, 17);
	AddStaticVehicle(463, -2451.2593, 740.6838, 34.7129, 180.6275, 79, 39);
	AddStaticVehicle(467, -2248.2617, 692.7663, 49.1081, 179.2399, 58, 8);
	AddStaticVehicle(405, -2151.4058, 637.089, 52.1898, 182.3598, 75, 1);
	AddStaticVehicle(405, -2134.6875, 686.8921, 63.7561, 178.3476, 123, 1);
	AddStaticVehicle(409, -1951.6525, 724.5811, 45.1672, 270.0913, 1, 1);
	AddStaticVehicle(429, -1941.2656, 585.4785, 34.7953, 359.2309, 3, 1);
	AddStaticVehicle(439, -1922.0646, 303.6587, 40.9425, 177.2474, 25, 78);
	AddStaticVehicle(461, -1974.683, 170.9425, 27.3574, 271.5703, 46, 46);
	AddStaticVehicle(420, -1987.983, 104.7278, 27.3169, 0.4059, 6, 1);
	AddStaticVehicle(420, -1988.1044, 147.8747, 27.3177, 0.2008, 6, 1);
	AddStaticVehicle(467, -2922.5259, 428.752, 4.6539, 276.2402, 2, 1);
	AddStaticVehicle(493, -2981.0247, 496.3422, -0.6554, 1.5943, 36, 13);
	AddStaticVehicle(549, -2578.6179, 626.5599, 27.4438, 359.1449, 117, 1);
	AddStaticVehicle(575, -2610.8423, 1405.6122, 6.7507, 270.0862, 19, 96);
	AddStaticVehicle(411, -1663.4688, 1211.4713, 6.9794, 276.9535, 12, 1);
	AddStaticVehicle(558, -1656.2698, 1208.2489, 20.7792, 268.6007, 42, 42);
	AddStaticVehicle(558, -1660.5311, 1215.1492, 20.7869, 315.8402, 24, 1);
	AddStaticVehicle(451, -1650.9478, 1208.6367, 13.3797, 247.0129, 18, 18);
	AddStaticVehicle(451, -1656.4871, 1215.6764, 13.4254, 259.0972, 101, 1);
	AddStaticVehicle(560, -2047.9236, 901.2451, 53.3068, 356.4079, 21, 1);
	AddStaticVehicle(560, -2105.8264, 901.478, 76.3014, 4.8684, 36, 1);
	AddStaticVehicle(500, -2927.3159, 500.506, 5.0168, 268.8409, 28, 119);
	AddStaticVehicle(409, -2752.1567, 374.9532, 3.9412, 179.1495, 1, 1);
	AddStaticVehicle(405, -2657.6785, 374.4564, 4.1077, 1.3494, 75, 1);
	AddStaticVehicle(426, -2664.9829, 267.9181, 4.0801, 0.0174, 7, 7);
	AddStaticVehicle(439, -2681.6306, 267.9998, 4.2312, 358.7699, 65, 79);
	AddStaticVehicle(462, -2636.0247, 247.4894, 3.9279, 163.5248, 2, 1);
	AddStaticVehicle(559, -2691.8088, 204.5243, 3.9923, 359.4068, 68, 8);
	AddStaticVehicle(496, -2793.0317, 229.3433, 6.8049, 89.8252, 53, 56);
	AddStaticVehicle(560, -2710.5635, 128.6468, 3.96, 177.1886, 37, 0);
	AddStaticVehicle(533, -2613.7, 205.8831, 4.6949, 1.1401, 74, 1);
	AddStaticVehicle(526, -2616.9363, 71.5616, 4.1026, 268.8823, 17, 1);
	AddStaticVehicle(436, -2546.9377, -142.7184, 13.8009, 0.8366, 109, 1);
	AddStaticVehicle(517, -2459.4773, -150.5229, 25.7609, 1.8047, 36, 36);
	AddStaticVehicle(496, -2592.981, -191.1821, 3.975, 91.0989, 31, 31);
	AddStaticVehicle(475, -2694.0012, -147.6346, 4.0512, 90.921, 76, 1);
	AddStaticVehicle(421, -2796.6199, -184.0407, 6.8207, 91.6072, 42, 42);
	AddStaticVehicle(566, -2796.3052, -39.5262, 7.0876, 89.8012, 8, 17);
	AddStaticVehicle(467, -2878.896, 734.5536, 29.3162, 280.599, 60, 1);
	AddStaticVehicle(482, -2462.1184, 793.0873, 35.227, 93.7908, 28, 28);
	AddStaticVehicle(439, -2380.2781, 1269.3492, 25.1014, 277.3688, 37, 78);
	AddStaticVehicle(522, -1821.9445, 1310.537, 59.307, 186.3879, 3, 8);
	AddStaticVehicle(475, -1829.748, 1289.9834, 59.8258, 21.8999, 61, 61);
	AddStaticVehicle(475, -1842.0276, 1304.4764, 59.5341, 198.8919, 37, 0);
	AddStaticVehicle(405, -1755.8068, 953.2106, 24.6171, 84.9867, 75, 1);
	AddStaticVehicle(480, -1686.7346, 1007.9662, 17.3024, 92.573, 66, 72);
	AddStaticVehicle(405, -1587.015, 859.0454, 7.4098, 90.4344, 75, 1);
	AddStaticVehicle(439, -1629.2559, 870.3282, 8.1322, 177.2777, 43, 21);
	AddStaticVehicle(533, -1707.0554, 795.3817, 24.5184, 2.4475, 77, 1);
	AddStaticVehicle(453, -1463.8043, 1023.7324, -0.2395, 269.142, 56, 56);
	AddStaticVehicle(473, -1509.0499, 1385.6211, -0.2875, 114.2092, 56, 15);
	AddStaticVehicle(417, -1468.1395, 1490.922, 8.3433, 92.3864, 0, 0);
	AddStaticVehicle(417, -2311.2693, 1544.9398, 18.8852, 183.6456, 0, 0);
	AddStaticVehicle(469, -2514.7388, 1545.1013, 17.3351, 349.7112, 1, 3);
	AddStaticVehicle(473, -2432.8538, 1568.3925, -0.0528, 353.0695, 56, 53);
	AddStaticVehicle(473, -2434.4873, 1571.9756, -0.1826, 348.1105, 56, 15);
	AddStaticVehicle(521, -2501.2534, 1222.1891, 36.9992, 139.5936, 87, 118);
	AddStaticVehicle(496, -2867.3279, 695.7776, 23.2883, 296.3333, 22, 22);
	AddStaticVehicle(496, -2857.4624, 830.0972, 39.8342, 238.8571, 42, 42);
	AddStaticVehicle(401, -2836.6306, 870.4559, 43.7638, 267.2119, 83, 1);
	AddStaticVehicle(401, -2839.8884, 925.7379, 43.8342, 274.0428, 47, 47);
	AddStaticVehicle(410, -2855.1917, 962.1486, 43.6477, 294.1936, 9, 1);
	AddStaticVehicle(516, -2900.1345, 1104.5038, 26.8936, 272.1553, 9, 1);
	AddStaticVehicle(418, -2898.4971, 1161.4402, 13.5039, 272.4668, 95, 95);
	AddStaticVehicle(415, -2722.1973, 980.1292, 54.2327, 9.4435, 25, 1);
	AddStaticVehicle(411, -2728.2146, 910.1182, 67.3208, 153.1185, 112, 1);
	AddStaticVehicle(421, -2634.7214, 929.3314, 71.3155, 214.6021, 30, 1);
	AddStaticVehicle(405, -2680.4905, 869.2202, 76.4498, 23.785, 91, 1);
	AddStaticVehicle(558, -2650.5452, 856.239, 63.6388, 312.0352, 117, 1);
	AddStaticVehicle(418, -2205.7361, 293.8083, 35.2104, 359.0113, 119, 119);
	AddStaticVehicle(400, -2231.1545, 293.4678, 35.2612, 1.3597, 14, 123);
	AddStaticVehicle(426, -2792.9805, 785.0926, 49.5488, 17.1913, 7, 7);
	AddStaticVehicle(533, -1997.057, 708.1403, 45.0732, 359.8203, 52, 39);
	AddStaticVehicle(536, -2098.6619, 653.4818, 52.1045, 178.5289, 57, 96);
	AddStaticVehicle(475, -1772.8362, 1205.1267, 24.9264, 128.7472, 21, 1);
	AddStaticVehicle(482, -1698.9235, 1029.1211, 45.264, 163.2027, 28, 28);
	AddStaticVehicle(421, -1915.2972, 792.2175, 39.533, 271.257, 42, 42);
	AddStaticVehicle(482, -1830.3928, 636.3265, 30.5508, 181.9362, 62, 62);
	AddStaticVehicle(551, -1767.2255, 857.6757, 24.6063, 90.7746, 72, 1);
	AddStaticVehicle(533, -1996.7197, 780.7192, 45.0773, 0.8333, 74, 1);
	AddStaticVehicle(480, -2156.5957, 781.6992, 69.2316, 271.9981, 58, 1);
	AddStaticVehicle(561, -2206.7849, 718.1914, 49.4181, 359.8657, 101, 1);
	AddStaticVehicle(482, -2287.0796, 581.4111, 34.9593, 270.0385, 59, 36);
	AddStaticVehicle(482, -2586.3882, 311.3461, 4.9411, 90.7013, 88, 1);
	AddStaticVehicle(439, -2586.3213, 325.2354, 4.7471, 270.4281, 65, 79);
	AddStaticVehicle(521, -2590.9128, 484.1599, 14.1862, 58.1234, 75, 13);
	AddStaticVehicle(463, -2454.1155, 638.9645, 32.6119, 266.5039, 74, 1);
	AddStaticVehicle(475, -2588.4861, 632.4481, 14.2561, 269.326, 9, 39);
	AddStaticVehicle(479, -2546.5293, 647.5505, 14.1927, 90.1881, 109, 100);
	AddStaticVehicle(405, -2566.9233, 556.15, 14.3396, 294.3413, 36, 1);
	AddStaticVehicle(461, -2621.0337, 137.8928, 4.0045, 266.5985, 46, 46);
	AddStaticVehicle(408, -2655.6912, -194.1583, 4.7043, 359.8855, 26, 26);
	AddStaticVehicle(479, -2274.9456, -119.1158, 35.1114, 266.5583, 54, 31);
	AddStaticVehicle(496, -2263.0579, 18.8142, 34.8656, 354.003, 42, 42);
	AddStaticVehicle(475, -2167.6179, 86.2425, 35.0484, 172.0044, 21, 1);
	AddStaticVehicle(579, -2265.7461, 452.6116, 34.9076, 250.2149, 95, 105);
	AddStaticVehicle(405, -2379.3401, 625.8353, 33.0, 1.2157, 36, 1);
	AddStaticVehicle(579, -2213.2063, 416.5867, 35.0997, 357.7801, 7, 7);
	AddStaticVehicle(582, -2123.9011, 428.0708, 34.6792, 356.2318, 14, 1);
	AddStaticVehicle(482, -2123.8403, 380.5338, 35.2907, 87.8615, 64, 64);
	AddStaticVehicle(582, -2044.8904, 460.4015, 35.2268, 304.5739, 56, 123);
	AddStaticVehicle(405, -2308.29, 673.636, 44.3038, 90.5505, 65, 79);
	AddStaticVehicle(480, -2175.9424, 654.7142, 49.2104, 181.1464, 12, 12);
	AddStaticVehicle(405, -2650.2134, 703.3293, 27.7206, 270.0416, 11, 1);
	AddStaticVehicle(496, -2694.9968, 719.9131, 34.236, 176.1588, 42, 42);
	AddStaticVehicle(482, -1612.3462, 1284.5171, 7.301, 90.9943, 85, 85);
	AddStaticVehicle(445, -1630.5129, 1289.7798, 6.914, 135.4144, 37, 37);
	AddStaticVehicle(482, -1834.8303, 1425.0577, 7.2412, 179.1661, 57, 57);
	AddStaticVehicle(411, -1975.7601, 1224.7452, 31.4079, 272.5271, 106, 1);
	AddStaticVehicle(560, -1971.0621, 1185.6659, 45.0734, 89.7986, 37, 0);
	AddStaticVehicle(480, -1847.4036, 1165.1617, 39.5751, 356.245, 73, 45);
	AddStaticVehicle(428, -1833.1833, 1096.2388, 45.488, 89.0391, 4, 75);
	AddStaticVehicle(439, -1730.7964, 1089.0475, 45.3416, 271.8883, 57, 8);
	AddStaticVehicle(455, -1944.7908, 1001.1067, 35.6111, 269.5481, 32, 74);
	AddStaticVehicle(482, -1673.3295, 1090.5961, 8.0443, 269.4953, 10, 10);
	AddStaticVehicle(400, -2124.6316, -935.2519, 32.1158, 268.5499, 62, 1);
	AddStaticVehicle(506, -2150.3098, -772.5972, 31.6486, 270.1075, 37, 37);
	AddStaticVehicle(506, -2134.1143, -760.7621, 31.728, 90.9188, 7, 7);
	AddStaticVehicle(421, -2124.5564, -847.0036, 31.9059, 270.5157, 95, 1);
	AddStaticVehicle(405, -1736.9055, 1053.4701, 17.4609, 267.537, 40, 1);
	AddStaticVehicle(439, -1696.899, 977.2657, 17.4815, 359.7377, 67, 8);
	AddStaticVehicle(496, -1474.2157, -137.3864, 5.6264, 270.1316, 62, 62);
	AddStaticVehicle(400, -1337.587, -128.923, 6.0923, 88.6881, 62, 1);
	AddStaticVehicle(482, -1426.0374, -212.6052, 6.0536, 88.9253, 57, 57);
	AddStaticVehicle(516, -1369.8975, -216.2965, 5.8337, 88.8366, 122, 1);
	AddStaticVehicle(517, -1337.3739, -37.7222, 5.8549, 87.8366, 36, 36);
	AddStaticVehicle(411, -2618.2075, 1349.1384, 6.9411, 0.761, 81, 1);
	AddStaticVehicle(477, -2617.5005, 1376.3701, 6.88, 180.0679, 94, 1);
	AddStaticVehicle(411, -2646.4983, 1334.4966, 6.9009, 0.6167, 106, 1);
	AddStaticVehicle(487, -1637.0043, 1381.6923, 18.5907, 137.6304, 29, 42);
	AddStaticVehicle(487, -2632.1711, 1417.5526, 24.9424, 235.3438, 29, 42);
	AddStaticVehicle(480, -1623.093, 817.0657, 6.5923, 2.0322, 6, 6);
	AddStaticVehicle(493, -1409.9961, 917.3229, -0.3734, 301.5048, 1, 5);
	AddStaticVehicle(493, -1403.3783, 888.8575, -0.1041, 328.1305, 36, 13);
	AddStaticVehicle(480, -1488.3904, 666.517, 6.9579, 92.0792, 2, 2);
	AddStaticVehicle(484, -1475.4053, 703.6797, 0.2567, 181.1956, 50, 32);
	AddStaticVehicle(482, -1487.4949, 758.5935, 7.5513, 89.3724, 32, 53);
	AddStaticVehicle(403, -1654.6354, 452.5728, 8.2105, 212.2164, 24, 77);
	AddStaticVehicle(455, -1701.2188, 407.839, 7.6164, 221.8163, 84, 58);
	AddStaticVehicle(461, -1673.6534, 399.1507, 6.7568, 311.2735, 37, 1);
	AddStaticVehicle(421, -1665.1743, 351.3592, 6.8215, 345.8147, 42, 42);
	AddStaticVehicle(455, -1622.2393, 84.3414, 3.9898, 147.7921, 1, 31);
	AddStaticVehicle(453, -1632.5704, 161.8541, -0.277, 315.6891, 56, 56);
	AddStaticVehicle(460, -1446.9373, 96.2603, 1.8018, 313.8602, 1, 30);
	AddStaticVehicle(421, -1319.0929, -337.8624, 14.0309, 260.0551, 25, 1);
	AddStaticVehicle(553, -1622.4431, -311.8704, 15.4839, 27.5372, 55, 23);
	AddStaticVehicle(417, -1712.1791, -456.0522, 14.2207, 1.9482, 0, 0);
	AddStaticVehicle(447, -1756.1366, -444.6548, 0.7483, 5.0545, 75, 2);
	AddStaticVehicle(507, -1236.8948, 33.3595, 13.9733, 221.5421, 7, 7);
	AddStaticVehicle(411, -1426.322, -13.7968, 5.7271, 90.1829, 116, 1);
	AddStaticVehicle(411, -1459.3002, -5.4454, 5.7914, 271.8837, 45, 32);
	AddStaticVehicle(424, -2906.0566, 58.3788, 4.3926, 5.7181, 119, 122);
	AddStaticVehicle(568, -2897.8433, 330.073, 4.6656, 170.8635, 9, 39);
	AddStaticVehicle(444, -2930.2214, 711.2976, 6.4082, 7.0339, 32, 53);
	AddStaticVehicle(579, -2885.2395, 1243.7937, 7.0338, 261.217, 7, 7);
	AddStaticVehicle(462, -2810.1172, 1325.5194, 6.7011, 143.9079, 3, 1);
	AddStaticVehicle(446, -2747.4805, 1399.5426, -0.769, 32.7627, 3, 3);
	AddStaticVehicle(447, -2676.2593, 1897.6268, 0.9115, 93.0397, 75, 2);
	AddStaticVehicle(508, -2065.7258, 1423.1896, 7.4764, 145.1099, 1, 1);
	AddStaticVehicle(461, -2092.5718, 1432.652, 6.675, 193.9025, 87, 118);
	AddStaticVehicle(536, -2091.5598, 1392.6028, 6.8385, 217.0096, 30, 96);
	AddStaticVehicle(452, -1902.7883, 1400.2579, -0.251, 76.7538, 1, 5);
	AddStaticVehicle(461, -1794.8903, 1405.5066, 6.7728, 203.9249, 61, 1);
	AddStaticVehicle(472, -1720.9418, 1436.017, 0.3172, 356.6591, 56, 53);
	AddStaticVehicle(454, -1467.051, 1503.8058, 0.1585, 110.2544, 26, 26);
	AddStaticVehicle(473, -1570.944, 1263.8746, -0.0779, 276.0413, 56, 15);
	AddStaticVehicle(506, -1554.5819, 1068.4961, 6.8919, 359.0276, 52, 52);
	AddStaticVehicle(562, -1614.6351, 1007.8853, 6.8478, 250.5691, 17, 1);
	AddStaticVehicle(553, -1566.2198, -255.4555, 15.4835, 41.4339, 61, 74);
	AddStaticVehicle(586, -1871.2375, -893.5937, 31.543, 91.2748, 122, 1);
	AddStaticVehicle(586, -1912.6022, -918.9386, 31.7413, 353.5594, 46, 46);
	AddStaticVehicle(541, -1897.6475, -823.9932, 31.8346, 272.8453, 44, 96);
	AddStaticVehicle(541, -1886.8457, -759.9957, 31.6483, 270.8408, 60, 1);
	AddStaticVehicle(533, -1761.6075, 613.7797, 26.952, 89.3371, 79, 1);
	AddStaticVehicle(429, -2019.1703, 1029.0781, 55.1885, 272.6768, 13, 13);
	AddStaticVehicle(442, -2041.7661, 1116.0492, 53.1165, 175.0672, 11, 105);
	AddStaticVehicle(421, -2052.5154, 1112.8059, 53.1715, 181.2767, 13, 1);
	AddStaticVehicle(560, -2557.4421, 1143.5118, 55.4319, 165.8663, 9, 39);
	AddStaticVehicle(402, -2541.8601, 1141.0548, 55.3862, 170.3531, 35, 1);
	AddStaticVehicle(496, -2499.5383, 1137.9291, 55.4432, 180.4333, 53, 56);
	AddStaticVehicle(536, -2485.8357, 1137.9993, 55.4642, 180.9101, 12, 1);
	AddStaticVehicle(541, -2458.5952, 1138.3412, 55.3516, 178.5045, 58, 8);
	AddStaticVehicle(541, -2431.1118, 1136.0994, 55.533, 175.6763, 69, 1);
	AddStaticVehicle(541, -2377.0164, 1122.4816, 55.3515, 340.0099, 60, 1);
	AddStaticVehicle(508, -2413.5251, 1026.2301, 50.7658, 0.0956, 1, 1);
	AddStaticVehicle(575, -2408.1653, 974.7092, 44.9025, 182.2524, 19, 96);
	AddStaticVehicle(575, -2406.2703, 944.5644, 44.979, 266.8056, 72, 1);
	AddStaticVehicle(559, -2352.3479, 981.5965, 50.3515, 5.7404, 58, 8);
	AddStaticVehicle(437, -2366.8171, 1023.6387, 50.8246, 181.9107, 79, 7);
	AddStaticVehicle(405, -2239.0337, 893.463, 66.5312, 89.817, 24, 1);
	AddStaticVehicle(426, -2233.844, 930.8287, 66.3919, 180.1113, 10, 10);
	AddStaticVehicle(587, -2220.6704, 813.1365, 49.0857, 90.0399, 53, 1);
	AddStaticVehicle(500, -2292.3335, 812.442, 49.065, 88.5746, 9, 39);
	AddStaticVehicle(466, -2273.5481, 1038.3989, 83.506, 179.7762, 68, 76);
	AddStaticVehicle(436, -2135.5122, 1036.8539, 79.6184, 0.2546, 87, 1);
	AddStaticVehicle(547, -2285.7629, 1101.4392, 79.8592, 268.6749, 123, 1);
	AddStaticVehicle(480, -2238.072, 1184.7144, 55.3492, 91.5899, 2, 2);
	AddStaticVehicle(561, -2233.6113, 1104.8516, 79.8828, 180.3517, 101, 1);
	AddStaticVehicle(521, -2034.3132, 167.2029, 28.41, 276.3217, 75, 13);
	AddStaticVehicle(549, -2033.3455, 177.7978, 28.7383, 266.041, 57, 8);
	AddStaticVehicle(486, -2122.9641, 176.7403, 35.5823, 269.0041, 1, 1);
	AddStaticVehicle(486, -2128.7603, 292.7856, 35.0132, 268.8581, 1, 1);
	AddStaticVehicle(486, -2066.6992, 295.181, 35.3575, 185.6239, 18, 20);
	AddStaticVehicle(482, -2126.249, 202.0597, 35.4645, 271.661, 102, 65);
	AddStaticVehicle(493, -2941.2458, 500.9425, 1.9118, 356.2562, 1, 9);
	AddStaticVehicle(421, -2151.0249, 835.4579, 69.2326, 181.8154, 71, 72);
	AddStaticVehicle(516, -1892.384, 823.9651, 34.924, 1.1847, 119, 1);
	AddStaticVehicle(500, -1983.7811, 896.3951, 45.3164, 161.2541, 28, 119);
	AddStaticVehicle(482, -1878.126, 1073.6155, 45.3833, 1.0803, 88, 1);
	AddStaticVehicle(518, -2027.1711, 1228.7698, 31.319, 268.9391, 9, 39);
	AddStaticVehicle(424, -2051.5183, 1160.1519, 45.2263, 15.6148, 2, 2);
	AddStaticVehicle(558, -2143.7021, 1221.0677, 46.9019, 92.5564, 24, 1);
	AddStaticVehicle(496, -2354.3687, 1323.6498, 14.6058, 77.0716, 42, 42);
	AddStaticVehicle(603, -2697.6223, 783.2014, 49.8749, 267.5988, 87, 74);
	AddStaticVehicle(603, -2637.6653, 802.7455, 49.7702, 1.1551, 34, 1);
	AddStaticVehicle(522, -2594.9675, 841.644, 49.9161, 84.3496, 51, 118);
	AddStaticVehicle(463, -2464.2109, 919.5464, 62.5336, 160.6213, 7, 7);
	AddStaticVehicle(428, -1893.1501, 878.8957, 35.1399, 0.5215, 4, 75);
	AddStaticVehicle(500, -1920.9349, 900.0209, 35.5579, 206.1858, 14, 123);
	AddStaticVehicle(409, -1736.3384, 947.9546, 24.5472, 65.3048, 1, 1);
	AddStaticVehicle(540, -1502.9904, 938.4938, 7.0463, 124.6396, 62, 62);
	AddStaticVehicle(550, -1788.1842, 802.8976, 24.7103, 359.7563, 42, 42);
	AddStaticVehicle(561, -1784.4341, 692.7875, 34.9859, 182.24, 57, 8);
	AddStaticVehicle(443, -1851.9319, 116.8267, 15.7521, 284.3587, 20, 1);
	AddStaticVehicle(482, -1855.5973, 146.2494, 15.2417, 277.9544, 85, 85);
	AddStaticVehicle(549, -2048.1506, 124.8951, 28.6802, 182.0321, 47, 76);
	AddStaticVehicle(600, -2160.9421, 515.2612, 34.8894, 119.1082, 32, 8);
	AddStaticVehicle(582, -2089.2358, 479.1807, 35.1022, 78.0878, 62, 62);
	AddStaticVehicle(461, -1962.3229, 466.2146, 34.8407, 64.7884, 53, 53);
	AddStaticVehicle(401, -1905.384, 710.6555, 45.0761, 179.5601, 47, 47);
	AddStaticVehicle(401, -2539.3262, 939.0101, 64.2301, 90.3424, 47, 47);
	AddStaticVehicle(401, -2569.1545, 981.8585, 78.1545, 358.0872, 25, 1);
	AddStaticVehicle(541, -2692.8362, 455.8668, 3.9608, 87.0999, 13, 8);
	AddStaticVehicle(400, -2279.4724, -247.3415, 42.5332, 18.4825, 40, 1);
	AddStaticVehicle(444, -2354.2649, -371.5601, 69.0405, 313.2816, 32, 42);
	AddStaticVehicle(461, -1704.8201, 1339.3179, 6.7801, 93.7506, 3, 6);
	AddStaticVehicle(405, -1696.467, 1348.2159, 7.0546, 99.783, 4, 1);
	AddStaticVehicle(461, -1648.1644, 1307.4525, 6.6986, 130.5739, 3, 3);
	AddStaticVehicle(479, -1915.3132, 1256.0265, 19.2396, 89.3746, 95, 105);
	AddStaticVehicle(402, -2178.9719, 1227.6172, 33.7613, 358.4316, 22, 22);
	AddStaticVehicle(482, -1987.7301, 1338.3241, 7.2635, 176.601, 105, 1);
	AddStaticVehicle(405, -1977.9648, -1020.8948, 32.0504, 332.2476, 36, 1);
	AddStaticVehicle(487, -1970.8481, -829.0056, 39.733, 1.503, 26, 3);
	AddStaticVehicle(421, -2148.8938, -879.1363, 31.9059, 269.8967, 24, 118);
	AddStaticVehicle(461, -1720.9136, 1007.36, 17.1706, 91.6206, 37, 1);
	AddStaticVehicle(439, -1703.6799, 1028.5684, 17.2701, 271.2751, 68, 1);
	AddStaticVehicle(516, -1385.4271, -207.9932, 5.6252, 269.5264, 60, 1);
	AddStaticVehicle(400, -1370.537, -108.512, 5.7368, 90.5826, 30, 96);
	AddStaticVehicle(410, -1427.6842, -71.5402, 5.6544, 92.1527, 9, 1);
	AddStaticVehicle(516, -1338.1565, -175.1089, 5.7248, 267.4071, 2, 62);
	AddStaticVehicle(496, -2436.2021, 1257.5581, 30.219, 90.0063, 11, 11);
	AddStaticVehicle(579, -1643.6743, -1049.7825, 102.4422, 184.7762, 62, 62);
	AddStaticVehicle(468, -1539.1002, -988.967, 159.2563, 171.1934, 46, 46);
	AddStaticVehicle(457, -2477.0815, -310.379, 41.1381, 313.3356, 10, 1);
	AddStaticVehicle(560, -2486.6094, 262.4621, 34.8724, 271.1458, 17, 1);
	AddStaticVehicle(549, -2585.9888, 712.8341, 27.582, 89.5528, 84, 36);
	AddStaticVehicle(466, -1837.0461, 339.5637, 16.9045, 331.3646, 78, 76);
	AddStaticVehicle(558, -1956.2533, 297.6264, 35.0939, 64.6876, 116, 1);
	AddStaticVehicle(560, -1957.6255, 276.9994, 35.1773, 132.1875, 9, 39);
	AddStaticVehicle(561, -1950.4956, 259.6261, 35.2702, 53.4263, 8, 17);
	AddStaticVehicle(562, -1952.4977, 265.6259, 40.7239, 292.5037, 35, 1);
	AddStaticVehicle(567, -1952.76, 258.75, 40.92, 258.7441, 88, 64);
	AddStaticVehicle(490, -1588.4078, 673.0458, 7.3151, 176.8283, 0, 0);
	AddStaticVehicle(490, -1574.3214, 718.2319, -5.114, 89.8176, 0, 0);
	AddStaticVehicle(472, -1076.0149, -207.4982, 0.0197, 201.3848, 56, 53);

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
	AddStaticVehicle(416, 2033.127, -1432.2743, 17.2845, 180.0169, 1, 3);
	AddStaticVehicle(416, 2016.3477, -1414.9769, 17.1412, 86.7151, 1, 3);

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

	AddStaticVehicle(446, 728.1595, -1495.2687, -0.4906, 179.7909, 1, 5);
	AddStaticVehicle(454, 720.704, -1633.3224, 0.1487, 177.6009, 26, 26);
	AddStaticVehicle(454, 720.5267, -1699.9827, 0.1866, 358.9251, 26, 26);
	AddStaticVehicle(429, 764.7679, -1660.5485, 4.216, 94.0819, 12, 12);
	AddStaticVehicle(541, 688.0235, -1600.1552, 13.7216, 359.7577, 58, 8);
	AddStaticVehicle(466, 594.6932, -1519.6713, 14.8586, 178.9838, 68, 76);
	AddStaticVehicle(458, 601.2115, -1519.8091, 14.8971, 359.8546, 101, 1);
	AddStaticVehicle(496, 648.1077, -1507.837, 14.7836, 88.3481, 35, 35);
	AddStaticVehicle(429, 729.7592, -1433.3433, 13.2151, 90.2927, 13, 13);
	AddStaticVehicle(506, 665.4387, -1421.552, 14.3497, 1.6522, 7, 7);
	AddStaticVehicle(506, 587.3435, -1499.5959, 15.0621, 273.6347, 6, 6);
	AddStaticVehicle(413, 691.4462, -1570.2456, 14.3358, 179.2636, 91, 1);
	AddStaticVehicle(451, 489.1148, -1514.9581, 20.0516, 186.2239, 46, 46);
	AddStaticVehicle(541, 494.3372, -1604.7161, 18.2, 275.607, 60, 1);
	AddStaticVehicle(603, 259.4689, -1597.9203, 33.1167, 299.1694, 69, 1);
	AddStaticVehicle(429, 262.3868, -1603.2013, 33.0642, 323.2319, 2, 2);
	AddStaticVehicle(518, 258.0661, -1591.6113, 33.1217, 275.3944, 36, 36);
	AddStaticVehicle(409, 867.4957, -1285.9368, 13.8859, 357.4155, 1, 1);
	AddStaticVehicle(457, 844.4999, -1197.9865, 16.6038, 0.398, 2, 1);
	AddStaticVehicle(457, 880.841, -1199.7491, 16.6031, 357.7022, 21, 108);
	AddStaticVehicle(457, 914.744, -1199.8364, 16.6032, 359.8655, 106, 56);
	AddStaticVehicle(463, 920.4453, -1290.5063, 13.3508, 118.6505, 121, 14);
	AddStaticVehicle(542, 863.2733, -1375.0151, 13.3187, 85.7265, 32, 92);
	AddStaticVehicle(561, 903.8953, -1454.9287, 12.8651, 270.7864, 8, 17);
	AddStaticVehicle(429, 881.5562, -1453.8588, 13.3618, 271.8305, 99, 93);
	AddStaticVehicle(507, 809.9615, -1448.9109, 12.968, 87.2106, 35, 54);
	AddStaticVehicle(589, 810.5452, -1464.3678, 12.7191, 85.7123, 134, 97);
	AddStaticVehicle(496, 821.6033, -1473.7249, 12.5756, 357.5008, 54, 120);
	AddStaticVehicle(461, 1031.1113, -1446.3105, 13.1411, 59.058, 67, 86);
	AddStaticVehicle(418, 1005.0084, -1461.3424, 13.6427, 183.0261, 119, 119);
	AddStaticVehicle(463, 990.1287, -1354.9878, 12.9125, 285.7227, 65, 6);
	AddStaticVehicle(479, 991.3929, -1345.2102, 13.1759, 271.1148, 123, 108);
	AddStaticVehicle(489, 990.5985, -1306.8129, 13.5204, 179.0488, 24, 6);
	AddStaticVehicle(475, 1002.5063, -1306.5654, 13.1866, 359.6424, 37, 0);
	AddStaticVehicle(518, 981.5054, -1306.6899, 13.163, 181.0135, 71, 18);
	AddStaticVehicle(414, 979.2278, -1258.1351, 16.8071, 182.5786, 24, 1);
	AddStaticVehicle(506, 955.9268, -1184.0712, 16.6498, 269.9031, 30, 31);
	AddStaticVehicle(549, 955.8333, -1190.2795, 16.6425, 270.2728, 75, 39);
	AddStaticVehicle(482, 956.0022, -1199.3633, 17.127, 268.5538, 20, 20);
	AddStaticVehicle(468, 956.3898, -1193.4253, 16.6297, 89.6432, 46, 46);
	AddStaticVehicle(567, 1085.8342, -1199.3883, 17.7945, 90.5839, 93, 64);
	AddStaticVehicle(542, 1097.0354, -1218.1705, 17.5471, 356.6483, 45, 92);
	AddStaticVehicle(461, 1084.2866, -1232.2461, 15.3945, 243.6654, 61, 1);
	AddStaticVehicle(461, 1083.9337, -1235.0449, 15.4088, 243.8919, 75, 1);
	AddStaticVehicle(461, 1083.7941, -1238.1573, 15.411, 243.1097, 79, 1);
	AddStaticVehicle(405, 1109.031, -1225.8809, 15.6987, 181.5343, 75, 1);
	AddStaticVehicle(458, 1000.3081, -1084.5488, 23.7069, 179.6207, 30, 1);
	AddStaticVehicle(542, 1015.8254, -1083.9113, 23.5711, 0.6381, 119, 113);
	AddStaticVehicle(461, 1032.2993, -1082.4255, 23.4136, 166.6669, 35, 27);
	AddStaticVehicle(475, 1003.6659, -1054.6088, 30.6946, 3.0438, 122, 102);
	AddStaticVehicle(560, 1070.9109, -1102.3247, 24.4439, 270.7971, 41, 81);
	AddStaticVehicle(496, 1137.6492, -1025.5586, 31.5121, 177.9917, 67, 6);
	AddStaticVehicle(558, 1131.7341, -1010.058, 29.4899, 95.0937, 40, 1);
	AddStaticVehicle(581, 1205.2384, -977.0176, 43.0742, 179.7537, 58, 1);
	AddStaticVehicle(536, 1227.2596, -974.1713, 43.2139, 180.2966, 30, 96);
	AddStaticVehicle(414, 1110.5709, -1331.4204, 13.1385, 0.6026, 43, 1);
	AddStaticVehicle(581, 989.3703, -1589.3812, 13.0903, 21.5606, 66, 1);
	AddStaticVehicle(542, 1061.2451, -1665.2649, 13.4966, 91.912, 32, 92);
	AddStaticVehicle(405, 1136.5767, -1695.5199, 13.6956, 88.9354, 75, 1);
	AddStaticVehicle(463, 1137.1466, -1700.1902, 13.3869, 87.9396, 132, 112);
	AddStaticVehicle(518, 1280.4908, -1816.1259, 13.0556, 270.4623, 133, 56);
	AddStaticVehicle(482, 1250.2468, -1835.0884, 13.5047, 180.4024, 85, 85);
	AddStaticVehicle(527, 1196.936, -1829.698, 13.1197, 269.7545, 90, 9);
	AddStaticVehicle(589, 1280.9364, -1833.0607, 13.0418, 90.805, 46, 126);
	AddStaticVehicle(562, 1267.0612, -1795.2074, 13.0702, 0.6533, 102, 24);
	AddStaticVehicle(463, 1281.6627, -1805.1254, 12.9241, 62.4969, 53, 53);
	AddStaticVehicle(545, 1238.0167, -1835.2385, 13.2008, 177.531, 40, 96);
	AddStaticVehicle(400, 1423.8417, -1845.0616, 13.4772, 270.4685, 109, 109);
	AddStaticVehicle(546, 1536.6632, -1846.7765, 13.2712, 0.8185, 3, 87);
	AddStaticVehicle(475, 1614.0917, -1893.9027, 13.3521, 357.9483, 102, 80);
	AddStaticVehicle(546, 1796.2775, -1933.2837, 13.118, 180.4499, 113, 78);
	AddStaticVehicle(545, 1776.1965, -1917.6884, 13.1976, 90.785, 39, 1);
	AddStaticVehicle(400, 1776.1498, -1907.3949, 13.4788, 271.3831, 101, 1);
	AddStaticVehicle(400, 1804.1429, -1909.402, 13.3328, 269.6684, 10, 10);
	AddStaticVehicle(474, 1804.4889, -1919.3353, 13.1556, 269.8831, 110, 1);
	AddStaticVehicle(496, 1785.9353, -1933.2903, 13.175, 0.8605, 52, 69);
	AddStaticVehicle(496, 1776.2777, -1894.077, 12.9741, 272.6132, 15, 15);
	AddStaticVehicle(482, 1776.5122, -1899.9752, 13.5071, 87.3522, 10, 10);
	AddStaticVehicle(482, 1791.3899, -1933.2008, 13.5101, 180.1195, 118, 118);
	AddStaticVehicle(461, 1775.7963, -1912.6582, 12.972, 269.4815, 61, 1);
	AddStaticVehicle(461, 1775.734, -1914.1243, 12.9716, 262.3925, 75, 1);
	AddStaticVehicle(536, 1834.7808, -1871.9734, 13.0925, 179.2434, 30, 96);
	AddStaticVehicle(496, 1836.6301, -1853.6381, 13.1059, 179.9886, 20, 20);
	AddStaticVehicle(414, 1858.8854, -1875.5944, 13.5724, 180.1933, 95, 1);
	AddStaticVehicle(468, 1900.5659, -1849.8379, 13.2277, 44.6102, 94, 63);
	AddStaticVehicle(589, 1251.2297, -2042.1305, 59.4474, 180.0659, 40, 1);
	AddStaticVehicle(521, 1244.8016, -2023.3499, 59.433, 292.8341, 92, 3);
	AddStaticVehicle(506, 1263.7994, -2011.0569, 59.016, 0.0, 7, 7);
	AddStaticVehicle(522, 1266.506, -2010.327, 58.8043, 0.0, 7, 79);
	AddStaticVehicle(463, 1097.5217, -1763.8896, 12.8933, 267.4286, 36, 36);
	AddStaticVehicle(475, 892.6356, -1668.8604, 13.3544, 179.2466, 37, 0);
	AddStaticVehicle(506, 874.8234, -1658.4843, 13.2514, 181.7123, 1, 15);
	AddStaticVehicle(521, 870.1176, -1676.6573, 13.1183, 186.2732, 115, 118);
	AddStaticVehicle(496, 888.5651, -1679.1317, 13.2628, 357.5185, 102, 135);
	AddStaticVehicle(411, 1671.5546, -1719.5422, 20.2115, 269.5804, 132, 108);
	AddStaticVehicle(415, 1656.9489, -1695.5144, 20.2285, 358.9435, 131, 53);
	AddStaticVehicle(496, 1671.9685, -1704.4779, 20.2006, 270.8929, 66, 72);
	AddStaticVehicle(461, 1673.9683, -1713.0564, 20.0617, 67.1318, 43, 1);

	AddStaticVehicle(413, 327.8443, -1809.2729, 4.5733, 359.3342, 91, 1);
	AddStaticVehicle(439, 311.7234, -1809.8577, 4.3552, 179.9755, 54, 38);
	AddStaticVehicle(496, 334.3875, -1788.6018, 4.7803, 358.1175, 41, 41);
	AddStaticVehicle(414, 383.4589, -1740.6958, 8.8571, 358.6929, 28, 1);
	AddStaticVehicle(467, 740.437, -1793.5476, 12.918, 349.2087, 58, 8);
	AddStaticVehicle(473, 823.7594, -2066.2686, -0.1017, 112.6381, 56, 53);
	AddStaticVehicle(467, 892.0507, -1797.3351, 13.407, 175.4098, 60, 1);
	AddStaticVehicle(467, 944.9136, -1813.559, 13.0146, 350.0614, 68, 8);
	AddStaticVehicle(491, 1096.8945, -1878.803, 13.3031, 178.1535, 71, 72);
	AddStaticVehicle(496, 1206.2454, -1879.0792, 13.3341, 88.519, 77, 26);
	AddStaticVehicle(541, 288.7144, -1158.0404, 80.5349, 221.9677, 0, 6);
	AddStaticVehicle(589, 346.9617, -1197.2283, 76.2875, 25.804, 70, 100);
	AddStaticVehicle(411, 407.0925, -1151.5203, 76.6354, 148.1414, 130, 130);
	AddStaticVehicle(562, 481.5187, -1089.5427, 82.1051, 359.1924, 0, 3);
	AddStaticVehicle(426, 565.9165, -1067.1946, 73.1332, 35.3833, 42, 42);
	AddStaticVehicle(451, 228.7167, -1398.7766, 51.2917, 51.4378, 131, 74);
	AddStaticVehicle(429, 133.9096, -1492.1663, 18.5958, 57.1215, 119, 1);
	AddStaticVehicle(562, 150.7156, -1473.8826, 24.9243, 5.9389, 111, 118);
	AddStaticVehicle(411, 166.3856, -1340.8578, 69.4391, 190.477, 128, 51);
	AddStaticVehicle(603, 172.0262, -1341.3418, 69.5661, 168.2207, 44, 40);
	AddStaticVehicle(429, 248.8978, -1355.4116, 52.8828, 279.1667, 53, 53);
	AddStaticVehicle(451, 251.6047, -1359.8792, 52.7134, 300.5452, 17, 117);
	AddStaticVehicle(562, 299.8025, -1331.8171, 53.2744, 72.7622, 44, 80);
	AddStaticVehicle(405, 406.4772, -1264.2565, 50.2499, 24.016, 24, 1);
	AddStaticVehicle(535, 423.6223, -1266.3209, 51.345, 21.9438, 54, 77);
	AddStaticVehicle(477, 261.5547, -1220.3823, 74.6478, 183.4546, 99, 100);
	AddStaticVehicle(535, 276.9328, -1267.3054, 73.7098, 302.5802, 6, 4);
	AddStaticVehicle(496, 280.3806, -1255.7952, 73.6166, 281.7693, 46, 66);
	AddStaticVehicle(411, 282.9343, -1160.42, 80.6401, 223.583, 42, 42);
	AddStaticVehicle(589, 569.3154, -1131.733, 50.295, 243.4572, 42, 39);
	AddStaticVehicle(411, 617.2254, -1102.6525, 46.5131, 126.8061, 64, 1);
	AddStaticVehicle(562, 687.5812, -1072.8162, 49.1274, 62.7814, 76, 45);
	AddStaticVehicle(496, 724.4913, -995.4954, 52.3857, 89.4483, 79, 110);
	AddStaticVehicle(545, 795.984, -840.3973, 60.4526, 174.574, 31, 96);
	AddStaticVehicle(522, 846.9828, -905.6497, 68.3458, 342.5805, 138, 94);
	AddStaticVehicle(534, 831.9914, -858.856, 69.6527, 199.3811, 65, 44);
	AddStaticVehicle(535, 839.4457, -893.5928, 68.534, 21.226, 3, 1);
	AddStaticVehicle(477, 912.5916, -832.098, 92.1407, 218.1897, 108, 127);
	AddStaticVehicle(429, 942.3409, -842.2905, 93.9553, 49.3921, 107, 69);
	AddStaticVehicle(429, 934.484, -856.8366, 93.1734, 204.4157, 135, 30);
	AddStaticVehicle(562, 966.6584, -842.2115, 95.4213, 208.6852, 103, 88);
	AddStaticVehicle(451, 979.1476, -831.5278, 95.3282, 27.7639, 22, 108);
	AddStaticVehicle(589, 1024.282, -777.6995, 102.7277, 142.3072, 128, 91);
	AddStaticVehicle(429, 1028.9191, -810.0178, 101.6239, 200.6103, 20, 71);
	AddStaticVehicle(522, 1099.2415, -818.4706, 86.5177, 153.557, 135, 31);
	AddStaticVehicle(522, 1256.5295, -804.6979, 83.7138, 117.1748, 116, 130);
	AddStaticVehicle(541, 1248.1569, -804.1443, 83.7656, 167.9414, 24, 3);
	AddStaticVehicle(487, 1291.7155, -786.8652, 96.6376, 1.5839, 29, 42);
	AddStaticVehicle(589, 1352.087, -622.193, 108.8587, 24.2312, 125, 64);
	AddStaticVehicle(477, 1460.3851, -633.6793, 95.553, 179.4419, 0, 1);
	AddStaticVehicle(411, 1108.8185, -732.72, 100.2283, 87.5487, 116, 1);
	AddStaticVehicle(429, 1515.277, -695.3987, 94.4297, 99.0699, 3, 1);
	AddStaticVehicle(522, 1518.6567, -688.1443, 94.3202, 127.6349, 134, 60);
	AddStaticVehicle(535, 1516.9452, -765.4361, 79.7405, 142.5422, 66, 1);
	AddStaticVehicle(458, 1530.6602, -814.2603, 71.8145, 269.5966, 125, 32);
	AddStaticVehicle(560, 1536.7003, -841.944, 64.3992, 91.245, 101, 95);
	AddStaticVehicle(506, 1515.6777, -879.8586, 61.2318, 73.2864, 106, 83);
	AddStaticVehicle(451, 1464.4681, -902.8252, 54.5429, 174.4412, 27, 31);
	AddStaticVehicle(429, 1429.4169, -883.6697, 50.4307, 45.8139, 103, 37);
	AddStaticVehicle(589, 1088.9662, -644.2655, 113.1492, 338.4004, 20, 50);
	AddStaticVehicle(424, 1113.3992, -657.0714, 113.2539, 1.8936, 24, 53);
	AddStaticVehicle(411, 1048.4277, -639.6287, 119.8443, 62.9709, 81, 124);
	AddStaticVehicle(550, 1038.2852, -640.5812, 119.9407, 3.9959, 18, 96);
	AddStaticVehicle(558, 1011.054, -659.986, 120.7726, 34.0075, 131, 53);
	AddStaticVehicle(562, 1006.7906, -663.9238, 120.8018, 212.6702, 68, 8);
	AddStaticVehicle(560, 946.7752, -705.8109, 121.9154, 208.3881, 17, 1);
	AddStaticVehicle(535, 912.4982, -665.0076, 116.7563, 234.0564, 136, 91);
	AddStaticVehicle(477, 866.9702, -712.0836, 105.4297, 301.5712, 75, 1);
	AddStaticVehicle(518, 851.5046, -741.6164, 94.8512, 223.7018, 13, 1);
	AddStaticVehicle(603, 887.4414, -782.381, 101.1163, 325.3539, 58, 1);
	AddStaticVehicle(534, 834.7188, -754.2109, 85.0352, 221.3681, 120, 0);
	AddStaticVehicle(545, 856.4266, -825.8338, 89.3121, 35.0684, 23, 94);
	AddStaticVehicle(545, 812.7324, -768.6061, 76.6226, 240.9842, 12, 12);
	AddStaticVehicle(562, 792.6622, -824.7413, 69.7717, 10.8903, 101, 4);
	AddStaticVehicle(405, 211.8928, -1419.0681, 13.1531, 135.6236, 24, 1);
	AddStaticVehicle(461, 203.5655, -1441.0552, 12.6881, 319.354, 43, 1);
	AddStaticVehicle(482, 216.6308, -1431.9065, 13.3691, 313.9951, 48, 48);
	AddStaticVehicle(462, 338.6057, -1340.7114, 14.1075, 116.4867, 53, 61);
	AddStaticVehicle(439, 343.3987, -1353.3427, 14.4033, 299.2459, 43, 21);
	AddStaticVehicle(542, 412.7446, -1318.5144, 14.6645, 210.7711, 112, 131);
	AddStaticVehicle(521, 411.1232, -1311.2087, 14.5024, 140.9818, 36, 0);
	AddStaticVehicle(562, 500.5935, -1304.4486, 16.8673, 309.546, 19, 113);
	AddStaticVehicle(521, 531.3096, -1315.9927, 16.8135, 188.1211, 74, 74);
	AddStaticVehicle(589, 534.3378, -1291.4104, 17.0133, 1.2697, 127, 47);
	AddStaticVehicle(463, 542.3274, -1292.8159, 16.7824, 341.9847, 79, 3);
	AddStaticVehicle(496, 556.2568, -1291.2498, 17.0149, 180.9516, 61, 21);
	AddStaticVehicle(461, 587.8506, -1279.8562, 15.9628, 75.5049, 57, 94);
	AddStaticVehicle(463, 588.5497, -1282.7085, 15.711, 71.1037, 20, 60);
	AddStaticVehicle(589, 569.194, -1264.3147, 16.4483, 105.7125, 75, 1);
	AddStaticVehicle(474, 580.0232, -1310.129, 13.631, 190.1793, 54, 114);
	AddStaticVehicle(429, 760.3118, -1026.9938, 23.8337, 171.0469, 25, 78);
	AddStaticVehicle(411, 825.8176, -1006.613, 27.4827, 38.89, 123, 1);
	AddStaticVehicle(429, 973.4509, -930.9051, 42.1739, 91.9582, 71, 134);
	AddStaticVehicle(463, 892.2068, -944.0689, 41.393, 346.6371, 46, 55);
	AddStaticVehicle(496, 1039.0024, -925.8621, 42.0801, 3.8901, 95, 87);
	AddStaticVehicle(496, 1028.1858, -887.8458, 41.8743, 18.1745, 76, 26);
	AddStaticVehicle(534, 1091.6672, -934.4342, 42.7434, 181.8923, 53, 53);
	AddStaticVehicle(496, 1196.446, -887.295, 42.7778, 4.9401, 13, 118);
	AddStaticVehicle(461, 1184.3699, -898.7025, 42.8468, 50.8006, 26, 5);
	AddStaticVehicle(479, 1307.0081, -871.5775, 39.3723, 88.4695, 20, 119);
	AddStaticVehicle(482, 1307.4617, -865.4689, 39.6982, 269.2831, 52, 52);
	AddStaticVehicle(543, 1307.449, -856.3735, 39.3962, 86.8428, 32, 8);
	AddStaticVehicle(463, 1305.3447, -860.6293, 39.1185, 240.4489, 102, 77);
	AddStaticVehicle(567, 1327.1772, -856.8694, 39.4427, 355.0141, 96, 74);
	AddStaticVehicle(458, 1422.6184, -915.699, 35.9254, 173.6657, 76, 95);
	AddStaticVehicle(439, 1455.1505, -920.9677, 37.4997, 5.5316, 137, 65);
	AddStaticVehicle(550, 1025.4679, -981.0638, 42.4947, 275.3589, 109, 23);
	AddStaticVehicle(576, 929.9745, -996.4139, 37.8311, 274.647, 68, 96);
	AddStaticVehicle(404, 863.1107, -1056.6387, 24.8362, 216.7097, 119, 50);
	AddStaticVehicle(463, 868.9804, -1068.5559, 24.6418, 26.0884, 90, 87);
	AddStaticVehicle(439, 783.3749, -1356.8221, 13.4354, 272.4747, 0, 119);
	AddStaticVehicle(463, 733.6376, -1347.5618, 13.0519, 258.9138, 22, 22);
	AddStaticVehicle(429, 783.3834, -1347.7704, 13.3739, 90.3087, 52, 94);
	AddStaticVehicle(536, 1696.6791, -2097.0415, 13.2841, 179.3459, 30, 96);
	AddStaticVehicle(542, 1662.7777, -2110.7148, 13.29, 90.387, 45, 92);
	AddStaticVehicle(400, 1707.4287, -2142.6919, 13.6471, 229.0505, 40, 110);
	AddStaticVehicle(567, 1725.0461, -2130.4683, 13.4259, 180.754, 88, 64);
	AddStaticVehicle(412, 1724.0801, -2092.9343, 13.3837, 178.9921, 91, 31);
	AddStaticVehicle(536, 1747.443, -2097.3616, 13.287, 179.0798, 32, 1);
	AddStaticVehicle(576, 1793.302, -2149.7551, 13.2392, 180.6801, 72, 1);
	AddStaticVehicle(536, 1772.7323, -2096.0732, 13.2853, 181.7548, 37, 1);
	AddStaticVehicle(549, 1948.6121, -2114.0183, 13.2416, 90.8657, 79, 39);
	AddStaticVehicle(496, 1948.0044, -2126.9031, 13.2611, 269.066, 37, 19);
	AddStaticVehicle(463, 1941.4159, -2139.873, 13.097, 153.7429, 53, 53);
	AddStaticVehicle(414, 1924.2328, -2123.9316, 13.6772, 359.7333, 95, 1);
	AddStaticVehicle(576, 1938.4186, -2089.9116, 13.1725, 87.9823, 74, 8);
	AddStaticVehicle(518, 1979.0964, -2065.5842, 13.1683, 1.551, 95, 1);
	AddStaticVehicle(482, 1998.881, -2095.2688, 13.6603, 182.4098, 110, 110);
	AddStaticVehicle(482, 2079.6143, -2007.4128, 13.6618, 267.6052, 66, 66);
	AddStaticVehicle(543, 2070.6382, -1995.7777, 13.3738, 177.5505, 32, 8);
	AddStaticVehicle(463, 2064.7144, -1998.2357, 13.087, 323.5498, 19, 19);
	AddStaticVehicle(475, 1981.1689, -1985.4224, 13.3487, 0.0153, 33, 0);
	AddStaticVehicle(443, 2002.952, -1940.1552, 13.9832, 90.4363, 20, 1);
	AddStaticVehicle(413, 2062.2634, -1904.0969, 13.6286, 358.4263, 91, 1);
	AddStaticVehicle(426, 2065.5415, -1920.3318, 13.2901, 179.3121, 53, 53);
	AddStaticVehicle(468, 2120.8396, -1874.5211, 13.2159, 331.0408, 6, 6);
	AddStaticVehicle(448, 2125.2058, -1817.1385, 13.1554, 304.3319, 3, 6);
	AddStaticVehicle(448, 2124.9956, -1814.4016, 13.1552, 307.8773, 3, 6);
	AddStaticVehicle(448, 2124.6506, -1811.72, 13.1522, 308.4132, 3, 6);
	AddStaticVehicle(489, 2121.7656, -1783.073, 13.5319, 181.4553, 112, 120);
	AddStaticVehicle(600, 2106.7954, -1783.6602, 13.0983, 178.3882, 32, 8);
	AddStaticVehicle(400, 2114.604, -1783.4563, 13.4944, 359.1006, 28, 119);
	AddStaticVehicle(546, 2095.9749, -1800.3145, 13.1088, 268.3826, 78, 38);
	AddStaticVehicle(400, 2096.2324, -1819.9232, 13.4752, 269.6763, 75, 1);
	AddStaticVehicle(554, 1928.452, -1795.0306, 13.4708, 269.1664, 15, 32);
	AddStaticVehicle(475, 1976.6083, -1727.6584, 15.7685, 270.5382, 33, 0);
	AddStaticVehicle(400, 2014.251, -1737.9341, 13.6451, 89.6673, 40, 1);
	AddStaticVehicle(546, 2017.8608, -1707.7689, 13.2712, 91.095, 3, 87);
	AddStaticVehicle(496, 1967.9211, -1658.8986, 15.7506, 88.966, 52, 69);
	AddStaticVehicle(474, 2026.2841, -1649.0118, 13.3172, 268.3413, 105, 1);
	AddStaticVehicle(429, 1990.6079, -1579.2163, 13.2836, 74.1057, 14, 14);
	AddStaticVehicle(475, 2014.0079, -1597.3103, 13.3757, 134.4442, 37, 0);
	AddStaticVehicle(466, 2057.4875, -1636.5558, 13.2887, 269.2682, 2, 76);
	AddStaticVehicle(496, 2062.4905, -1694.4796, 13.3308, 89.8789, 71, 107);
	AddStaticVehicle(533, 2062.6511, -1738.6663, 13.256, 90.7603, 74, 1);
	AddStaticVehicle(412, 2238.7908, -1630.9789, 15.5684, 339.3786, 29, 8);
	AddStaticVehicle(534, 2284.063, -1681.7241, 13.8912, 0.3629, 53, 53);
	AddStaticVehicle(475, 2271.4482, -1634.8553, 15.1246, 1.4485, 9, 39);
	AddStaticVehicle(463, 2289.7493, -1685.7275, 13.2727, 338.6942, 36, 36);
	AddStaticVehicle(496, 2296.9233, -1644.5267, 14.5451, 178.7794, 17, 1);
	AddStaticVehicle(474, 2328.1565, -1677.1449, 14.1746, 268.4948, 74, 1);
	AddStaticVehicle(545, 2319.2271, -1712.0625, 13.3579, 179.0224, 44, 96);
	AddStaticVehicle(475, 2416.0103, -1707.7166, 13.5772, 180.6127, 17, 1);
	AddStaticVehicle(400, 2443.6687, -1637.1934, 13.3619, 180.6244, 10, 10);
	AddStaticVehicle(404, 2516.5413, -1672.2059, 13.6568, 247.427, 123, 92);
	AddStaticVehicle(600, 2501.3005, -1685.7114, 13.2052, 54.223, 43, 8);
	AddStaticVehicle(482, 2473.6335, -1688.4501, 13.6213, 1.3507, 34, 34);
	AddStaticVehicle(426, 2500.2908, -1755.7277, 13.1737, 179.5942, 53, 53);
	AddStaticVehicle(414, 2445.8567, -1762.6874, 13.682, 179.0055, 9, 1);
	AddStaticVehicle(479, 2452.3486, -1784.1185, 13.3435, 358.682, 60, 35);
	AddStaticVehicle(475, 2498.792, -1953.6908, 13.2268, 180.0759, 33, 0);
	AddStaticVehicle(482, 2482.8601, -1953.4886, 13.5429, 359.9536, 32, 32);
	AddStaticVehicle(475, 2731.426, -1937.1626, 13.3474, 270.949, 37, 0);
	AddStaticVehicle(489, 2685.5461, -1986.3003, 13.6939, 358.8623, 120, 123);
	AddStaticVehicle(536, 2685.3967, -2021.3516, 13.265, 179.1453, 57, 96);
	AddStaticVehicle(475, 2644.9438, -1989.3313, 13.3576, 178.503, 56, 29);
	AddStaticVehicle(547, 2787.842, -1876.2371, 9.5681, 179.4587, 123, 1);
	AddStaticVehicle(426, 2757.7773, -1847.0181, 9.4532, 21.0801, 37, 37);
	AddStaticVehicle(479, 2732.686, -1875.274, 9.3877, 359.7763, 45, 32);
	AddStaticVehicle(567, 2706.5757, -1843.5668, 9.3669, 339.9568, 97, 96);
	AddStaticVehicle(458, 2679.1792, -1826.0692, 9.2646, 129.6775, 113, 1);
	AddStaticVehicle(439, 2657.7949, -1812.8765, 9.1989, 98.6444, 67, 8);
	AddStaticVehicle(461, 2697.0117, -1836.8411, 9.0454, 131.7257, 61, 1);
	AddStaticVehicle(463, 2757.8318, -1878.8939, 9.2421, 331.1535, 7, 122);
	AddStaticVehicle(521, 2813.1143, -1822.5189, 9.5068, 56.5744, 87, 118);
	AddStaticVehicle(521, 2808.0325, -1669.0962, 9.5088, 168.8724, 92, 3);
	AddStaticVehicle(466, 2829.7585, -1699.7444, 9.7443, 256.3983, 16, 76);
	AddStaticVehicle(545, 2825.0059, -1718.6702, 9.8159, 77.5273, 30, 1);
	AddStaticVehicle(588, 2686.6833, -1672.3564, 9.3456, 1.2872, 1, 1);
	AddStaticVehicle(546, 2657.6079, -1701.7725, 9.0416, 92.9747, 113, 78);
	AddStaticVehicle(521, 2654.6636, -1692.5939, 8.8779, 251.8571, 36, 0);
	AddStaticVehicle(463, 2696.4189, -1669.2604, 9.0249, 152.7104, 11, 11);
	AddStaticVehicle(474, 2813.8862, -1429.2637, 16.0126, 357.9624, 83, 1);
	AddStaticVehicle(546, 2792.6982, -1432.1294, 19.9428, 95.9562, 119, 62);
	AddStaticVehicle(521, 2819.5498, -1427.8861, 27.7283, 97.02, 75, 13);
	AddStaticVehicle(429, 2796.616, -1428.0923, 35.7734, 355.7729, 1, 2);
	AddStaticVehicle(400, 2794.7859, -1464.7653, 40.1536, 180.1253, 75, 84);
	AddStaticVehicle(418, 2816.582, -1431.5497, 40.1556, 268.4159, 114, 114);
	AddStaticVehicle(521, 2794.0625, -1576.2109, 10.4993, 252.9832, 118, 118);
	AddStaticVehicle(600, 2796.4966, -1562.6956, 10.6452, 89.5535, 83, 13);
	AddStaticVehicle(426, 2822.3193, -1553.4038, 10.6672, 89.8755, 42, 42);
	AddStaticVehicle(533, 2807.4377, -1540.4016, 10.631, 180.0459, 73, 1);
	AddStaticVehicle(414, 2772.3438, -1614.6322, 11.009, 270.605, 43, 1);
	AddStaticVehicle(589, 2855.3896, -1354.9142, 10.8385, 271.7889, 40, 1);
	AddStaticVehicle(521, 2850.301, -1323.347, 10.871, 43.7938, 92, 3);
	AddStaticVehicle(562, 2845.5762, -1287.0035, 18.8725, 276.48, 62, 62);
	AddStaticVehicle(463, 2802.9653, -1174.3158, 25.0878, 148.6355, 22, 22);
	AddStaticVehicle(589, 2814.8518, -1186.5088, 24.974, 125.2599, 43, 1);
	AddStaticVehicle(496, 2827.8259, -1165.8298, 24.8425, 74.4954, 41, 29);
	AddStaticVehicle(419, 2828.4297, -1193.2813, 24.7035, 319.2678, 47, 76);
	AddStaticVehicle(521, 2686.6938, -1102.2723, 68.9335, 36.244, 25, 118);
	AddStaticVehicle(536, 2570.6431, -1101.5728, 65.9616, 224.2815, 30, 96);
	AddStaticVehicle(461, 2589.6411, -967.647, 80.974, 54.8113, 88, 1);
	AddStaticVehicle(543, 2561.0659, -955.9353, 82.5712, 189.2468, 32, 8);
	AddStaticVehicle(543, 2499.9092, -961.6536, 82.0865, 177.1486, 43, 8);
	AddStaticVehicle(478, 2492.5671, -951.8682, 82.2364, 268.9169, 66, 1);
	AddStaticVehicle(463, 2450.5344, -957.0054, 79.5994, 88.6032, 79, 79);
	AddStaticVehicle(521, 2359.4319, -648.6396, 127.7032, 321.5916, 36, 0);
	AddStaticVehicle(478, 2368.4819, -651.1127, 127.6424, 221.5063, 59, 1);
	AddStaticVehicle(529, 2497.5225, -1063.2612, 69.7644, 180.0623, 42, 42);
	AddStaticVehicle(412, 2503.8013, -1024.9954, 69.9222, 354.6204, 37, 8);
	AddStaticVehicle(536, 2485.7839, -1015.6508, 65.0513, 332.0788, 57, 96);
	AddStaticVehicle(475, 2453.7122, -1011.7231, 59.5763, 354.2991, 37, 0);
	AddStaticVehicle(549, 2432.1267, -1056.5386, 54.0339, 182.6494, 91, 35);
	AddStaticVehicle(521, 2366.8833, -1052.4576, 53.7198, 162.4203, 118, 118);
	AddStaticVehicle(463, 2334.833, -1052.5548, 51.8916, 205.8942, 7, 7);
	AddStaticVehicle(400, 2328.0398, -1052.35, 52.4471, 178.7152, 40, 1);
	AddStaticVehicle(468, 2368.9734, -1029.3669, 53.9112, 303.9771, 53, 53);
	AddStaticVehicle(521, 2222.1743, -1043.8972, 57.4453, 287.0623, 92, 3);
	AddStaticVehicle(475, 2200.8208, -1000.4743, 62.11, 337.412, 41, 29);
	AddStaticVehicle(536, 2073.8337, -972.3666, 48.8145, 121.6684, 9, 1);
	AddStaticVehicle(461, 2057.1284, -987.3378, 45.8448, 41.0353, 37, 1);
	AddStaticVehicle(549, 2032.1614, -966.3978, 40.8893, 144.2881, 74, 39);
	AddStaticVehicle(521, 1994.0328, -1089.3951, 24.179, 265.7199, 115, 118);
	AddStaticVehicle(536, 1910.2012, -1117.5193, 25.4453, 359.7224, 12, 1);
	AddStaticVehicle(576, 1934.3488, -1118.8567, 26.0909, 167.6531, 84, 96);
	AddStaticVehicle(540, 1991.7618, -1119.2262, 26.6329, 88.562, 42, 42);
	AddStaticVehicle(549, 2090.1191, -1141.0527, 25.255, 91.9199, 83, 36);
	AddStaticVehicle(536, 2116.0889, -1059.6656, 25.4645, 1.6788, 30, 96);
	AddStaticVehicle(549, 2161.8665, -1148.1637, 24.0918, 268.7138, 84, 36);
	AddStaticVehicle(576, 2162.5032, -1162.9884, 23.4278, 270.5314, 67, 1);
	AddStaticVehicle(540, 2147.646, -1180.4316, 23.6805, 271.2742, 53, 53);
	AddStaticVehicle(554, 2161.5271, -1192.5657, 23.9013, 270.695, 14, 32);
	AddStaticVehicle(521, 2164.0178, -1178.0918, 23.389, 68.9158, 74, 74);
	AddStaticVehicle(463, 2145.5957, -1162.0776, 23.3554, 273.2266, 57, 55);
	AddStaticVehicle(475, 2148.752, -1242.4739, 24.4964, 2.1731, 9, 39);
	AddStaticVehicle(536, 2105.4612, -1242.9531, 24.7791, 1.3025, 71, 96);
	AddStaticVehicle(475, 2033.9213, -1285.0781, 20.7583, 269.6826, 17, 1);
	AddStaticVehicle(479, 2033.2328, -1294.9094, 20.7262, 90.1861, 116, 34);
	AddStaticVehicle(536, 2095.4097, -1365.6405, 23.7217, 359.4201, 26, 96);
	AddStaticVehicle(567, 2136.8682, -1366.1549, 24.9118, 181.6538, 97, 96);
	AddStaticVehicle(554, 2156.667, -1408.6438, 25.6234, 89.8769, 15, 32);
	AddStaticVehicle(529, 2150.2095, -1423.7836, 25.1728, 270.8055, 53, 53);
	AddStaticVehicle(412, 2157.4702, -1454.6027, 25.3766, 272.0728, 9, 1);
	AddStaticVehicle(482, 2168.9004, -1503.8928, 24.0567, 264.3123, 66, 66);
	AddStaticVehicle(554, 2191.4373, -1465.714, 25.6253, 90.8413, 45, 32);
	AddStaticVehicle(489, 2185.0557, -1434.4803, 25.6846, 93.1798, 13, 118);
	AddStaticVehicle(529, 2229.7317, -1367.4005, 23.6257, 273.8516, 62, 62);
	AddStaticVehicle(405, 2229.4822, -1348.8889, 23.8603, 87.4558, 75, 1);
	AddStaticVehicle(600, 2230.1382, -1359.4955, 23.7003, 269.3415, 104, 72);
	AddStaticVehicle(536, 2196.1318, -1278.5265, 24.2447, 358.3134, 32, 1);
	AddStaticVehicle(479, 2426.9795, -1241.6071, 24.0514, 176.572, 40, 29);
	AddStaticVehicle(603, 2414.5007, -1223.4979, 24.7468, 354.3562, 69, 1);
	AddStaticVehicle(475, 2431.3196, -1241.5726, 24.1538, 177.5767, 2, 39);
	AddStaticVehicle(463, 2430.6926, -1220.7517, 24.9012, 142.6704, 19, 19);
	AddStaticVehicle(467, 2556.9187, -1211.2632, 54.271, 92.0357, 68, 8);
	AddStaticVehicle(475, 2559.0198, -1194.618, 61.2624, 177.0269, 17, 1);
	AddStaticVehicle(412, 2491.1543, -1299.4158, 32.1578, 276.4995, 37, 8);
	AddStaticVehicle(554, 2489.9026, -1292.775, 32.091, 246.3011, 45, 32);
	AddStaticVehicle(400, 2493.6797, -1276.2856, 33.0028, 268.8489, 40, 110);
	AddStaticVehicle(475, 2390.2915, -1487.712, 23.633, 90.8244, 41, 29);
	AddStaticVehicle(400, 2390.6387, -1503.733, 23.9272, 270.7136, 62, 1);
	AddStaticVehicle(463, 2389.4578, -1497.8422, 23.3752, 243.2236, 79, 79);
	AddStaticVehicle(545, 2396.8088, -1536.9807, 23.8111, 0.1546, 50, 1);
	AddStaticVehicle(479, 2407.3284, -1538.0587, 23.7968, 0.6749, 59, 36);
	AddStaticVehicle(466, 2412.8625, -1537.3831, 23.7432, 357.6566, 78, 76);
	AddStaticVehicle(475, 2449.7637, -1556.845, 23.8046, 1.3418, 17, 1);
	AddStaticVehicle(529, 2454.6299, -1557.0045, 23.6327, 180.156, 16, 40);
	AddStaticVehicle(496, 2477.5659, -1557.4111, 23.7818, 358.5618, 41, 29);
	AddStaticVehicle(463, 2491.4055, -1535.6182, 23.5519, 59.4337, 11, 11);
	AddStaticVehicle(461, 2491.1179, -1529.3501, 23.5688, 56.2088, 75, 1);
	AddStaticVehicle(521, 2491.436, -1532.5398, 23.5717, 55.7102, 25, 118);
	AddStaticVehicle(496, 2489.5791, -1518.4509, 23.7588, 269.8171, 2, 39);
	AddStaticVehicle(562, 2482.6208, -1557.3427, 23.6524, 2.3099, 10, 10);
	AddStaticVehicle(468, 2499.0034, -1538.0708, 23.6439, 335.4962, 3, 3);
	AddStaticVehicle(536, 2520.1445, -1480.9065, 23.7363, 1.3232, 37, 1);
	AddStaticVehicle(533, 2573.5979, -1489.6091, 23.7162, 87.7542, 77, 1);
	AddStaticVehicle(521, 2554.3159, -1367.9281, 31.7872, 241.1393, 36, 0);
	AddStaticVehicle(536, 2411.6626, -1390.6456, 24.0787, 268.8195, 26, 96);
	AddStaticVehicle(533, 1819.86, -1403.5051, 13.1363, 89.9457, 73, 1);
	AddStaticVehicle(496, 1809.4696, -1432.1268, 13.0139, 274.7705, 42, 42);
	AddStaticVehicle(542, 1676.156, -1106.9868, 23.6493, 268.6964, 113, 92);
	AddStaticVehicle(589, 1649.5083, -1102.5532, 23.5644, 270.0267, 31, 31);
	AddStaticVehicle(589, 1658.4116, -1088.9274, 23.6777, 89.2744, 75, 1);
	AddStaticVehicle(482, 1620.9778, -1089.5054, 24.0216, 89.9049, 48, 48);
	AddStaticVehicle(518, 1629.4741, -1103.3231, 23.576, 268.5257, 9, 39);
	AddStaticVehicle(518, 1640.7035, -1046.7117, 23.5692, 359.8533, 17, 1);
	AddStaticVehicle(482, 1660.7136, -1016.1744, 23.9634, 11.4114, 20, 117);
	AddStaticVehicle(496, 1689.934, -1035.6692, 23.6231, 178.1297, 20, 20);
	AddStaticVehicle(429, 1712.4379, -1005.7189, 23.5937, 351.9539, 13, 13);
	AddStaticVehicle(542, 1731.1282, -1009.0837, 23.6852, 348.17, 119, 113);
	AddStaticVehicle(496, 1757.4509, -1037.7462, 23.8359, 180.9093, 39, 39);
	AddStaticVehicle(475, 1770.8777, -1061.7106, 23.7646, 179.464, 26, 104);
	AddStaticVehicle(496, 1780.0526, -1069.8851, 23.677, 359.9332, 9, 14);
	AddStaticVehicle(536, 1762.5533, -1085.8549, 23.6983, 180.703, 57, 96);
	AddStaticVehicle(518, 1740.1122, -1085.832, 23.6318, 181.083, 74, 59);
	AddStaticVehicle(542, 1726.2168, -1085.2207, 23.6669, 182.7872, 122, 113);
	AddStaticVehicle(549, 1699.9979, -1068.8979, 23.6031, 357.971, 75, 39);
	AddStaticVehicle(400, 1713.3634, -1061.1498, 23.9985, 181.1158, 36, 1);
	AddStaticVehicle(496, 1640.7484, -1038.1542, 23.615, 358.3014, 0, 0);
	AddStaticVehicle(542, 1594.9391, -1009.9454, 23.6493, 185.8625, 13, 118);
	AddStaticVehicle(482, 1577.2344, -1040.1863, 24.0271, 141.0052, 52, 52);
	AddStaticVehicle(536, 1562.9835, -1011.3809, 23.6439, 359.5882, 12, 1);
	AddStaticVehicle(496, 1546.6223, -1026.6492, 23.6228, 162.1279, 74, 72);
	AddStaticVehicle(463, 1577.0701, -1008.9494, 23.4464, 165.1993, 7, 7);
	AddStaticVehicle(521, 1592.5432, -1057.9313, 23.4784, 297.7319, 118, 118);
	AddStaticVehicle(461, 1651.4, -1015.1333, 23.4877, 216.5875, 88, 1);
	AddStaticVehicle(463, 1694.4098, -1003.8555, 23.4463, 216.3939, 11, 11);
	AddStaticVehicle(521, 1748.7355, -1039.5499, 23.5323, 15.0375, 134, 95);
	AddStaticVehicle(542, 1657.546, -1137.0397, 23.6497, 178.333, 24, 118);
	AddStaticVehicle(589, 1616.6453, -1128.1941, 23.5644, 92.6623, 23, 23);
	AddStaticVehicle(484, 2947.8057, -2052.6362, 0.4738, 359.4145, 50, 32);
	AddStaticVehicle(456, 2313.5281, -2310.5837, 13.7196, 133.0174, 91, 63);
	AddStaticVehicle(455, 2264.7073, -2335.1189, 13.9838, 314.5604, 84, 58);
	AddStaticVehicle(455, 2612.2107, -2198.1665, 13.9835, 180.483, 84, 31);
	AddStaticVehicle(525, 2572.6416, -2240.2261, 13.4192, 93.6711, 17, 20);
	AddStaticVehicle(453, 2505.7712, -2269.1885, -0.312, 268.6544, 56, 56);
	AddStaticVehicle(453, 2307.9446, -2414.1733, -0.2071, 314.9561, 56, 56);
	AddStaticVehicle(455, 2189.0393, -2649.3572, 13.9833, 266.7652, 1, 31);
	AddStaticVehicle(525, 2226.0032, -2677.0149, 13.4329, 4.2993, 18, 20);
	AddStaticVehicle(552, 2200.3921, -2638.4026, 13.2521, 357.1788, 56, 56);
	AddStaticVehicle(422, 2203.6013, -2595.3611, 13.5221, 87.9727, 83, 57);
	AddStaticVehicle(422, 2206.7747, -2527.8098, 13.5299, 94.0067, 67, 59);
	AddStaticVehicle(525, 2510.2681, -2629.5205, 13.5251, 88.6646, 22, 30);
	AddStaticVehicle(456, 2491.5276, -2671.4338, 13.8094, 180.9983, 110, 93);
	AddStaticVehicle(455, 2498.7861, -2572.7219, 14.0866, 357.5439, 84, 15);
	AddStaticVehicle(422, 2516.4746, -2452.8889, 13.6216, 44.3283, 96, 25);
	AddStaticVehicle(470, 2764.3169, -2383.4829, 13.6235, 181.4826, 43, 0);
	AddStaticVehicle(470, 2779.573, -2440.3181, 13.6296, 267.8545, 43, 0);
	AddStaticVehicle(470, 2737.374, -2485.676, 13.6431, 87.2884, 43, 0);
	AddStaticVehicle(400, 2744.2754, -2447.5588, 13.7433, 179.2557, 40, 84);
	AddStaticVehicle(400, 2765.2122, -2531.8735, 13.7407, 359.5258, 40, 84);
	AddStaticVehicle(400, 2784.2922, -2387.0547, 13.7279, 89.7828, 40, 84);
	AddStaticVehicle(400, 2753.1467, -2387.5439, 13.7358, 1.3794, 40, 84);
	AddStaticVehicle(552, 2656.9172, -2451.1821, 13.3204, 93.4499, 49, 49);
	AddStaticVehicle(422, 2428.1499, -2492.5559, 13.6317, 45.6813, 111, 31);
	AddStaticVehicle(530, 2435.3372, -2434.5278, 13.3911, 41.7356, 112, 1);
	AddStaticVehicle(530, 2418.4021, -2506.5557, 13.4131, 273.468, 114, 1);
	AddStaticVehicle(530, 2205.8362, -2571.1787, 13.3094, 85.7644, 119, 1);
	AddStaticVehicle(455, 2152.5361, -2148.2825, 13.986, 310.8004, 1, 31);
	AddStaticVehicle(439, 1373.6738, -1634.1741, 13.279, 271.5004, 8, 17);
	AddStaticVehicle(542, 1362.9803, -1659.5125, 13.1263, 270.4668, 32, 92);
	AddStaticVehicle(475, 1359.668, -1749.6177, 13.1843, 0.0962, 21, 1);
	AddStaticVehicle(439, 1401.3602, -1507.1211, 13.4834, 163.4146, 67, 8);
	AddStaticVehicle(475, 1500.1357, -1487.4355, 13.3556, 91.3002, 2, 39);
	AddStaticVehicle(542, 1797.1293, -1701.1102, 13.2757, 179.534, 31, 93);
	AddStaticVehicle(521, 1807.9387, -1688.3774, 13.1068, 105.3693, 75, 13);
	AddStaticVehicle(414, 1781.86, -1701.3483, 13.5957, 3.8341, 25, 1);
	AddStaticVehicle(475, 306.773, -1438.4087, 27.7341, 120.6372, 33, 0);
	AddStaticVehicle(475, 1277.5547, -1610.1168, 13.3511, 90.3928, 2, 39);
	AddStaticVehicle(439, 1670.6208, -1886.9011, 13.4429, 2.8833, 65, 79);
	AddStaticVehicle(414, 1653.4976, -1837.6439, 13.64, 1.1054, 72, 1);
	AddStaticVehicle(475, 1145.1482, -1366.7389, 13.5456, 184.4175, 2, 39);
	AddStaticVehicle(418, 2090.4797, -1556.7979, 13.2113, 181.8175, 114, 114);
	AddStaticVehicle(403, 2201.249, -2241.3311, 14.1532, 135.1536, 30, 1);
	AddStaticVehicle(403, 2196.7461, -2236.3652, 14.1486, 134.2909, 28, 1);
	AddStaticVehicle(403, 2208.1824, -2296.9404, 15.3708, 136.0373, 25, 1);
	AddStaticVehicle(439, 2393.2522, -1927.3457, 13.2782, 179.4218, 65, 79);
	AddStaticVehicle(475, 2383.3689, -1928.1165, 13.1844, 179.4976, 56, 29);
	AddStaticVehicle(521, 2376.876, -1929.3613, 12.9563, 341.1395, 87, 118);
	AddStaticVehicle(439, 2349.1824, -2000.2684, 13.2666, 267.0585, 25, 78);
	AddStaticVehicle(420, 1775.6141, -1860.01, 13.2745, 269.2006, 6, 1);
	AddStaticVehicle(420, 1763.0121, -1860.0037, 13.2723, 271.2998, 6, 1);
	AddStaticVehicle(420, 1748.9358, -1859.9502, 13.2721, 270.3943, 6, 1);
	AddStaticVehicle(420, 1734.6754, -1859.9305, 13.274, 270.5646, 6, 1);
	AddStaticVehicle(542, 1512.3342, -2211.7639, 13.294, 359.3842, 45, 92);
	AddStaticVehicle(518, 1546.2539, -2211.5557, 13.2254, 178.7042, 37, 0);
	AddStaticVehicle(521, 1560.0939, -2243.5127, 13.1179, 94.0584, 118, 118);
	AddStaticVehicle(429, 1441.7079, -2225.1514, 13.2265, 1.5921, 13, 13);
	AddStaticVehicle(518, 1454.6436, -2224.9185, 13.2177, 0.2168, 41, 29);
	AddStaticVehicle(496, 1408.1469, -2242.1521, 13.263, 359.3946, 9, 14);
	AddStaticVehicle(439, 1398.157, -2225.4885, 13.4427, 179.626, 37, 78);
	AddStaticVehicle(475, 1391.6555, -2241.8704, 13.3495, 180.5889, 33, 0);
	AddStaticVehicle(542, 1364.5348, -2242.7036, 13.2899, 270.7713, 119, 113);
	AddStaticVehicle(542, 1404.6641, -2314.1211, 13.2898, 180.5298, 122, 113);
	AddStaticVehicle(518, 1411.2491, -2347.343, 13.2101, 180.0483, 9, 39);
	AddStaticVehicle(496, 1391.5173, -2364.2131, 13.2633, 179.7053, 0, 0);
	AddStaticVehicle(521, 1365.7269, -2351.5515, 13.1069, 87.0619, 92, 3);

	AddStaticVehicle(402, -2507.2949, -2661.3745, 41.6141, 47.4363, 110, 110);
	AddStaticVehicle(489, -2226.7434, -2328.2502, 30.7267, 320.7235, 112, 120);
	AddStaticVehicle(489, -2222.251, -2313.6255, 30.7043, 139.2188, 84, 110);
	AddStaticVehicle(492, -2237.1716, -2319.5217, 30.1612, 320.8835, 81, 27);
	AddStaticVehicle(416, -2202.5034, -2315.8738, 30.7133, 319.2146, 1, 3);
	AddStaticVehicle(437, -2183.7781, -2251.1504, 30.7739, 50.7582, 47, 74);
	AddStaticVehicle(439, -2195.2422, -2265.3093, 30.521, 141.9245, 67, 8);
	AddStaticVehicle(468, -2119.6216, -2309.6587, 30.2906, 236.4014, 46, 46);
	AddStaticVehicle(468, -2090.2646, -2343.2664, 30.2931, 133.5882, 46, 46);
	AddStaticVehicle(478, -2139.3381, -2394.7605, 30.5346, 321.4478, 39, 1);
	AddStaticVehicle(403, -2000.1112, -2415.5122, 31.591, 229.2187, 42, 76);
	AddStaticVehicle(578, -1969.7488, -2437.875, 31.2884, 278.4375, 1, 1);
	AddStaticVehicle(483, -2047.1421, -2548.5454, 30.6175, 143.9577, 1, 5);
	AddStaticVehicle(496, -2090.5361, -2547.2097, 30.3414, 319.1863, 22, 22);
	AddStaticVehicle(499, -2147.2827, -2540.939, 30.6123, 321.3171, 30, 44);
	AddStaticVehicle(507, -2198.5273, -2501.1497, 30.4429, 142.3857, 42, 42);
	AddStaticVehicle(508, -2238.4976, -2476.8638, 31.5504, 135.3413, 1, 1);
	AddStaticVehicle(525, -2201.8979, -2431.7083, 30.5065, 143.2419, 18, 20);
	AddStaticVehicle(542, -2208.8726, -2301.8511, 30.3685, 141.4184, 24, 118);
	AddStaticVehicle(468, -2408.1938, -2180.655, 32.9574, 359.2591, 46, 46);
	AddStaticVehicle(468, -2408.5, -2185.9998, 32.947, 320.6251, 46, 46);
	AddStaticVehicle(468, -2404.6194, -2184.0007, 32.958, 180.5767, 46, 46);
	AddStaticVehicle(468, -2410.8003, -2193.1538, 32.9575, 98.739, 46, 46);
	AddStaticVehicle(468, -2383.4412, -2195.6008, 32.9551, 269.5914, 46, 46);
	AddStaticVehicle(421, -2232.4705, -2168.4863, 40.0861, 269.7545, 60, 72);
	AddStaticVehicle(586, -2211.9084, -2152.1482, 44.5665, 39.1714, 32, 1);
	AddStaticVehicle(510, -2341.5479, -1617.2042, 483.2097, 282.5971, 32, 1);
	AddStaticVehicle(483, -2343.2617, -1613.8766, 483.6216, 105.4733, 17, 0);
	AddStaticVehicle(508, -2338.5103, -1593.7384, 483.9936, 19.6733, 1, 1);
	AddStaticVehicle(542, -1903.3435, -1648.1373, 21.4948, 0.2053, 119, 113);
	AddStaticVehicle(543, -1884.324, -1746.2726, 21.5641, 116.1925, 11, 11);
	AddStaticVehicle(568, -1425.6388, -1964.6725, 16.7105, 350.8758, 21, 1);
	AddStaticVehicle(568, -1422.0557, -1774.0085, 46.2861, 324.6743, 21, 1);
	AddStaticVehicle(424, -1642.4336, -2250.6626, 31.2032, 90.7391, 3, 2);
	AddStaticVehicle(471, -1623.8788, -1935.3231, 98.1842, 9.9608, 120, 113);
	AddStaticVehicle(471, -1423.5978, -1480.9163, 101.1533, 181.2331, 120, 113);
	AddStaticVehicle(478, -1446.126, -1494.6138, 101.7287, 5.6246, 20, 1);
	AddStaticVehicle(468, -1460.75, -1566.6244, 101.4172, 1.4063, 3, 3);
	AddStaticVehicle(455, -1921.1332, -1376.5702, 40.8204, 60.9558, 43, 31);
	AddStaticVehicle(568, -2675.916, -2647.4185, 8.687, 28.6794, 21, 1);
	AddStaticVehicle(527, -2504.5608, -2310.4421, 14.8242, 97.2619, 81, 1);
	AddStaticVehicle(543, -2522.907, -2151.9607, 30.3162, 29.5732, 67, 8);
	AddStaticVehicle(568, -2675.916, -2647.4185, 8.687, 28.6794, 21, 1);
	AddStaticVehicle(487, -2249.4399, -1714.577, 480.34, 224.1963, 26, 3);
	AddStaticVehicle(500, -2390.3206, -1866.1573, 405.1097, 113.9224, 25, 119);
	AddStaticVehicle(533, -2096.2732, -1879.9227, 110.108, 326.6144, 79, 1);
	AddStaticVehicle(540, -2515.5264, -1995.7284, 166.3035, 28.0149, 7, 7);
	AddStaticVehicle(554, -2669.3086, -1735.2327, 252.3595, 12.2743, 53, 32);
	AddStaticVehicle(559, -2590.593, -1618.1426, 343.4677, 186.3544, 2, 1);
	AddStaticVehicle(579, -2106.7739, -1752.2147, 195.3652, 327.5763, 53, 53);
	AddStaticVehicle(595, -2819.6802, -2525.9888, 0.4586, 189.6302, 112, 20);
	AddStaticVehicle(453, -2741.3564, -2707.7283, 0.1389, 208.1954, 56, 56);
	AddStaticVehicle(484, -2548.1646, -2873.2219, 0.3669, 268.3289, 40, 26);
	AddStaticVehicle(484, -2476.8723, -2872.8672, 0.4027, 271.5837, 40, 26);
	AddStaticVehicle(473, -2251.1206, -2847.8003, -0.3512, 165.8474, 56, 53);
	AddStaticVehicle(424, -2242.9829, -2821.887, 2.7472, 94.074, 15, 30);
	AddStaticVehicle(506, -1604.347, -2709.353, 48.2387, 54.1573, 3, 3);
	AddStaticVehicle(536, -1561.9785, -2720.5659, 48.275, 234.6728, 37, 1);
	AddStaticVehicle(545, -1569.3097, -2733.4148, 48.3547, 326.8112, 28, 96);
	AddStaticVehicle(582, -1557.6207, -2741.3735, 48.599, 146.9182, 41, 20);
	AddStaticVehicle(430, -1190.5161, -2686.8108, -0.2699, 13.1617, 46, 26);
	AddStaticVehicle(478, -1220.1482, -2632.0308, 9.9623, 84.2916, 59, 1);
	AddStaticVehicle(473, -1249.5088, -2431.4194, -0.1994, 349.6535, 56, 15);
	AddStaticVehicle(473, -1183.5031, -2138.8706, -0.242, 8.5587, 56, 15);
	AddStaticVehicle(446, -1429.5232, -2080.6206, -0.3127, 148.7616, 1, 35);
	AddStaticVehicle(446, -1544.0499, -2232.3506, -0.5151, 167.9522, 1, 35);
	AddStaticVehicle(453, -1639.3208, -1706.3165, -0.3042, 73.088, 56, 56);
	AddStaticVehicle(460, -2038.772, -1314.9452, 1.7166, 80.6954, 17, 23);
	AddStaticVehicle(493, -2417.8992, -944.8141, -0.1597, 61.3139, 36, 13);
	AddStaticVehicle(542, -2217.0332, -2407.2427, 30.8341, 232.1176, 24, 118);
	AddStaticVehicle(468, -2508.1077, -1892.6254, 297.1185, 25.0147, 46, 46);

	AddStaticVehicle(513, 291.1346, 2535.585, 17.3778, 180.2974, 21, 36);
	AddStaticVehicle(512, 324.4324, 2535.6506, 17.5121, 181.8785, 89, 91);
	AddStaticVehicle(476, 403.6754, 2456.9727, 16.7825, 357.7751, 15, 123);
	AddStaticVehicle(417, 364.4265, 2535.2258, 16.7616, 143.5451, 0, 0);
	AddStaticVehicle(586, 423.4558, 2541.1025, 15.9887, 339.6539, 10, 1);
	AddStaticVehicle(543, 385.2093, 2603.5049, 16.308, 192.7106, 67, 8);
	AddStaticVehicle(468, 383.9264, 2590.5933, 16.1533, 275.5223, 46, 46);
	AddStaticVehicle(473, 260.6835, 2936.9685, 0.129, 358.4063, 56, 53);
	AddStaticVehicle(586, -237.9596, 2595.8259, 62.2231, 181.1165, 122, 1);
	AddStaticVehicle(468, -146.0389, 2681.6436, 62.0454, 272.4597, 46, 46);
	AddStaticVehicle(429, -213.1005, 2609.1829, 62.3828, 359.865, 13, 13);
	AddStaticVehicle(600, -201.2879, 2594.717, 62.422, 1.1029, 32, 8);
	AddStaticVehicle(489, -270.6937, 2675.0889, 62.7954, 251.3489, 14, 123);
	AddStaticVehicle(471, -165.8631, 2715.074, 61.9532, 88.0077, 103, 111);
	AddStaticVehicle(420, -208.3269, 2723.999, 62.4695, 267.2648, 6, 1);
	AddStaticVehicle(489, -290.5132, 2721.2917, 62.4475, 181.4169, 112, 120);
	AddStaticVehicle(463, -322.7055, 2671.4551, 62.2949, 179.9792, 79, 79);
	AddStaticVehicle(489, -303.7003, 2683.5918, 62.7898, 180.7489, 120, 123);
	AddStaticVehicle(468, -255.1318, 2766.75, 61.9963, 181.5453, 3, 3);
	AddStaticVehicle(604, -171.7224, 2759.3877, 62.4067, 24.1882, 2, 76);
	AddStaticVehicle(424, -17.3881, 2355.6077, 23.8879, 143.4369, 3, 2);
	AddStaticVehicle(470, 304.7515, 1839.3784, 17.5989, 336.0933, 43, 0);
	AddStaticVehicle(433, 301.75, 1863.875, 18.0533, 360.0, 43, 0);
	AddStaticVehicle(548, 296.0859, 1925.9017, 19.3104, 236.2604, 1, 1);
	AddStaticVehicle(548, 314.9759, 2046.6259, 19.2481, 157.8634, 1, 1);
	AddStaticVehicle(548, 350.5939, 1984.1194, 19.3047, 92.2205, 1, 1);
	AddStaticVehicle(470, 282.3898, 1955.389, 17.6341, 270.8638, 43, 0);
	AddStaticVehicle(543, -210.2042, 2609.1667, 62.5216, 181.28, 32, 8);
	AddStaticVehicle(482, -528.5228, 2571.3865, 53.5349, 269.274, 32, 32);
	AddStaticVehicle(424, -527.7629, 2604.1191, 53.1937, 271.2167, 2, 2);
	AddStaticVehicle(411, -519.1963, 2617.6292, 53.1448, 90.1552, 64, 1);
	AddStaticVehicle(600, -421.8827, 2225.4055, 42.0774, 180.3449, 8, 90);
	AddStaticVehicle(568, -363.7965, 2215.8901, 42.3509, 72.2219, 9, 39);
	AddStaticVehicle(568, -366.0048, 2213.4297, 42.3455, 69.9285, 17, 1);
	AddStaticVehicle(471, -399.0436, 2252.6685, 41.8178, 300.8135, 120, 112);
	AddStaticVehicle(461, -301.5291, 1777.7788, 42.272, 92.88, 37, 1);
	AddStaticVehicle(468, -290.4525, 1746.2904, 42.3604, 91.2906, 3, 3);
	AddStaticVehicle(508, -302.0461, 1755.6252, 43.0626, 271.135, 1, 1);
	AddStaticVehicle(568, -162.9634, 1673.1277, 14.4768, 202.5489, 21, 1);
	AddStaticVehicle(508, -285.4013, 1562.1003, 75.7344, 137.1875, 1, 1);
	AddStaticVehicle(468, -307.6941, 1556.6575, 75.0275, 45.628, 46, 46);
	AddStaticVehicle(424, -299.3567, 1577.7837, 75.1395, 313.4809, 3, 2);
	AddStaticVehicle(478, -336.6758, 1514.6866, 75.352, 180.0568, 45, 1);
	AddStaticVehicle(495, -359.6404, 1596.7112, 77.361, 356.9484, 115, 43);
	AddStaticVehicle(477, -333.5037, 1515.067, 75.1135, 180.809, 94, 1);
	AddStaticVehicle(421, -291.1455, 1308.1112, 53.8199, 82.9306, 71, 72);
	AddStaticVehicle(581, -291.5828, 1293.2133, 53.2624, 258.5006, 58, 1);
	AddStaticVehicle(403, -290.1071, 1317.401, 55.3024, 262.6769, 24, 77);
	AddStaticVehicle(433, 277.9318, 2020.2458, 18.0773, 271.3422, 43, 0);
	AddStaticVehicle(433, 277.5226, 2025.6991, 18.0772, 270.0389, 43, 0);
	AddStaticVehicle(470, 183.5019, 1930.6356, 17.8497, 181.7918, 43, 0);
	AddStaticVehicle(470, 270.1317, 1830.0344, 17.6344, 143.8543, 43, 0);
	AddStaticVehicle(470, 121.0928, 1926.0619, 19.0886, 306.0423, 43, 0);
	AddStaticVehicle(470, 103.0628, 1914.8339, 18.3727, 40.8428, 43, 0);
	AddStaticVehicle(468, 140.1879, 1893.0078, 18.0574, 274.7855, 6, 6);
	AddStaticVehicle(468, 136.2435, 1892.8341, 18.0553, 270.1823, 46, 46);
	AddStaticVehicle(470, 134.6078, 1849.7643, 17.6816, 91.4023, 43, 0);
	AddStaticVehicle(433, 301.8881, 1877.5836, 18.0772, 359.7517, 43, 0);
	AddStaticVehicle(548, 359.2137, 1913.947, 19.2744, 133.3756, 1, 1);
	AddStaticVehicle(586, -89.7496, 1365.3422, 9.7936, 285.2903, 10, 1);
	AddStaticVehicle(466, -85.4119, 1340.1921, 10.5036, 7.1843, 68, 76);
	AddStaticVehicle(468, 9.3781, 1377.7744, 8.8402, 294.2037, 6, 6);
	AddStaticVehicle(422, 833.7327, 840.1547, 11.8228, 24.4117, 101, 25);
	AddStaticVehicle(543, 830.2897, 838.6003, 11.3841, 23.9283, 43, 8);
	AddStaticVehicle(468, 827.4531, 860.1788, 12.0124, 109.8286, 46, 46);
	AddStaticVehicle(422, 836.8755, 842.0146, 12.0941, 26.4861, 111, 31);
	AddStaticVehicle(468, 580.7761, 864.2721, -43.7228, 275.0642, 53, 53);
	AddStaticVehicle(468, 631.1497, 894.8027, -43.246, 149.4182, 3, 3);
	AddStaticVehicle(543, 683.038, 839.5352, -43.1469, 55.171, 67, 8);
	AddStaticVehicle(543, 576.0908, 872.8019, -43.8402, 181.5102, 8, 90);
	AddStaticVehicle(554, 486.3824, 859.6133, -29.9394, 199.5197, 45, 32);
	AddStaticVehicle(468, 325.5537, 854.3142, 20.0746, 292.9197, 46, 46);
	AddStaticVehicle(422, 374.6481, 870.9434, 20.3944, 29.1111, 67, 59);
	AddStaticVehicle(554, 368.3893, 869.1057, 20.4881, 353.6958, 34, 30);
	AddStaticVehicle(468, 446.0428, 914.1238, -8.4729, 4.2421, 3, 3);
	AddStaticVehicle(408, -82.4225, 1133.9078, 20.2849, 89.4278, 26, 26);
	AddStaticVehicle(600, -140.4019, 1132.2213, 19.4622, 166.3078, 43, 8);
	AddStaticVehicle(402, -177.5177, 1219.8247, 19.5739, 89.4745, 13, 13);
	AddStaticVehicle(478, -247.5334, 1183.9092, 19.7249, 89.957, 59, 1);
	AddStaticVehicle(420, -131.1938, 1216.3356, 19.5211, 273.1837, 6, 1);
	AddStaticVehicle(463, -86.8976, 1222.4147, 19.2826, 1.5395, 84, 84);
	AddStaticVehicle(475, -34.2045, 1166.1117, 19.247, 180.8655, 9, 39);
	AddStaticVehicle(479, -14.0528, 1219.9521, 19.1505, 180.8122, 59, 36);
	AddStaticVehicle(508, 5.572, 1164.8835, 19.9813, 180.1032, 1, 1);
	AddStaticVehicle(546, 70.3248, 1218.6127, 18.5363, 344.9671, 78, 38);
	AddStaticVehicle(554, 59.339, 1157.976, 18.7484, 180.9685, 15, 32);
	AddStaticVehicle(600, 92.6611, 1173.931, 18.3813, 90.7633, 11, 11);
	AddStaticVehicle(543, -30.8094, 1083.9031, 19.5579, 1.117, 32, 8);
	AddStaticVehicle(468, -22.2045, 1123.5083, 19.4094, 176.0903, 46, 46);
	AddStaticVehicle(403, -159.1066, 1060.1151, 20.6254, 0.9132, 62, 77);
	AddStaticVehicle(599, -224.1936, 992.7146, 19.7456, 270.4413, 0, 1);
	AddStaticVehicle(599, -224.8071, 998.3138, 19.7815, 274.794, 0, 1);
	AddStaticVehicle(416, -303.5811, 1036.1851, 19.7425, 270.8693, 1, 3);
	AddStaticVehicle(416, -305.4525, 1028.0148, 19.7435, 90.5686, 1, 3);
	AddStaticVehicle(543, -304.5286, 1015.9146, 19.415, 271.5633, 67, 8);
	AddStaticVehicle(401, -305.0732, 1019.7994, 19.3733, 272.2266, 66, 66);
	AddStaticVehicle(471, -255.7188, 1059.0928, 19.2251, 123.921, 120, 114);
	AddStaticVehicle(542, -353.3448, 1160.9194, 19.4856, 208.7233, 24, 118);
	AddStaticVehicle(489, -369.5547, 1127.0491, 19.903, 88.9193, 14, 123);
	AddStaticVehicle(478, -314.7126, 1175.3938, 19.7328, 359.4184, 35, 1);
	AddStaticVehicle(468, -2.8215, 943.7739, 19.2857, 266.8889, 3, 3);
	AddStaticVehicle(600, 13.2779, 904.8585, 23.3526, 188.5502, 43, 8);
	AddStaticVehicle(421, -43.5167, 892.946, 22.0018, 142.2973, 71, 72);
	AddStaticVehicle(463, -330.2067, 827.7351, 13.7821, 359.8963, 53, 53);
	AddStaticVehicle(482, -288.9207, 833.3483, 13.2276, 94.7101, 32, 32);
	AddStaticVehicle(525, 594.1296, 1239.8491, 11.596, 43.6646, 17, 20);
	AddStaticVehicle(403, 582.1791, 1215.078, 12.8863, 211.4348, 39, 78);
	AddStaticVehicle(543, 575.5624, 1209.5081, 12.1971, 211.329, 76, 8);
	AddStaticVehicle(554, 484.7194, 1381.9646, 4.7876, 235.201, 14, 32);
	AddStaticVehicle(543, 197.9468, 1415.4565, 10.4055, 91.7165, 67, 8);
	AddStaticVehicle(500, 195.0309, 1465.7158, 10.6965, 270.6187, 25, 119);
	AddStaticVehicle(468, 253.7791, 1424.7091, 10.2522, 90.4512, 53, 53);
	AddStaticVehicle(586, 650.1385, 1702.9343, 6.5119, 313.6105, 10, 1);
	AddStaticVehicle(567, 658.5644, 1721.3257, 6.8587, 221.6448, 88, 64);
	AddStaticVehicle(586, 651.9063, 1700.9137, 6.5111, 313.4966, 13, 1);
	AddStaticVehicle(411, 608.4836, 1699.7764, 6.7211, 304.8487, 64, 1);
	AddStaticVehicle(411, 612.1846, 1694.9164, 6.7193, 304.3299, 80, 1);
	AddStaticVehicle(403, 600.2841, 1651.9192, 7.5816, 243.8007, 25, 1);
	AddStaticVehicle(435, 605.6486, 1655.4606, 7.5724, 64.8614, 28, 1);
	AddStaticVehicle(450, 635.8098, 1225.5219, 12.7302, 122.5696, 62, 77);
	AddStaticVehicle(567, 686.5157, 1946.5956, 5.4101, 359.8968, 93, 64);
	AddStaticVehicle(401, 706.4429, 1947.4441, 5.3187, 180.868, 52, 52);
	AddStaticVehicle(463, 721.6701, 1948.3236, 5.0788, 359.9206, 84, 84);
	AddStaticVehicle(463, 726.7943, 1948.379, 5.0792, 4.4732, 11, 11);
	AddStaticVehicle(478, 755.5939, 1967.2079, 5.3298, 282.8079, 20, 1);
	AddStaticVehicle(468, 768.3365, 2012.5627, 5.5681, 262.9368, 6, 6);
	AddStaticVehicle(554, 768.9951, 2089.9961, 6.8011, 350.1155, 15, 32);
	AddStaticVehicle(543, -36.5703, 2343.9338, 23.9552, 88.5315, 76, 8);
	AddStaticVehicle(568, -267.6664, 2085.4219, 28.2351, 247.1185, 21, 1);
	AddStaticVehicle(461, 228.3988, 2545.1191, 16.2295, 196.5723, 43, 1);
	AddStaticVehicle(487, 382.8607, 2535.8291, 16.7153, 213.0074, 29, 42);
	AddStaticVehicle(586, 524.6804, 2367.6975, 29.8994, 150.4217, 8, 1);
	AddStaticVehicle(586, 521.06, 2369.9216, 29.8828, 149.7267, 25, 1);
	AddStaticVehicle(475, 528.7834, 2366.8169, 30.2135, 192.6022, 17, 1);
	AddStaticVehicle(473, -483.4696, 2180.584, 40.2966, 179.7985, 56, 53);
	AddStaticVehicle(473, -483.3937, 2187.7937, 40.3838, 179.0521, 56, 15);
	AddStaticVehicle(568, -186.4468, 1861.0107, 51.1178, 240.6369, 56, 29);
	AddStaticVehicle(568, -167.072, 1672.7179, 14.8377, 174.3531, 9, 39);
	AddStaticVehicle(508, 64.9485, 968.3702, 16.9385, 271.081, 1, 1);
	AddStaticVehicle(429, 168.0688, 1182.8462, 14.4375, 171.1509, 14, 14);
	AddStaticVehicle(586, 180.4965, 1170.926, 14.2779, 57.335, 10, 1);
	AddStaticVehicle(424, 309.9406, 1152.244, 8.3663, 92.8471, 24, 53);
	AddStaticVehicle(543, 394.3825, 1148.7456, 8.4119, 247.3248, 32, 8);
	AddStaticVehicle(468, 408.538, 1169.1869, 7.5731, 270.985, 6, 6);
	AddStaticVehicle(549, 418.798, 1164.1499, 7.5854, 270.0799, 72, 39);
	AddStaticVehicle(605, -130.1386, 2244.4834, 31.9744, 169.1918, 0, 0);
	AddStaticVehicle(524, 687.0164, 895.0749, -38.586, 78.9521, 61, 27);
	AddStaticVehicle(525, 596.8069, 872.9095, -43.235, 185.6433, 18, 20);
	AddStaticVehicle(468, -735.1237, 2755.1318, 46.8951, 266.4757, 46, 46);
	AddStaticVehicle(478, -767.0835, 2758.8774, 45.7563, 358.3536, 66, 1);
	AddStaticVehicle(479, -784.2089, 2753.3965, 45.4415, 269.4912, 59, 36);
	AddStaticVehicle(468, -866.5963, 2767.2468, 45.6691, 269.6088, 53, 53);
	AddStaticVehicle(482, -844.1183, 2753.1841, 45.97, 271.7795, 64, 64);
	AddStaticVehicle(460, -943.488, 2640.384, 42.2746, 216.3266, 1, 9);
	AddStaticVehicle(599, -1400.0967, 2631.6567, 55.9455, 89.9378, 0, 1);
	AddStaticVehicle(599, -1408.4203, 2656.5623, 55.8772, 359.9003, 0, 1);
	AddStaticVehicle(600, -1399.9004, 2644.0771, 55.3996, 88.6644, 11, 11);
	AddStaticVehicle(489, -1445.9099, 2629.4878, 55.9792, 68.1607, 14, 123);
	AddStaticVehicle(471, -1447.7238, 2645.5598, 55.317, 254.0852, 74, 91);
	AddStaticVehicle(468, -1474.1904, 2702.0869, 55.426, 157.1582, 53, 53);
	AddStaticVehicle(496, -1478.3545, 2650.0291, 55.5523, 0.1259, 66, 72);
	AddStaticVehicle(522, -1280.2207, 2719.3792, 49.6274, 119.8673, 3, 8);
	AddStaticVehicle(443, -1296.2134, 2713.6497, 50.6959, 5.7505, 20, 1);
	AddStaticVehicle(403, -1329.1465, 2671.8989, 50.6692, 262.2381, 37, 1);
	AddStaticVehicle(435, -1307.8534, 2705.8735, 49.6342, 184.4975, 3, 8);
	AddStaticVehicle(468, -662.1753, 2305.8408, 135.7179, 90.3149, 53, 53);
	AddStaticVehicle(531, -778.7887, 2420.9666, 157.0897, 144.8344, 36, 2);
	AddStaticVehicle(554, -809.7922, 2406.8044, 156.375, 191.0582, 15, 32);

	AddStaticVehicle(599, -807.0116, -942.0936, 104.6271, 314.7196, 0, 1);
	AddStaticVehicle(405, -589.3418, -1079.1355, 23.3771, 236.8904, 24, 1);
	AddStaticVehicle(505, -569.3895, -1048.4032, 24.0146, 237.8018, 14, 123);
	AddStaticVehicle(403, -349.3221, -1052.6652, 59.4551, 89.0788, 14, 123);
	AddStaticVehicle(505, -388.6629, -1150.0758, 69.5786, 357.9839, 14, 123);
	AddStaticVehicle(403, -76.0173, -1110.5597, 1.0456, 157.5384, 36, 2);
	AddStaticVehicle(531, -41.9499, -1153.2262, 1.044, 63.5908, 36, 2);
	AddStaticVehicle(403, -39.6653, -1149.7799, 1.0409, 65.3597, 36, 2);
	AddStaticVehicle(531, -82.1817, -1137.4266, 1.0402, 340.8923, 36, 2);
	AddStaticVehicle(531, -85.4142, -1135.9938, 1.0412, 337.3026, 36, 2);
	AddStaticVehicle(403, -184.4848, -1307.1466, 5.7091, 103.7043, 36, 2);
	AddStaticVehicle(531, -367.7308, -1437.3649, 25.6921, 89.2236, 36, 2);
	AddStaticVehicle(422, -587.1984, -1499.8407, 10.1747, 36.7555, 97, 25);
	AddStaticVehicle(422, -657.5599, -1606.0066, 25.1821, 175.4014, 97, 25);
	AddStaticVehicle(400, -495.5439, -1834.0343, 17.7955, 184.7055, 101, 1);
	AddStaticVehicle(473, -512.5999, -1902.9431, 5.0016, 179.0171, 56, 53);
	AddStaticVehicle(468, -655.3087, -1998.3328, 26.7546, 211.5583, 46, 46);
	AddStaticVehicle(466, -841.4815, -2274.665, 20.8199, 210.7536, 68, 76);
	AddStaticVehicle(466, -714.6012, -2547.3081, 50.9399, 128.7565, 68, 76);
	AddStaticVehicle(473, -485.8806, -2852.4319, -0.1373, 248.4979, 56, 15);
	AddStaticVehicle(473, -196.7365, -2925.3259, 0.0006, 269.7706, 56, 15);
	AddStaticVehicle(473, -237.46, -1794.3876, -0.1057, 3.6694, 56, 15);
	AddStaticVehicle(468, -271.2445, -1790.1851, 10.9364, 163.2745, 3, 3);
	AddStaticVehicle(400, -379.1094, -2171.6399, 46.6781, 140.235, 62, 1);
	AddStaticVehicle(410, -1196.9539, -2364.4788, 18.5773, 236.2259, 9, 1);
	AddStaticVehicle(532, -759.8405, -2458.446, 72.6366, 319.4753, 0, 0);
	AddStaticVehicle(400, -20.6879, -2498.1814, 36.7408, 122.2802, 4, 1);
	AddStaticVehicle(400, -17.069, -2520.2581, 36.7478, 213.8456, 4, 1);
	AddStaticVehicle(410, -31.9095, -2493.5383, 36.3036, 194.0151, 10, 1);
	AddStaticVehicle(599, -11.514, -2512.1458, 36.8428, 121.2561, 0, 1);
	AddStaticVehicle(489, 20.0119, -2648.0332, 40.6164, 92.65, 112, 120);
	AddStaticVehicle(489, -186.1633, -2516.2021, 31.3678, 342.0027, 112, 120);
	AddStaticVehicle(466, -384.6082, -2474.8984, 102.478, 268.9366, 25, 76);
	AddStaticVehicle(466, -485.5412, -2688.4248, 152.3252, 102.3787, 25, 76);
	AddStaticVehicle(471, -765.0049, -2686.1196, 83.7728, 114.8461, 120, 112);
	AddStaticVehicle(586, -1541.8571, -1342.7786, 50.5056, 14.339, 122, 1);
	AddStaticVehicle(586, -1029.8485, -638.6542, 31.528, 93.46, 8, 1);
	AddStaticVehicle(586, -1006.874, -674.109, 31.5279, 275.2718, 8, 1);
	AddStaticVehicle(400, -983.5594, -641.0239, 32.1002, 271.1476, 101, 1);
	AddStaticVehicle(400, -1006.5243, -623.0823, 32.1002, 90.1122, 101, 1);
	AddStaticVehicle(483, -1030.8571, -658.642, 32.0001, 90.1086, 1, 31);
	AddStaticVehicle(531, -940.2722, -498.212, 25.9274, 256.5565, 51, 53);
	AddStaticVehicle(531, -918.0818, -534.8812, 25.9175, 357.6102, 51, 53);
	AddStaticVehicle(532, -1140.084, -991.7651, 130.1964, 86.3863, 0, 0);
	AddStaticVehicle(532, -1164.6876, -1057.4521, 130.2022, 277.322, 0, 0);
	AddStaticVehicle(466, -1407.8011, -1165.6597, 103.0781, 151.5499, 78, 76);
	AddStaticVehicle(531, -1444.6823, -1496.3507, 101.7242, 183.6463, 91, 2);
	AddStaticVehicle(531, -1417.1289, -1534.5874, 101.7193, 184.5565, 91, 2);
	AddStaticVehicle(531, -1451.8495, -1456.9764, 101.7236, 175.8479, 91, 2);
	AddStaticVehicle(468, -219.3871, -906.6091, 40.6608, 186.4501, 46, 46);
	AddStaticVehicle(471, -504.2122, -1660.6406, 10.6085, 43.9901, 103, 111);
	AddStaticVehicle(468, -916.9662, -1459.5214, 122.9255, 13.1392, 46, 46);
	AddStaticVehicle(468, -1071.7697, -1296.8829, 128.8868, 278.976, 46, 46);
	AddStaticVehicle(471, -925.3805, -1439.3502, 125.5587, 24.4562, 74, 83);
	AddStaticVehicle(531, -85.5815, -1608.7993, 2.7154, 300.0013, 36, 2);
	AddStaticVehicle(403, -47.9698, -1570.7786, 3.2227, 152.931, 37, 1);
	AddStaticVehicle(400, -93.063, -1194.6671, 2.3429, 344.3191, 123, 1);
	AddStaticVehicle(422, -81.0025, -1198.4222, 2.2849, 345.3639, 97, 25);

	AddStaticVehicle(487, -2227.7432, 2327.126, 7.7581, 178.662, 29, 42);
	AddStaticVehicle(400, -2272.3713, 2285.2505, 4.9224, 270.0, 120, 123);
	AddStaticVehicle(400, -2251.1697, 2284.9854, 4.9106, 91.8943, 62, 1);
	AddStaticVehicle(418, -2251.1719, 2290.9373, 4.9096, 270.371, 108, 108);
	AddStaticVehicle(587, -2272.0286, 2300.4329, 4.5463, 89.7395, 53, 1);
	AddStaticVehicle(581, -2184.281, 2418.5032, 4.6261, 225.544, 36, 1);
	AddStaticVehicle(484, -2227.5676, 2446.2383, 0.2238, 229.2436, 40, 26);
	AddStaticVehicle(454, -2323.5996, 2492.2419, -0.0163, 230.2643, 26, 26);
	AddStaticVehicle(454, -2238.8279, 2533.397, 0.0677, 228.0608, 26, 26);
	AddStaticVehicle(454, -2235.0234, 2394.8408, 0.2049, 225.3403, 26, 26);
	AddStaticVehicle(484, -2222.4343, 2399.7363, 0.3907, 47.6966, 50, 32);
	AddStaticVehicle(484, -2211.9019, 2412.5371, 0.3222, 45.0241, 66, 36);
	AddStaticVehicle(484, -2035.5737, 2337.9326, 0.3638, 93.894, 66, 36);
	AddStaticVehicle(460, -2044.7676, 2348.114, 1.5708, 85.2721, 46, 23);
	AddStaticVehicle(492, -2351.7927, 2438.0439, 7.5216, 326.6075, 81, 27);
	AddStaticVehicle(484, -2319.6973, 2297.0566, 0.1447, 177.2915, 66, 36);
	AddStaticVehicle(524, -2380.887, 2370.3657, 4.4518, 109.2159, 83, 66);
	AddStaticVehicle(525, -2451.8999, 2302.0273, 4.8566, 90.9255, 1, 1);
	AddStaticVehicle(541, -2621.1914, 2250.5889, 8.0296, 183.8325, 123, 1);
	AddStaticVehicle(541, -2616.7476, 2250.0974, 7.8063, 184.5472, 22, 1);
	AddStaticVehicle(554, -2609.3669, 2251.1685, 8.2939, 182.2681, 12, 32);
	AddStaticVehicle(446, -2597.6831, 2231.7883, -0.5205, 262.0586, 1, 22);
	AddStaticVehicle(581, -2632.2297, 2299.0674, 8.0274, 266.4473, 54, 1);
	AddStaticVehicle(587, -2500.2227, 2326.0215, 4.6304, 267.2316, 95, 1);
	AddStaticVehicle(409, -2492.2183, 2410.7954, 16.2328, 29.643, 1, 1);
	AddStaticVehicle(581, -2635.7234, 2423.7803, 13.5265, 165.2141, 36, 1);
	AddStaticVehicle(419, -2472.6233, 2490.2595, 17.5856, 1.8418, 69, 76);
	AddStaticVehicle(419, -2455.7502, 2489.7153, 16.0495, 2.9791, 87, 76);
	AddStaticVehicle(400, -2471.6484, 2511.5083, 17.842, 178.3649, 84, 110);
	AddStaticVehicle(421, -2377.9495, 2410.4937, 8.1698, 324.3596, 52, 66);
	AddStaticVehicle(493, -2417.5188, 2297.3801, -0.1381, 265.4497, 36, 13);
	AddStaticVehicle(493, -2417.7244, 2291.5913, -0.2166, 266.5734, 36, 13);
	AddStaticVehicle(493, -2418.0994, 2286.5984, 0.1419, 268.6934, 36, 13);
	AddStaticVehicle(587, -2426.7017, 2346.563, 5.0736, 282.6106, 40, 84);
	AddStaticVehicle(587, -2446.9214, 2224.6204, 4.6071, 179.338, 118, 1);
	AddStaticVehicle(496, -2440.604, 2224.332, 4.5603, 179.5986, 0, 0);
	AddStaticVehicle(480, -2470.7988, 2224.3967, 4.618, 180.6733, 53, 53);
	AddStaticVehicle(477, -2482.4893, 2224.7783, 4.5955, 179.0414, 75, 1);
	AddStaticVehicle(530, -2509.7058, 2369.0825, 4.7508, 179.0875, 110, 1);
	AddStaticVehicle(473, -1374.8508, 2116.469, 40.4058, 319.3678, 56, 53);
	AddStaticVehicle(473, -1366.9723, 2106.8796, 40.2918, 315.082, 56, 53);
	AddStaticVehicle(573, -1804.4702, 2045.1581, 9.6246, 294.187, 91, 38);
	AddStaticVehicle(468, -1824.8999, 2035.1219, 8.3037, 212.8331, 46, 46);
	AddStaticVehicle(453, -1854.5022, 2098.843, -0.2039, 102.5433, 56, 56);
	AddStaticVehicle(453, -1860.6494, 2115.2981, -0.3292, 107.9941, 56, 56);
	AddStaticVehicle(453, -1869.9406, 2128.6624, -0.2785, 113.4106, 56, 56);
	AddStaticVehicle(444, -1871.3125, 2166.4583, 4.9119, 130.7896, 32, 42);
	AddStaticVehicle(444, -1877.4138, 2173.9583, 4.4635, 128.7793, 32, 66);
	AddStaticVehicle(445, -1940.1118, 2393.2588, 49.3672, 291.4925, 39, 39);
	AddStaticVehicle(482, -1934.0543, 2377.3718, 49.6189, 290.8993, 34, 34);
	AddStaticVehicle(482, -865.7496, 1541.4736, 22.7941, 89.706, 109, 1);
	AddStaticVehicle(602, -865.9515, 1547.824, 23.0657, 268.7399, 75, 77);
	AddStaticVehicle(602, -866.0584, 1563.5151, 24.3648, 269.9845, 32, 1);
	AddStaticVehicle(420, -866.0, 1557.1432, 23.837, 269.2511, 6, 1);
	AddStaticVehicle(400, -904.0693, 1546.9365, 26.0011, 270.6434, 36, 1);
	AddStaticVehicle(400, -880.8666, 1518.9015, 26.0064, 84.4363, 113, 1);
	AddStaticVehicle(552, -837.0482, 1528.4155, 21.4272, 356.9085, 56, 56);
	AddStaticVehicle(428, -836.9631, 1518.5033, 20.9587, 356.9585, 4, 75);
	AddStaticVehicle(522, -855.4826, 1529.1183, 22.149, 175.2427, 7, 79);
	AddStaticVehicle(522, -854.3849, 1528.8517, 21.831, 177.4948, 36, 105);
	AddStaticVehicle(508, -763.8517, 1643.942, 27.8381, 359.3427, 1, 1);
	AddStaticVehicle(508, -759.1082, 1643.9677, 27.7561, 357.9965, 1, 1);
	AddStaticVehicle(508, -753.882, 1643.4702, 27.6587, 357.3247, 1, 1);
	AddStaticVehicle(508, -779.0374, 1557.928, 27.1835, 359.258, 20, 117);
	AddStaticVehicle(495, -771.3682, 1431.5581, 14.1421, 91.6766, 116, 115);
	AddStaticVehicle(495, -771.4456, 1436.7625, 14.1395, 89.8264, 5, 6);
	AddStaticVehicle(554, -772.0689, 1443.1458, 13.8807, 91.3204, 12, 32);
	AddStaticVehicle(554, -771.5674, 1486.2036, 24.4291, 89.6569, 45, 32);
	AddStaticVehicle(508, -720.9415, 1438.1919, 18.8516, 358.8137, 1, 1);
	AddStaticVehicle(483, -685.9806, 1444.2805, 17.2557, 358.825, 1, 5);
	AddStaticVehicle(452, -859.717, 1383.5663, -0.4432, 255.0147, 1, 35);
	AddStaticVehicle(525, -967.3431, 1322.6412, 39.9578, 290.9068, 52, 54);
	AddStaticVehicle(525, -1202.8787, 1677.6721, 20.1641, 63.42, 52, 54);
	AddStaticVehicle(525, -1492.0199, 1877.8156, 32.5073, 3.4296, 52, 54);
	AddStaticVehicle(554, -1485.6687, 1877.9529, 32.7206, 2.7033, 53, 32);
	AddStaticVehicle(522, -1460.499, 1871.0664, 32.206, 3.0444, 36, 105);
	AddStaticVehicle(522, -1459.1002, 1871.1023, 32.1946, 6.0306, 51, 118);
	AddStaticVehicle(522, -1457.7523, 1871.1093, 32.1942, 8.4307, 3, 8);
	AddStaticVehicle(420, -1450.4545, 1870.4369, 32.4111, 2.9921, 6, 1);
	AddStaticVehicle(525, -1766.5353, 1882.8726, 17.5407, 198.3129, 1, 1);
	AddStaticVehicle(525, -837.5615, 813.0668, 18.5289, 199.0021, 1, 1);
	AddStaticVehicle(421, -680.4999, 948.1251, 12.0152, 36.5625, 36, 1);
	AddStaticVehicle(444, -669.6081, 945.8578, 12.5041, 89.2779, 32, 36);
	AddStaticVehicle(444, -669.888, 950.3906, 12.5041, 92.0677, 32, 53);
	AddStaticVehicle(444, -669.973, 955.0541, 12.5041, 91.0209, 32, 14);
	AddStaticVehicle(545, -710.5756, 939.2571, 12.2113, 182.5872, 53, 53);
	AddStaticVehicle(572, -666.9449, 962.442, 11.7128, 180.1996, 116, 1);
	AddStaticVehicle(473, -792.8611, 937.9167, 0.1685, 121.33, 56, 15);
	AddStaticVehicle(472, -615.6752, 1807.6965, 0.101, 81.714, 56, 53);
	AddStaticVehicle(473, -527.8143, 1634.6472, -0.2518, 232.0554, 56, 15);
	AddStaticVehicle(468, -1044.5811, 1559.1265, 32.8485, 222.25, 3, 3);
	AddStaticVehicle(462, -1214.526, 1841.3584, 41.3185, 264.4565, 13, 13);
	AddStaticVehicle(482, -1203.9337, 1813.2631, 41.8329, 44.3244, 62, 62);
	AddStaticVehicle(568, -1506.3029, 1966.6509, 48.2421, 293.187, 9, 39);
	AddStaticVehicle(510, -767.7841, 1103.9338, 44.4799, 321.7752, 39, 39);

	AddStaticVehicle(466, 287.4403, -53.5151, 1.3217, 180.3743, 62, 34);
	AddStaticVehicle(422, 109.289, -150.6062, 1.7835, 182.5754, 89, 108);
	AddStaticVehicle(498, -196.8096, -232.7299, 1.4901, 90.5921, 133, 57);
	AddStaticVehicle(403, -199.9957, -285.4144, 2.0351, 90.5924, 133, 57);
	AddStaticVehicle(403, -200.2189, -275.2891, 2.0383, 91.6567, 133, 57);
	AddStaticVehicle(578, -194.7877, -196.3295, 2.0529, 257.8566, 133, 57);
	AddStaticVehicle(422, -169.073, -202.1836, 1.4064, 257.8462, 133, 57);
	AddStaticVehicle(402, -39.7196, -377.463, 5.2613, 180.238, 29, 36);
	AddStaticVehicle(566, -9.5253, -377.6481, 5.2111, 178.0852, 30, 8);
	AddStaticVehicle(529, -0.4525, -353.891, 5.0621, 269.4471, 42, 42);
	AddStaticVehicle(603, -62.5941, -324.9349, 5.2677, 90.3766, 70, 67);
	AddStaticVehicle(401, 179.2976, -310.824, 1.3519, 207.7475, 47, 47);
	AddStaticVehicle(445, 319.0325, -126.0534, 2.0656, 90.7404, 120, 119);
	AddStaticVehicle(440, 329.5297, -52.3254, 1.6189, 177.8881, 32, 32);
	AddStaticVehicle(458, 319.1395, -84.5798, 2.0518, 91.7452, 101, 1);
	AddStaticVehicle(467, 218.0327, -178.1497, 1.3182, 270.4043, 58, 8);
	AddStaticVehicle(475, 218.7911, -173.3128, 1.3817, 270.2328, 123, 65);
	AddStaticVehicle(489, 244.8729, -148.5339, 1.7217, 88.835, 14, 123);
	AddStaticVehicle(492, 247.1553, -129.2907, 2.0627, 90.8534, 77, 26);
	AddStaticVehicle(498, 176.3295, -7.4976, 1.648, 180.2088, 105, 113);
	AddStaticVehicle(439, 278.4608, -54.8498, 1.474, 359.8853, 8, 17);
	AddStaticVehicle(475, 320.56, -253.1715, 1.3886, 176.4384, 17, 1);
	AddStaticVehicle(524, 312.2956, -251.1326, 2.5129, 175.4649, 61, 27);
	AddStaticVehicle(527, 235.0123, -300.2693, 1.2937, 2.3086, 53, 1);
	AddStaticVehicle(536, 213.0004, -244.5481, 1.3203, 272.8867, 38, 103);
	AddStaticVehicle(531, 1077.2228, -288.722, 73.9531, 358.7784, 36, 2);
	AddStaticVehicle(422, 1112.765, -306.5776, 73.9655, 267.5965, 101, 25);
	AddStaticVehicle(531, 1067.0962, -288.6843, 73.9569, 2.3921, 51, 53);
	AddStaticVehicle(599, 622.2627, -610.134, 17.3154, 270.2242, 0, 1);
	AddStaticVehicle(599, 622.2755, -606.0399, 17.306, 269.8338, 0, 1);
	AddStaticVehicle(585, 707.2459, -461.4757, 15.9223, 269.7682, 91, 35);
	AddStaticVehicle(500, 667.6416, -461.4851, 16.4435, 268.6327, 40, 84);
	AddStaticVehicle(461, 669.1239, -471.032, 15.9138, 270.803, 37, 1);
	AddStaticVehicle(542, 668.1328, -546.3011, 16.0794, 269.8267, 90, 90);
	AddStaticVehicle(522, 753.754, -586.7284, 16.9004, 181.3295, 36, 105);
	AddStaticVehicle(549, 748.6429, -581.7985, 16.9131, 269.3827, 94, 94);
	AddStaticVehicle(429, 763.1589, -509.2891, 16.8662, 180.4318, 127, 44);
	AddStaticVehicle(547, 786.0645, -498.4352, 17.0708, 3.0965, 123, 1);
	AddStaticVehicle(456, 797.4796, -607.9578, 16.5112, 0.4182, 84, 63);
	AddStaticVehicle(554, 751.6056, -553.2162, 17.3698, 180.8741, 15, 32);
	AddStaticVehicle(445, 1396.5654, 395.3847, 19.6327, 66.5844, 47, 47);
	AddStaticVehicle(559, 1404.218, 411.9715, 19.4141, 67.1748, 58, 8);
	AddStaticVehicle(580, 768.8481, 348.3186, 19.7428, 190.0995, 81, 81);
	AddStaticVehicle(473, 2103.25, -98.4897, -0.2214, 122.9253, 56, 53);
	AddStaticVehicle(473, 2108.5276, -106.2102, -0.2394, 122.9441, 56, 15);
	AddStaticVehicle(448, 2323.3232, 63.0302, 26.0883, 265.2746, 3, 6);
	AddStaticVehicle(439, 2358.1836, -62.4556, 27.3646, 179.8344, 37, 78);
	AddStaticVehicle(436, 2443.998, -47.9166, 26.9963, 179.673, 87, 1);
	AddStaticVehicle(436, 2503.7507, 125.9338, 26.2435, 1.0102, 92, 1);
	AddStaticVehicle(419, 2493.917, 95.978, 26.2806, 179.8299, 47, 76);
	AddStaticVehicle(412, 2549.9116, 81.1802, 26.3143, 270.4565, 10, 8);
	AddStaticVehicle(410, 2551.1191, 9.4253, 26.6691, 270.6199, 9, 1);
	AddStaticVehicle(508, 2502.7742, 6.0906, 27.5812, 2.9588, 1, 1);
	AddStaticVehicle(505, 2380.957, 37.7925, 27.1163, 89.9017, 120, 123);
	AddStaticVehicle(500, 2211.6929, -88.3423, 26.9028, 88.7287, 13, 119);
	AddStaticVehicle(496, 2263.897, -82.7569, 26.2452, 1.1014, 66, 72);
	AddStaticVehicle(492, 2257.5105, -83.1763, 26.3074, 359.2125, 30, 26);
	AddStaticVehicle(405, 2290.2622, 155.5207, 26.9788, 0.109, 24, 1);
	AddStaticVehicle(532, 1996.752, 175.8992, 31.3614, 79.7076, 0, 0);
	AddStaticVehicle(532, 1914.0114, 192.1063, 36.0155, 358.2132, 0, 0);
	AddStaticVehicle(478, 1905.3486, 174.1229, 37.1748, 341.5607, 66, 1);
	AddStaticVehicle(549, 1240.2759, 214.9924, 19.2519, 243.737, 79, 39);
	AddStaticVehicle(550, 1367.7468, 365.9338, 20.3661, 246.2637, 15, 15);
	AddStaticVehicle(547, 1289.3826, 339.9178, 19.2903, 247.19, 123, 1);
	AddStaticVehicle(536, 1231.7341, 295.6075, 19.2922, 336.8393, 57, 96);
	AddStaticVehicle(455, -580.8631, -64.8466, 65.3632, 3.7867, 84, 31);
	AddStaticVehicle(468, -543.4543, -180.5744, 78.075, 4.158, 53, 53);
	AddStaticVehicle(468, -541.5284, -180.6667, 78.0747, 0.224, 53, 53);
	AddStaticVehicle(471, -774.8654, -115.3844, 64.6716, 24.2185, 120, 112);
	AddStaticVehicle(471, -771.7146, -113.4644, 64.8308, 26.8406, 120, 112);
	AddStaticVehicle(532, -273.9301, -41.3983, 3.4405, 339.6638, 0, 0);
	AddStaticVehicle(532, -127.1731, 55.7261, 4.0943, 158.3291, 0, 0);
	AddStaticVehicle(478, -137.3239, -48.9942, 3.1078, 342.2244, 35, 1);
	AddStaticVehicle(475, 1368.2947, 476.275, 19.9363, 335.9672, 37, 0);
	AddStaticVehicle(475, 2331.3064, 133.1183, 26.7203, 270.6836, 17, 1);
	AddStaticVehicle(482, 2308.6682, -74.7184, 26.5995, 89.9092, 48, 48);
	AddStaticVehicle(468, 2208.6223, 110.5543, 27.0101, 275.3439, 53, 53);
	AddStaticVehicle(471, 1923.8339, 147.8248, 36.7282, 93.4718, 103, 111);
	AddStaticVehicle(415, 1586.3274, 38.5556, 24.6067, 272.3959, 25, 1);
	AddStaticVehicle(468, 1547.5862, 10.6921, 23.7739, 265.3787, 3, 3);
	AddStaticVehicle(402, 889.0992, -21.7845, 63.1125, 152.4678, 13, 13);
	AddStaticVehicle(403, 1207.524, 189.3297, 20.9522, 334.8106, 37, 1);
	AddStaticVehicle(416, 1249.8207, 338.2164, 19.6291, 66.7975, 1, 3);
	AddStaticVehicle(482, 1335.0803, 284.7404, 19.686, 243.0011, 52, 52);
	AddStaticVehicle(468, 1414.2616, 248.6772, 19.2239, 65.7798, 6, 6);
	AddStaticVehicle(475, 751.2299, 277.2577, 27.1364, 199.6289, 56, 29);
	AddStaticVehicle(468, 747.8585, 346.7843, 20.1559, 209.1134, 6, 6);
	AddStaticVehicle(403, 221.642, 30.1998, 3.1849, 186.4463, 28, 1);
	AddStaticVehicle(525, 157.2517, -166.2276, 1.4527, 90.9328, 17, 20);
	AddStaticVehicle(532, 20.7659, 24.6322, 4.0942, 340.4432, 0, 0);
	AddStaticVehicle(532, -6.4192, -11.1534, 4.0939, 163.1182, 0, 0);
	AddStaticVehicle(460, -332.7806, -467.6667, 1.6828, 228.5235, 1, 9);
	AddStaticVehicle(403, -564.843, -473.1027, 26.1267, 178.3205, 113, 1);
	AddStaticVehicle(415, -535.2667, -488.2196, 25.2958, 358.2053, 40, 1);
	AddStaticVehicle(479, -499.9452, -472.3691, 25.3184, 178.849, 59, 36);
	AddStaticVehicle(482, -480.437, -486.2536, 25.6331, 177.1059, 64, 64);

	AddStaticVehicle(556, -2345.126, -1605.334, 484.0368, 260.9758, 216, 198);

	LinkVehicleToInterior(AddStaticVehicle(504, -1517.9827, 994.6107, 1037.4454, 269.9938, 198, 157), 15);
	LinkVehicleToInterior(AddStaticVehicle(504, -1398.8826, 1058.7346, 1038.3002, 179.4297, 186, 25), 15);
	LinkVehicleToInterior(AddStaticVehicle(504, -1279.2094, 991.5643, 1036.9727, 87.4943, 250, 20), 15);

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

	FerrisWheelObjects[10] = CreateObject(18877, 389.7734, -2028.4688, 22, 0, 0, 90, 300);
	FerrisWheelObjects[11] = CreateObject(18878, 389.7734, -2028.4688, 22, 0, 0, 90, 300);
	for(i = sizeof(FerrisWheelObjects) - 3; i != -1; --i)
	{
		FerrisWheelObjects[i] = CreateObject(18879, 389.7734, -2028.4688, 22, 0, 0, 90, 300);
		AttachObjectToObject(FerrisWheelObjects[i], FerrisWheelObjects[10], gFerrisCageOffsets[i][0], gFerrisCageOffsets[i][1], gFerrisCageOffsets[i][2], 0.0, 0.0, 90, 0);
	}

	iGate = CreateObject(980, 2233.8757, -2214.9118, 13.5468, 0.0, 0.0, 315.4335);
	iGate4 = CreateObject(980, 2236.8757, -2217.9118, 13.5468, 0.0, 0.0, 315.4335);
	iGate2= CreateObject(980, 2720.827, -2405.449, 13.4609, 0.0, 0.0, 90);
	iGate3= CreateObject(980, 2720.827, -2504.226, 13.4609, 0.0, 0.0, 90);

	Balloon = CreateObject(19335, 836.08, -2000.51, 13.6, 0.0, 0.0, 0.0);
	Fire = CreateObject(18692, 0, 0, 0, 0.0, 0.0, 0.0);
	Fire1 = CreateObject(18692, 0, 0, 0, 0.0, 0.0, 0.0);
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
	AttachObjectToObject(Fire, Balloon, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 1);
	AttachObjectToObject(Fire1, Balloon, 0.0, 0.0, 4.0, 0.0, 0.0, 0.0, 1);

	VipGates = CreateObject(980, 77.9044, 266.1524, 4.4453, 0.0, 0.0, 150.0);

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

	//CreateObject(19076, 2490.6165, -1669.3250, 11.6359, 0.0, 0.0, 0.0);

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
	for(i = GetPlayerPoolSize(); i != -1; --i)
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
	for(i = sizeof(FerrisWheelObjects) - 1; i != -1; --i) DestroyObject(FerrisWheelObjects[i]);
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
	PlayerInfo[playerid][pClicked] = INVALID_PLAYER_ID;
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

	PlayerInfo[playerid][pRaceInfo] = TextDrawCreate(633.0, 348.0, "_");
	TextDrawAlignment(PlayerInfo[playerid][pRaceInfo], 3);
	TextDrawBackgroundColor(PlayerInfo[playerid][pRaceInfo], 255);
	TextDrawFont(PlayerInfo[playerid][pRaceInfo], 1);
	TextDrawLetterSize(PlayerInfo[playerid][pRaceInfo], 0.24, 1.1);
	TextDrawColor(PlayerInfo[playerid][pRaceInfo], -687931137);
	TextDrawSetOutline(PlayerInfo[playerid][pRaceInfo], 0);
	TextDrawSetProportional(PlayerInfo[playerid][pRaceInfo], 1);
	TextDrawSetShadow(PlayerInfo[playerid][pRaceInfo], 1);

	PlayerInfo[playerid][pVehSpeed] = CreatePlayerTextDraw(playerid, 72.5, 319.0, "_");
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pVehSpeed], 3);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pVehSpeed], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pVehSpeed], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pVehSpeed], 0.309996, 1.099997);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pVehSpeed], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pVehSpeed], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pVehSpeed], 1);

	PlayerInfo[playerid][pMutedTime] = CreatePlayerTextDraw(playerid, 17.0, 428.0, "_");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pMutedTime], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pMutedTime], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pMutedTime], 0.39, 1.1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pMutedTime], -16776961);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pMutedTime], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pMutedTime], 1);

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
	RemoveBuildingForPlayer(playerid, 3751, 389.875, -2035.3828, 29.9531, 50);
	RemoveBuildingForPlayer(playerid, 6298, 389.7734, -2028.4688, 19.8047, 0.5);
	RemoveBuildingForPlayer(playerid, 6461, 389.7734, -2028.5, 20.1094, 0.5);
	RemoveBuildingForPlayer(playerid, 3752, 389.875, -2028.5, 32.2266, 50);

	new string[145];
	GetPlayerName(playerid, PlayerInfo[playerid][pName], MAX_PLAYER_NAME);
	format(string, sizeof string, "*** %s (id: %d) вошел(ла) на сервер", PlayerInfo[playerid][pName], playerid);
	SendClientMessageToAll(COLOR_GRAY, string);
	PlaySoundForAll(1056, 0.0, 0.0, 0.0);
	for(new i = strlen(PlayerInfo[playerid][pName]) - 1; i != -1; --i)
	{
		switch(PlayerInfo[playerid][pName][i])
		{
			case 'A'..'Z', 'a'..'z', '[', ']', '_':{}
			default:
			{
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
			SendClientMessage(playerid, COLOR_RED, "Вы не администратор сервера!");
			Ban2(playerid);
			return 1;
		}
		new iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			new admin;
			ini_getInteger(iniFile, "Admin", admin);
			if(!admin)
			{
				SendClientMessage(playerid, COLOR_RED, "Вы не администратор сервера!");
				ini_closeFile(iniFile);
				Ban2(playerid);
				return 1;
			}
			ini_closeFile(iniFile);
		}
	}
	new connecting_ip[16];
	GetPlayerIp(playerid, connecting_ip, sizeof connecting_ip);
	if(GetNumberOfPlayersOnThisIP(connecting_ip) > MAX_CONNECTIONS_FROM_IP) return Kick2(playerid);
	format(string, sizeof string, "Welcome To ~n~~g~Los Santos ~n~~r~Gang War ~n~~y~%s!", PlayerInfo[playerid][pName]);
	GameTextForPlayer(playerid, string, 4500, 1);
	PlayerPlaySound(playerid, 1097, 0.0, 0.0, 0.0);
	TextDrawShowForPlayer(playerid, TDLogo2);
	ShowPlayerDialog(playerid, DIALOG_RULES, DIALOG_STYLE_MSGBOX, "{FF0000}Правила поведения на сервере GTA SA GangWar", RulesStr, "Принять", "Отмена");
	SendClientMessage(playerid, COLOR_RED, "---------------------------------------------------------------------------------");
	SendClientMessage(playerid, COLOR_RED, "Для помощи наберите: /help");
	SendClientMessage(playerid, COLOR_RED, "---------------------------------------------------------------------------------");
	SendClientMessage(playerid, COLOR_GREEN, "---------------------------------------------------------------------------------");
	SendClientMessage(playerid, COLOR_GREEN, "Для просмотра команд наберите: /icommands");
	SendClientMessage(playerid, COLOR_GREEN, "---------------------------------------------------------------------------------");
	PlayerInfo[playerid][pPayDayTmr] = SetTimerEx("PayDay", 60000 * 30, 1, "i", playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(PlayerInfo[playerid][pInPvp])
	{
		PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]] = false;
		for(new i = GetPlayerPoolSize(); i != -1; --i)
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
	if(PlayerInfo[playerid][pSpikes])
	{
		DestroyObject(PlayerInfo[playerid][pSpikes]);
		PlayerInfo[playerid][pSpikes] = 0;
	}
	if(PlayerInfo[playerid][pMineStatus])
	{
		if(PlayerInfo[playerid][pMineStatus] == 1)
		{
			Delete3DTextLabel(PlayerInfo[playerid][pMineLabel]);
			DestroyObject(PlayerInfo[playerid][pMine][1]);
			KillTimer(PlayerInfo[playerid][pMineTmr]);
		}
		else DestroyPickup(PlayerInfo[playerid][pMinePickup]);
		DestroyObject(PlayerInfo[playerid][pMine][0]);
		PlayerInfo[playerid][pMineStatus] = 0;
	}
	if(PlayerInfo[playerid][pNeonStatus])
	{
		for(new i = 11; i != -1; --i)
		{
			DestroyObject(PlayerInfo[playerid][pNeon][i]);
			PlayerInfo[playerid][pNeon][i] = 0;
		}
		PlayerInfo[playerid][pNeonStatus] = false;
	}
	if(PlayerInfo[playerid][pInRace])
	{
		JoinCount--;
		StopPlayerRace(playerid);
	}
	SaveAccount(playerid);
	KillTimer(PlayerInfo[playerid][pPromiseTmr]);
	KillTimer(PlayerInfo[playerid][pPayDayTmr]);
	KillTimer(PlayerInfo[playerid][pAntiSKTmr]);
	KillTimer(PlayerInfo[playerid][pGiveMoneyTmr]);
	TextDrawDestroy(PlayerInfo[playerid][pRaceInfo]);
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
	PlayerInfo[playerid][pInDm] = 0;
	new string[145];
	format(string, sizeof string, "*** %s (id: %d) вышел(ла) из игры (%s)", PlayerInfo[playerid][pName], playerid, DisReasons[reason]);
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
		case 0, 1, 2, 3:
		{
			GameTextForPlayer(playerid, "~g~Grove", 500, 3);
			SetPlayerPos(playerid, 2442.612, -1660.374, 27.4512);
			SetPlayerFacingAngle(playerid, 90);
			SetPlayerCameraPos(playerid, 2437.612, -1660.374, 28.9512);
			SetPlayerCameraLookAt(playerid, 2442.612, -1660.374, 27.4512);
		}
		case 4, 5, 6, 7:
		{
			GameTextForPlayer(playerid, "~p~Ballas", 500, 3);
			SetPlayerPos(playerid, 2197.747, -1161.255, 35.1022);
			SetPlayerFacingAngle(playerid, 90);
			SetPlayerCameraPos(playerid, 2193.747, -1161.255, 37.1022);
			SetPlayerCameraLookAt(playerid, 2197.747, -1161.255, 35.1022);
			ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 8, 9, 10, 11:
		{
			GameTextForPlayer(playerid, "~b~Aztec", 500, 3);
			SetPlayerPos(playerid, 1828.7595, -1682.1378, 13.5469);
			SetPlayerFacingAngle(playerid, 88.0);
			SetPlayerCameraPos(playerid, 1823.7562, -1682.1378, 13.3828);
			SetPlayerCameraLookAt(playerid, 1828.7595, -1682.1378, 13.5469);
		}
		case 12, 13, 14, 15:
		{
			GameTextForPlayer(playerid, "~r~Nang", 500, 3);
			SetPlayerPos(playerid, 1174.399, -1702.686, 22.2344);
			SetPlayerFacingAngle(playerid, 90);
			SetPlayerCameraPos(playerid, 1171.399, -1699.686, 22.8344);
			SetPlayerCameraLookAt(playerid, 1174.399, -1702.686, 22.2344);
		}
		case 16, 17, 18, 19:
		{
			GameTextForPlayer(playerid, "~y~Vagos", 500, 3);
			SetPlayerPos(playerid, 2848.22, -1187.98, 24.6544);
			SetPlayerFacingAngle(playerid, 630);
			SetPlayerCameraPos(playerid, 2858.22, -1189.58, 24.6544);
			SetPlayerCameraLookAt(playerid, 2848.22, -1187.98, 24.6544);
			ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 20, 21, 22:
		{
			GameTextForPlayer(playerid, "~b~Cops", 500, 3);
			SetPlayerPos(playerid, 1508.293, -1679.039, 19.2421);
			SetPlayerFacingAngle(playerid, 135);
			SetPlayerCameraPos(playerid, 1505.293, -1682.039, 19.9421);
			SetPlayerCameraLookAt(playerid, 1508.293, -1679.039, 19.2421);
			ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
		}
		case 23, 24, 25, 26:
		{
			GameTextForPlayer(playerid, "~r~Italian~n~Mafia", 500, 3);
			SetPlayerPos(playerid, 2183.969, -2243.625, 18.5154);
			SetPlayerFacingAngle(playerid, 135);
			SetPlayerCameraPos(playerid, 2177.969, -2247.625, 21.5154);
			SetPlayerCameraLookAt(playerid, 2183.969, -2243.625, 18.5154);
			ApplyAnimation(playerid, "PED", "fucku", 4.0, 0, 0, 0, 0, 0);
		}
		case 27, 28, 29:
		{
			GameTextForPlayer(playerid, "~r~Biker", 500, 3);
			SetPlayerPos(playerid, 1797.251, -1346.597, 15.5146);
			SetPlayerFacingAngle(playerid, -90);
			SetPlayerCameraPos(playerid, 1803.251, -1345.597, 15.5146);
			SetPlayerCameraLookAt(playerid, 1797.251, -1346.597, 15.5146);
		}
		case 30, 31, 32:
		{
			GameTextForPlayer(playerid, "~w~Triad", 500, 3);
			SetPlayerPos(playerid, 895.0587, -1672.637, 14.2871);
			SetPlayerFacingAngle(playerid, 135);
			SetPlayerCameraPos(playerid, 900.0587, -1677.637, 14.2871);
			SetPlayerCameraLookAt(playerid, 895.0587, -1672.637, 14.2871);
			ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 33:
		{
			GameTextForPlayer(playerid, "~r~Admin Only", 500, 3);
			SetPlayerPos(playerid, 1176.287, -1994.802, 69.0078);
			SetPlayerFacingAngle(playerid, 730);
			SetPlayerCameraPos(playerid, 1174.287, -1991.802, 69.0078);
			SetPlayerCameraLookAt(playerid, 1176.287, -1994.802, 69.0078);
			ApplyAnimation(playerid, "SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0);
		}
		case 34:
		{
			GameTextForPlayer(playerid, "~w~Army", 500, 3);
			SetPlayerPos(playerid, 2775.568, -2455.016, 23.173);
			SetPlayerFacingAngle(playerid, 630);
			SetPlayerCameraPos(playerid, 2780.568, -2460.516, 25.673);
			SetPlayerCameraLookAt(playerid, 2775.568, -2455.016, 23.173);
			ApplyAnimation(playerid, "ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1);
		}
		case 35, 36:
		{
			GameTextForPlayer(playerid, "~r~Bandit", 500, 3);
			SetPlayerPos(playerid, 311.5885, -1512.816, 24.9219);
			SetPlayerFacingAngle(playerid, 60);
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
		new string[145];
		format(string, sizeof string, "%s(ID: %d) был кикнут [Необходимо залогиниться]", PlayerInfo[playerid][pName], playerid);
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
			SendClientMessage(playerid, COLOR_BLUE, "Команды копов: Полицейский щит - /shield");
		}
		case TEAM_MAFIA:
		{
			SetPlayerColor(playerid, COLOR_BLACK);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Команды банды Mafia: /opengate /closegate");
		}
		case TEAM_BIKER: SetPlayerColor(playerid, COLOR_ORANGE);
		case TEAM_TRIAD: SetPlayerColor(playerid, COLOR_WHITE);
		case TEAM_ADMIN:
		{
			TogglePlayerClock(playerid, 1);
			SetPlayerColor(playerid, COLOR_GRAY);
			SendClientMessage(playerid, COLOR_GRAY, "Команды админов: Полицейский щит - /shield");
			GivePlayerWeapon(playerid, 34, 200);
			GivePlayerWeapon(playerid, 16, 50);
		}
		case TEAM_ARMY:
		{
			SetPlayerColor(playerid, COLOR_DARKBROWN);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Команды армии: /opengate /closegate /opengate2 /closegate2");
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Полицейский щит - /shield");
		}
		case TEAM_BANDIT: SetPlayerColor(playerid, COLOR_DARKORANGE);
	}
	SetPlayerHealth(playerid, 99999);
	SetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
	PlayerInfo[playerid][pAntiSKTmr] = SetTimerEx("AntiSpawnKill", 10000, 0, "i", playerid);
	SendClientMessage(playerid, COLOR_RED, "Вы не можете быть убиты в течение 10 секунд (Anti-Spawnkill защита)");
	if(PlayerInfo[playerid][pSkin] >= 0) SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	if(PlayerInfo[playerid][pGang])
	{
		if(GSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1] >= 0) SetPlayerSkin(playerid, GSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1]);
		if(GSpawn[PlayerInfo[playerid][pGang]][0] && GSpawn[PlayerInfo[playerid][pGang]][1] && GSpawn[PlayerInfo[playerid][pGang]][2]) SetPlayerPos(playerid, GSpawn[PlayerInfo[playerid][pGang]][0], GSpawn[PlayerInfo[playerid][pGang]][1], GSpawn[PlayerInfo[playerid][pGang]][2]);
		SetPlayerColor(playerid, HexToInt(GColor[PlayerInfo[playerid][pGang]]));
		SetPlayerInterior(playerid, GSpawnInt[PlayerInfo[playerid][pGang]]);
	}
	switch(PlayerInfo[playerid][pInDm])
	{
		case 1:
		{
			SetPlayerPos(playerid, -1301.9515, 2518.7886, 87.2480);
			SetPlayerFacingAngle(playerid, 173.0);
			SetPlayerInterior(playerid, 0);
		}
		case 2:
		{
			SetPlayerPos(playerid, -1096.4175, -1646.4270, 76.3672);
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
		JoinCount--;
		StopPlayerRace(playerid);
	}
	if(BuildRace == playerid + 1) BuildRace = 0;
	if(killerid != INVALID_PLAYER_ID)
	{
		new string[145];
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
			format(string, sizeof string, ">>> В PVP между игроками {FFFFFF}%s{00FF00} и {FFFFFF}%s{00FF00} победил игрок {FFFFFF}%s. {00FF00}Награда %d$", PlayerInfo[killerid][pName], PlayerInfo[playerid][pName], PlayerInfo[killerid][pName], PlayerInfo[killerid][pPvpMoney]);
			SendClientMessageToAll(COLOR_LIME_2, string);
			SpawnPlayer(killerid);
			return 1;
		}
		if(!PlayerInfo[killerid][pGang])
		{
			switch(PlayerInfo[killerid][pTeam])
			{
				case TEAM_GROVE:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(GroveGz);
						GangZoneHideForAll(GroveGz);
						GangZoneShowForAll(GroveGz, COLOR_GREEN);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_BALLAS:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(BallasGz);
						GangZoneHideForAll(BallasGz);
						GangZoneShowForAll(BallasGz, COLOR_PURPLE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_AZTEC:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(AztecGz);
						GangZoneHideForAll(AztecGz);
						GangZoneShowForAll(AztecGz, COLOR_LIGHTBLUE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_NANG:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(NangGz);
						GangZoneHideForAll(NangGz);
						GangZoneShowForAll(NangGz, COLOR_DARKRED);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_VAGOS:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(VagosGz);
						GangZoneHideForAll(VagosGz);
						GangZoneShowForAll(VagosGz, COLOR_YELLOW);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_MAFIA:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(MafiaGz);
						GangZoneHideForAll(MafiaGz);
						GangZoneShowForAll(MafiaGz, COLOR_BLACK);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_COPS:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(CopsGz);
						GangZoneHideForAll(CopsGz);
						GangZoneShowForAll(CopsGz, COLOR_BLUE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_BIKER:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(BikerGz);
						GangZoneHideForAll(BikerGz);
						GangZoneShowForAll(BikerGz, COLOR_ORANGE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_TRIAD:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(TriadGz);
						GangZoneHideForAll(TriadGz);
						GangZoneShowForAll(TriadGz, COLOR_WHITE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_ARMY:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(ArmyGz);
						GangZoneHideForAll(ArmyGz);
						GangZoneShowForAll(ArmyGz, COLOR_DARKBROWN);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
				case TEAM_BANDIT:
				{
					if(++PlayerInfo[killerid][pTurfBackCount] >= REOWN_TURF)
					{
						GangZoneStopFlashForAll(BanditGz);
						GangZoneHideForAll(BanditGz);
						GangZoneShowForAll(BanditGz, COLOR_DARKORANGE);
						PlayerInfo[killerid][pTurfBackCount] = 0;
					}
				}
			}
		}
		if(!PlayerInfo[playerid][pGang])
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Грувовцы атакованы!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(GroveGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s завоевал территорию грувовцов", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Балласы атакованы!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(BallasGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s завоевал территорию балласов", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Команда Ацтеков атакована!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(AztecGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s завоевал территорию Ацтеков", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Команда Nang атакована!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(NangGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s завоевал территорию NANG", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Вагосы атакованы!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(VagosGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s завоевал территорию вагосов", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Копы атакованы!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(CopsGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s Взял территорию копов", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Мафия атакована!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(MafiaGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s Взял территорию Мафии", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Команда байкеров атакована!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(BikerGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s Взял территорию байкеров", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Триада атакована!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(TriadGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s Взял территорию Триады", PlayerInfo[killerid][pName]);
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
						if(++PlayerInfo[playerid][pGangKillCount] > GANGAREA_WARNINGS)
						{
							SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Команда админов атакована!");
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Армия атакована!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(ArmyGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s Взял территорию Армии", PlayerInfo[killerid][pName]);
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
							case GANGAREA_WARNINGS:
							{
								SendClientMessageToAll(COLOR_BORDO, "Сообщение гангзоны: Клан Bandit атакован!");
								if(!PlayerInfo[killerid][pGang]) GangZoneFlashForAll(BanditGz, GetPlayerColor(killerid));
							}
							case GANGAREA_TAKE:
							{
								if(!PlayerInfo[killerid][pGang])
								{
									format(string, sizeof string, "Сообщение гангзоны: %s Взял территорию Bandit", PlayerInfo[killerid][pName]);
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
			GKills[PlayerInfo[playerid][pGang]]++;
			PlayerInfo[playerid][pGangKillCount]++;
			switch(PlayerInfo[playerid][pGangKillCount])
			{
				case GANGAREA_WARNINGS:
				{
					format(string, sizeof string, "Сообщение гангзоны: Банда \"%s\" атакована!", GName[PlayerInfo[playerid][pGang]]);
					SendClientMessageToAll(COLOR_BORDO, string);
				}
				case GANGAREA_TAKE:
				{
					format(string, sizeof string, "Сообщение гангзоны: %s одержал победу над бандой \"%s\"", PlayerInfo[killerid][pName], GName[PlayerInfo[playerid][pGang]]);
					SendClientMessageToAll(COLOR_BORDO, string);
					PlayerInfo[playerid][pGangKillCount] = 0;
					GKills[PlayerInfo[playerid][pGang]] = 0;
				}
			}
			switch(GKills[PlayerInfo[playerid][pGang]])
			{
				case GANGAREA_TAKE:
				{
					format(string, sizeof string, "Сообщение гангзоны: Банда \"%s\" одержала победу над бандой \"%s\"", GName[PlayerInfo[killerid][pGang]], GName[PlayerInfo[playerid][pGang]]);
					SendClientMessageToAll(GetPlayerColor(killerid), string);
					GKills[PlayerInfo[playerid][pGang]] = 0;
				}
			}
		}
		if(PlayerInfo[playerid][pTeam] == PlayerInfo[killerid][pTeam] && PlayerInfo[playerid][pGang] == PlayerInfo[killerid][pGang] || PlayerInfo[playerid][pGang] && PlayerInfo[killerid][pGang] && PlayerInfo[playerid][pGang] == PlayerInfo[killerid][pGang])
		{
			SetPlayerHealth(killerid, 0.0);
			PlayerInfo[killerid][pMoney] -= 1000;
			GameTextForPlayer(killerid, "~r~Team Killer", 5000, 3);
			PlayerInfo[killerid][pKills]--;
			SetPlayerScore(killerid, PlayerInfo[killerid][pKills]);
			if(++PlayerInfo[killerid][pTeamKills] > MAX_TEAMKILLS)
			{
				format(string, sizeof string, "***[ %s ] был кикнут за Тим атаку или Тим кил]", PlayerInfo[killerid][pName]);
				SendClientMessageToAll(COLOR_GRAY, string);
				SendClientMessage(killerid, COLOR_GRAY, "Вы были кикнуты за тим-атаку!");
				Kick2(killerid);
				return 1;
			}
			format(string, sizeof string, "*** [ %s ] был наказан за team-kill!", PlayerInfo[killerid][pName]);
			SendClientMessageToAll(COLOR_YELLOW, string);
			SetPlayerPos(killerid, -1350.1162, 994.3682, 1024.0056);
			SetPlayerInterior(killerid, 15);
		}
		else if(GetPlayerState(killerid) == PLAYER_STATE_DRIVER)
		{
			PlayerInfo[killerid][pKills]++;
			SetPlayerScore(killerid, PlayerInfo[killerid][pKills]);
			PlayerInfo[killerid][pMoney] -= 10000;
			format(string, sizeof string, "***[ %s ] был кикнут за ДБ!!!", PlayerInfo[killerid][pName]);
			SendClientMessageToAll(-1, string);
			Kick2(killerid);
			return 1;
		}
		else
		{
			GameTextForPlayer(killerid, "~r~Owned", 5000, 1);
			if(PlayerInfo[killerid][pInDm]) PlayerInfo[killerid][pDmPoints]++;
			else
			{
				PlayerInfo[killerid][pKills]++;
				SetPlayerScore(killerid, PlayerInfo[killerid][pKills]);
			}
			PlayerInfo[killerid][pMoney] += 1000;
		}
		for(new i = sizeof(Ranks) - 1; i != -1; --i)
		{
			if(PlayerInfo[killerid][pKills] == Ranks[i][1][0])
			{
				SendClientMessageToAll(COLOR_BORDO, "____________________________");
				format(string, sizeof string, "...::: [%s] присваивается звание \"%s (%d kill's)\" :::...", PlayerInfo[killerid][pName], Ranks[i][0], PlayerInfo[killerid][pKills]);
				SendClientMessageToAll(GetPlayerColor(killerid), string);
				break;
			}
		}
	}
	else if(PlayerInfo[playerid][pInPvp])
	{
		new string[145];
		PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]] = false;
		PlayerInfo[playerid][pInPvp] = false;
		PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
		PlayerInfo[playerid][pMoney] -= PlayerInfo[playerid][pPvpMoney];
		format(string, sizeof string, "~r~-%d$", PlayerInfo[playerid][pPvpMoney]);
		GameTextForPlayer(playerid, string, 1000, 1);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][pInPvp] && PlayerInfo[i][pPvpPlace] == PlayerInfo[playerid][pPvpPlace])
			{
				PlayerInfo[i][pInPvp] = false;
				PlayerInfo[i][pPvpCreate] = INVALID_PLAYER_ID;
				PlayerInfo[i][pMoney] += PlayerInfo[playerid][pPvpMoney];
				format(string, sizeof string, "~g~+%d$", PlayerInfo[playerid][pPvpMoney]);
				GameTextForPlayer(i, string, 1000, 1);
				format(string, sizeof string, ">>> В PVP между игроками {FFFFFF}%s{00FF00} и {FFFFFF}%s{00FF00} победил игрок {FFFFFF}%s. {00FF00}Награда %d$", PlayerInfo[i][pName], PlayerInfo[playerid][pName], PlayerInfo[i][pName], PlayerInfo[playerid][pPvpMoney]);
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
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) SetPlayerInterior(i, newinteriorid);
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(!PlayerInfo[playerid][pLogged]) return SendClientMessage(playerid, COLOR_BORDO, "Чтобы писать в чат, необходимо залогиниться!"), 0;
	if(PlayerInfo[playerid][pMute]) return SendClientMessage(playerid, COLOR_RED, "Вы не можете писать в чат, Вы заглушены!"), 0;
	if(PlayerInfo[playerid][pFloodTime] > gettime())
	{
		PlayerInfo[playerid][pFloodCount]++;
		if(PlayerInfo[playerid][pFloodCount] >= 3)
		{
			new string[145];
			format(string, sizeof string, "%s(ID: %d) был кикнут. Причина: Спам", PlayerInfo[playerid][pName], playerid);
			SendClientMessageToAll(COLOR_BORDO, string);
			Kick2(playerid);
			return 0;
		}
		else if(PlayerInfo[playerid][pFloodCount] >= 2) SendClientMessage(playerid, COLOR_RED, "АнтиСпам предупреждение! Дальше кик.");
		else SendClientMessage(playerid, COLOR_LIGHTBLUE, "Администрация: не флуди!");
		return 0;
	}
	if(ContainsAnyIP(text))
	{
		new string[145];
		format(string, sizeof string, "SERVER: %s(%d) забанен на сервере. Причина: реклама", PlayerInfo[playerid][pName], playerid);
		SendClientMessageToAll(COLOR_BORDO, string);
		Ban2(playerid);
		return 0;
	}
	for(new s, i, pos, start, end; s < sizeof Swears; s++)
	{
		pos = -1;
		while((pos = strfuzzyfind(text, Swears[s], pos + 1, start, end)) != -1)
		{
			for(i = end; i >= start; --i) text[i] = '*';
		}
	}
	if(PlayerInfo[playerid][pCaps]) UpperToLower(text);
	PlayerInfo[playerid][pFloodTime] = gettime() + 1;
	if(IsEmptyMessage(text)) return 0;
	if(text[0] == '!')
	{
		if(IsEmptyMessage(text[1])) return 0;
		new string[145];
		if(PlayerInfo[playerid][pGang])
		{
			format(string, sizeof string, "* Чат банды %s >> от %s: %s", GName[PlayerInfo[playerid][pGang]], PlayerInfo[playerid][pName], text[1]);
			SendClientMessageToGang(PlayerInfo[playerid][pGang], GetPlayerColor(playerid), string);
		}
		else
		{
			format(string, sizeof string, "* Чат банды %s >> от %s: %s", DefaultGangNames[PlayerInfo[playerid][pTeam]], PlayerInfo[playerid][pName], text[1]);
			SendClientMessageToTeam(PlayerInfo[playerid][pTeam], GetPlayerColor(playerid), string);
		}
		return 0;
	}
	if(text[0] == '#' && IsPlayerAdminEx(playerid, 1))
	{
		if(IsEmptyMessage(text[1])) return 0;
		new string[145];
		format(string, sizeof string, "* Админский чат: %s: %s", PlayerInfo[playerid][pName], text[1]);
		SendClientMessageToAdmins(COLOR_LIME, string);
		return 0;
	}
	if(PlayerInfo[playerid][pGang] && GTag[PlayerInfo[playerid][pGang]])
	{
		new string[145];
		format(string, sizeof string, "[%s]%s(%d): {FFFFFF}%s", GName[PlayerInfo[playerid][pGang]], PlayerInfo[playerid][pName], playerid, text);
		SendClientMessageToAll(GetPlayerColor(playerid), string);
		return 0;
	}
	new string[145];
	format(string, sizeof string, "(%d): %s", playerid, text);
	SendPlayerMessageToAll(playerid, string);
	return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!PlayerInfo[playerid][pLogged]) return SendClientMessage(playerid, COLOR_RED, "*** Ошибка: Вы должны авторизоваться");
	if(PlayerInfo[playerid][pJail]) return SendClientMessage(playerid, COLOR_RED, "Вы не можете использовать команды, Вы в тюрьме!");
	if(PlayerInfo[playerid][pFloodTime] > gettime())
	{
		PlayerInfo[playerid][pFloodCount]++;
		if(PlayerInfo[playerid][pFloodCount] >= 3)
		{
			new string[145];
			format(string, sizeof string, "%s(ID: %d) был кикнут. Причина: Спам", PlayerInfo[playerid][pName], playerid);
			SendClientMessageToAll(COLOR_BORDO, string);
			Kick2(playerid);
			return 1;
		}
		else if(PlayerInfo[playerid][pFloodCount] >= 2) SendClientMessage(playerid, COLOR_RED, "АнтиСпам предупреждение! Дальше кик.");
		else SendClientMessage(playerid, COLOR_LIGHTBLUE, "Администрация: не флуди!");
		return 1;
	}
	PlayerInfo[playerid][pFloodTime] = gettime() + 1;
	new idx, cmd[32], tmp[32], string[145];
	cmd = strtok(cmdtext, idx);
	format(string, sizeof string, "*** %s (ID:%d) использовал команду: %s", PlayerInfo[playerid][pName], playerid, cmd);
	SendClientMessageToAdmins(COLOR_GRAY, string);
	if(!strcmp(cmd, "/stats", true))
	{
		tmp = strtok(cmdtext, idx);
		new string2[256];
		if(!strlen(tmp))
		{
			format(string, sizeof string, "{FFFF00}Статистика %s", PlayerInfo[playerid][pName]);
			format(string2, sizeof string2, "Убийств: %d\nСмертей: %d\nПоказатель: %0.2f\nОчков: %d\nDM Points: %d\nБанда: %s\nУровень в банде: %d\nДеньги: $%d\nВремя на сервере: %d час\nВозможность приглашения на PVP: %s\nПодключений к серверу: %d\nСтиль боя: %d\nСкин: %d", PlayerInfo[playerid][pKills],
			PlayerInfo[playerid][pDeaths], float(PlayerInfo[playerid][pKills]) / float(PlayerInfo[playerid][pDeaths]), PlayerInfo[playerid][pPoints], PlayerInfo[playerid][pDmPoints], (strlen(GName[PlayerInfo[playerid][pGang]]) ? GName[PlayerInfo[playerid][pGang]] : "Нет"), PlayerInfo[playerid][pGangLvl],
			PlayerInfo[playerid][pMoney], floatround(PlayerInfo[playerid][pSeconds] / 3600, floatround_tozero), PlayerInfo[playerid][pPvpAccept] ? ("Да") : ("Нет"), PlayerInfo[playerid][pConnectCount], PlayerInfo[playerid][pFightStyle], PlayerInfo[playerid][pSkin]);
			ShowPlayerDialog(playerid, DIALOG_STATS, DIALOG_STYLE_MSGBOX, string, string2, "Ок", "");
			return 1;
		}
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		format(string, sizeof string, "{FFFF00}Статистика %s", PlayerInfo[player][pName]);
		format(string2, sizeof string2, "Убийств: %d\nСмертей: %d\nПоказатель: %0.2f\nОчков: %d\nDM Points: %d\nБанда: %s\nУровень в банде: %d\nДеньги: $%d\nВремя на сервере: %d час\nВозможность приглашения на PVP: %s\nПодключений к серверу: %d\nСтиль боя: %d\nСкин: %d", PlayerInfo[player][pKills],
		PlayerInfo[player][pDeaths], float(PlayerInfo[player][pKills]) / float(PlayerInfo[player][pDeaths]), PlayerInfo[player][pPoints], PlayerInfo[player][pDmPoints], (strlen(GName[PlayerInfo[player][pGang]]) ? GName[PlayerInfo[player][pGang]] : "Нет"),
		PlayerInfo[player][pGangLvl], PlayerInfo[player][pMoney], floatround(PlayerInfo[player][pSeconds] / 3600, floatround_tozero), PlayerInfo[player][pPvpAccept] ? ("Да") : ("Нет"), PlayerInfo[player][pConnectCount], PlayerInfo[playerid][pFightStyle], PlayerInfo[playerid][pSkin]);
		ShowPlayerDialog(playerid, DIALOG_STATS, DIALOG_STYLE_MSGBOX, string, string2, "Ок", "");
		return 1;
	}
	if(!strcmp(cmd, "/start", true))
	{
		if(BalloonIsStarted) return SendClientMessage(playerid, COLOR_BORDO, "Воздушный шар уже запущен!");
		if(!IsPlayerInRangeOfPoint(playerid, 10.0, 836.08, -2000.51, 13.6)) return SendClientMessage(playerid, COLOR_BORDO, "Вы находитесь слишком далеко!");
		MoveObject(Balloon, 856.731, -2011.687, 45.7461, 3.0);
		Delete3DTextLabel(BalloonLabel);
		BalloonIsStarted = true;
		BalloonStage = 1;
		return 1;
	}
	if(!strcmp(cmd, "/spikes", true))
	{
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "*** Ошибка: Вы не должны находиться в автомобиле!");
		if(!PlayerInfo[playerid][pSpikes])
		{
			new Float:plocx, Float:plocy, Float:plocz, Float:ploca;
			GetPlayerPos(playerid, plocx, plocy, plocz);
			GetPlayerFacingAngle(playerid, ploca);
			PlayerInfo[playerid][pSpikes] = CreateObject(2899, plocx, plocy, plocz - 0.9, 0, 0, ploca - 90);
		}
		else
		{
			DestroyObject(PlayerInfo[playerid][pSpikes]);
			PlayerInfo[playerid][pSpikes] = 0;
		}
		return 1;
	}
	if(!strcmp(cmd, "/dmpoints", true)) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM Очки", "Обменять очки на киллы\nОбменять киллы на очки\nПередать очки игроку", "Ок", "Отмена");
	if(!strcmp(cmd, "/tune", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** Ошибка: Вы должны находиться в автомобиле!");
		ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
		GameTextForPlayer(playerid, "~r~-500$", 1000, 1);
		PlayerInfo[playerid][pMoney] -= 500;
		return 1;
	}
	if(!strcmp(cmd, "/bloodring", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		SetPlayerPos(playerid, -1470.8719, 947.058, 1036.7661);
		SetPlayerFacingAngle(playerid, 332.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 15);
		SetCameraBehindPlayer(playerid);
		format(string, sizeof string, "%s телепортировался на BloodRing (/bloodring)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "Вы телепортировались на BloodRing (/bloodring)");
		return 1;
	}
	if(!strcmp(cmd, "/report", true))
	{
		if(PlayerInfo[playerid][pMute]) return SendClientMessage(playerid, COLOR_RED, "Вы не можете использовать команду, Вы заглушены!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /report [id] [причина]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "Ошибка: Вы не можете написать жалобу на самого себя");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /report [id] [причина]");
		format(string, sizeof string, "Жалоба от %s(%d) на %s(%d): %s", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player, cmdtext[strfind(cmdtext, " ", true, 8) + 1]);
		SendClientMessageToAdmins(COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "Ваша жалоба отправлена администрации");
		return 1;
	}
	if(!strcmp(cmd, "/icommands", true)) return ShowPlayerDialog(playerid, DIALOG_ICOMMANDS, DIALOG_STYLE_MSGBOX, "{FFFF00}Команды сервера", CmdsStr, "Ок", "");
	if(!strcmp(cmd, "/stuntpr", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		SetPlayerPos(playerid, 1285.0985, 2681.6624, 10.8203);
		SetPlayerFacingAngle(playerid, 0.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		format(string, sizeof string, "%s телепортировался в Stunt Park (/stuntpr)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "Вы телепортировались в Stunt Park (/stuntpr)");
		return 1;
	}
	if(!strcmp(cmd, "/help", true)) return ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "{FFFF00}Помощь", "О GangWar моде\nСправка по гонке\nСправка по PVP\nСправка по управлению транспортом", "Выбрать", "Отмена");
	if(!strcmp(cmd, "/шапка", true))
	{
		if(PlayerInfo[playerid][pCap]) RemovePlayerAttachedObject(playerid, 3);
		else SetPlayerAttachedObject(playerid, 3, 19066, 2, 0.13, 0.0, 0.0, 0.0, 90.0, 90.0);
		PlayerInfo[playerid][pCap] = !PlayerInfo[playerid][pCap];
		return 1;
	}
	if(!strcmp(cmd, "/rules", true)) return ShowPlayerDialog(playerid, DIALOG_RULES, DIALOG_STYLE_MSGBOX, "{FF0000}Правила поведения на сервере GTA SA GangWar", RulesStr, "Принять", "Отмена");
	if(!strcmp(cmd, "/мигалка", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** Ошибка: Вы должны находиться в автомобиле!");
		new vehid = GetPlayerVehicleID(playerid);
		if(!IsACar(vehid)) return SendClientMessage(playerid, COLOR_RED, "Мигалка недоступна для этого транспорта!");
		if(Flasher[vehid])
		{
			DestroyObject(Flasher[vehid]);
			Flasher[vehid] = 0;
		}
		else
		{
			Flasher[vehid] = CreateObject(19419, 0, 0, 0, 0, 0, 0, 0.0);
			AttachObjectToVehicle(Flasher[vehid], vehid, -0.0, -0.2, 0.74, 1.0, 1.0, 1.0);
		}
		return 1;
	}
	if(!strcmp(cmd, "/sadomazo", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		SetPlayerSkin(playerid, 178);
		SetPlayerPos(playerid, 2096.9209, 2062.2678, 10.8203);
		SetPlayerFacingAngle(playerid, 270.3132);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		GivePlayerWeapon(playerid, 10, 1);
		format(string, sizeof string, "%s телепортировался в Sex Shop (/sadomazo)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "Вы телепортировались в Sex Shop (/sadomazo)");
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
			default: return SendClientMessage(playerid, COLOR_BORDO, "Данная команда недоступна вашей банде!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/lock", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** Ошибка: Вы должны находиться в автомобиле!");
		new veh = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(veh, engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
		format(string, sizeof string, "***%s закрыл двери своего транспорта", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		return 1;
	}
	if(!strcmp(cmd, "/unlock", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** Ошибка: Вы должны находиться в автомобиле!");
		new veh = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(veh, engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
		format(string, sizeof string, "***%s открыл двери своего транспорта", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		return 1;
	}
	if(!strcmp(cmd, "/очки", true)) return ShowPlayerDialog(playerid, DIALOG_GLASSES, DIALOG_STYLE_LIST, "{FFFF00}Очки", "Снять очки\nОчки 1\nОчки 2\nОчки 3\nОчки 4\nОчки 5\nОчки 6\nОчки 7\nОчки 8\n\
	Очки 9\nОчки 10\nОчки 11\nОчки 12\nОчки 13\nОчки 14\nОчки 15\nОчки 16\nОчки 17\nОчки 18\nОчки 19\nОчки 20\nОчки 21\nОчки 22\nОчки 23\nОчки 24\nОчки 25\nОчки 26\nОчки 27\nОчки 28\nОчки 29\nОчки 30", "Выбрать", "Отмена");
	if(!strcmp(cmd, "/avto", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_BORDO, "*** Ошибка: Вы должны находиться в автомобиле!");
		ShowPlayerDialog(playerid, DIALOG_AVTO, DIALOG_STYLE_LIST, "{FFFF00}Авто-меню", AvtoStr, "Выбрать", "Отмена");
		return 1;
	}
	if(!strcmp(cmd, "/skin", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /skin [id скина]");
		new skinid = strval(tmp);
		if(!(0 <= skinid <= 311)) return SendClientMessage(playerid, COLOR_BORDO, "Вы ввели неверный id скина. Используйте id от 0 до 311!");
		format(string, sizeof string, "Вы изменили свой скин на %d. Используйте: /noskin чтобы отказаться от сохранённого скина.", skinid);
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
	if(!strcmp(cmd, "/drink", true)) return ShowPlayerDialog(playerid, DIALOG_DRINK, DIALOG_STYLE_LIST, "{FFFF00}Меню выпивки", "Ничего\nBeer\nWine\nSprunk", "Выбрать", "Отмена");
	if(!strcmp(cmd, "/skydive", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz + 1500.0);
		GivePlayerWeapon(playerid, 46, 1);
		format(string, sizeof string, "%s совершил прыжок с парашютом! (/skydive)", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_YELLOW, string);
		SendClientMessage(playerid, -1, "GO GO GO!");
		return 1;
	}
	if(!strcmp(cmd, "/count", true))
	{
		if(CountStarted) return SendClientMessage(playerid, COLOR_DARKORANGE, "Кто-то уже начал отсчёт!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /count [1-5]");
		CountCmd = strval(tmp);
		if(!(1 <= CountCmd <= 5)) return SendClientMessage(playerid, COLOR_RED, "Количество секунд от 1 до 5!");
		format(string, sizeof string, "*** %s начал отсчёт.", PlayerInfo[playerid][pName]);
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
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		format(string, sizeof string, "%s телепортировался на драг зону (/drag)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "Вы телепортировались на драг зону (/drag)");
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
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		format(string, sizeof string, "%s телепортировался в Китайский Ресторан (/china)", PlayerInfo[playerid][pName]);
		SendClientMessageWithoutPlayer(playerid, COLOR_YELLOW, string);
		SendClientMessage(playerid, COLOR_YELLOW, "Вы телепортировались в Китайский Ресторан (/china)");
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
				if(PlayerInfo[playerid][pMoney] < 1000) return SendClientMessage(playerid, COLOR_DARKRED, "У вас нехватает денег!");
				SendClientMessage(playerid, COLOR_DARKRED, "Добро пожаловать на BIGJUMP!");
				SetPlayerPos(playerid, 3170.7329, -1097.5336, 150.9375);
				PlayerInfo[playerid][pMoney] -= 1000;
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
			}
			default: return SendClientMessage(playerid, -1, "Нельзя телепортироваться на BIGJUMP на этом транспорте !!!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/piss", true)) return SetPlayerSpecialAction(playerid, 68);
	if(!strcmp(cmd, "/vip", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		if(PlayerInfo[playerid][pMoney] < 1000) return SendClientMessage(playerid, COLOR_DARKRED, "У вас недостаточно денег!");
		SendClientMessage(playerid, COLOR_GREEN, "Вы телепортировались на остров VIP");
		SendClientMessage(playerid, COLOR_GREEN, "VIP: Открыть ворота /vipon");
		SendClientMessage(playerid, COLOR_GREEN, "VIP: Закрыть ворота /vipoff");
		SetPlayerPos(playerid, 88.3505, 288.4197, 2.6452);
		PlayerInfo[playerid][pMoney] -= 1000;
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/vipon", true))
	{
		SendClientMessage(playerid, COLOR_GREEN, "Ворота на остров VIP открыты");
		MoveObject(VipGates, 77.9044, 266.1524, 10.4453, 2.0);
		return 1;
	}
	if(!strcmp(cmd, "/vipoff", true))
	{
		SendClientMessage(playerid, COLOR_GREEN, "Ворота на остров VIP закрыты");
		MoveObject(VipGates, 77.9044, 266.1524, 4.4453, 2.0);
		return 1;
	}
	if(!strcmp(cmd, "/dm", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы уже телепортировась на dm. Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Ошибка: Вы не должны находиться в транспорте!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /dm [1-8]");
		new dmzone = strval(tmp);
		if(!(1 <= dmzone <= 8)) return SendClientMessage(playerid, -1, "Вы ввели неверную dm зону. Используйте от 1 до 8.");
		if(PlayerInfo[playerid][pMoney] < 1000) return SendClientMessage(playerid, -1, "У вас нехватает денег.");
		PlayerInfo[playerid][pMoney] -= 1000;
		GameTextForPlayer(playerid, "~r~-1000$", 1000, 1);
		PlayerInfo[playerid][pInDm] = dmzone;
		if(dmzone != 8)
		{
			format(string, sizeof string, "*** %s телепортировался на dm зону № %d (/dm %d)", PlayerInfo[playerid][pName], dmzone, dmzone);
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
				SetPlayerPos(playerid, -1096.4175, -1646.4270, 76.3672);
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
				format(string, sizeof string, "*** %s телепортировался на \"sniper dm\" зону № 8 (/dm 8)", PlayerInfo[playerid][pName]);
				SendClientMessageToAll(COLOR_YELLOW, string);
				SetPlayerFacingAngle(playerid, 90.0);
				GivePlayerWeapon(playerid, 34, 100);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
		}
		SendClientMessage(playerid, COLOR_YELLOW, "*** Выход из зоны: /exitdm");
		return 1;
	}
	if(!strcmp(cmd, "/exitdm", true))
	{
		if(!PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы не находитесь на dm!");
		SendClientMessage(playerid, COLOR_YELLOW, "*** Вы вышли с dm");
		SetPlayerWorldBounds(playerid, 20000.0, -20000.0, 20000.0, -20000.0);
		PlayerInfo[playerid][pInDm] = 0;
		return 1;
	}
	if(!strcmp(cmd, "/pvp", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы уже участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ошибка: Вы не должны находиться в транспорте");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, -1, "Используйте: /pvp [id игрока] [id оружия] [1/0 наличие брони] [место (1-5)] [ставка]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, -1, "Игрок с указанным Вами id не найден!");
		if(player == playerid) return SendClientMessage(playerid, -1, "Ты не можешь применить это действие к самому себе.");
		if(IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, -1, "Ошибка: Игрок не должен находиться в транспорте");
		if(!PlayerInfo[player][pPvpAccept]) return SendClientMessage(playerid, COLOR_YELLOW, "Игрок отключил возможность участия в PVP");
		if(PlayerInfo[player][pInPvp]) return SendClientMessage(playerid, -1, "Этот игрок уже участвует в PvP.");
		if(PlayerInfo[player][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Этот игрок участвует в гонке.");
		if(PlayerInfo[player][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Игрок находится на dm!");
		if(PlayerInfo[player][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Этот игрок отбывает наказание!");
		if(PlayerInfo[player][pJail]) return SendClientMessage(playerid, COLOR_RED, "Ошибка: Данный игрок в тюрьме!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, -1, "Используйте: /pvp [id игрока] [id оружия] [1/0 наличие брони] [место (1-5)] [ставка]");
		PlayerInfo[playerid][pPvpWeapon] = strval(tmp);
		switch(PlayerInfo[playerid][pPvpWeapon])
		{
			case 16, 24, 25, 27, 29, 31, 34:
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) return SendClientMessage(playerid, -1, "Используйте: /pvp [id игрока] [id оружия] [1/0 наличие брони] [место (1-5)] [ставка]");
				PlayerInfo[playerid][pPvpArmour] = strval(tmp);
				if(!(0 <= PlayerInfo[playerid][pPvpArmour] <= 1)) return SendClientMessage(playerid, -1, "Вы ввели неверное наличие брони. Используй 1/0");
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) return SendClientMessage(playerid, -1, "Используйте: /pvp [id игрока] [id оружия] [1/0 наличие брони] [место (1-5)] [ставка]");
				PlayerInfo[playerid][pPvpPlace] = strval(tmp) - 1;
				if(!(0 <= PlayerInfo[playerid][pPvpPlace] <= 4)) return SendClientMessage(playerid, -1, "Вы ввели неверное место. Используйте место от 1 до 5");
				if(PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]]) return SendClientMessage(playerid, -1, "PvP-место занято.");
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) return SendClientMessage(playerid, -1, "Используйте: /pvp [id игрока] [id оружия] [1/0 наличие брони] [место (1-5)] [ставка]");
				PlayerInfo[playerid][pPvpMoney] = strval(tmp);
				if(!(1 <= PlayerInfo[playerid][pPvpMoney] <= 100000)) return SendClientMessage(playerid, -1, "Вы ввели неверную сумму ставки. Используйте сумму от 1$ до 100000$");
				if(PlayerInfo[playerid][pPvpMoney] > PlayerInfo[playerid][pMoney]) return SendClientMessage(playerid, -1, "У вас нехватает денег.");
				if(PlayerInfo[playerid][pPvpMoney] > PlayerInfo[player][pMoney]) return SendClientMessage(playerid, -1, "У противника нехватает денег.");
				PlayerInfo[player][pPvpCreate] = playerid;
				format(string, sizeof string, "Вы успешно пригласили игрока {9DDAF2}%s{FFFFFF} на PVP! Дождитесь ответа.", PlayerInfo[player][pName]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "Игрок %s приглашает тебя на PVP.\n\nОружие: %d\nБроня: %d\nМесто: %d\nСтавка: %d$", PlayerInfo[playerid][pName], PlayerInfo[playerid][pPvpWeapon], PlayerInfo[playerid][pPvpArmour], PlayerInfo[playerid][pPvpPlace], PlayerInfo[playerid][pPvpMoney]);
				ShowPlayerDialog(player, DIALOG_PVP, DIALOG_STYLE_MSGBOX, "{FFFF00}Приглашение на PVP", string, "Да", "Нет");
			}
			default: SendClientMessage(playerid, -1, "Вы ввели неверный id оружия. Используй id: 16, 24, 25, 27, 29, 31, 34");
		}
		return 1;
	}
	if(!strcmp(cmd, "/nopvp", true))
	{
		format(string, sizeof string, "Вы %s возможность участия в PVP", PlayerInfo[playerid][pPvpAccept] ? ("отключили") : ("включили"));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pPvpAccept] = !PlayerInfo[playerid][pPvpAccept];
		return 1;
	}
	if(!strcmp(cmd, "/joinrace", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "Гонка уже запущена! Подождите, пока она закончится!");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		if(!RaceBusy) return SendClientMessage(playerid, COLOR_RED_RACE, "На данный момент нет гонки, к которой можно присоединиться!");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы уже участвуете в гонке!");
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
		if(!PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не участвуете в гонке!");
		JoinCount--;
		StopPlayerRace(playerid);
		TogglePlayerControllable(playerid, 1);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/mine", true))
	{
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, " Для использования команды Вы не должны находиться в транспорте!");
		if(PlayerInfo[playerid][pMineStatus]) return SendClientMessage(playerid, -1, " Вы уже установили мину!");
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		PlayerInfo[playerid][pMine][0] = CreateObject(2992, X, Y, Z - 0.85, 0.0, 0.0, 0.0);
		PlayerInfo[playerid][pMine][1] = CreateObject(19290, X, Y, Z - 0.85, 0.0, 0.0, 0.0);
		PlayerInfo[playerid][pMineLabel] = Text3D:-1;
		PlayerInfo[playerid][pMinePickup] = -1;
		PlayerInfo[playerid][pMineStatus] = 1;
		PlayerInfo[playerid][pMineCount] = 11;
		MineCount(playerid);
		return 1;
	}
	if(!strcmp(cmd, "/actions", true)) return ShowPlayerDialog(playerid, DIALOG_ACTIONS, DIALOG_STYLE_LIST, "{FFFF00}Специальные действия / Стиль боя / Список анимаций", "Специальные действия\nСтиль боя\nАнимация", "Выбрать", "Отмена");
	if(!strcmp(cmd, "/kill", true))
	{
		SetPlayerHealth(playerid, 0.0);
		GameTextForPlayer(playerid, "~r~Suicide", 5000, 1);
		return 1;
	}
	if(!strcmp(cmd, "/givemoney", true))
	{
		if(!PlayerInfo[playerid][pGiveMoney]) return SendClientMessage(playerid, COLOR_BORDO, "*** Передавать деньги можно не чаще, чем 1 раз в 1 минуту!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /givemoney [id] [summa]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /givemoney [id] [summa]");
		new moneys = strval(tmp);
		if(moneys < 1) return SendClientMessage(playerid, COLOR_BORDO, "Вы указали неверную сумму!");
		if(PlayerInfo[playerid][pMoney] < moneys) return SendClientMessage(playerid, COLOR_BORDO, "У вас не хватает денег!");
		PlayerInfo[playerid][pMoney] -= moneys;
		PlayerInfo[player][pMoney] += moneys;
		format(string, sizeof string, "Вы переслали %s(ID: %d), $%d.", PlayerInfo[player][pName], player, moneys);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		format(string, sizeof string, "Вы получили $%d от %s(ID: %d).", moneys, PlayerInfo[playerid][pName], playerid);
		SendClientMessage(player, COLOR_YELLOW, string);
		PlayerInfo[playerid][pGiveMoneyTmr] = SetTimerEx("GiveMoney", 1000 * 60, 0, "i", playerid);
		PlayerInfo[playerid][pGiveMoney] = false;
		return 1;
	}
	if(!strcmp(cmd, "/pm", true))
	{
		if(PlayerInfo[playerid][pMute]) return SendClientMessage(playerid, COLOR_RED, "Вы не можете использовать команду, Вы заглушены!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /pm [id] [сообщение]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете написать PM самому себе.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /pm [id] [сообщение]");
		new pos = strfind(cmdtext, " ", true, 4) + 1;
		if(ContainsAnyIP(cmdtext[pos]))
		{
			format(string, sizeof string, "SERVER: %s(%d) забанен на сервере. Причина: реклама в PM", PlayerInfo[playerid][pName], playerid);
			SendClientMessageToAll(COLOR_BORDO, string);
			Ban2(playerid);
			return 1;
		}
		format(string, sizeof string, "Вы послали PM %s(%d): %s", PlayerInfo[player][pName], player, cmdtext[pos]);
		SendClientMessage(playerid, COLOR_YELLOW_2, string);
		format(string, sizeof string, "Вы получили PM от %s(%d): %s", PlayerInfo[playerid][pName], playerid, cmdtext[pos]);
		SendClientMessage(player, COLOR_YELLOW, string);
		if(EarsIsEnabled)
		{
			format(string, sizeof string, "PM от %s(%d) для %s(%d): %s", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player, cmdtext[pos]);
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				if(IsPlayerConnected(i) && IsPlayerAdminEx(i, 10)) SendClientMessage(i, COLOR_YELLOW, string);
			}
		}
		PlayerPlaySound(player, 1085, 0.0, 0.0, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/ky", true))
	{
		format(string, sizeof string, "..:: %s приветствует всех!!! ::..", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/hi", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /hi [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете указать свой id!");
		format(string, sizeof string, "..:: %s[%d] приветствует %s[%d]!!! ::..", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/bb", true))
	{
		format(string, sizeof string, "..:: %s прощается со всеми!!! ::..", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/by", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /by [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете указать самого себя!");
		format(string, sizeof string, "..:: %s[%d] прощается с %s[%d]!!! ::..", PlayerInfo[playerid][pName], playerid, PlayerInfo[player][pName], player);
		SendClientMessageToAll(COLOR_LIME, string);
		return 1;
	}
	if(!strcmp(cmd, "/porvu", true))
	{
		if(!PlayerInfo[playerid][pPromise]) return SendClientMessage(playerid, COLOR_BORDO, "*** Данную команду можно использовать не чаще, чем 1 раз в 30 секунд!");
		format(string, sizeof string, "..:: %s обещает всех порвать!!! ::..", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_LIME, string);
		PlayerInfo[playerid][pPromiseTmr] = SetTimerEx("Promise", 1000 * 30, 0, "i", playerid);
		PlayerInfo[playerid][pPromise] = false;
		return 1;
	}
	if(!strcmp(cmd, "/radio", true)) return ShowPlayerDialog(playerid, DIALOG_RADIO, DIALOG_STYLE_LIST, "{FFFF00}Онлайн радио", "Выключить радио\nLove Радио\nKiss FM\nРадио Шансон\nРадио Рекорд\nSky Radio\nEuropa +\nRadio aplus", "Выбрать", "Отмена");
	if(!strcmp(cmd, "/changepass", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /changepass [новый пароль]");
		if(strlen(tmp) < 4) return SendClientMessage(playerid, COLOR_RED, "Пароль должен состоять как минимум из 4 символов!");
		if(strlen(tmp) > 31) return SendClientMessage(playerid, COLOR_RED, "Длина пароля должна быть меньше 32 символов!");
		format(PlayerInfo[playerid][pPass], MAX_PASSWORD_LENGTH, "%s", tmp);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		format(string, sizeof string, "АККАУНТ: Пароль успешно изменен на [ %s ]", PlayerInfo[playerid][pPass]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		return 1;
	}
	if(!strcmp(cmd, "/resetstats", true))
	{
		PlayerInfo[playerid][pKills] = 0;
		PlayerInfo[playerid][pDeaths] = 0;
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		SetPlayerScore(playerid, PlayerInfo[playerid][pKills]);
		SendClientMessage(playerid, COLOR_YELLOW, "АККАУНТ: Статистика успешно сброшена. Ваши убийства и смерти: 0");
		return 1;
	}
	if(!strcmp(cmd, "/engine", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Для использования команды Вы должны находиться в транспорте!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, !engine, lights, alarm, doors, bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/bonnet", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Для использования команды Вы должны находиться в транспорте!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, alarm, doors, !bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/boot", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Для использования команды Вы должны находиться в транспорте!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, !boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/lights", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Для использования команды Вы должны находиться в транспорте!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, !lights, alarm, doors, bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/alarm", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Для использования команды Вы должны находиться в транспорте!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, !alarm, doors, bonnet, boot, objective);
		return 1;
	}
	if(!strcmp(cmd, "/nomer", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Для использования команды Вы должны находиться в транспорте!");
		ShowPlayerDialog(playerid, DIALOG_CHANGE_NUMBER, DIALOG_STYLE_INPUT, "{FFFF00}Смена номера", "Введите новый номер автомобиля:", "Принять", "Отмена");
		return 1;
	}
	if(!strcmp(cmd, "/objective", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Для использования команды Вы должны находиться в транспорте!");
		new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, !objective);
		return 1;
	}
	if(!strcmp(cmd, "/dance", true))
	{
		new dance = strval(strtok(cmdtext, idx));
		if(!(1 <= dance <= 4)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /dance [1-4]");
		SetPlayerSpecialAction(playerid, dance + 4);
		return 1;
	}
	if(!strcmp(cmd, "/gang", true))
	{
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		return 1;
	}
	if(!strcmp(cmd, "/банды", true))
	{
		new string2[256];
		for(new i = 1, string3[64]; i < MAX_GANGS; i++)
		{
			if(Gang[i])
			{
				format(string3, sizeof string3, "%d. Банда \"%s\"\n", i, GName[i]);
				strcat(string2, string3);
			}
		}
		if(!strlen(string2)) return ShowPlayerDialog(playerid, DIALOG_GANGS, DIALOG_STYLE_MSGBOX, "{FFFF00}Банды", "Банды не найдены", "Ок", "");
		ShowPlayerDialog(playerid, DIALOG_GANGS, DIALOG_STYLE_LIST, "{FFFF00}Банды", string2, "Ок", "Отмена");
		return 1;
	}
	if(!strcmp(cmd, "/listrace", true))
	{
		LoadRaceNames();
		new string2[256];
		for(new i; i < TotalRaces; i++)
		{
			strcat(string2, RaceNames[i]);
			strcat(string2, "\n");
		}
		ShowPlayerDialog(playerid, DIALOG_RACES, DIALOG_STYLE_MSGBOX, "{FFFF00}Доступные гонки", string2, "Ок", "");
		return 1;
	}
	if(!strcmp(cmd, "/toprace", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED_RACE, "Используйте: /toprace [racename]");
		format(string, sizeof string, "/rRaceSystem/%s.RRACE", tmp);
		if(!fexist(string)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Гонка не существует!");
		new iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			string[0] = EOS;
			for(new i, string3[64], name[MAX_PLAYER_NAME], time, TempTime1, TempTime2, TempTime3; i < 5; i++)
			{
				format(string3, sizeof string3, "BestRacerTime_%d", i);
				ini_getInteger(iniFile, string3, time);
				format(string3, sizeof string3, "BestRacer_%d", i);
				ini_getString(iniFile, string3, name);
				ConvertTime(var, time, TempTime1, TempTime2, TempTime3);
				format(string3, sizeof string3, "%d. %s\t%02d:%02d.%03d\n", i + 1, name, TempTime1, TempTime2, TempTime3);
				strcat(string, string3);
			}
			ini_closeFile(iniFile);
		}
		new string2[64];
		format(string2, sizeof string2, "{FFFF00}Победители гонки %s", tmp);
		ShowPlayerDialog(playerid, DIALOG_RACE_TOP, DIALOG_STYLE_MSGBOX, string2, string, "Ок", "");
		return 1;
	}
	if(!strcmp(cmd, "/opengate", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_MAFIA, TEAM_ADMIN:
			{
				MoveObject(iGate, 2223.8757, -2205.9118, 13.5468, 2.5);
				MoveObject(iGate4, 2223.8757, -2205.9118, 13.5468, 2.5);
				GameTextForPlayer(playerid, "~w~BOPOЏA OЏKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
			}
			case TEAM_ARMY:
			{
				MoveObject(iGate2, 2720.827, -2414.449, 13.46094, 3.0);
				GameTextForPlayer(playerid, "~w~BOPOЏA OЏKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "Ваша банда не может открывать ворота!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/opengate2", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_ADMIN:
			{
				MoveObject(iGate3, 2720.827, -2514.226, 13.4609, 3.0);
				GameTextForPlayer(playerid, "BOPOЏA OЏKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
			}
			case TEAM_ARMY:
			{
				MoveObject(iGate3, 2720.827, -2514.226, 13.4609, 3.0);
				GameTextForPlayer(playerid, "~w~BOPOЏA OЏKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "Ваша банда не может открывать ворота!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/closegate", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_ADMIN, TEAM_MAFIA:
			{
				MoveObject(iGate, 2233.8757, -2214.9118, 13.5468, 2.5);
				MoveObject(iGate4, 2236.8757, -2217.9118, 13.5468, 2.5);
				GameTextForPlayer(playerid, "~w~BOPOЏA €AKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
			}
			case TEAM_ARMY:
			{
				MoveObject(iGate2, 2720.827, -2405.449, 13.4609, 2.5);
				GameTextForPlayer(playerid, "~w~BOPOЏA €AKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "Ваша банда не может закрывать ворота!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/closegate2", true))
	{
		switch(PlayerInfo[playerid][pTeam])
		{
			case TEAM_ADMIN, TEAM_ARMY:
			{
				MoveObject(iGate3, 2720.827, -2504.226, 13.4609, 2.5);
				GameTextForPlayer(playerid, "~w~BOPOЏA €AKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
			}
			default: return SendClientMessage(playerid, COLOR_BORDO, "Ваша банда не может закрывать ворота!");
		}
		return 1;
	}
	if(!strcmp(cmd, "/closeallgates", true))
	{
		if(PlayerInfo[playerid][pTeam] == TEAM_ADMIN)
		{
			MoveObject(iGate, 2233.8757, -2214.9118, 13.5468, 2.5);
			MoveObject(iGate4, 2236.8757, -2217.9118, 13.5468, 2.5);
			MoveObject(iGate2, 2720.827, -2405.449, 13.4609, 2.5);
			MoveObject(iGate3, 2720.827, -2504.226, 13.4609, 2.5);
			GameTextForPlayer(playerid, "~w~BOPOЏA €AKP‘BA”ЏC•, ЊO„A†‡YCЏA „ѓ…ЏE...", 4000, 3);
		}
		return 1;
	}
	if(!strcmp(cmd, "/startrace", true))
	{
		if(!IsPlayerAdminEx(playerid, 1)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не являетесь администратором!");
		if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы участвуете в PvP.");
		if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
		if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
		if(AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "Данное действие невозможно, включена автоматическая гонка!");
		if(BuildRace) return SendClientMessage(playerid, COLOR_RED_RACE, "На данный момент кто-то уже создаёт гонку!");
		if(RaceBusy || RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "Подождите, пока закончится текущая гонка!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED_RACE, "Используйте: /startrace [racename]");
		LoadRace(tmp, playerid);
		return 1;
	}
	if(!strcmp(cmd, "/stoprace", true))
	{
		if(!IsPlayerAdminEx(playerid, 1)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не являетесь администратором!");
		if(!RaceBusy || !RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "На данный момент нет гонок, которые можно остановить!");
		SendClientMessageToAll(COLOR_RED_RACE, "Администратор остановил текущую гонку!");
		StopRace();
		return 1;
	}
	if(!strcmp(cmd, "/admins", true))
	{
		if(!IsPlayerAdminEx(playerid, 1)) return SendClientMessage(playerid, COLOR_RED, "Вы не являетесь администратором!");
		new string2[256];
		for(new i = GetPlayerPoolSize(), string3[64]; i != -1; --i)
		{
			if(IsPlayerConnected(i) && IsPlayerAdminEx(i, 1))
			{
				format(string3, sizeof string3, "Админ: %s [ID %d] [Уровень %d]\n", PlayerInfo[i][pName], i, PlayerInfo[i][pAdmin]);
				strcat(string2, string3);
			}
		}
		if(!strlen(string2)) strcat(string2, "В данный момент нет админов онлайн");
		ShowPlayerDialog(playerid, DIALOG_ADMINS, DIALOG_STYLE_MSGBOX, "{FFFF00}Админы онлайн", string2, "Ок", "");
		return 1;
	}
	if(!strcmp(cmd, "/buildrace", true))
	{
		if(!IsPlayerAdminEx(playerid, 2)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не являетесь администратором!");
		if(BuildRace) return SendClientMessage(playerid, COLOR_RED_RACE, "На данный момент кто-то уже создаёт гонку!");
		if(RaceBusy) return SendClientMessage(playerid, COLOR_RED_RACE, "Подождите, пока закончится текущая гонка!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не должны находиться в машине!");
		ShowPlayerDialog(playerid, DIALOG_RACE_CREATE, DIALOG_STYLE_LIST, "{FFFF00}Создание новой гонки", "Обычная гонка\nВоздушная гонка", "Далее", "Выход");
		BuildRace = playerid + 1;
		return 1;
	}
	if(!strcmp(cmd, "/ltc", true))
	{
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы уже находитесь в машине!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /ltc [1-13]");
		new modelid = strval(tmp);
		if(!(1 <= modelid <= 13)) return SendClientMessage(playerid, COLOR_RED, "Используйте модель от 1 до 13!");
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
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /givecar [id] [model]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /givecar [id] [model]");
		new modelid = strval(tmp);
		if(!(400 <= modelid <= 611)) return SendClientMessage(playerid, COLOR_RED, "Используйте модель от 400 до 611!");
		format(string, sizeof string, "Вы дали игроку %s машину. Модель: %d", PlayerInfo[player][pName], modelid);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s дал вам машину. Модель: %d", PlayerInfo[playerid][pName], modelid);
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
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Ошибка: Вы не в транспорте!");
		DestroyVehicle(GetPlayerVehicleID(playerid));
		return 1;
	}
	if(!strcmp(cmd, "/fixcar", true))
	{
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Вы не в транспорте!");
			new Float:x, Float:y, Float:z, Float:a, vehid = GetPlayerVehicleID(playerid);
			GetVehiclePos(vehid, x, y, z);
			GetVehicleZAngle(vehid, a);
			SetVehiclePos(vehid, x, y, z);
			SetVehicleZAngle(vehid, a);
			return RepairVehicle(vehid);
		}
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(!IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, -1, "Данный игрок не в транспорте!");
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
		if(!IsPlayerAdminEx(playerid, 3)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /getinfo [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		new string2[256], ip[16], Float:health, Float:armour;
		GetPlayerHealth(player, health);
		GetPlayerArmour(player, armour);
		GetPlayerIp(player, ip, sizeof ip);
		format(string, sizeof string, "{FFFF00}Информация о %s", PlayerInfo[player][pName]);
		format(string2, sizeof string2, "Здоровье: %.1f\nБроня: %.2f\nДеньги: %d\nИнтерьер: %d\nIP адрес: %s\nPing: %d\nПатроны: %d\nБанда: %s\nScore: %d\nСкин: %d\n\
		В тюрьме: %s", health, armour, GetPlayerMoney(player), GetPlayerInterior(player), ip, GetPlayerPing(player), GetPlayerAmmo(player), DefaultGangNames[PlayerInfo[player][pTeam]], GetPlayerScore(player), GetPlayerSkin(player), PlayerInfo[player][pJail] ? ("Да") : ("Нет"));
		ShowPlayerDialog(playerid, DIALOG_PLAYER_INFO, DIALOG_STYLE_MSGBOX, string, string2, "Ок", "");
		return 1;
	}
	if(!strcmp(cmd, "/startautorace", true))
	{
		if(!IsPlayerAdminEx(playerid, 4)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не являетесь администратором!");
		if(RaceBusy || RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "Подождите, пока закончится текущая гонка!");
		if(AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "Автоматический режим уже включен!");
		AutomaticRace = true;
		LoadRaceNames();
		LoadRace(RaceNames[random(TotalRaces)]);
		SendClientMessage(playerid, COLOR_GREEN_RACE, "Вы включили автоматический режим! Будет выбираться случайная гонка после окончания предыдущей!");
		return 1;
	}
	if(!strcmp(cmd, "/stopautorace", true))
	{
		if(!IsPlayerAdminEx(playerid, 4)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не являетесь администратором!");
		if(!AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "Автоматический режим уже выключен!");
		AutomaticRace = false;
		return 1;
	}
	if(!strcmp(cmd, "/delrace", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не являетесь администратором!");
		if(AutomaticRace) return SendClientMessage(playerid, COLOR_RED_RACE, "Данное действие невозможно, включена автоматическая гонка!");
		if(BuildRace) return SendClientMessage(playerid, COLOR_RED_RACE, "На данный момент кто-то уже создаёт гонку!");
		if(RaceBusy || RaceStarted) return SendClientMessage(playerid, COLOR_RED_RACE, "Подождите, пока закончится текущая гонка!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED_RACE, "Используйте: /delrace [racename]");
		DeleteRace(tmp, playerid);
		return 1;
	}
	if(!strcmp(cmd, "/deltoprace", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED_RACE, "Вы не являетесь администратором!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED_RACE, "Используйте: /deltoprace [racename]");
		format(string, sizeof string, "/rRaceSystem/%s.RRACE", tmp);
		if(!fexist(string)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Гонка не существует!");
		SendClientMessage(playerid, COLOR_YELLOW, "RACE: Результаты гонки обнулены!");
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
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		format(string, sizeof string, "*** Администратор %s: %s", PlayerInfo[playerid][pName], cmdtext[3]);
		SendClientMessageToAll(COLOR_RED, string);
		return 1;
	}
	if(!strcmp(cmd, "/slap", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /slap [id] [причина]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /slap [id] [причина]");
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(player, slx, sly, slz);
		SetPlayerPos(player, slx, sly, slz + 5.0);
		PlayerPlaySound(player, 1130, 0.0, 0.0, 0.0);
		format(string, sizeof string, "Админ %s пнул вас. Причина: %s", PlayerInfo[playerid][pName], cmdtext[strfind(cmdtext, " ", true, 6) + 1]);
		SendClientMessage(player, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/freeze", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /freeze [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		TogglePlayerControllable(player, 0);
		format(string, sizeof string, "Админ %s заморозил игрока %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/unfreeze", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /unfreeze [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		TogglePlayerControllable(player, 1);
		format(string, sizeof string, "Админ %s разморозил игрока %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/disarm", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /disarm [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		format(string, sizeof string, "Вы обезоружили игрока %s", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s обезоружил Вас", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		ResetPlayerWeapons(player);
		return 1;
	}
	if(!strcmp(cmd, "/spec", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /spec [id]");
		new specid = strval(tmp);
		if(!IsPlayerConnected(specid)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(specid == playerid) return SendClientMessage(playerid, COLOR_GRAY, "Вы не можете наблюдать за самим собой!");
		if(PlayerInfo[playerid][pSpec] != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_BORDO, "Вы уже ведёте наблюдение!");
		if(GetPlayerAdmin(specid) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		TogglePlayerSpectating(playerid, 1);
		if(IsPlayerInAnyVehicle(specid)) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(specid));
		else PlayerSpectatePlayer(playerid, specid);
		PlayerInfo[playerid][pSpec] = specid;
		SetPlayerInterior(playerid, GetPlayerInterior(specid));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(specid));
		SendClientMessage(playerid, COLOR_BLUE, "Слежка начата");
		return 1;
	}
	if(!strcmp(cmd, "/specoff", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(PlayerInfo[playerid][pSpec] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_BORDO, "Вы не ведёте наблюдение!");
		TogglePlayerSpectating(playerid, 0);
		PlayerInfo[playerid][pSpec] = INVALID_PLAYER_ID;
		SendClientMessage(playerid, COLOR_BLUE, "Слежка прекращена");
		return 1;
	}
	if(!strcmp(cmd, "/caps", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /caps [id] [время (мин)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		if(PlayerInfo[player][pCaps]) return SendClientMessage(playerid, COLOR_RED, "Данному игроку уже запрещено использование заглавных букв!");
		PlayerInfo[player][pCaps] = true;
		format(string, sizeof string, "Админ %s запретил использование заглавных букв игроку %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/uncaps", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /unmute [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(!PlayerInfo[player][pCaps]) return SendClientMessage(playerid, COLOR_RED, "Данному игроку уже разрешено использование заглавных букв!");
		PlayerInfo[player][pCaps] = false;
		format(string, sizeof string, "Админ %s разрешил использование заглавных букв игроку %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/mute", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /mute [id] [время (мин)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /mute [id] [время (мин)]");
		new time = strval(tmp);
		if(time < 1) return SendClientMessage(playerid, COLOR_GRAY, "Время молчанки указано неверно!");
		PlayerInfo[player][pMute] = true;
		PlayerInfo[player][pMuteTime] = time * 60;
		format(string, sizeof string, "Админ %s заткнул игрока %s на %d минут", PlayerInfo[playerid][pName], PlayerInfo[player][pName], time);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/unmute", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /unmute [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		PlayerInfo[player][pMute] = false;
		PlayerInfo[player][pMuteTime] = 0;
		format(string, sizeof string, "Админ %s снял затычку с игрока %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setskin", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setskin [id] [skin]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setskin [id] [skin]");
		new skin = strval(tmp);
		if(!(0 <= skin <= 311)) return SendClientMessage(playerid, COLOR_RED, "Вы указали неверный ID скина!");
		format(string, sizeof string, "Вы установили %d скин игроку %s", skin, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s установил Вам %d скин", PlayerInfo[playerid][pName], skin);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerSkin(player, skin);
		return 1;
	}
	if(!strcmp(cmd, "/setvw", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setvw [id] [vw]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setvw [id] [vw]");
		new vw = strval(tmp);
		format(string, sizeof string, "Вы установили игроку %s виртуальный мир на %d", PlayerInfo[player][pName], vw);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s установил Вам виртуальный мир на %d", PlayerInfo[playerid][pName], vw);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerVirtualWorld(player, vw);
		return 1;
	}
	if(!strcmp(cmd, "/setint", true))
	{
		if(!IsPlayerAdminEx(playerid, 5)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setint [id] [interior]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setint [id] [interior]");
		new interior = strval(tmp);
		format(string, sizeof string, "Вы установили игроку %s интерьер на %d", PlayerInfo[player][pName], interior);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s установил Вам интерьер на %d", PlayerInfo[playerid][pName], interior);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerInterior(player, interior);
		return 1;
	}
	if(!strcmp(cmd, "/sethp", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /sethp [id] [кол-во]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /sethp [id] [кол-во]");
		new hp = strval(tmp);
		format(string, sizeof string, "Вы установили игроку %s здоровье на %d", PlayerInfo[player][pName], hp);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s установил Вам здоровье на %d", PlayerInfo[playerid][pName], hp);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerHealth(player, hp);
		return 1;
	}
	if(!strcmp(cmd, "/carhealth", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /carhealth [playerid] [кол-во]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(!IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, COLOR_BORDO, "Данный игрок не в машине!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /carhealth [playerid] [кол-во]");
		new hp = strval(tmp);
		if(!(0 <= hp <= 1000000)) return SendClientMessage(playerid, COLOR_BORDO, "Ошибка: Неправильно указано количество hp");
		format(string, sizeof string, "Вы установили здоровье машины игрока %s на %d", PlayerInfo[player][pName], hp);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s установил здоровье вашей машины на %d", PlayerInfo[playerid][pName], hp);
		SendClientMessage(player, COLOR_BLUE, string);
		SetVehicleHealth(GetPlayerVehicleID(player), hp);
		return 1;
	}
	if(!strcmp(cmd, "/eject", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /eject [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		if(!IsPlayerInAnyVehicle(player)) return SendClientMessage(playerid, COLOR_RED, "Данный игрок не в машине!");
		format(string, sizeof string, "Вы выкинули игрока %s из авто", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s выкинул вас из авто", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		RemovePlayerFromVehicle(player);
		return 1;
	}
	if(!strcmp(cmd, "/jail", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /jail [id] [время (мин)] [причина]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		if(PlayerInfo[player][pJail]) return SendClientMessage(playerid, COLOR_RED, "Данный игрок уже находится в тюрьме!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /jail [id] [время (мин)] [причина]");
		new time = strval(tmp);
		if(time < 1) return SendClientMessage(playerid, COLOR_GRAY, "Время отсидки указано неверно!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /jail [id] [время (мин)] [причина]");
		if(PlayerInfo[player][pInDm])
		{
			SetPlayerWorldBounds(player, 20000.0, -20000.0, 20000.0, -20000.0);
			PlayerInfo[player][pInDm] = 0;
		}
		else if(PlayerInfo[player][pInRace])
		{
			JoinCount--;
			StopPlayerRace(player);
		}
		else if(PlayerInfo[player][pInPvp])
		{
			PlayerInfo[player][pInPvp] = false;
			PlayerInfo[player][pPvpCreate] = INVALID_PLAYER_ID;
		}
		SetTimerEx("Jail", 1000, 0, "iii", player, time, 1);
		format(string, sizeof string, "Админ %s посадил игрока %s в тюрьму на %d минут. Причина: %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName], time, cmdtext[strfind(cmdtext, " ", true, 8) + 1]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/unjail", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /unjail [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(!PlayerInfo[player][pJail]) return SendClientMessage(playerid, COLOR_RED, "Данный игрок не находится в тюрьме!");
		format(string, sizeof string, "Админ %s освободил игрока %s из тюрьмы", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		UnJail(player);
		return 1;
	}
	if(!strcmp(cmd, "/explode", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /explode [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		new Float:ePosX, Float:ePosY, Float:ePosZ;
		GetPlayerPos(player, ePosX, ePosY, ePosZ);
		format(string, sizeof string, "Вы взорвали игрока %s", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s взорвал вас", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		CreateExplosion(ePosX, ePosY, ePosZ, 7, 10.0);
		return 1;
	}
	if(!strcmp(cmd, "/clearchat", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		for(new i = 20; i != -1; --i) SendClientMessageToAll(-1, " ");
		format(string, sizeof string, "Администратор %s очистил чат", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/goto", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /goto [id]");
		new player = strval(tmp);
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете указать свой id!");
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(player, x, y, z);
		format(string, sizeof string, "Вы телепортировались к игроку %s", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		SetPlayerPos(playerid, x, y, z);
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(player));
		SetPlayerInterior(playerid, GetPlayerInterior(player));
		return 1;
	}
	if(!strcmp(cmd, "/warn", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /warn [id] [причина]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /warn [id] [причина]");
		format(string, sizeof string, "***Администратор %s предупредил игрока %s по причине %s (Всего причин: %d/3)***", PlayerInfo[playerid][pName], PlayerInfo[player][pName], cmdtext[strfind(cmdtext, " ", true, 6) + 1], PlayerInfo[player][pWarns] + 1);
		SendClientMessageToAll(COLOR_YELLOW, string);
		if(++PlayerInfo[player][pWarns] >= 3) Kick2(player);
		return 1;
	}
	if(!strcmp(cmd, "/kick", true))
	{
		if(!IsPlayerAdminEx(playerid, 6)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /kick [id] [причина]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /kick [id] [причина]");
		format(string, sizeof string, "Администратор %s кикнул игрока %s. Причина: %s", PlayerInfo[playerid][pName], PlayerInfo[player][pName], cmdtext[strfind(cmdtext, " ", true, 6) + 1]);
		SendClientMessageToAll(COLOR_BORDO, string);
		Kick2(player);
		return 1;
	}
	if(!strcmp(cmd, "/ban", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /ban [id] [дни] [причина]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /ban [id] [дни] [причина]");
		new time = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /ban [id] [дни] [причина]");
		new pos = strfind(cmdtext, " ", true, 7) + 1, year, month, day, hour, minute;
		getdate(year, month, day);
		gettime(hour, minute);
		format(string, sizeof string, "Игрок %s забанен админом %s. [Причина: %s] [Дата: %d.%d.%d] [Время: %d:%d]", PlayerInfo[player][pName], PlayerInfo[playerid][pName], cmdtext[pos], day, month, year, hour, minute);
		SendClientMessageToAll(COLOR_BORDO, string);
		PlayerInfo[player][pBan] = true;
		PlayerInfo[player][pBanTime] = gettime() + (time * 86400);
		BanEx2(player, cmdtext[pos]);
		return 1;
	}
	if(!strcmp(cmd, "/setmaxping", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setmaxping [maxping]");
		new ping = strval(tmp);
		if(!(50 <= ping <= 1000)) return SendClientMessage(playerid, COLOR_RED, "Допустимые значения пинга: 50-1000!");
		MaxPing = ping;
		format(string, sizeof string, "Админ %s установил максимальный пинг на %d", PlayerInfo[playerid][pName], ping);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setmoney", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setmoney [id] [summa]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setmoney [id] [summa]");
		new money = strval(tmp);
		format(string, sizeof string, "Вы установили сумму денег на $%d игроку %s", money, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s установил вам сумму денег на $%d", PlayerInfo[playerid][pName], money);
		SendClientMessage(player, COLOR_BLUE, string);
		PlayerInfo[player][pMoney] = money;
		return 1;
	}
	if(!strcmp(cmd, "/givecash", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /givecash [id] [summa]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /givecash [id] [summa]");
		new money = strval(tmp);
		format(string, sizeof string, "Вы дали $%d игроку %s", money, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s дал Вам $%d", PlayerInfo[playerid][pName], money);
		SendClientMessage(player, COLOR_BLUE, string);
		PlayerInfo[player][pMoney] += money;
		return 1;
	}
	if(!strcmp(cmd, "/giveweapon", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /giveweapon [id] [weapon] [ammo]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /giveweapon [id] [weapon] [ammo]");
		new weapon = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /giveweapon [id] [weapon] [ammo]");
		new ammo = strval(tmp), wname[32];
		GetWeaponName(weapon, wname, sizeof wname);
		format(string, sizeof string, "Вы дали игроку %s оружие %s (%d) с %d патронами", PlayerInfo[player][pName], wname, weapon, ammo);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s дал Вам оружие %s (%d) с %d патронами", PlayerInfo[playerid][pName], wname, weapon, ammo);
		SendClientMessage(player, COLOR_BLUE, string);
		GivePlayerWeapon(player, weapon, ammo);
		return 1;
	}
	if(!strcmp(cmd, "/spawn", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /spawn [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		format(string, sizeof string, "Админ %s заспавнил Вас", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		SpawnPlayer(player);
		return 1;
	}
	if(!strcmp(cmd, "/akill", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /akill [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		format(string, sizeof string, "Админ %s убил Вас", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerHealth(player, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/get", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /get [id]");
		new player = strval(tmp);
		if(player == playerid) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете указать свой id!");
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		format(string, sizeof string, "Вы телепортировали игрока %s к себе", PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s телепортировал вас к себе", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		SetPlayerVirtualWorld(player, GetPlayerVirtualWorld(playerid));
		SetPlayerInterior(player, GetPlayerInterior(playerid));
		SetPlayerPos(player, x, y, z);
		return 1;
	}
	if(!strcmp(cmd, "/settime", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /settime [hour]");
		new time = strval(tmp);
		if(!(0 <= time <= 23)) return SendClientMessage(playerid, COLOR_RED, "Указанный параметр должен быть от 0 до 23!");
		format(string, sizeof string, "Админ %s сменил время", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		for(new i = GetPlayerPoolSize(); i != -1; --i) SetPlayerTime(i, time, 0);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/setweather", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setweather [weather]");
		new weather = strval(tmp);
		if(!(0 <= weather <= 20)) return SendClientMessage(playerid, COLOR_RED, "Указанный параметр должен быть от 0 до 20!");
		format(string, sizeof string, "Админ %s сменил погоду", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		for(new i = GetPlayerPoolSize(); i != -1; --i) SetPlayerWeather(i, weather);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		return 1;
	}
	if(!strcmp(cmd, "/gm", true))
	{
		if(!IsPlayerAdminEx(playerid, 7)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		PlayerInfo[playerid][pGodMode] = !PlayerInfo[playerid][pGodMode];
		format(string, sizeof string, "Вы %s GodMode", PlayerInfo[playerid][pGodMode] ? ("включили") : ("отключили"));
		SendClientMessage(playerid, COLOR_BLUE, string);
		if(PlayerInfo[playerid][pGodMode]) SetPlayerHealth(playerid, 99999);
		else SetPlayerHealth(playerid, 100.0);
		return 1;
	}
	if(!strcmp(cmd, "/getall", true) || !strcmp(cmd, "/gethere", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		for(new i = GetPlayerPoolSize(), interior = GetPlayerInterior(playerid), vw = GetPlayerVirtualWorld(playerid); i != -1; --i)
		{
			if(IsPlayerConnected(i) && i != playerid)
			{
				SetPlayerVirtualWorld(i, vw);
				SetPlayerInterior(i, interior);
				SetPlayerPos(i, x, y, z + 1);
			}
		}
		format(string, sizeof string, "Админ %s телепортировал всех к себе", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setvwall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setvwall [vw]");
		new vw = strval(tmp);
		format(string, sizeof string, "Админ %s установил всем виртуальный мир на %d", PlayerInfo[playerid][pName], vw);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerVirtualWorld(i, vw);
		}
		return 1;
	}
	if(!strcmp(cmd, "/setintall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setintall [interior]");
		new interior = strval(tmp);
		format(string, sizeof string, "Админ %s установил всем интерьер на %d", PlayerInfo[playerid][pName], interior);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerInterior(i, interior);
		}
		return 1;
	}
	if(!strcmp(cmd, "/giveweaponall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /giveweaponall [weapon] [ammo]");
		new weapon = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /giveweaponall [weapon] [ammo]");
		new ammo = strval(tmp), wname[32];
		GetWeaponName(weapon, wname, sizeof wname);
		format(string, sizeof string, "Админ %s дал всем игрокам %s (ID:%d) с %d патронами", PlayerInfo[playerid][pName], wname, weapon, ammo);
		SendClientMessageToAll(COLOR_BLUE, string);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i)) GivePlayerWeapon(i, weapon, ammo);
		}
		return 1;
	}
	if(!strcmp(cmd, "/healall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		format(string, sizeof string, "Админ %s вылечил всех", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerHealth(i, 100.0);
		}
		return 1;
	}
	if(!strcmp(cmd, "/armourall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		format(string, sizeof string, "Админ %s выдал всем броню", PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i)) SetPlayerArmour(i, 100.0);
		}
		return 1;
	}
	if(!strcmp(cmd, "/killall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		SendClientMessage(playerid, COLOR_BLUE, "Вы убили всех игроков");
		format(string, sizeof string, "Администратор %s убил вас", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
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
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		SendClientMessage(playerid, COLOR_BLUE, "Вы заморозили всех игроков");
		format(string, sizeof string, "Администратор %s заморозил вас", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
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
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		SendClientMessage(playerid, COLOR_BLUE, "Вы разморозили всех игроков");
		format(string, sizeof string, "Администратор %s разморозил вас", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
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
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		SendClientMessage(playerid, COLOR_BLUE, "Вы выкинули из авто всех игроков");
		format(string, sizeof string, "Администратор %s выкинул вас из авто", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
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
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		SendClientMessage(playerid, COLOR_BLUE, "Вы обезоружили всех игроков");
		format(string, sizeof string, "Администратор %s обезоружил ваc", PlayerInfo[playerid][pName]);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
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
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setmoneyall [summa]");
		new money = strval(tmp);
		format(string, sizeof string, "Админ %s установил всем $%d", PlayerInfo[playerid][pName], money);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i)) PlayerInfo[i][pMoney] = money;
		}
		return 1;
	}
	if(!strcmp(cmd, "/givecashall", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /givecashall [summa]");
		new money = strval(tmp);
		format(string, sizeof string, "Админ %s дал всем $%d", PlayerInfo[playerid][pName], money);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i)) PlayerInfo[i][pMoney] += money;
		}
		return 1;
	}
	if(!strcmp(cmd, "/setscore", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setscore [id] [score]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setscore [id] [score]");
		new score = strval(tmp);
		format(string, sizeof string, "Вы установили %d очков игроку %s", score, PlayerInfo[player][pName]);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s установил Вам %d очков", PlayerInfo[playerid][pName], score);
		SendClientMessage(player, COLOR_BLUE, string);
		PlayerInfo[player][pKills] = score;
		SetPlayerScore(player, score);
		return 1;
	}
	if(!strcmp(cmd, "/banip", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /banip [ip]");
		new count;
		for(new i = 7, j = strlen(cmdtext); i < j; i++)
		{
			switch(cmdtext[i])
			{
				case '*':
				{
					if(count < 2) return SendClientMessage(playerid, COLOR_BORDO, "IP-адрес введён некорректно!");
				}
				case '0'..'9':{}
				case '.': count++;
				default: return SendClientMessage(playerid, COLOR_BORDO, "IP-адрес введён некорректно!");
			}
		}
		format(string, sizeof string, "banip %s", cmdtext[7]);
		SendRconCommand(string);
		format(string, sizeof string, "Администратор %s забанил IP %s", PlayerInfo[playerid][pName], cmdtext[7]);
		SendClientMessageToAll(COLOR_BORDO, string);
		return 1;
	}
	if(!strcmp(cmd, "/unban", true))
	{
		if(!IsPlayerAdminEx(playerid, 8)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /unban [name]");
		new pname[MAX_PLAYER_NAME];
		strmid(pname, tmp, 0, strlen(tmp));
		format(string, sizeof string, "Users/%s.ini", pname);
		if(!fexist(string)) return SendClientMessage(playerid, COLOR_RED, "Такого аккаунта не существует!");
		new iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			new bool:ban;
			ini_getInteger(iniFile, "Ban", ban);
			if(!ban)
			{
				SendClientMessage(playerid, COLOR_RED, "Этот аккаунт не забанен!");
				ini_closeFile(iniFile);
				return 1;
			}
			ini_setInteger(iniFile, "Ban", 0);
			ini_setInteger(iniFile, "BanTime", 0);
			ini_closeFile(iniFile);
		}
		format(string, sizeof string, "Игрок %s разбанен админом %s", pname, PlayerInfo[playerid][pName]);
		SendClientMessageToAll(COLOR_GREEN, string);
		return 1;
	}
	if(!strcmp(cmd, "/kickall", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /kick [причина]");
		format(string, sizeof string, "Администратор %s кикнул всех игроков. Причина: %s", PlayerInfo[playerid][pName], cmdtext[9]);
		SendClientMessageToAll(COLOR_BORDO, string);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
		{
			if(IsPlayerConnected(i) && i != playerid) Kick2(i);
		}
		return 1;
	}
	if(!strcmp(cmd, "/setscoreall", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setscoreall [score]");
		new score = strval(tmp);
		format(string, sizeof string, "Админ %s установил всем %d очков", PlayerInfo[playerid][pName], score);
		SendClientMessageToAll(COLOR_BLUE, string);
		PlaySoundForAll(1057, 0.0, 0.0, 0.0);
		for(new i = GetPlayerPoolSize(); i != -1; --i)
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
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /unbanip [ip]");
		for(new i = 9, j = strlen(cmdtext); i < j; i++)
		{
			switch(cmdtext[i])
			{
				case '0'..'9', '.', '*':{}
				default: return SendClientMessage(playerid, COLOR_BORDO, "IP-адрес введён некорректно!");
			}
		}
		format(string, sizeof string, "unbanip %s", cmdtext[9]);
		SendRconCommand(string);
		SendRconCommand("reloadbans");
		format(string, sizeof string, "Администратор %s разбанил IP %s", PlayerInfo[playerid][pName], cmdtext[9]);
		SendClientMessageToAll(COLOR_GREEN, string);
		return 1;
	}
	if(!strcmp(cmd, "/noob", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /noob [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		if(GetPlayerAdmin(player) > GetPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_BORDO, "Вы не можете применить это действие к данному игроку!");
		PlayerInfo[player][pKills] = 0;
		SetPlayerScore(player, PlayerInfo[player][pKills]);
		PlayerInfo[player][pDmPoints] = 0;
		GivePlayerWeapon(player, 10, 1);
		PlayerInfo[player][pPoints] = 0;
		PlayerInfo[player][pMoney] = 0;
		SetPlayerSkin(player, 137);
		format(string, sizeof string, "Админ %s скинул Вам статистику", PlayerInfo[playerid][pName]);
		SendClientMessage(player, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/setname", true))
	{
		if(!IsPlayerAdminEx(playerid, 9)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setname [id] [name]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setname [id] [name]");
		new pname[MAX_PLAYER_NAME];
		strmid(pname, cmdtext, 11, strlen(cmdtext));
		format(string, sizeof string, "Users/%s.ini", pname);
		if(fexist(string)) return SendClientMessage(playerid, COLOR_RED, "Данный ник уже кем-то занят!");
		new iniFile = ini_createFile(string);
		if(iniFile >= INI_OK)
		{
			ini_setString(iniFile, "Pass", PlayerInfo[player][pPass]);
			ini_closeFile(iniFile);
		}
		format(string, sizeof string, "Вы сменили игроку %s ник на %s", PlayerInfo[player][pName], pname);
		SendClientMessage(playerid, COLOR_BLUE, string);
		format(string, sizeof string, "Админ %s сменил Вам ник на %s", PlayerInfo[playerid][pName], pname);
		SendClientMessage(player, COLOR_BLUE, string);
		format(string, sizeof string, "Users/%s.ini", PlayerInfo[player][pName]);
		fremove(string);
		SetPlayerName(player, pname);
		GetPlayerName(player, PlayerInfo[player][pName], MAX_PLAYER_NAME);
		SaveAccount(player);
		return 1;
	}
	if(!strcmp(cmd, "/setlevel", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setlevel [id] [уровень (0-10)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /setlevel [id] [уровень (0-10)]");
		new level = strval(tmp);
		if(!(0 <= level <= 10)) return SendClientMessage(playerid, COLOR_RED, "Уровень должен быть от 0 до 10!");
		PlayerInfo[player][pAdmin] = level;
		format(string, sizeof string, "Админ %s повысил вас до %d уровня админки", PlayerInfo[playerid][pName], level);
		SendClientMessage(player, COLOR_BLUE, string);
		format(string, sizeof string, "Вы повысили %s(ID: %d) до %d уровня админки", PlayerInfo[player][pName], player, level);
		SendClientMessage(playerid, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/settemplevel", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /settemplevel [id] [уровень (0-10)]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /settemplevel [id] [уровень (0-10)]");
		new level = strval(tmp);
		if(!(0 <= level <= 10)) return SendClientMessage(playerid, COLOR_RED, "Уровень должен быть от 0 до 10!");
		PlayerInfo[player][pTempAdmin] = level;
		format(string, sizeof string, "Админ %s повысил вас до %d уровня временной админки", PlayerInfo[playerid][pName], level);
		SendClientMessage(player, COLOR_BLUE, string);
		format(string, sizeof string, "Вы повысили %s(ID: %d) до %d уровня временной админки", PlayerInfo[player][pName], player, level);
		SendClientMessage(playerid, COLOR_BLUE, string);
		return 1;
	}
	if(!strcmp(cmd, "/skick", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /skick [id]");
		new player = strval(tmp);
		if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_GRAY, "Данный игрок оффлайн!");
		Kick(player);
		return 1;
	}
	if(!strcmp(cmd, "/ears", true))
	{
		if(!IsPlayerAdminEx(playerid, 10)) return SendClientMessage(playerid, COLOR_RED, "Вы не уполномочены использовать эту команду!");
		format(string, sizeof string, "Вы %s прослушку PM", EarsIsEnabled ? ("отключили") : ("включили"));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		EarsIsEnabled = !EarsIsEnabled;
		return 1;
	}
	format(string, sizeof string, " Команда %s не существует. Для помощи наберите: /help", cmd);
	SendClientMessage(playerid, COLOR_BORDO, string);
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(GetPlayerWeapon(playerid) && GetPlayerInterior(playerid) && !PlayerInfo[playerid][pInDm] && !PlayerInfo[playerid][pInPvp]) SetPlayerArmedWeapon(playerid, 0);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vid = GetPlayerVehicleID(playerid), panels, doors, lights, tires;
		GetVehicleDamageStatus(vid, panels, doors, lights, tires);
		for(new i = GetPlayerPoolSize(), Float:sx, Float:sy, Float:sz; i != -1; --i)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][pSpikes])
			{
				GetObjectPos(PlayerInfo[i][pSpikes], sx, sy, sz);
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
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) PlayerSpectatePlayer(i, playerid);
			}
			if(PLAYER_STATE_DRIVER <= oldstate <= PLAYER_STATE_PASSENGER) SendClientMessage(playerid, COLOR_SALMON, "Всё ваше оружие возвращено.");
		}
		case PLAYER_STATE_DRIVER:
		{
			new vehid = GetPlayerVehicleID(playerid);
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) PlayerSpectateVehicle(i, vehid);
			}
			SetPlayerArmedWeapon(playerid, 0);
			PlayerTextDrawShow(playerid, PlayerInfo[playerid][pVehSpeed]);
			SendClientMessage(playerid, COLOR_SALMON, "Всё ваше оружие изьято для предотвращения ДБ.");
			if(PlayerInfo[playerid][pTeam] != TEAM_ADMIN)
			{
				if(PlayerInfo[playerid][pTeam] != TEAM_ARMY && vehid == Dumper)
				{
					GameTextForPlayer(playerid, "Get Out Of Army's Dumper", 3000, 3);
					RemovePlayerFromVehicle(playerid);
				}
				if(vehid == Panzer)
				{
					GameTextForPlayer(playerid, "This Tank Is For Admin Use Only", 3000, 3);
					RemovePlayerFromVehicle(playerid);
				}
				else if(vehid == Hydra1 || vehid == Hydra2)
				{
					GameTextForPlayer(playerid, "‹‘‡E€…_…€_–OE†_–AЋ…м‘!", 3000, 3);
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
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pSpec] == playerid) PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
			}
			SendClientMessage(playerid, COLOR_SALMON, "Всё ваше оружие изьято для устранения превосходства в убийстве из транспорта. Доступен только MP5.");
			if(GetPlayerWeapon(playerid) != 29) SetPlayerArmedWeapon(playerid, 0);
		}
	}
	if(oldstate == PLAYER_STATE_DRIVER) PlayerTextDrawHide(playerid, PlayerInfo[playerid][pVehSpeed]);
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	new string[64];
	format(string, sizeof string, "~n~~n~~n~~n~~n~~n~~n~~g~+%.01f HP", amount);
	GameTextForPlayer(playerid, string, 1500, 3);
	if(PlayerInfo[damagedid][pGang] && GSpawn[PlayerInfo[damagedid][pGang]][0] && GSpawn[PlayerInfo[damagedid][pGang]][1] && GSpawn[PlayerInfo[damagedid][pGang]][2])
	{
		if(IsPlayerInRangeOfPoint(damagedid, 1.5, GSpawn[PlayerInfo[damagedid][pGang]][0], GSpawn[PlayerInfo[damagedid][pGang]][1], GSpawn[PlayerInfo[damagedid][pGang]][2])) Punish(playerid);
	}
	else if(IsPlayerInRangeOfPoint(damagedid, 1.5, TeamSpawns[PlayerInfo[damagedid][pTeam]][0], TeamSpawns[PlayerInfo[damagedid][pTeam]][1], TeamSpawns[PlayerInfo[damagedid][pTeam]][2])) Punish(playerid);
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(issuerid != INVALID_PLAYER_ID)
	{
		new string[64];
		format(string, sizeof string, "~n~~n~~n~~n~~n~~n~~n~~r~-%.01f HP", amount);
		GameTextForPlayer(playerid, string, 1500, 3);
		if(PlayerInfo[playerid][pInDm] == 8)
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
	if(!GetPlayerInterior(playerid)) return 0;
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	for(new i = strlen(inputtext) - 1; i != -1; --i)
	{
		if(inputtext[i] == '%') inputtext[i] = '#';
	}
	if(dialogid != PlayerInfo[playerid][pDialog])
	{
		PlayerInfo[playerid][pDialog] = -1;
		return 0;
	}
	PlayerInfo[playerid][pDialog] = -1;
	switch(dialogid)
	{
		case DIALOG_REGISTRATION:
		{
			new string[145];
			if(response)
			{
				if(strlen(inputtext) < 4)
				{
					SendClientMessage(playerid, COLOR_RED, "Пароль должен состоять как минимум из 4 символов!");
					format(string, sizeof string, "{FA8072}Этот аккаунт {FFFF00}'%s'{FA8072} не зарегистрирован!\n\n{FF5300}Зарегистрируйтесь, для доступа к учётной записи:", PlayerInfo[playerid][pName]);
					ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}Регистрация аккаунта", string, "Register", "Отмена");
					return 1;
				}
				if(strlen(inputtext) > 31)
				{
					SendClientMessage(playerid, COLOR_RED, "Длина пароля должна быть меньше 32 символов!");
					format(string, sizeof string, "{FA8072}Этот аккаунт {FFFF00}'%s'{FA8072} не зарегистрирован!\n\n{FF5300}Зарегистрируйтесь, для доступа к учётной записи:", PlayerInfo[playerid][pName]);
					ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}Регистрация аккаунта", string, "Register", "Отмена");
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
					SendClientMessage(playerid, COLOR_LIME, "АККАУНТ: Вы зарегистрированы и автоматически залогинены");
				}
			}
			else
			{
				format(string, sizeof string, "{FA8072}Этот аккаунт {FFFF00}'%s'{FA8072} не зарегистрирован!\n\n{FF5300}Зарегистрируйтесь, для доступа к учётной записи:", PlayerInfo[playerid][pName]);
				ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}Регистрация аккаунта", string, "Register", "Отмена");
			}
		}
		case DIALOG_LOGIN:
		{
			if(response)
			{
				new string[145];
				if(!strlen(inputtext))
				{
					format(string, sizeof string, "{FA8072}Этот аккаунт {FFFF00}%s{FA8072} зарегистрирован\n{FF5300}Пожалуйста залогиньтесь:", PlayerInfo[playerid][pName]);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FFCC00}Авторизация аккаунта", string, "Login", "Выход");
					return 1;
				}
				format(string, sizeof string, "Users/%s.ini", PlayerInfo[playerid][pName]);
				new iniFile = ini_openFile(string), password[24];
				ini_getString(iniFile, "Pass", password);
				format(PlayerInfo[playerid][pPass], MAX_PASSWORD_LENGTH, "%s", password);
				if(strcmp(inputtext, password, true))
				{
					if(++PlayerInfo[playerid][pPassCount] >= MAX_PASSWORD_ATTEMPTS)
					{
						format(string, sizeof string, "%s(ID: %d) был кикнут [3/3 раз ввёл неверный пароль]", PlayerInfo[playerid][pName], playerid);
						SendClientMessageToAll(COLOR_GRAY, string);
						Kick2(playerid);
						return 1;
					}
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FFFF00}Пароль", "{FF0000}Неправильный пароль\n{00FFFF}Попробуйте ещё раз", "Ок", "Выход");
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
					if(!Gang[PlayerInfo[playerid][pGang]] || GCheck[PlayerInfo[playerid][pGang]] != PlayerInfo[playerid][pGangCheck])
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
							SendClientMessage(playerid, COLOR_RED, "Вы забанены на этом сервере.");
							Kick2(playerid);
							return 1;
						}
					}
					SetPlayerScore(playerid, PlayerInfo[playerid][pKills]);
					if(PlayerInfo[playerid][pGang]) SetPlayerColor(playerid, HexToInt(GColor[PlayerInfo[playerid][pGang]]));
					PlayerInfo[playerid][pConnectCount]++;
					PlayerInfo[playerid][pLogged] = true;
					if(IsPlayerAdminEx(playerid, 1))
					{
						format(string, sizeof string, "АККАУНТ: Вы успешно залогинились (Уровень %d)", GetPlayerAdmin(playerid));
						SendClientMessage(playerid, COLOR_LIME, string);
					}
					else SendClientMessage(playerid, COLOR_LIME, "АККАУНТ: Вы успешно залогинились");
				}
			}
			else Kick2(playerid);
		}
		case DIALOG_RULES:
		{
			if(PlayerInfo[playerid][pLogged]) return 1;
			new string[145];
			if(!response)
			{
				format(string, sizeof string, "%s(ID: %d) был кикнут за несогласие с правилами сервера!", PlayerInfo[playerid][pName], playerid);
				SendClientMessageToAll(COLOR_GRAY, string);
				Kick2(playerid);
				return 1;
			}
			SendClientMessage(playerid, COLOR_GREEN, " Удачной игры на сервере");
			format(string, sizeof string, "Users/%s.ini", PlayerInfo[playerid][pName]);
			if(!fexist(string))
			{
				SendClientMessage(playerid, COLOR_RED, "АККАУНТ: Для игры на сервере Вам необходимо зарегистрироваться.");
				format(string, sizeof string, "{FA8072}Этот аккаунт {FFFF00}'%s'{FA8072} не зарегистрирован!\n\n{FF5300}Зарегистрируйтесь, для доступа к учётной записи:", PlayerInfo[playerid][pName]);
				ShowPlayerDialog(playerid, DIALOG_REGISTRATION, DIALOG_STYLE_INPUT, "{FFCC00}Регистрация аккаунта", string, "Register", "Отмена");
			}
			else
			{
				SendClientMessage(playerid, COLOR_LIME, "АККАУНТ: Для игры на сервере Вам необходимо залогиниться.");
				format(string, sizeof string, "{FA8072}Этот аккаунт {FFFF00}%s{FA8072} зарегистрирован\n{FF5300}Пожалуйста залогиньтесь:", PlayerInfo[playerid][pName]);
				ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FFCC00}Авторизация аккаунта", string, "Login", "Выход");
			}
		}
		case DIALOG_GLASSES:
		{
			if(response)
			{
				if(listitem) SetPlayerAttachedObject(playerid, 2, listitem + 19005, 2, 0.1, 0.03, 0.0, 0.0, 90.0, 90.0);
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
					SendClientMessage(playerid, -1, "Вы уже участвуете в PvP.");
					SendClientMessage(PlayerInfo[playerid][pPvpCreate], -1, "При соглашении на участие в PvP произошла ошибка!");
					PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
					return 1;
				}
				if(PvpPlaceVisit[PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpPlace]])
				{
					SendClientMessage(playerid, -1, "PvP-место занято.");
					SendClientMessage(PlayerInfo[playerid][pPvpCreate], -1, "PvP-место занято.");
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
					SetPlayerHealth(PlayerInfo[playerid][pPvpCreate], 100);
					SetPlayerHealth(playerid, 100);
					if(PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pPvpArmour])
					{
						SetPlayerArmour(PlayerInfo[playerid][pPvpCreate], 100);
						SetPlayerArmour(playerid, 100);
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
					SendClientMessage(playerid, -1, "Игрок, отославший тебе приглашение, отсоеденился!");
					PlayerInfo[playerid][pPvpCreate] = INVALID_PLAYER_ID;
				}
			}
			else
			{
				new string[145];
				format(string, sizeof string, "Ты отказался от участия в PVP с игроком {9DDAF2}%s", PlayerInfo[PlayerInfo[playerid][pPvpCreate]][pName]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "Игрок {9DDAF2}%s{FFFFFF} отказался от участия в PVP!", PlayerInfo[playerid][pName]);
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
					case 0: ShowPlayerDialog(playerid, DIALOG_TPLS, DIALOG_STYLE_LIST, "Los Santos", "Los Santos Airport\nSanta Marina\nGrove Street\nCity Hall\nPolice Station\nBank\nOcean Docks\nCrazybob's House\nJefferson Motel", "Выбрать", "Назад");
					case 1: ShowPlayerDialog(playerid, DIALOG_TPSF, DIALOG_STYLE_LIST, "San Fierro", "San Fierro Airport\nCity Hall\nBank\nOcean Flats\nMissionary Hill\nJizzys Pleasure Dome\nPolice Station", "Выбрать", "Назад");
					case 2: ShowPlayerDialog(playerid, DIALOG_TPLV, DIALOG_STYLE_LIST, "Las Venturas", "Las Venturas Airport\nCity Hall\nPolice Station\nCaligulas Casino\nStarfish Casino\nBank\nPrickle Pine\nBandit Stadium\nLast Dime Motel", "Выбрать", "Назад");
					case 3: ShowPlayerDialog(playerid, DIALOG_TP_OTHER, DIALOG_STYLE_LIST, "Другое", "Verdant Meadows\nBayside\nPalominmo Creek\nMontgomery\nBlueberry\nMount Chilliad Cabin\nTop of Mount Chilliad\nMount Chilliad", "Выбрать", "Назад");
				}
			}
		}
		case DIALOG_TPLS:
		{
			if(response)
			{
				new string[145];
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, 1934.8811, -2305.5283, 13.5469);
						format(string, sizeof string, "*** %s телепортировался в Los Santos Airport", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, 433.1179, -1796.5649, 5.5469);
						format(string, sizeof string, "*** %s телепортировался на Santa Marina Beach", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, 2499.8733, -1667.6309, 13.3512);
						format(string, sizeof string, "*** %s телепортировался на Grove Street", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, 1461.0043, -1019.4626, 24.6975);
						format(string, sizeof string, "*** %s телепортировался в Los Santos City Hall", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, 1544.87, -1675.8081, 13.5593);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s телепортировался в Los Santos Police Department", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, 595.1895, -1243.1205, 18.0844);
						format(string, sizeof string, "*** %s телепортировался в Los Santos Bank", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, 2791.1782, -2534.6309, 13.6303);
						format(string, sizeof string, "*** %s телепортировался в Ocean Docks", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 7:
					{
						SetPlayerPos(playerid, 1255.2925, -778.2413, 92.0302);
						format(string, sizeof string, "*** %s телепортировался в Crazybob's House", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 8:
					{
						SetPlayerPos(playerid, 2229.02, -1159.8, 25.7981);
						format(string, sizeof string, "*** %s телепортировался в Jefferson Motel", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}Меню телепортов", "Los Santos\nSan Fierro\nLas Venturas\nДругое", "Ок", "Отмена");
		}
		case DIALOG_TPSF:
		{
			if(response)
			{
				new string[145];
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, -1315.9419, -223.8595, 14.1484);
						format(string, sizeof string, "*** %s телепортировался в San Fierro Airport", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, -2672.6116, 1268.4943, 55.9456);
						format(string, sizeof string, "*** %s телепортировался в San Fierro City Hall", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, -2050.6089, 459.3649, 35.1719);
						format(string, sizeof string, "*** %s телепортировался в San Fierro Bank", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, -2670.1101, -4.9832, 6.1328);
						format(string, sizeof string, "*** %s телепортировался в Ocean Flats", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, -2515.6768, -611.6651, 132.5625);
						format(string, sizeof string, "*** %s телепортировался в Missionary Hill", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, -2621.0244, 1403.7534, 7.0938);
						format(string, sizeof string, "*** %s телепортировался в Jizzy's Pleasure Dome", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, -1608.1376, 718.9722, 12.4356);
						format(string, sizeof string, "*** %s телепортировался на San Fierro Police Station", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}Меню телепортов", "Los Santos\nSan Fierro\nLas Venturas\nДругое", "Ок", "Отмена");
		}
		case DIALOG_TPLV:
		{
			if(response)
			{
				new string[145];
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, 1487.9703, 1736.9537, 10.8125);
						format(string, sizeof string, "*** %s телепортировался в Las Venturas Airport", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, 2421.7185, 1121.9866, 10.8125);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s телепортировался в Las Venturas City Hall", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, 2287.2561, 2426.2576, 10.8203);
						format(string, sizeof string, "*** %s телепортировался на Las Venturas Police Station", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, 2187.835, 1678.5358, 11.1094);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s телепортировался в Caligulas Casino", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, 2227.3596, 1894.3228, 10.6719);
						format(string, sizeof string, "*** %s телепортировался в Starfish Casino", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, 2463.668, 2240.7524, 10.8203);
						format(string, sizeof string, "*** %s телепортировался в Las Venturas Bank", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, 1434.6989, 2654.4026, 11.3926);
						format(string, sizeof string, "*** %s телепортировался в Prickle Pine", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 7:
					{
						SetPlayerPos(playerid, 1493.2443, 2238.1526, 11.0291);
						format(string, sizeof string, "*** %s телепортировался на Bandit Stadium", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 8:
					{
						SetPlayerPos(playerid, 1929.0522, 707.8507, 10.8203);
						format(string, sizeof string, "*** %s телепортировался в Last Dime Motel", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}Меню телепортов", "Los Santos\nSan Fierro\nLas Venturas\nДругое", "Ок", "Отмена");
		}
		case DIALOG_TP_OTHER:
		{
			if(response)
			{
				new string[145];
				switch(listitem)
				{
					case 0:
					{
						SetPlayerPos(playerid, 414.9159, 2532.97, 19.1484);
						format(string, sizeof string, "*** %s телепортировался в Verdant Meadows", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 1:
					{
						SetPlayerPos(playerid, -2271.0764, 2317.8457, 4.8202);
						SetPlayerFacingAngle(playerid, 180.0);
						format(string, sizeof string, "*** %s телепортировался на Bayside", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 2:
					{
						SetPlayerPos(playerid, 2259.5532, -85.0334, 26.5107);
						SetPlayerFacingAngle(playerid, 180.0);
						format(string, sizeof string, "*** %s телепортировался в Palomino Creek", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 3:
					{
						SetPlayerPos(playerid, 1377.4314, 271.4077, 19.5669);
						format(string, sizeof string, "*** %s телепортировался в Montgomery", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 4:
					{
						SetPlayerPos(playerid, 183.9907, -108.544, 2.0234);
						format(string, sizeof string, "*** %s телепортировался в Blueberry", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 5:
					{
						SetPlayerPos(playerid, -2809.0, -1516.5, 142.0);
						SetPlayerFacingAngle(playerid, 270.0);
						format(string, sizeof string, "*** %s телепортировался в Mount Chilliad Cabin", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 6:
					{
						SetPlayerPos(playerid, -2238.0, -1712.27, 482.0);
						SetPlayerFacingAngle(playerid, 90.0);
						format(string, sizeof string, "*** %s телепортировался на Top of Mount Chilliad", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
					case 7:
					{
						SetPlayerPos(playerid, -2409.5, -2190.0, 35.0);
						SetPlayerFacingAngle(playerid, 270.0);
						format(string, sizeof string, "*** %s телепортировался на Mount Chilliad", PlayerInfo[playerid][pName]);
						SetCameraBehindPlayer(playerid);
					}
				}
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SendClientMessageToAll(COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}Меню телепортов", "Los Santos\nSan Fierro\nLas Venturas\nДругое", "Ок", "Отмена");
		}
		case DIALOG_HELP:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_ABOUT, DIALOG_STYLE_MSGBOX, "{FFFF00}О GangWar моде", "Особая благодарность автору мода: LethaL'у\nМодернизатор мода - Shurik\nСоздатели сервера - aig & Shurik", "Назад", "Выход");
					case 1: ShowPlayerDialog(playerid, DIALOG_RACE, DIALOG_STYLE_MSGBOX, "{FFFF00}Справка по гонке", RaceAboutStr, "Назад", "Выход");
					case 2: ShowPlayerDialog(playerid, DIALOG_PVP_ABOUT, DIALOG_STYLE_MSGBOX, "{FFFF00}Справка по PVP", PvpAboutStr, "Назад", "Выход");
					case 3: ShowPlayerDialog(playerid, DIALOG_VEHICLE, DIALOG_STYLE_MSGBOX, "{FFFF00}Справка по управлению транспортом", AvtoAboutStr, "Назад", "Выход");
				}
			}
		}
		case DIALOG_ABOUT, DIALOG_RACE, DIALOG_PVP_ABOUT, DIALOG_VEHICLE:
		{
			if(response) ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "{FFFF00}Помощь", "О GangWar моде\nСправка по гонке\nСправка по PVP\nСправка по управлению транспортом", "Выбрать", "Отмена");
		}
		case DIALOG_ACTIONS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_SPEC_ACTIONS, DIALOG_STYLE_LIST, "{FFFF00}Специальные действия", "dance 1\ndance 2\ndance 3\ndance 4\nhandsup", "Выбрать", "Отмена");
					case 1: ShowPlayerDialog(playerid, DIALOG_FIGHTING_STYLES, DIALOG_STYLE_LIST, "{FFFF00}Стиль боя", "Boxing\nKungfu\nKneeHead\nGrabkick\nElbow", "Выбрать", "Отмена");
					case 2: ShowPlayerDialog(playerid, DIALOG_ANIMATION, DIALOG_STYLE_LIST, "{FFFF00}Список анимаций", "Остановить анимацию\nDrunk Walk\nbomb\ngetarrested\nlaugh\nlookout\n\
					robman\ncrossarms\nlay\nhide\nvomit\neat\nwave\ntaichi\ndeal\ncrack\nsmokem\nsmokef\ngroundsit\nchat\nfucku", "Выбрать", "Отмена");
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
					case 0: ShowPlayerDialog(playerid, DIALOG_PM, DIALOG_STYLE_INPUT, "{FFFF00}Написать PM", "Напишите ваше сообщение ниже:", "Ок", "Назад");
					case 1: ShowPlayerDialog(playerid, DIALOG_GIVE_MONEY, DIALOG_STYLE_INPUT, "{FFFF00}Передать деньги", "Укажите ниже нужную сумму для передачи:", "Ок", "Назад");
					case 2:
					{
						if(PlayerInfo[playerid][pInPvp]) return SendClientMessage(playerid, -1, "Вы уже участвуете в PvP.");
						if(PlayerInfo[playerid][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Вы участвуете в гонке.");
						if(PlayerInfo[playerid][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы находитесь на dm! Введите /exitdm, чтобы выйти.");
						if(PlayerInfo[playerid][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Вы отбываете наказание!");
						if(PlayerInfo[playerid][pJail]) return SendClientMessage(playerid, COLOR_RED, "Ошибка: Вы находитесь в тюрьме!");
						if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ошибка: Вы не должны находиться в транспорте");
						if(IsPlayerInAnyVehicle(PlayerInfo[playerid][pClicked])) return SendClientMessage(playerid, -1, "Ошибка: Игрок не должен находиться в транспорте");
						if(!PlayerInfo[PlayerInfo[playerid][pClicked]][pPvpAccept]) return SendClientMessage(playerid, COLOR_YELLOW, "Игрок отключил возможность участия в PVP");
						if(PlayerInfo[PlayerInfo[playerid][pClicked]][pInPvp]) return SendClientMessage(playerid, -1, "Этот игрок уже участвует в PvP.");
						if(PlayerInfo[PlayerInfo[playerid][pClicked]][pInRace]) return SendClientMessage(playerid, COLOR_RED_RACE, "*** Ошибка: Этот игрок участвует в гонке.");
						if(PlayerInfo[PlayerInfo[playerid][pClicked]][pInDm]) return SendClientMessage(playerid, COLOR_YELLOW, "Игрок находится на dm!");
						if(PlayerInfo[PlayerInfo[playerid][pClicked]][pPunish]) return SendClientMessage(playerid, COLOR_YELLOW, "Этот игрок отбывает наказание!");
						if(PlayerInfo[PlayerInfo[playerid][pClicked]][pJail]) return SendClientMessage(playerid, COLOR_RED, "Ошибка: Данный игрок в тюрьме!");
						ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите ID оружия ниже:", "Ок", "Назад");
					}
					case 3: ShowPlayerDialog(playerid, DIALOG_REPORT, DIALOG_STYLE_INPUT, "{FFFF00}Написать жалобу", "Напишите текст жалобы ниже:", "Ок", "Назад");
					case 4:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pGangLvl] >= 4)
						{
							new string[16];
							PlayerInfo[playerid][pDialog] = DIALOG_GANG_INVITE;
							format(string, sizeof string, "%d", PlayerInfo[playerid][pClicked]);
							OnDialogResponse(playerid, DIALOG_GANG_INVITE, 1, 0, string);
						}
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть как минимум 4 уровень.");
					}
					case 5:
					{
						new string[64];
						format(string, sizeof string, "/stats %d", PlayerInfo[playerid][pClicked]);
						OnPlayerCommandText(playerid, string);
					}
					case 6:
					{
						PlayerInfo[playerid][pPointsId] = PlayerInfo[playerid][pClicked];
						ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите количество очков, которое хотите передать:", "Ок", "Назад");
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
					case 0: ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE, DIALOG_STYLE_INPUT, "{FFFF00}Обменять очки", "Напишите ниже, сколько очков вы хотите обменять\n3 очка = 1 килл", "Ок", "Назад");
					case 1: ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE_2, DIALOG_STYLE_INPUT, "{FFFF00}Обменять киллы", "Напишите ниже, сколько киллов вы хотите обменять\n1 килл = 3 очка", "Ок", "Назад");
					case 2: ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите ID игрока, которому хотите передать очки:", "Ок", "Назад");
				}
			}
		}
		case DIALOG_DMPOINTS_EXCHANGE:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE, DIALOG_STYLE_INPUT, "{FFFF00}Обменять очки", "Напишите ниже, сколько очков вы хотите обменять\n3 очка = 1 килл", "Ок", "Назад");
				new amount = strval(inputtext);
				if(amount % 3)
				{
					SendClientMessage(playerid, COLOR_RED, "Введённое вами количество очков обменять нельзя!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE, DIALOG_STYLE_INPUT, "{FFFF00}Обменять очки", "Напишите ниже, сколько очков вы хотите обменять\n3 очка = 1 килл", "Ок", "Назад");
					return 1;
				}
				new string[145], amount2 = floatround(amount / 3, floatround_tozero);
				PlayerInfo[playerid][pDmPoints] -= amount;
				PlayerInfo[playerid][pKills] += amount2;
				format(string, sizeof string, "Вы обменяли %d очков на %d килов", amount, amount2);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM Очки", "Обменять очки на киллы\nОбменять киллы на очки\nПередать очки игроку", "Ок", "Отмена");
		}
		case DIALOG_DMPOINTS_EXCHANGE_2:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_EXCHANGE_2, DIALOG_STYLE_INPUT, "{FFFF00}Обменять киллы", "Напишите ниже, сколько киллов вы хотите обменять\n1 килл = 3 очка", "Ок", "Назад");
				new string[145], amount = strval(inputtext);
				PlayerInfo[playerid][pKills] -= amount;
				PlayerInfo[playerid][pDmPoints] += amount * 3;
				format(string, sizeof string, "Вы обменяли %d килов на %d очков", amount, amount * 3);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM Очки", "Обменять очки на киллы\nОбменять киллы на очки\nПередать очки игроку", "Ок", "Отмена");
		}
		case DIALOG_DMPOINTS_GIVE:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите ID игрока, которому хотите передать очки:", "Ок", "Назад");
				PlayerInfo[playerid][pPointsId] = strval(inputtext);
				if(!IsPlayerConnected(PlayerInfo[playerid][pPointsId]))
				{
					SendClientMessage(playerid, COLOR_RED, "Данный игрок оффлайн!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите ID игрока, которому хотите передать очки:", "Ок", "Назад");
					return 1;
				}
				ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите количество очков, которое хотите передать:", "Ок", "Назад");
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS, DIALOG_STYLE_LIST, "{FFFF00}DM Очки", "Обменять очки на киллы\nОбменять киллы на очки\nПередать очки игроку", "Ок", "Отмена");
		}
		case DIALOG_DMPOINTS_GIVE_2:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите количество очков, которое хотите передать:", "Ок", "Назад");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED, "Вы указали неверное количество очков!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите количество очков, которое хотите передать:", "Ок", "Назад");
					return 1;
				}
				if(PlayerInfo[playerid][pDmPoints] < amount)
				{
					SendClientMessage(playerid, COLOR_RED, "У вас не хватает очков!");
					ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE_2, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите количество очков, которое хотите передать:", "Ок", "Назад");
					return 1;
				}
				PlayerInfo[playerid][pDmPoints] -= amount;
				PlayerInfo[PlayerInfo[playerid][pPointsId]][pDmPoints] += amount;
				new string[145];
				format(string, sizeof string, "Вы передали %s(ID: %d), %d DM-очков.", PlayerInfo[PlayerInfo[playerid][pPointsId]][pName], PlayerInfo[playerid][pPointsId], amount);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof string, "Вы получили %d DM-очков от %s(ID: %d).", amount, PlayerInfo[playerid][pName], playerid);
				SendClientMessage(PlayerInfo[playerid][pPointsId], COLOR_YELLOW, string);
			}
			else ShowPlayerDialog(playerid, DIALOG_DMPOINTS_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Передать очки", "Укажите ID игрока, которому хотите передать очки:", "Ок", "Назад");
		}
		case DIALOG_PM:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_PM, DIALOG_STYLE_INPUT, "{FFFF00}Написать PM", "Напишите ваше сообщение ниже:", "Ок", "Назад");
				new string[145];
				format(string, sizeof string, "/pm %d %s", PlayerInfo[playerid][pClicked], inputtext);
				OnPlayerCommandText(playerid, string);
			}
			else
			{
				new message[64];
				format(message, sizeof message, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClicked]][pName], PlayerInfo[playerid][pClicked]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, message, "Написать PM\nПередать деньги\nПригласить на PVP\nНаписать жалобу\nПригласить в банду\nПосмотреть статистику\nПередать DM-очки", "Выбрать", "Отмена");
			}
		}
		case DIALOG_GIVE_MONEY:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_PM, DIALOG_STYLE_INPUT, "{FFFF00}Передать деньги", "Укажите ниже нужную сумму для передачи:", "Ок", "Назад");
				new string[64];
				format(string, sizeof string, "/givemoney %d %d", PlayerInfo[playerid][pClicked], strval(inputtext));
				OnPlayerCommandText(playerid, string);
			}
			else
			{
				new message[64];
				format(message, sizeof message, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClicked]][pName], PlayerInfo[playerid][pClicked]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, message, "Написать PM\nПередать деньги\nПригласить на PVP\nНаписать жалобу\nПригласить в банду\nПосмотреть статистику\nПередать DM-очки", "Выбрать", "Отмена");
			}
		}
		case DIALOG_REPORT:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REPORT, DIALOG_STYLE_INPUT, "{FFFF00}Написать жалобу", "Напишите текст жалобы ниже:", "Ок", "Назад");
				new string[145];
				format(string, sizeof string, "/report %d %s", PlayerInfo[playerid][pClicked], inputtext);
				OnPlayerCommandText(playerid, string);
			}
			else
			{
				new message[64];
				format(message, sizeof message, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClicked]][pName], PlayerInfo[playerid][pClicked]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, message, "Написать PM\nПередать деньги\nПригласить на PVP\nНаписать жалобу\nПригласить в банду\nПосмотреть статистику\nПередать DM-очки", "Выбрать", "Отмена");
			}
		}
		case DIALOG_PVP_INVITE_1:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите ID оружия ниже:", "Ок", "Назад");
				PlayerInfo[playerid][pPvpWeapon] = strval(inputtext);
				switch(PlayerInfo[playerid][pPvpWeapon])
				{
					case 16, 24, 25, 27, 29, 31, 34: ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите наличие брони (1/0) ниже:", "Ок", "Назад");
					default:
					{
						SendClientMessage(playerid, -1, "Вы ввели неверный id оружия. Используй id: 16, 24, 25, 27, 29, 31, 34");
						ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите ID оружия ниже:", "Ок", "Назад");
						return 1;
					}
				}
			}
			else
			{
				new message[64];
				format(message, sizeof message, "{FFFF00}%s(ID: %d)", PlayerInfo[PlayerInfo[playerid][pClicked]][pName], PlayerInfo[playerid][pClicked]);
				ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, message, "Написать PM\nПередать деньги\nПригласить на PVP\nНаписать жалобу\nПригласить в банду\nПосмотреть статистику\nПередать DM-очки", "Выбрать", "Отмена");
			}
		}
		case DIALOG_PVP_INVITE_2:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите наличие брони (1/0) ниже:", "Ок", "Назад");
				PlayerInfo[playerid][pPvpArmour] = strval(inputtext);
				if(!(0 <= PlayerInfo[playerid][pPvpArmour] <= 1))
				{
					SendClientMessage(playerid, -1, "Вы ввели неверное наличие брони. Используй 1/0");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите наличие брони (1/0) ниже:", "Ок", "Назад");
					return 1;
				}
				ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите место (1-5) ниже:", "Ок", "Назад");
			}
			else ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_1, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите ID оружия ниже:", "Ок", "Назад");
		}
		case DIALOG_PVP_INVITE_3:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите место (1-5) ниже:", "Ок", "Назад");
				PlayerInfo[playerid][pPvpPlace] = strval(inputtext) - 1;
				if(!(0 <= PlayerInfo[playerid][pPvpPlace] <= 4))
				{
					SendClientMessage(playerid, -1, "Вы ввели неверное место. Используйте место от 1 до 5");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите место (1-5) ниже:", "Ок", "Назад");
					return 1;
				}
				if(PvpPlaceVisit[PlayerInfo[playerid][pPvpPlace]])
				{
					SendClientMessage(playerid, -1, "PvP-место занято.");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите место (1-5) ниже:", "Ок", "Назад");
					return 1;
				}
				ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите сумму ставки ниже:", "Ок", "Назад");
			}
			else ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_2, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите наличие брони (1/0) ниже:", "Ок", "Назад");
		}
		case DIALOG_PVP_INVITE_4:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите сумму ставки ниже:", "Ок", "Назад");
				PlayerInfo[playerid][pPvpMoney] = strval(inputtext);
				if(!(1 <= PlayerInfo[playerid][pPvpMoney] <= 100000))
				{
					SendClientMessage(playerid, -1, "Вы ввели неверную сумму ставки. Используйте сумму от 1$ до 100000$");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите сумму ставки ниже:", "Ок", "Назад");
					return 1;
				}
				if(PlayerInfo[playerid][pPvpMoney] > PlayerInfo[playerid][pMoney])
				{
					SendClientMessage(playerid, -1, "У вас нехватает денег.");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите сумму ставки ниже:", "Ок", "Назад");
					return 1;
				}
				if(PlayerInfo[playerid][pPvpMoney] > PlayerInfo[PlayerInfo[playerid][pClicked]][pMoney])
				{
					SendClientMessage(playerid, -1, "У противника нехватает денег.");
					ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_4, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите сумму ставки ниже:", "Ок", "Назад");
					return 1;
				}
				new string[145];
				PlayerInfo[PlayerInfo[playerid][pClicked]][pPvpCreate] = playerid;
				format(string, sizeof string, "Вы успешно пригласили игрока {9DDAF2}%s{FFFFFF} на PVP! Дождитесь ответа.", PlayerInfo[PlayerInfo[playerid][pClicked]][pName]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "Игрок %s приглашает тебя на PVP.\n\nОружие: %d\nБроня: %d\nМесто: %d\nСтавка: %d$", PlayerInfo[playerid][pName], PlayerInfo[playerid][pPvpWeapon], PlayerInfo[playerid][pPvpArmour], PlayerInfo[playerid][pPvpPlace], PlayerInfo[playerid][pPvpMoney]);
				ShowPlayerDialog(PlayerInfo[playerid][pClicked], DIALOG_PVP, DIALOG_STYLE_MSGBOX, "{FFFF00}Приглашение на PVP", string, "Да", "Нет");
			}
			else ShowPlayerDialog(playerid, DIALOG_PVP_INVITE_3, DIALOG_STYLE_INPUT, "{FFFF00}Пригласить на PVP", "Укажите место (1-5) ниже:", "Ок", "Назад");
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
						ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
					}
					case 1: ShowPlayerDialog(playerid, DIALOG_TUNING_COLOR, DIALOG_STYLE_LIST, "{FFFF00}Цвет авто 1", "Белый\nЧёрный\nОранжевый\nГолубой\nТёмно Синий\nКоричневый\nЗелёный\nТёмно красный\nСерый", "Ок", "Назад");
					case 2: ShowPlayerDialog(playerid, DIALOG_TUNING_WHEELS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Shadow\nMega\nRimshine\nWires\nClassic\nTwist\nCutter\nSwitch\nGrove\nImport\nDollar\nTrance\nAtomic\nAhab\nVirtual\nAcces", "Ок", "Назад");
					case 3:
					{
						AddVehicleComponent(vehid, 1086);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
					}
					case 4:
					{
						AddVehicleComponent(vehid, 1087);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
					}
					case 5:
					{
						switch(GetVehicleModel(vehid))
						{
							case 558..562, 565: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_1, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob\nAlien\nX-Flow", "Выбрать", "Назад");
							case 535, 575, 576: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_2, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob\nChrome\nSlamin", "Выбрать", "Назад");
							case 536, 567: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_3, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob\nChrome\nSlamin\nHardtop Roof\nSofttop Roof", "Выбрать", "Назад");
							case 534: ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_4, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob\nChrome\nSlamin\nFlame Sideskirt\nArches Sideskirt Roof", "Выбрать", "Назад");
							case 401, 410, 415, 418, 420, 436, 439, 458, 489, 491, 492, 496, 505, 516, 517, 518, 527, 529, 540, 546, 547, 549, 550, 551, 580, 585, 587, 589, 600, 603: RegularCarDialog(playerid);
							default: SendClientMessage(playerid, COLOR_RED, "Для этого авто данный тюнинг не доступен!");
						}
					}
				}
			}
		}
		case DIALOG_TUNING_COLOR:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
			new color1, color2, vehid = GetPlayerVehicleID(playerid);
			GetVehicleColor(vehid, color1, color2);
			ChangeVehicleColor(vehid, Carray[listitem], color2);
			ShowPlayerDialog(playerid, DIALOG_TUNING_COLOR_2, DIALOG_STYLE_LIST, "{FFFF00}Цвет авто 2", "Белый\nЧёрный\nОранжевый\nГолубой\nТёмно Синий\nКоричневый\nЗелёный\nТёмно красный\nСерый", "Ок", "Назад");
		}
		case DIALOG_TUNING_COLOR_2:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_TUNING_COLOR, DIALOG_STYLE_LIST, "{FFFF00}Цвет авто 1", "Белый\nЧёрный\nОранжевый\nГолубой\nТёмно Синий\nКоричневый\nЗелёный\nТёмно красный\nСерый", "Ок", "Назад");
			new color1, color2, vehid = GetPlayerVehicleID(playerid);
			GetVehicleColor(vehid, color1, color2);
			ChangeVehicleColor(vehid, color1, Carray[listitem]);
			ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
		}
		case DIALOG_TUNING_WHEELS:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), Warray[listitem]);
			ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
		}
		case DIALOG_TUNING_PAINTJOB_1:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob 1\nPaintjob 2\nPaintjob 3", "Ок", "Назад");
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
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
			}
		}
		case DIALOG_TUNING_PAINTJOB_2:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob 1\nPaintjob 2\nPaintjob 3", "Ок", "Назад");
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
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
			}
		}
		case DIALOG_TUNING_PAINTJOB_3:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob 1\nPaintjob 2\nPaintjob 3", "Ок", "Назад");
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
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
			}
		}
		case DIALOG_TUNING_PAINTJOB_4:
		{
			if(response)
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, DIALOG_TUNING_PAINTJOB_5, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Paintjob 1\nPaintjob 2\nPaintjob 3", "Ок", "Назад");
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
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
			}
		}
		case DIALOG_TUNING_PAINTJOB_5:
		{
			if(response && -1 < listitem < 3) ChangeVehiclePaintjob(GetPlayerVehicleID(playerid), listitem);
			RegularCarDialog(playerid);
		}
		case DIALOG_TUNING_COMPONENTS:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
			else
			{
				new vehid = GetPlayerVehicleID(playerid);
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_TUNING_SPOILERS_1, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Pro\nWin\nDrag\nAlpha\nChamp\nRace\nWorx\nFury", "Выбрать", "Назад");
					case 1:
					{
						switch(GetVehicleModel(vehid))
						{
							case 418, 527, 580, 585, 603:
							{
								AddVehicleComponent(vehid, 1006);
								RegularCarDialog(playerid);
							}
							case 439, 458, 491, 517, 547: ShowPlayerDialog(playerid, DIALOG_TUNING_VENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Oval\nSquare", "Выбрать", "Назад");
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
							case 549, 585, 603: ShowPlayerDialog(playerid, DIALOG_TUNING_VENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Oval\nSquare", "Выбрать", "Назад");
							case 410, 418, 436, 439, 458, 491, 516, 517, 527, 580:
							{
								AddVehicleComponent(vehid, 1007);
								AddVehicleComponent(vehid, 1071);
								RegularCarDialog(playerid);
							}
							default: ShowPlayerDialog(playerid, DIALOG_TUNING_SPOILERS_2, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Champ\nFury\nRace\nWorx", "Выбрать", "Назад");
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
							case 410, 436, 439, 458, 489, 505: ShowPlayerDialog(playerid, DIALOG_TUNING_LIGHTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Round Fog\nSquare Fog", "Выбрать", "Назад");
							default: ShowPlayerDialog(playerid, DIALOG_TUNING_VENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Oval\nSquare", "Выбрать", "Назад");
						}
					}
					case 4:
					{
						switch(GetVehicleModel(vehid))
						{
							case 549, 550, 585, 603: ShowPlayerDialog(playerid, DIALOG_TUNING_LIGHTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Round Fog\nSquare Fog", "Выбрать", "Назад");
							default:
							{
								AddVehicleComponent(vehid, 1007);
								AddVehicleComponent(vehid, 1071);
								RegularCarDialog(playerid);
							}
						}
					}
					case 5: ShowPlayerDialog(playerid, DIALOG_TUNING_LIGHTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Round Fog\nSquare Fog", "Выбрать", "Назад");
				}
			}
		}
		case DIALOG_TUNING_SPOILERS_1:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), Xarray1[listitem]);
			RegularCarDialog(playerid);
		}
		case DIALOG_TUNING_SPOILERS_2:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), Xarray2[listitem]);
			RegularCarDialog(playerid);
		}
		case DIALOG_TUNING_LIGHTS:
		{
			if(response) AddVehicleComponent(GetPlayerVehicleID(playerid), Xarray3[listitem]);
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
						if(!PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pKills] >= 300 && PlayerInfo[playerid][pMoney] >= 300000) ShowPlayerDialog(playerid, DIALOG_GANG_CREATE, DIALOG_STYLE_INPUT, "{FF0000}Создание банды", "Введите название банды:", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны выйти из своей банды, и у вас должно быть как минимум 300 очков и 300.000$");
					}
					case 1:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_SKIN_LEVEL, DIALOG_STYLE_LIST, "{FF0000}Назначение скинов", "Нуб\nИгрок\nДевушка\nЭлита\nЗам лидера\nЛидер", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
					}
					case 2:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pMoney] >= 300000 && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_SPAWN, DIALOG_STYLE_MSGBOX, "{FF0000}Назначение спавна", "Вы точно хотите назначить место спавна на этом месте?", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Для смены спавна требуется: уровень лидера и 300.000$");
					}
					case 3:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}Назначение уровня", "Введите id игрока, которому хотите назначить уровень:", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
					}
					case 4:
					{
						if(PlayerInfo[playerid][pGang])
						{
							new string[64];
							format(string, sizeof string, "{FFFF00}Общак банды \"%s\"", GName[PlayerInfo[playerid][pGang]]);
							ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "Посмотреть общак\nПоложить деньги\nВзять деньги\nПоложить DM-очки\nВзять DM-очки", "Выбрать", "Назад");
						}
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде.");
					}
					case 5:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pGangLvl] >= 4) ShowPlayerDialog(playerid, DIALOG_GANG_INVITE, DIALOG_STYLE_INPUT, "{FF0000}Приглашение в банду", "Введите id игрока, которого хотите пригласить:", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть как минимум 4 уровень.");
					}
					case 6:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pGangLvl] >= 5) ShowPlayerDialog(playerid, DIALOG_GANG_KICK, DIALOG_STYLE_INPUT, "{FF0000}Выгнать из банды", "Введите id игрока, которого хотите выгнать:", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть как минимум 5 уровень.");
					}
					case 7:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_COLOR, DIALOG_STYLE_INPUT, "{FF0000}Смена цвета", "Введите 6 символов формата RRGGBB:", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
					}
					case 8:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pMoney] >= 300000 && PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_NAME, DIALOG_STYLE_INPUT, "{FF0000}Смена названия", "Введите новое название банды\nв поле ниже:", "Принять", "Отмена");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Для смены названия требуется: уровень лидера и 300.000$");
					}
					case 9:
					{
						if(PlayerInfo[playerid][pGang] && PlayerInfo[playerid][pGangLvl] == 6)
						{
							new string[64];
							format(string, sizeof string, "Вы %s тег вашей банды", GTag[PlayerInfo[playerid][pGang]] ? ("отключили") : ("включили"));
							SendClientMessage(playerid, COLOR_YELLOW_2, string);
							GTag[PlayerInfo[playerid][pGang]] = !GTag[PlayerInfo[playerid][pGang]];
							format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
							new iniFile = ini_openFile(string);
							if(iniFile >= INI_OK)
							{
								ini_setInteger(iniFile, "Tag", GTag[PlayerInfo[playerid][pGang]]);
								ini_closeFile(iniFile);
							}
						}
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
					}
					case 10:
					{
						if(PlayerInfo[playerid][pGang]) ShowPlayerDialog(playerid, DIALOG_GANG_EXIT, DIALOG_STYLE_MSGBOX, "{FF0000}Выход из банды", "Вы точно хотите уйти из банды?", "Да", "Нет");
						else SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде.");
					}
				}
			}
		}
		case DIALOG_GANG_CREATE:
		{
			if(response)
			{
				for(new i, j = strlen(inputtext); i < j; i++)
				{
					if(inputtext[i] == '{') CheckDialogColor(inputtext, i, i + 7);
				}
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_CREATE, DIALOG_STYLE_INPUT, "{FF0000}Создание банды", "Введите название банды:", "Принять", "Отмена");
				format(GangName[playerid], sizeof GangName[], inputtext);
				ShowPlayerDialog(playerid, DIALOG_GANG_CREATE_COLOR, DIALOG_STYLE_INPUT, "{FF0000}Создание банды", "Введите цвет банды:", "Принять", "Отмена");
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_SKIN:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_SKIN, DIALOG_STYLE_INPUT, "{FF0000}Назначение скинов", "Введите ID скина, который хотите назначить:", "Принять", "Отмена");
				new skin = strval(inputtext);
				if(!(0 <= skin <= 311)) return SendClientMessage(playerid, COLOR_RED_GANG, "Неправильный ID скина!");
				new string[145];
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					format(string, sizeof string, "Skin%d", PlayerInfo[playerid][pGangSkin]);
					ini_setInteger(iniFile, string, skin);
					ini_closeFile(iniFile);
					format(string, sizeof string, "Скин успешно установлен! ID скина: %d", skin);
					SendClientMessage(playerid, COLOR_YELLOW_2, string);
					GSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangSkin] - 1] = skin;
					for(new i = GetPlayerPoolSize(); i != -1; --i)
					{
						if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == PlayerInfo[playerid][pGang] && PlayerInfo[i][pGangLvl] == PlayerInfo[playerid][pGangSkin]) SetPlayerSkin(i, skin);
					}
					PlayerInfo[playerid][pGangSkin] = -1;
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG_SKIN_LEVEL, DIALOG_STYLE_LIST, "{FF0000}Назначение скинов", "Нуб\nИгрок\nДевушка\nЭлита\nЗам лидера\nЛидер", "Принять", "Отмена");
		}
		case DIALOG_GANG_INVITE:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_INVITE, DIALOG_STYLE_INPUT, "{FF0000}Приглашение в банду", "Введите id игрока, которого хотите пригласить:", "Принять", "Отмена");
				new player = strval(inputtext);
				if(!IsPlayerConnected(player)) return SendClientMessage(playerid, -1, "Этот игрок не в игре!");
				if(PlayerInfo[player][pGang]) return SendClientMessage(playerid, -1, "Этот игрок уже в банде!");
				new string[145];
				format(string, sizeof string, "Игрок %s пригласил Вас в банду '%s'", PlayerInfo[playerid][pName], GName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(player, DIALOG_GANG_INV_ACCEPT, DIALOG_STYLE_MSGBOX, "{FF0000}Приглашение в банду", string, "Принять", "Отказать");
				format(string, sizeof string, "Лидер '%s' выслал приглашение игроку '%s'", PlayerInfo[playerid][pName], PlayerInfo[player][pName]);
				SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_RED_GANG, string);
				PlayerInfo[player][pTgang] = PlayerInfo[playerid][pGang];
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_EXIT:
		{
			if(response)
			{
				new string[145];
				format(string, sizeof string, "{FFFF00}'{FFFFFF}%s{FFFF00}' ушёл из банды!", PlayerInfo[playerid][pName]);
				for(new i = GetPlayerPoolSize(); i != -1; --i)
				{
					if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == PlayerInfo[playerid][pGang] && i != playerid) SendClientMessage(i, COLOR_YELLOW_2, string);
				}
				if(PlayerInfo[playerid][pGangLvl] == 6)
				{
					DestroyGang(PlayerInfo[playerid][pGang]);
					SendClientMessage(playerid, COLOR_YELLOW_2, "Ваша банда успешно удалена!");
					return 1;
				}
				PlayerInfo[playerid][pGang] = 0;
				PlayerInfo[playerid][pGangCheck] = 0;
				PlayerInfo[playerid][pGangLvl] = 0;
				SetPlayerHealth(playerid, 0.0);
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_SPAWN:
		{
			if(response)
			{
				for(new i = sizeof(TeamSpawns) - 1; i != -1; --i)
				{
					if(IsPlayerInRangeOfPoint(playerid, 50.0, TeamSpawns[i][0], TeamSpawns[i][1], TeamSpawns[i][2])) return SendClientMessage(playerid, COLOR_RED_GANG, "Нельзя устанавливать спавн возле респа других банд!");
				}
				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				GSpawn[PlayerInfo[playerid][pGang]][0] = x;
				GSpawn[PlayerInfo[playerid][pGang]][1] = y;
				GSpawn[PlayerInfo[playerid][pGang]][2] = z;
				GSpawnInt[PlayerInfo[playerid][pGang]] = GetPlayerInterior(playerid);
				DestroyPickup(GPick[PlayerInfo[playerid][pGang]]);
				Delete3DTextLabel(GLabel[PlayerInfo[playerid][pGang]]);
				PlayerInfo[playerid][pMoney] -= 300000;
				new string[64];
				format(string, sizeof string, "Респ банды .:: %s ::.", GName[PlayerInfo[playerid][pGang]]);
				GLabel[PlayerInfo[playerid][pGang]] = Create3DTextLabel(string, COLOR_LIME, x, y, z, 15.0, 0, 0);
				GPick[PlayerInfo[playerid][pGang]] = CreatePickup(1559, 1, x, y, z, -1);
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "SpawnInt", GSpawnInt[PlayerInfo[playerid][pGang]]);
					ini_setFloat(iniFile, "SpawnX", x);
					ini_setFloat(iniFile, "SpawnY", y);
					ini_setFloat(iniFile, "SpawnZ", z);
					ini_closeFile(iniFile);
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_LEVEL_ID:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}Назначение уровня", "Введите id игрока, которому хотите назначить уровень:", "Принять", "Отмена");
				new player = strval(inputtext);
				if(PlayerInfo[player][pGang] != PlayerInfo[playerid][pGang])
				{
					SendClientMessage(playerid, COLOR_YELLOW_2, "Игрок не в вашей банде!");
					ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}Назначение уровня", "Введите id игрока, которому хотите назначить уровень:", "Принять", "Отмена");
					return 1;
				}
				if(playerid == player)
				{
					SendClientMessage(playerid, COLOR_YELLOW_2, "Вы не можете назначить себе уровень!");
					ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}Назначение уровня", "Введите id игрока, которому хотите назначить уровень:", "Принять", "Отмена");
					return 1;
				}
				PlayerInfo[playerid][pId] = player;
				ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL, DIALOG_STYLE_LIST, "{FF0000}Назначение уровня", "Нуб\nИгрок\nДевушка\nЭлита\nЗам лидера", "Принять", "Отмена");
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_LEVEL:
		{
			if(response)
			{
				if(-1 < listitem < 5) PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl] = listitem + 1;
				new string[145];
				format(string, sizeof string, "Вы выдали игроку %s уровень %d", PlayerInfo[PlayerInfo[playerid][pId]][pName], PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl]);
				SendClientMessage(playerid, COLOR_YELLOW_2, string);
				format(string, sizeof string, "Лидер %s выдал Вам уровень %d", PlayerInfo[playerid][pName], PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl]);
				SendClientMessage(PlayerInfo[playerid][pId], COLOR_YELLOW_2, string);
				if(GSkin[PlayerInfo[playerid][pGang]][PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl]] >= 0) SetPlayerSkin(PlayerInfo[playerid][pId], GSkin[PlayerInfo[playerid][pGang]][PlayerInfo[PlayerInfo[playerid][pId]][pGangLvl] - 1]);
				PlayerInfo[playerid][pId] = -1;
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG_LEVEL_ID, DIALOG_STYLE_INPUT, "{FF0000}Назначение уровня", "Введите id игрока, которому хотите назначить уровень:", "Принять", "Отмена");
		}
		case DIALOG_GANG_STOCK:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						new string[64], string2[64];
						format(string, sizeof string, "{FFFF00}Общак банды \"%s\"", GName[PlayerInfo[playerid][pGang]]);
						format(string2, sizeof string2, "Денег в общаке: $%d\nDM очков в общаке: %d", GMoney[PlayerInfo[playerid][pGang]], GDMPoints[PlayerInfo[playerid][pGang]]);
						ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_AMOUNT, DIALOG_STYLE_MSGBOX, string, string2, "Ок", "");
					}
					case 1: ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Положить деньги", "Укажите сумму, которую вы хотите положить в общак:", "Ок", "Назад");
					case 2:
					{
						if(PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}Взять деньги", "Укажите сумму, которую вы хотите взять с общака:", "Ок", "Назад");
						else SendClientMessage(playerid, COLOR_RED_GANG, "У вас должен быть уровень лидера.");
					}
					case 3: ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Положить DM-очки", "Укажите количество DM-очков, которое вы хотите положить в общак:", "Ок", "Назад");
					case 4:
					{
						if(PlayerInfo[playerid][pGangLvl] == 6) ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Взять DM-очки", "Укажите количество DM-очков, которое вы хотите взять с общака:", "Ок", "Назад");
						else SendClientMessage(playerid, COLOR_RED_GANG, "У вас должен быть уровень лидера.");
					}
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_STOCK_AMOUNT:
		{
			new string[64];
			format(string, sizeof string, "{FFFF00}Общак банды \"%s\"", GName[PlayerInfo[playerid][pGang]]);
			ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "Посмотреть общак\nПоложить деньги\nВзять деньги\nПоложить DM-очки\nВзять DM-очки", "Выбрать", "Назад");
		}
		case DIALOG_GANG_STOCK_GIVE:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Положить деньги", "Укажите сумму, которую вы хотите положить в общак:", "Ок", "Назад");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "Вы указали неверную сумму!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Положить деньги", "Укажите сумму, которую вы хотите положить в общак:", "Ок", "Назад");
				}
				if(amount > PlayerInfo[playerid][pMoney])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "У вас нехватает денег!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE, DIALOG_STYLE_INPUT, "{FFFF00}Положить деньги", "Укажите сумму, которую вы хотите положить в общак:", "Ок", "Назад");
				}
				new string[64];
				PlayerInfo[playerid][pMoney] -= amount;
				GMoney[PlayerInfo[playerid][pGang]] += amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "Money", GMoney[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "Игрок %s положил $%d в общак банды", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "Вы успешно положили $%d в общак вашей банды", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				new string[64];
				format(string, sizeof string, "{FFFF00}Общак банды \"%s\"", GName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "Посмотреть общак\nПоложить деньги\nВзять деньги\nПоложить DM-очки\nВзять DM-очки", "Выбрать", "Назад");
			}
		}
		case DIALOG_GANG_STOCK_TAKE:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}Взять деньги", "Укажите сумму, которую вы хотите взять с общака:", "Ок", "Назад");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "Вы указали неверную сумму!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}Взять деньги", "Укажите сумму, которую вы хотите взять с общака:", "Ок", "Назад");
				}
				if(amount > GMoney[PlayerInfo[playerid][pGang]])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "В общаке нехватает денег!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE, DIALOG_STYLE_INPUT, "{FFFF00}Взять деньги", "Укажите сумму, которую вы хотите взять с общака:", "Ок", "Назад");
				}
				new string[64];
				PlayerInfo[playerid][pMoney] += amount;
				GMoney[PlayerInfo[playerid][pGang]] -= amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "Money", GMoney[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "Игрок %s взял $%d из общака банды", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "Вы успешно взяли $%d из общака вашей банды", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				new string[64];
				format(string, sizeof string, "{FFFF00}Общак банды \"%s\"", GName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "Посмотреть общак\nПоложить деньги\nВзять деньги\nПоложить DM-очки\nВзять DM-очки", "Выбрать", "Назад");
			}
		}
		case DIALOG_GANG_STOCK_GIVE_POINTS:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Положить DM-очки", "Укажите количество DM-очков, которое вы хотите положить в общак:", "Ок", "Назад");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "Вы указали неверное количество!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Положить DM-очки", "Укажите количество DM-очков, которое вы хотите положить в общак:", "Ок", "Назад");
				}
				if(amount > PlayerInfo[playerid][pDmPoints])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "У вас нехватает DM-очков!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_GIVE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Положить DM-очки", "Укажите количество DM-очков, которое вы хотите положить в общак:", "Ок", "Назад");
				}
				new string[64];
				PlayerInfo[playerid][pDmPoints] -= amount;
				GDMPoints[PlayerInfo[playerid][pGang]] += amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "DMPoints", GDMPoints[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "Игрок %s положил %d DM-очков в общак банды", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "Вы успешно положили %d DM-очков в общак вашей банды", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				new string[64];
				format(string, sizeof string, "{FFFF00}Общак банды \"%s\"", GName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "Посмотреть общак\nПоложить деньги\nВзять деньги\nПоложить DM-очки\nВзять DM-очки", "Выбрать", "Назад");
			}
		}
		case DIALOG_GANG_STOCK_TAKE_POINTS:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Взять DM-очки", "Укажите количество DM-очков, которое вы хотите взять с общака:", "Ок", "Назад");
				new amount = strval(inputtext);
				if(amount < 1)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "Вы указали неверное количество!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Взять DM-очки", "Укажите количество DM-очков, которое вы хотите взять с общака:", "Ок", "Назад");
				}
				if(amount > GDMPoints[PlayerInfo[playerid][pGang]])
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "В общаке нехватает DM-очков!");
					return ShowPlayerDialog(playerid, DIALOG_GANG_STOCK_TAKE_POINTS, DIALOG_STYLE_INPUT, "{FFFF00}Взять DM-очки", "Укажите количество DM-очков, которое вы хотите взять с общака:", "Ок", "Назад");
				}
				new string[64];
				PlayerInfo[playerid][pDmPoints] += amount;
				GDMPoints[PlayerInfo[playerid][pGang]] -= amount;
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setInteger(iniFile, "DMPoints", GDMPoints[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
					format(string, sizeof string, "Игрок %s взял %d DM-очков из общака банды", PlayerInfo[playerid][pName], amount);
					SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW, string);
					format(string, sizeof string, "Вы успешно взяли %d DM-очков из общака вашей банды", amount);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
				new string[64];
				format(string, sizeof string, "{FFFF00}Общак банды \"%s\"", GName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(playerid, DIALOG_GANG_STOCK, DIALOG_STYLE_LIST, string, "Посмотреть общак\nПоложить деньги\nВзять деньги\nПоложить DM-очки\nВзять DM-очки", "Выбрать", "Назад");
			}
		}
		case DIALOG_GANG_KICK:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_KICK, DIALOG_STYLE_INPUT, "{FF0000}Выгнать из банды", "Введите id игрока, которого хотите выгнать:", "Принять", "Отмена");
				new player = strval(inputtext);
				if(!IsPlayerConnected(player)) return SendClientMessage(playerid, -1, "Этот игрок не в игре!");
				if(PlayerInfo[player][pGang] != PlayerInfo[playerid][pGang]) return SendClientMessage(playerid, -1, "Этот игрок не в вашей банде!");
				if(playerid == player) return SendClientMessage(playerid, -1, "Вы не можете выгнать самого себя!");
				PlayerInfo[player][pGang] = 0;
				PlayerInfo[player][pGangCheck] = 0;
				PlayerInfo[player][pGangLvl] = 0;
				new string[145];
				format(string, sizeof string, "{FF0000}Вы были кикнуты из банды игроком '{FFFFFF}%s{FF0000}'", PlayerInfo[playerid][pName]);
				SendClientMessage(player, COLOR_RED_GANG, string);
				SetPlayerHealth(player, 0.0);
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_COLOR:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_COLOR, DIALOG_STYLE_INPUT, "{FF0000}Смена цвета", "Введите 6 символов формата RRGGBB:", "Принять", "Отмена");
				if(strlen(inputtext) != 6)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "Значение должно быть из 6 символов формата RRGGBB!");
					ShowPlayerDialog(playerid, DIALOG_GANG_COLOR, DIALOG_STYLE_INPUT, "{FF0000}Смена цвета", "Введите 6 символов формата RRGGBB:", "Принять", "Отмена");
					return 1;
				}
				LowerToUpper(inputtext);
				format(GColor[PlayerInfo[playerid][pGang]], sizeof GColor[], "%sFF", inputtext);
				SetPlayerColor(playerid, HexToInt(GColor[PlayerInfo[playerid][pGang]]));
				new string[145];
				format(string, sizeof string, "Теперь цвет вашей банды: {%s}%s", inputtext, GColor[PlayerInfo[playerid][pGang]]);
				SendClientMessage(playerid, COLOR_LIME_GANG, string);
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setString(iniFile, "Color", GColor[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_NAME:
		{
			if(response)
			{
				for(new i, j = strlen(inputtext); i < j; i++)
				{
					if(inputtext[i] == '{') CheckDialogColor(inputtext, i, i + 7);
				}
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_NAME, DIALOG_STYLE_INPUT, "{FF0000}Смена названия", "Введите новое имя банды\nв поле ниже:", "Принять", "Отмена");
				format(GName[PlayerInfo[playerid][pGang]], sizeof GName[], "%s", inputtext);
				new string[145];
				format(string, sizeof string, "Респ банды .:: %s ::.", GName[PlayerInfo[playerid][pGang]]);
				if(GLabel[PlayerInfo[playerid][pGang]] != Text3D:-1) Update3DTextLabelText(GLabel[PlayerInfo[playerid][pGang]], COLOR_LIME, string);
				format(string, sizeof string, "{FFFF00}Вы успешно изменили имя банды!\nНовое имя банды: {FF0000}%s\n", inputtext);
				ShowPlayerDialog(playerid, DIALOG_GANG_NAME_CHANGED, DIALOG_STYLE_MSGBOX, "{FF0000}Смена названия", string, "Ок", "");
				format(string, sizeof string, "Gangs/%d.ini", PlayerInfo[playerid][pGang]);
				PlayerInfo[playerid][pMoney] -= 300000;
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					ini_setString(iniFile, "Name", GName[PlayerInfo[playerid][pGang]]);
					ini_closeFile(iniFile);
				}
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_SKIN_LEVEL:
		{
			if(response)
			{
				if(-1 < listitem < 6) PlayerInfo[playerid][pGangSkin] = listitem + 1;
				ShowPlayerDialog(playerid, DIALOG_GANG_SKIN, DIALOG_STYLE_INPUT, "{FF0000}Назначение скинов", "Введите ID скина, который хотите назначить:", "Принять", "Отмена");
			}
			else ShowPlayerDialog(playerid, DIALOG_GANG, DIALOG_STYLE_LIST, "{FFFF00}Меню банды", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nОбщак банды\nПригласить в банду\nВыгнать из банды\nИзменить цвет банды\nИзменить название банды\nВкл/выкл тега банды\nУйти из банды", "Выбрать", "Отмена");
		}
		case DIALOG_GANG_INV_ACCEPT:
		{
			if(response)
			{
				PlayerInfo[playerid][pGang] = PlayerInfo[playerid][pTgang];
				PlayerInfo[playerid][pGangCheck] = GCheck[PlayerInfo[playerid][pGang]];
				PlayerInfo[playerid][pGangLvl] = 1;
				SetPlayerColor(playerid, HexToInt(GColor[PlayerInfo[playerid][pGang]]));
				new string[145];
				format(string, sizeof string, "Вы вступили в банду '%s'", GName[PlayerInfo[playerid][pGang]]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof string, "%s вступил в банду!", PlayerInfo[playerid][pName]);
				SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_YELLOW_2, string);
			}
			else
			{
				new string[145];
				format(string, sizeof string, "%s отказался от вступления в банду!", PlayerInfo[playerid][pName]);
				SendClientMessageToGang(PlayerInfo[playerid][pTgang], COLOR_YELLOW_2, string);
				PlayerInfo[playerid][pTgang] = 0;
			}
		}
		case DIALOG_GANG_CREATE_COLOR:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GANG_CREATE_COLOR, DIALOG_STYLE_INPUT, "{FF0000}Создание банды", "Введите цвет банды:", "Принять", "Отмена");
				if(strlen(inputtext) != 6)
				{
					SendClientMessage(playerid, COLOR_RED_GANG, "Значение должно быть из 6 символов формата RRGGBB!");
					ShowPlayerDialog(playerid, DIALOG_GANG_CREATE_COLOR, DIALOG_STYLE_INPUT, "{FF0000}Создание банды", "Введите цвет банды:", "Принять", "Отмена");
					return 1;
				}
				new year, month, day;
				getdate(year, month, day);
				new string[256], fgang = GetFreeGang();
				format(string, sizeof string, "Gangs/%d.ini", fgang);
				new iniFile = ini_createFile(string);
				if(iniFile >= INI_OK)
				{
					PlayerInfo[playerid][pGangLvl] = 6;
					PlayerInfo[playerid][pGang] = fgang;
					Gang[PlayerInfo[playerid][pGang]] = 1;
					GTag[PlayerInfo[playerid][pGang]] = true;
					PlayerInfo[playerid][pGangCheck] = gettime();
					GCheck[PlayerInfo[playerid][pGang]] = PlayerInfo[playerid][pGangCheck];
					format(GName[PlayerInfo[playerid][pGang]], sizeof GName[], GangName[playerid]);
					LowerToUpper(inputtext);
					format(GColor[PlayerInfo[playerid][pGang]], sizeof GColor[], "%sFF", inputtext);
					format(string, sizeof string, "%d/%d/%d", day, month, year);
					SetPlayerColor(playerid, HexToInt(GColor[PlayerInfo[playerid][pGang]]));
					PlayerInfo[playerid][pMoney] -= 300000;
					GPick[PlayerInfo[playerid][pGang]] = -1;
					GLabel[PlayerInfo[playerid][pGang]] = Text3D:-1;
					format(string, sizeof string, "{FFFF00}Банда успешно создана!\r\n{FFFF00}Название банды: %s\r\n{FFFF00}Цвет банды: {%s}%s\r\n{FFFF00}Дата основания: {FFFFFF}%s", GName[PlayerInfo[playerid][pGang]], inputtext, GColor[PlayerInfo[playerid][pGang]], string);
					ShowPlayerDialog(playerid, DIALOG_GANG_CREATED, DIALOG_STYLE_MSGBOX, "{FF0000}Создание банды", string, "Принять", "");
					ini_setString(iniFile, "Name", GName[PlayerInfo[playerid][pGang]]);
					ini_setString(iniFile, "Color", GColor[PlayerInfo[playerid][pGang]]);
					ini_setInteger(iniFile, "Check", GCheck[PlayerInfo[playerid][pGang]]);
					ini_setInteger(iniFile, "Money", GMoney[PlayerInfo[playerid][pGang]]);
					ini_setInteger(iniFile, "DMPoints", GDMPoints[PlayerInfo[playerid][pGang]]);
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
			else ShowPlayerDialog(playerid, DIALOG_GANG_CREATE, DIALOG_STYLE_INPUT, "{FF0000}Создание банды", "Введите название банды:", "Принять", "Отмена");
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
						OnPlayerCommandText(playerid, "/банды");
						return 1;
					}
				}
				new string[64];
				PlayerInfo[playerid][pGangId] = sgang;
				format(string, sizeof string, "{FFFF00}Банда \"%s\"", GName[sgang]);
				ShowPlayerDialog(playerid, DIALOG_GANGS_MENU, DIALOG_STYLE_LIST, string, "Члены банды онлайн\nВызвать на поединок", "Выбрать", "Назад");
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
						new string[256];
						for(new i = GetPlayerPoolSize(), string2[64]; i != -1; --i)
						{
							if(IsPlayerConnected(i) && PlayerInfo[playerid][pGangId] == PlayerInfo[i][pGang])
							{
								format(string2, sizeof string2, "%s [ID %d] [Уровень: %d]\n", PlayerInfo[i][pName], i, PlayerInfo[i][pGangLvl]);
								strcat(string, string2);
							}
						}
						if(!strlen(string)) strcat(string, "В данный момент нет членов банды онлайн");
						ShowPlayerDialog(playerid, DIALOG_GANG_ONLINE, DIALOG_STYLE_MSGBOX, "{FFFF00}Члены банды онлайн", string, "Ок", "");
					}
					case 1:
					{
						if(!PlayerInfo[playerid][pGang] || PlayerInfo[playerid][pGangLvl] < 6) return SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
						if(PlayerInfo[playerid][pGang] == PlayerInfo[playerid][pGangId]) return SendClientMessage(playerid, COLOR_RED_GANG, "Вы должны состоять в другой банде.");
						if(GetGangLeader(PlayerInfo[playerid][pGangId]) == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_GANG, "Лидер противоположной банды оффлайн.");
						new string[64];
						format(string, sizeof string, "Вы действительно хотите вызвать на поединок банду \"%s\"?", GName[PlayerInfo[playerid][pGangId]]);
						ShowPlayerDialog(playerid, DIALOG_GANG_BATTLE, DIALOG_STYLE_MSGBOX, "{FFFF00}Вызвать на поединок", string, "Ок", "Назад");
					}
				}
			}
			else OnPlayerCommandText(playerid, "/банды");
		}
		case DIALOG_GANG_ONLINE:
		{
			new string[64];
			format(string, sizeof string, "{FFFF00}Банда \"%s\"", GName[PlayerInfo[playerid][pGangId]]);
			ShowPlayerDialog(playerid, DIALOG_GANGS_MENU, DIALOG_STYLE_LIST, string, "Члены банды онлайн\nВызвать на поединок", "Выбрать", "Назад");
		}
		case DIALOG_GANG_BATTLE:
		{
			new string[145];
			if(response)
			{
				new gleader = GetGangLeader(PlayerInfo[playerid][pGangId]);
				if(gleader == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_GANG, "Лидер противоположной банды оффлайн.");
				format(string, sizeof string, "Банда \"%s\" приглашает вашу банду на поединок.\nСогласиться на поединок?", GName[PlayerInfo[playerid][pGang]]);
				ShowPlayerDialog(gleader, DIALOG_GANG_BATTLE_ACCEPT, DIALOG_STYLE_MSGBOX, "{FFFF00}Вызов на поединок", string, "Ок", "Отмена");
				PlayerInfo[gleader][pBattleId] = PlayerInfo[playerid][pGang];
				SendClientMessage(playerid, -1, "Приглашение на поединок отправлено.");
			}
			else
			{
				format(string, sizeof string, "{FFFF00}Банда \"%s\"", GName[PlayerInfo[playerid][pGangId]]);
				ShowPlayerDialog(playerid, DIALOG_GANGS_MENU, DIALOG_STYLE_LIST, string, "Члены банды онлайн\nВызвать на поединок", "Выбрать", "Назад");
			}
		}
		case DIALOG_GANG_BATTLE_ACCEPT:
		{
			if(response)
			{
				new gleader = GetGangLeader(PlayerInfo[playerid][pBattleId]);
				if(gleader == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_GANG, "Лидер противоположной банды вышел.");
				new Float:pX, Float:pY, Float:pZ, pInt = GetPlayerInterior(gleader), pVw = GetPlayerVirtualWorld(gleader);
				GetPlayerPos(gleader, pX, pY, pZ);
				for(new i = GetPlayerPoolSize(); i != -1; --i)
				{
					if(IsPlayerConnected(i) && i != gleader && (PlayerInfo[i][pGang] == PlayerInfo[playerid][pGang] || PlayerInfo[i][pGang] == PlayerInfo[playerid][pBattleId]))
					{
						SetPlayerPos(i, pX + random(4), pY + random(4), pZ + 1.0);
						SetPlayerVirtualWorld(i, pVw);
						SetPlayerInterior(i, pInt);
					}
				}
				SendClientMessageToGang(PlayerInfo[playerid][pGang], COLOR_BLUE, "Все члены банды телепортированы в зону конфликта");
				SendClientMessageToGang(PlayerInfo[playerid][pBattleId], COLOR_BLUE, "Все члены банды телепортированы в зону конфликта");
			}
			else
			{
				new string[128], gleader = GetGangLeader(PlayerInfo[playerid][pBattleId]);
				format(string, sizeof string, "Вы отказались от участия в поединке с бандой \"%s\"", GName[PlayerInfo[playerid][pBattleId]]);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				if(gleader == INVALID_PLAYER_ID) return 1;
				format(string, sizeof string, "Банда \"%s\" отказалась от участия в поединке!", GName[PlayerInfo[gleader][pGangId]]);
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
						if(!IsACar(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_RED, "Неон недоступен для этого транспорта!");
						ShowPlayerDialog(playerid, DIALOG_NEON, DIALOG_STYLE_LIST, "{FFFF00}Неон", "{004DFF}Синий\n{ff0000}Красный\n{14ff00}Зеленый\n{ffffff}Белый\n{ffcbdb}Розовый\n{ffff00}Желтый\n{fa8072}Удалить неон", "Выбрать", "Назад");
					}
					case 13: ShowPlayerDialog(playerid, DIALOG_CHANGE_NUMBER, DIALOG_STYLE_INPUT, "{FFFF00}Смена номера", "Введите новый номер автомобиля:", "Принять", "Отмена");
				}
			}
		}
		case DIALOG_CHANGE_NUMBER:
		{
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_CHANGE_NUMBER, DIALOG_STYLE_INPUT, "{FFFF00}Смена номера", "Введите новый номер автомобиля:", "Принять", "Отмена");
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
			if(!response) return ShowPlayerDialog(playerid, DIALOG_AVTO, DIALOG_STYLE_LIST, "{FFFF00}Авто-меню", AvtoStr, "Выбрать", "Отмена");
			switch(listitem)
			{
				case 0:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeon][0]);
					DestroyObject(PlayerInfo[playerid][pNeon][1]);
					DestroyObject(PlayerInfo[playerid][pNeon][2]);
					PlayerInfo[playerid][pNeon][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][3]);
					PlayerInfo[playerid][pNeon][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][4]);
					PlayerInfo[playerid][pNeon][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][5]);
					PlayerInfo[playerid][pNeon][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][6]);
					PlayerInfo[playerid][pNeon][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][7]);
					PlayerInfo[playerid][pNeon][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][8]);
					PlayerInfo[playerid][pNeon][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][9]);
					PlayerInfo[playerid][pNeon][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][10]);
					PlayerInfo[playerid][pNeon][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][11]);
					PlayerInfo[playerid][pNeon][11] = 0;
					PlayerInfo[playerid][pNeon][0] = CreateObject(18648, 0, 0, 0, 0, 0, 0);
					PlayerInfo[playerid][pNeon][1] = CreateObject(18648, 0, 0, 0, 0, 0, 0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 1:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeon][0]);
					PlayerInfo[playerid][pNeon][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][1]);
					PlayerInfo[playerid][pNeon][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][2]);
					DestroyObject(PlayerInfo[playerid][pNeon][3]);
					DestroyObject(PlayerInfo[playerid][pNeon][4]);
					PlayerInfo[playerid][pNeon][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][5]);
					PlayerInfo[playerid][pNeon][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][6]);
					PlayerInfo[playerid][pNeon][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][7]);
					PlayerInfo[playerid][pNeon][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][8]);
					PlayerInfo[playerid][pNeon][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][9]);
					PlayerInfo[playerid][pNeon][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][10]);
					PlayerInfo[playerid][pNeon][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][11]);
					PlayerInfo[playerid][pNeon][11] = 0;
					PlayerInfo[playerid][pNeon][2] = CreateObject(18647, 0, 0, 0, 0, 0, 0);
					PlayerInfo[playerid][pNeon][3] = CreateObject(18647, 0, 0, 0, 0, 0, 0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][2], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][3], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 2:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeon][0]);
					PlayerInfo[playerid][pNeon][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][1]);
					PlayerInfo[playerid][pNeon][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][2]);
					PlayerInfo[playerid][pNeon][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][3]);
					PlayerInfo[playerid][pNeon][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][4]);
					DestroyObject(PlayerInfo[playerid][pNeon][5]);
					DestroyObject(PlayerInfo[playerid][pNeon][6]);
					PlayerInfo[playerid][pNeon][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][7]);
					PlayerInfo[playerid][pNeon][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][8]);
					PlayerInfo[playerid][pNeon][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][9]);
					PlayerInfo[playerid][pNeon][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][10]);
					PlayerInfo[playerid][pNeon][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][11]);
					PlayerInfo[playerid][pNeon][11] = 0;
					PlayerInfo[playerid][pNeon][4] = CreateObject(18649, 0, 0, 0, 0, 0, 0);
					PlayerInfo[playerid][pNeon][5] = CreateObject(18649, 0, 0, 0, 0, 0, 0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][4], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][5], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 3:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeon][0]);
					PlayerInfo[playerid][pNeon][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][1]);
					PlayerInfo[playerid][pNeon][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][2]);
					PlayerInfo[playerid][pNeon][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][3]);
					PlayerInfo[playerid][pNeon][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][4]);
					PlayerInfo[playerid][pNeon][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][5]);
					PlayerInfo[playerid][pNeon][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][6]);
					DestroyObject(PlayerInfo[playerid][pNeon][7]);
					DestroyObject(PlayerInfo[playerid][pNeon][8]);
					PlayerInfo[playerid][pNeon][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][9]);
					PlayerInfo[playerid][pNeon][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][10]);
					PlayerInfo[playerid][pNeon][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][11]);
					PlayerInfo[playerid][pNeon][11] = 0;
					PlayerInfo[playerid][pNeon][6] = CreateObject(18652, 0, 0, 0, 0, 0, 0);
					PlayerInfo[playerid][pNeon][7] = CreateObject(18652, 0, 0, 0, 0, 0, 0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][6], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][7], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 4:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeon][0]);
					PlayerInfo[playerid][pNeon][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][1]);
					PlayerInfo[playerid][pNeon][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][2]);
					PlayerInfo[playerid][pNeon][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][3]);
					PlayerInfo[playerid][pNeon][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][4]);
					PlayerInfo[playerid][pNeon][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][5]);
					PlayerInfo[playerid][pNeon][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][6]);
					PlayerInfo[playerid][pNeon][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][7]);
					PlayerInfo[playerid][pNeon][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][8]);
					DestroyObject(PlayerInfo[playerid][pNeon][9]);
					DestroyObject(PlayerInfo[playerid][pNeon][10]);
					PlayerInfo[playerid][pNeon][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][11]);
					PlayerInfo[playerid][pNeon][11] = 0;
					PlayerInfo[playerid][pNeon][8] = CreateObject(18651, 0, 0, 0, 0, 0, 0);
					PlayerInfo[playerid][pNeon][9] = CreateObject(18651, 0, 0, 0, 0, 0, 0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][8], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][9], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 5:
				{
					PlayerInfo[playerid][pNeonStatus] = true;
					DestroyObject(PlayerInfo[playerid][pNeon][0]);
					PlayerInfo[playerid][pNeon][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][1]);
					PlayerInfo[playerid][pNeon][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][2]);
					PlayerInfo[playerid][pNeon][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][3]);
					PlayerInfo[playerid][pNeon][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][4]);
					PlayerInfo[playerid][pNeon][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][5]);
					PlayerInfo[playerid][pNeon][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][6]);
					PlayerInfo[playerid][pNeon][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][7]);
					PlayerInfo[playerid][pNeon][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][8]);
					PlayerInfo[playerid][pNeon][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][9]);
					PlayerInfo[playerid][pNeon][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][10]);
					DestroyObject(PlayerInfo[playerid][pNeon][11]);
					PlayerInfo[playerid][pNeon][10] = CreateObject(18650, 0, 0, 0, 0, 0, 0);
					PlayerInfo[playerid][pNeon][11] = CreateObject(18650, 0, 0, 0, 0, 0, 0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][10], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					AttachObjectToVehicle(PlayerInfo[playerid][pNeon][11], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				}
				case 6:
				{
					DestroyObject(PlayerInfo[playerid][pNeon][0]);
					PlayerInfo[playerid][pNeon][0] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][1]);
					PlayerInfo[playerid][pNeon][1] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][2]);
					PlayerInfo[playerid][pNeon][2] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][3]);
					PlayerInfo[playerid][pNeon][3] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][4]);
					PlayerInfo[playerid][pNeon][4] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][5]);
					PlayerInfo[playerid][pNeon][5] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][6]);
					PlayerInfo[playerid][pNeon][6] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][7]);
					PlayerInfo[playerid][pNeon][7] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][8]);
					PlayerInfo[playerid][pNeon][8] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][9]);
					PlayerInfo[playerid][pNeon][9] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][10]);
					PlayerInfo[playerid][pNeon][10] = 0;
					DestroyObject(PlayerInfo[playerid][pNeon][11]);
					PlayerInfo[playerid][pNeon][11] = 0;
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
			ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_1, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 1/4)", "Этап 1:\n********\nДобро пожаловать в мастер 'создания новой гонки'.\nПеред началом, мне нужно узнать имя гокни (например, SFRace) для её сохранения.\n\n>> Введите имя ниже и нажмите 'Далее' для продолжения.", "Далее", "Назад");
		}
		case DIALOG_RACE_CREATE_1, DIALOG_RACE_CREATE_1_ERROR:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE, DIALOG_STYLE_LIST, "{FFFF00}Создание новой гонки", "Обычная гонка\nВоздушная гонка", "Далее", "Выход");
			if(!strlen(inputtext) || !(1 <= strlen(inputtext) <= 20)) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_1_ERROR, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 1/4)", "ОШИБКА: Имя слишком длинное либо слишком короткое! (мин. 1 - макс. 20)\n\n\n\
			Этап 1:\n********\nДобро пожаловать в мастер 'создания новой гонки'.\nПеред началом, мне нужно узнать имя гокни (например, SFRace) для её сохранения.\n\n>> Введите имя ниже и нажмите 'Далее' для продолжения.", "Далее", "Назад");
			strmid(BuildName, inputtext, 0, strlen(inputtext), sizeof BuildName);
			ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 2/4)", "Этап 2:\n********\nПожалуйста, укажите ID или ИМЯ автомобиля, который будет использоваться в этой гонке.\n\n>> Введите ID или ИМЯ автомобиля ниже и нажмите 'Далее' для продолжения. 'Назад', чтобы что-то изменить.", "Далее", "Назад");
		}
		case DIALOG_RACE_CREATE_2, DIALOG_RACE_CREATE_2_ERROR:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_1, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 1/4)", "Этап 1:\n********\nДобро пожаловать в мастер 'создания новой гонки'.\nПеред началом, мне нужно узнать имя гокни (например, SFRace) для её сохранения.\n\n>> Введите имя ниже и нажмите 'Далее' для продолжения.", "Далее", "Назад");
			if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2_ERROR, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 2/4)", "ОШИБКА: Неверный ID/Имя автомобиля\n\n\nЭтап 2:\n********\n\
			Пожалуйста, укажите ID или ИМЯ автомобиля, который будет использоваться в этой гонке.\n\n>> Введите ID или ИМЯ автомобиля ниже и нажмите 'Далее' для продолжения. 'Назад', чтобы что-то изменить.", "Далее", "Назад");
			if(IsNumeric(inputtext))
			{
				new model = strval(inputtext);
				if(!(400 <= model <= 611)) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2_ERROR, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 2/4)", "ОШИБКА: Неверный ID/Имя автомобиля\n\n\nЭтап 2:\n********\n\
				Пожалуйста, укажите ID или ИМЯ автомобиля, который будет использоваться в этой гонке.\n\n>> Введите ID или ИМЯ автомобиля ниже и нажмите 'Далее' для продолжения. 'Назад', чтобы что-то изменить.", "Далее", "Назад");
				new Float:pPosX, Float:pPosY, Float:pPosZ, Float:pPosA;
				GetPlayerPos(playerid, pPosX, pPosY, pPosZ);
				GetPlayerFacingAngle(playerid, pPosA);
				BuildModeVID = model;
				DestroyVehicle(BuildVehicle);
				BuildVehicle = CreateVehicle(model, pPosX, pPosY, pPosZ, pPosA, random(126), random(126), 60 * 60);
				PutPlayerInVehicle(playerid, BuildVehicle, 0);
				ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_3, DIALOG_STYLE_MSGBOX, "{FFFF00}Создание новой гонки (Этап 3/4)", RaceCreate3Str, "Ок", "Назад");
			}
			else
			{
				if(!(400 <= ReturnVehicleID(inputtext) <= 611)) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2_ERROR, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 2/4)", "ОШИБКА: Неверный ID/Имя автомобиля\n\n\nЭтап 2:\n********\n\
				Пожалуйста, укажите ID или ИМЯ автомобиля, который будет использоваться в этой гонке.\n\n>> Введите ID или ИМЯ автомобиля ниже и нажмите 'Далее' для продолжения. 'Назад', чтобы что-то изменить.", "Далее", "Назад");
				new Float:pPosX, Float:pPosY, Float:pPosZ, Float:pPosA;
				GetPlayerPos(playerid, pPosX, pPosY, pPosZ);
				GetPlayerFacingAngle(playerid, pPosA);
				BuildModeVID = ReturnVehicleID(inputtext);
				DestroyVehicle(BuildVehicle);
				BuildVehicle = CreateVehicle(ReturnVehicleID(inputtext), pPosX, pPosY, pPosZ, pPosA, random(126), random(126), 60 * 60);
				PutPlayerInVehicle(playerid, BuildVehicle, 0);
				ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_3, DIALOG_STYLE_MSGBOX, "{FFFF00}Создание новой гонки (Этап 3/4)", RaceCreate3Str, "Ок", "Назад");
			}
		}
		case DIALOG_RACE_CREATE_3:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_2, DIALOG_STYLE_INPUT, "{FFFF00}Создание новой гонки (Этап 2/4)", "Этап 2:\n********\nПожалуйста, укажите ID или ИМЯ автомобиля, который будет использоваться в этой гонке.\n\n>> Введите ID или ИМЯ автомобиля ниже и нажмите 'Далее' для продолжения. 'Назад', чтобы что-то изменить.", "Далее", "Назад");
			SendClientMessage(playerid, COLOR_GREEN_RACE, "RACE: Подъедьте к линии старта на левой полосе и нажмите 'KEY_FIRE', сделайте тоже самое и на правой полосе.");
			SendClientMessage(playerid, COLOR_GREEN_RACE, " - Когда это будет сделано, Вы увидите диалоговое окно продолжения.");
			BuildTakeVehPos = true;
			BuildVehPosCount = 0;
		}
		case DIALOG_RACE_CREATE_4:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_3, DIALOG_STYLE_MSGBOX, "{FFFF00}Создание новой гонки (Этап 3/4)", RaceCreate3Str, "Ок", "Назад");
			SendClientMessage(playerid, COLOR_GREEN_RACE, "RACE: Чтобы создать чекпоинт, нажмите 'KEY_FIRE'.");
			SendClientMessage(playerid, COLOR_GREEN_RACE, " - ВАЖНО: Нажмите 'ENTER', когда Вы закончите! Если он не реагирует, нажмите его снова и снова.");
			BuildTakeCheckpoints = true;
			BuildCheckPointCount = 0;
		}
		case DIALOG_RACE_CREATE_DONE:
		{
			if(!response) return ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_DONE, DIALOG_STYLE_MSGBOX, "{FFFF00}Создание новой гонки (готово)", "Вы создали гонку и уже сейчас она готова к использованию.\n\n>> Нажмите 'Готово' для завершения. 'Выход' - для отмены.", "Готово", "Выход");
			DestroyVehicle(BuildVehicle);
			BuildTakeCheckpoints = false;
			BuildCheckPointCount = 0;
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
	if(objectid == FerrisWheelObjects[10])
	{
		SetTimer("RotateFerrisWheel", FERRIS_WHEEL_WAIT_TIME, 0);
		return 1;
	}
	if(objectid == Balloon)
	{
		switch(BalloonStage)
		{
			case 1: MoveObject(Balloon, 908.4518, -2037.1908, 64.0458, 5.0);
			case 2: MoveObject(Balloon, 994.5233, -2053.7102, 98.6453, 5.0);
			case 3: MoveObject(Balloon, 1141.4609, -2061.4761, 116.945, 5.0);
			case 4: MoveObject(Balloon, 1250.7042, -2025.9906, 119.145, 5.0);
			case 5: MoveObject(Balloon, 1154.7401, -1884.9833, 109.8451, 5.0);
			case 6: MoveObject(Balloon, 1010.0747, -1925.0986, 100.6452, 5.0);
			case 7: MoveObject(Balloon, 919.6353, -1966.6344, 75.6456, 5.0);
			case 8: MoveObject(Balloon, 875.8741, -1994.6158, 45.8461, 5.0);
			case 9: MoveObject(Balloon, 836.08, -2000.51, 13.6, 5.0);
			case 10:
			{
				BalloonLabel = Create3DTextLabel("Для запуска воздушного шара\nвведите /start", COLOR_ELEVATOR, 836.1572, -2000.5112, 14.7462, 15.0, 0, 0);
				BalloonIsStarted = false;
			}
		}
		BalloonStage++;
		return 1;
	}
	new Float:x, Float:y, Float:z;
	if(objectid == ObjElevator)
	{
		KillTimer(ElevatorBoostTmr);
		FloorRequestedBy[ElevatorFloor] = INVALID_PLAYER_ID;
		ElevatorOpenDoors();
		FloorOpenDoors(ElevatorFloor);
		GetObjectPos(ObjElevator, x, y, z);
		LabelElevator = Create3DTextLabel("Нажмите '~k~~CONVERSATION_YES~' для использования лифта", COLOR_ELEVATOR, 1784.9822, -1302.0426, z - 0.9, 4.0, 0, 1);
		ElevatorState = 1;
		SetTimer("ElevatorTurnToIdle", ELEVATOR_WAIT_TIME, 0);
		return 1;
	}
	for(new i; i < sizeof ObjFloorDoors; i++)
	{
		if(objectid == ObjFloorDoors[i][0])
		{
			GetObjectPos(ObjFloorDoors[i][0], x, y, z);
			if(x < X_DOOR_L_OPENED - 0.5)
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
	if(pickupid == TPls || pickupid == TPsf || pickupid == TPlv) return ShowPlayerDialog(playerid, DIALOG_TP, DIALOG_STYLE_LIST, "{FFFF00}Меню телепортов", "Los Santos\nSan Fierro\nLas Venturas\nДругое", "Ок", "Отмена");
	if(pickupid == TPChina)
	{
		SetPlayerPos(playerid, 1051.3702, -1290.4711, 13.8372);
		SetPlayerFacingAngle(playerid, 267.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		return 1;
	}
	for(new i = GetPlayerPoolSize(), Float:X, Float:Y, Float:Z; i != -1; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pMineStatus] && PlayerInfo[i][pMinePickup] == pickupid)
		{
			GetObjectPos(PlayerInfo[i][pMine][0], X, Y, Z);
			CreateExplosion(X, Y, Z, 7, 1);
			DestroyPickup(PlayerInfo[i][pMinePickup]);
			DestroyObject(PlayerInfo[i][pMine][0]);
			DestroyObject(PlayerInfo[i][pMine][1]);
			PlayerInfo[i][pMinePickup] = -1;
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
		for(new i = GetPlayerPoolSize(), ips[16]; i != -1; --i)
		{
			if(IsPlayerConnected(i))
			{
				GetPlayerIp(i, ips, sizeof ips);
				if(!strcmp(ip, ips, true)) return Kick(i);
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
				ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", "Нитро\nЦвет авто\nКолёса\nStereo\nГидравлика\nКомпоненты авто", "Выбрать", "Выход");
				GameTextForPlayer(playerid, "~r~-500$", 1000, 1);
				PlayerInfo[playerid][pMoney] -= 500;
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
				new string2[400];
				for(new i; i < sizeof ElevatorQueue; i++)
				{
					if(FloorRequestedBy[i] != INVALID_PLAYER_ID) strcat(string2, "{FF0000}");
					strcat(string2, FloorNames[i]);
				}
				ShowPlayerDialog(playerid, DIALOG_ELEVATOR, DIALOG_STYLE_LIST, "{FFFF00}Лифт", string2, "Выбрать", "Отмена");
			}
			else
			{
				if(-1301.4 < posY < -1299.1447 && 1781.9902 < posX < 1785.6147)
				{
					new i = 20;
					while(posZ < GetDoorsZCoordForFloor(i) + 3.5 && i > 0) i--;
					if(!i && posZ < GetDoorsZCoordForFloor(0) + 2.0) i = -1;
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
	if(newkeys & KEY_FIRE && BuildRace == playerid + 1)
	{
		if(BuildTakeVehPos)
		{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Вы должны быть в автомобиле");
			new Float:vPosX, Float:vPosY, Float:vPosZ, Float:vPosA;
			GetVehiclePos(GetPlayerVehicleID(playerid), vPosX, vPosY, vPosZ);
			GetVehicleZAngle(GetPlayerVehicleID(playerid), vPosA);
			new string[64];
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
				format(string, sizeof string, "RACE: Позиция машины '%d' установлена.", BuildVehPosCount + 1);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				BuildVehPosCount++;
			}
		}
		if(BuildVehPosCount > 1)
		{
			BuildVehPosCount = 0;
			BuildTakeVehPos = false;
			ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_4, DIALOG_STYLE_MSGBOX, "{FFFF00}Создание новой гонки (Этап 4/4)", RaceCreate4Str, "Ок", "Назад");
		}
		if(BuildTakeCheckpoints)
		{
			if(BuildCheckPointCount > MAX_RACE_CHECKPOINTS_EACH_RACE) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Вы достигли максимального количества чекпоинтов!");
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Вы должны быть в автомобиле");
			new Float:vPosX, Float:vPosY, Float:vPosZ;
			GetVehiclePos(GetPlayerVehicleID(playerid), vPosX, vPosY, vPosZ);
			new string[64];
			format(string, sizeof string, "/rRaceSystem/%s.RRACE", BuildName);
			new iniFile = ini_createFile(string);
			if(iniFile < 0) iniFile = ini_openFile(string);
			if(iniFile >= INI_OK)
			{
				format(string, sizeof string, "CP_%d_PosX", BuildCheckPointCount);
				ini_setFloat(iniFile, string, vPosX);
				format(string, sizeof string, "CP_%d_PosY", BuildCheckPointCount);
				ini_setFloat(iniFile, string, vPosY);
				format(string, sizeof string, "CP_%d_PosZ", BuildCheckPointCount);
				ini_setFloat(iniFile, string, vPosZ);
				ini_closeFile(iniFile);
				format(string, sizeof string, "RACE: Чекпоинт '%d' был создан!", BuildCheckPointCount + 1);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				BuildCheckPointCount++;
			}
		}
	}
	if(newkeys & KEY_SECONDARY_ATTACK && BuildTakeCheckpoints)
	{
		ShowPlayerDialog(playerid, DIALOG_RACE_CREATE_DONE, DIALOG_STYLE_MSGBOX, "{FFFF00}Создание новой гонки (готово)", "Вы создали гонку и уже сейчас она готова к использованию.\n\n>> Нажмите 'Готово' для завершения. 'Выход' - для отмены.", "Готово", "Выход");
		new iniFile = ini_openFile("/rRaceSystem/RaceNames/RaceNames.txt"), string[64];
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
			ini_setInteger(iniFile, "TotalCP", BuildCheckPointCount);
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
		new modelid = GetVehicleModel(GetPlayerVehicleID(playerid));
		if(modelid != RaceVehicle)
		{
			new string[145];
			format(string, sizeof string, "RACE: %s(%d) дисквалифицирован за смену транспорта! Модель в гонке: %d, у игрока: %d", PlayerInfo[playerid][pName], playerid, RaceVehicle, modelid);
			SendClientMessageToAll(COLOR_RED_RACE, string);
			SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Вы дисквалифицированы за смену транспорта!");
			StopPlayerRace(playerid);
			JoinCount--;
		}
		else if(PlayerInfo[playerid][pCPProgess] == TotalCP - 1)
		{
			new TimeStamp = GetTickCount(), TotalRaceTime;
			TotalRaceTime = TimeStamp - RaceTick;
			new rTime0, rTime1, rTime2;
			ConvertTime(var, TotalRaceTime, rTime0, rTime1, rTime2);
			new Prize0, Prize1;
			switch(TimeProgress + 1)
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
			new string[145];
			format(string, sizeof string, "{FF0000}RACE: {FFFF00}\"%s\" {00FF7F}завершил гонку. Место: {FFFF00}\"%d\"", PlayerInfo[playerid][pName], TimeProgress + 1);
			SendClientMessageToAll(-1, string);
			format(string, sizeof string, "{FF0000}RACE: {00FF7F}Время: {FFFF00}\"%02d:%02d.%d\"{00FF7F}. Награда - {FFFF00}\"$%d\"{00FF7F}. Очки - {FFFF00}\"%d\"", rTime0, rTime1, rTime2, Prize0, Prize1);
			SendClientMessageToAll(-1, string);
			if(FinishCount <= 5)
			{
				format(string, sizeof string, "/rRaceSystem/%s.RRACE", RaceName);
				new iniFile = ini_openFile(string);
				if(iniFile >= INI_OK)
				{
					new TempTotalTime;
					format(string, sizeof string, "BestRacerTime_%d", TimeProgress);
					ini_getInteger(iniFile, string, TempTotalTime);
					new TempTime0, TempTime1, TempTime2, time2 = TempTotalTime - TotalRaceTime;
					ConvertTime(var1, time2, TempTime0, TempTime1, TempTime2);
					if(TotalRaceTime <= TempTotalTime || !TempTotalTime)
					{
						ini_setInteger(iniFile, string, TotalRaceTime);
						if(TempTotalTime)
						{
							new racer[MAX_PLAYER_NAME];
							format(string, sizeof string, "BestRacer_%d", TimeProgress);
							ini_getString(iniFile, string, racer);
							format(string, sizeof string, "RACE: \"%s\" установил новый рекорд и был на \"%02d:%02d.%d\" секунд быстрее предыдущего победителя \"%s\"! Поздравляем: \"%d\" место!", PlayerInfo[playerid][pName], TempTime0, TempTime1, TempTime2, racer, TimeProgress + 1);
						}
						else format(string, sizeof string, "RACE: \"%s\" установил новый рекорд! Поздравляем: \"%d\" место!", PlayerInfo[playerid][pName], TimeProgress + 1);
						SendClientMessageToAll(COLOR_LIME, string);
						format(string, sizeof string, "BestRacer_%d", TimeProgress);
						ini_setString(iniFile, string, PlayerInfo[playerid][pName]);
						TimeProgress++;
					}
					ini_closeFile(iniFile);
				}
			}
			FinishCount++;
			PlayerInfo[playerid][pMoney] += Prize0;
			PlayerInfo[playerid][pPoints] += Prize1;
			DisablePlayerRaceCheckpoint(playerid);
			PlayerInfo[playerid][pCPProgess]++;
			if(FinishCount >= JoinCount) return StopRace();
		}
		else
		{
			PlayerInfo[playerid][pCPProgess]++;
			CPCoords[PlayerInfo[playerid][pCPProgess]][3]++;
			PlayerInfo[playerid][pRacePos] = floatround(CPCoords[PlayerInfo[playerid][pCPProgess]][3], floatround_floor);
			SetCP(playerid, PlayerInfo[playerid][pCPProgess], PlayerInfo[playerid][pCPProgess] + 1, TotalCP, RaceType);
			PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	new message[145];
	format(message, sizeof message, "You clicked on player %s (ID: %d)", PlayerInfo[clickedplayerid][pName], clickedplayerid);
	SendClientMessage(playerid, -1, message);
	format(message, sizeof message, "{FFFF00}%s(ID: %d)", PlayerInfo[clickedplayerid][pName], clickedplayerid);
	if(playerid != clickedplayerid) ShowPlayerDialog(playerid, DIALOG_PLAYER_MENU, DIALOG_STYLE_LIST, message, "Написать PM\nПередать деньги\nПригласить на PVP\nНаписать жалобу\nПригласить в банду\nПосмотреть статистику\nПередать DM-очки", "Выбрать", "Отмена");
	PlayerInfo[playerid][pClicked] = clickedplayerid;
	return 1;
}

fpublic RotateFerrisWheel()
{
	FerrisWheelAngle += 36;
	if(FerrisWheelAngle >= 360) FerrisWheelAngle = 0;
	if(FerrisWheelAlternate) FerrisWheelAlternate = 0;
	else FerrisWheelAlternate = 1;
	new Float:FerrisWheelModZPos = 0.0;
	if(FerrisWheelAlternate) FerrisWheelModZPos = 0.05;
	MoveObject(FerrisWheelObjects[10], 389.7734, -2028.4688, 22.0 + FerrisWheelModZPos, FERRIS_WHEEL_SPEED, 0, FerrisWheelAngle, 90);
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
			SetPlayerCameraPos(playerid, x + 10, y, z + 10);
			SetPlayerCameraLookAt(playerid, x, y, z);
			SetTimerEx("Jail", 1000, 0, "iii", playerid, time, 2);
		}
		case 2:
		{
			GetPlayerPos(playerid, x, y, z);
			SetPlayerCameraPos(playerid, x + 7, y, z + 5);
			SetPlayerCameraLookAt(playerid, x, y, z);
			if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
			SetTimerEx("Jail", 1000, 0, "iii", playerid, time, 3);
		}
		case 3:
		{
			GetPlayerPos(playerid, x, y, z);
			SetPlayerCameraPos(playerid, x + 3, y, z);
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
	GetObjectPos(PlayerInfo[playerid][pMine][0], X, Y, Z);
	switch(PlayerInfo[playerid][pMineCount])
	{
		case 11: PlayerInfo[playerid][pMineLabel] = Create3DTextLabel("До активации осталось: \n10 cекунд!", COLOR_MINE_10, X, Y, Z + 1, 40.0, 0);
		case 10: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_9, "До активации осталось: \n9 cекунд!");
		case 9: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_8, "До активации осталось: \n8 cекунд!");
		case 8: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_7, "До активации осталось: \n7 cекунд!");
		case 7: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_6, "До активации осталось: \n6 cекунд!");
		case 6: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_5, "До активации осталось: \n5 cекунд!");
		case 5: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_4, "До активации осталось: \n4 cекунды!");
		case 4: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_3, "До активации осталось: \n3 cекунды!");
		case 3: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_2, "До активации осталось: \n2 cекунды!");
		case 2: Update3DTextLabelText(PlayerInfo[playerid][pMineLabel], COLOR_MINE_1, "До активации осталось: \n1 cекунда!");
		case 1:
		{
			KillTimer(PlayerInfo[playerid][pMineTmr]);
			DestroyObject(PlayerInfo[playerid][pMine][1]);
			Delete3DTextLabel(PlayerInfo[playerid][pMineLabel]);
			PlayerInfo[playerid][pMinePickup] = CreatePickup(0, 1, X, Y, Z, -1);
			PlayerInfo[playerid][pMineLabel] = Text3D:-1;
			PlayerInfo[playerid][pMineStatus] = 2;
		}
	}
	PlayerInfo[playerid][pMineCount]--;
	return 1;
}

fpublic SetupRaceForPlayer(playerid)
{
	PlayerInfo[playerid][pCPProgess] = 0;
	TogglePlayerControllable(playerid, 0);
	CPCoords[playerid][3] = 0;
	SetCP(playerid, PlayerInfo[playerid][pCPProgess], PlayerInfo[playerid][pCPProgess] + 1, TotalCP, RaceType);
	if(IsOdd(playerid)) Index = 1;
	else Index = 0;
	switch(Index)
	{
		case 0:
		{
			if(PlayersCount[0] == 1)
			{
				RaceVehCoords[0][0] -= (6 * floatsin(-RaceVehCoords[0][3], degrees));
				RaceVehCoords[0][1] -= (6 * floatcos(-RaceVehCoords[0][3], degrees));
				PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2, RaceVehCoords[0][3], random(126), random(126), (60 * 60));
				SetPlayerPos(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2);
				SetPlayerFacingAngle(playerid, RaceVehCoords[0][3]);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
				Camera(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2], RaceVehCoords[0][3], 20);
			}
			else
			{
				PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2, RaceVehCoords[0][3], random(126), random(126), (60 * 60));
				SetPlayerPos(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2] + 2);
				SetPlayerFacingAngle(playerid, RaceVehCoords[0][3]);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
				Camera(playerid, RaceVehCoords[0][0], RaceVehCoords[0][1], RaceVehCoords[0][2], RaceVehCoords[0][3], 20);
				PlayersCount[0] = 1;
			}
		}
		case 1:
		{
			if(PlayersCount[1] == 1)
			{
				RaceVehCoords[1][0] -= (6 * floatsin(-RaceVehCoords[1][3], degrees));
				RaceVehCoords[1][1] -= (6 * floatcos(-RaceVehCoords[1][3], degrees));
				PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2, RaceVehCoords[1][3], random(126), random(126), (60 * 60));
				SetPlayerPos(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2);
				SetPlayerFacingAngle(playerid, RaceVehCoords[1][3]);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
				Camera(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2], RaceVehCoords[1][3], 20);
			}
			else
			{
				PlayerInfo[playerid][pCreatedRaceVeh] = CreateVehicle(RaceVehicle, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2, RaceVehCoords[1][3], random(126), random(126), (60 * 60));
				SetPlayerPos(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2] + 2);
				SetPlayerFacingAngle(playerid, RaceVehCoords[1][3]);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				PutPlayerInVehicle(playerid, PlayerInfo[playerid][pCreatedRaceVeh], 0);
				Camera(playerid, RaceVehCoords[1][0], RaceVehCoords[1][1], RaceVehCoords[1][2], RaceVehCoords[1][3], 20);
				PlayersCount[1] = 1;
			}
		}
	}
	PlayerInfo[playerid][pInfoTmr] = SetTimerEx("TextInfo", 500, 1, "i", playerid);
	new string[145];
	format(string, sizeof string, "RaceName: ~w~%s~n~~p~~h~Checkpoint: ~w~%d/%d~n~~b~~h~RaceTime: ~w~%s~n~~y~RacePosition: ~w~%d/%d~n~ ", RaceName, PlayerInfo[playerid][pCPProgess], TotalCP, TimeConvert(RaceTime), PlayerInfo[playerid][pRacePos], JoinCount);
	TextDrawSetString(PlayerInfo[playerid][pRaceInfo], string);
	TextDrawShowForPlayer(playerid, PlayerInfo[playerid][pRaceInfo]);
	JoinCount++;
	return 1;
}

fpublic CountTillRace()
{
	switch(CountAmount)
	{
		case 0:
		{
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				if(IsPlayerConnected(i) && !PlayerInfo[i][pInRace]) SendClientMessage(i, COLOR_YELLOW, "RACE: Гонка началась!");
			}
			StartRace();
		}
		case 1..5:
		{
			new string[10];
			format(string, sizeof string, "~b~%d", CountAmount);
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				if(IsPlayerConnected(i) && PlayerInfo[i][pInRace])
				{
					GameTextForPlayer(i, string, 999, 5);
					PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
				}
			}
		}
		case 60, 50, 40, 30, 20, 10:
		{
			new string[145];
			format(string, sizeof string, "RACE: \"%d\" секунд осталось до старта гонки \"%s\"! Введите \"/joinrace\", чтобы вступить в гонку или \"/exitrace\", чтобы выйти.", CountAmount, RaceName);
			SendClientMessageToAll(COLOR_GREEN_RACE, string);
		}
	}
	return CountAmount--;
}

fpublic PayDay(playerid)
{
	PlayerInfo[playerid][pMoney] += 5000;
	SendClientMessage(playerid, COLOR_CYAN, "Зарплата: 5000$");
	return 1;
}

fpublic SaveAccounts()
{
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && SaveAccount(i)) SendClientMessage(i, COLOR_SPRINGGREEN, "Данные аккаунта обновлены!");
	}
	return 1;
}

fpublic OnPlayerKick(playerid) return Kick(playerid);

fpublic OnPlayerBan(playerid) return Ban(playerid);

fpublic AntiSpawnKill(playerid)
{
	SetPlayerHealth(playerid, 100);
	SendClientMessage(playerid, COLOR_RED, "Anti-Spawnkill защита завершена.");
	return 1;
}

fpublic GiveMoney(playerid)
{
	PlayerInfo[playerid][pGiveMoney] = true;
	SendClientMessage(playerid, COLOR_GREEN, "*** Вы снова можете использовать команду /givemoney");
	return 1;
}

fpublic Promise(playerid)
{
	PlayerInfo[playerid][pPromise] = true;
	SendClientMessage(playerid, COLOR_GREEN, "*** Вы снова можете использовать команду /porvu");
	return 1;
}

fpublic PvpStarting(playerid)
{
	PlayerInfo[playerid][pPvpCount]--;
	SetPlayerHealth(playerid, 100);
	if(!PlayerInfo[playerid][pPvpCount])
	{
		GameTextForPlayer(playerid, "~g~GO!", 3000, 3);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		TogglePlayerControllable(playerid, 1);
		KillTimer(PlayerInfo[playerid][pCountPvpTmr]);
		return 1;
	}
	new string[10];
	format(string, sizeof string, "~w~%d", PlayerInfo[playerid][pPvpCount]);
	GameTextForPlayer(playerid, string, 999, 3);
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
	for(new i = GetPlayerPoolSize(), string[16]; i != -1; --i)
	{
		if(IsPlayerConnected(i))
		{
			format(string, sizeof string, "%d Km/h", GetPlayerSpeed(i, true));
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
	for(new i = GetPlayerPoolSize(), string[145], string2[32], temp; i != -1; --i)
	{
		if(IsPlayerConnected(i))
		{
			temp = GetPlayerPing(i);
			if(temp != 65535)
			{
				if(!AveragePing) AveragePing = temp;
				else AveragePing = floatround((AveragePing + temp) / 2);
				if(temp > MaxPing)
				{
					format(string, sizeof string, "%s кикнут с сервера. (Причина: Высокий пинг (%d) | В среднем (%d) | Максимальный (%d))", PlayerInfo[i][pName], temp, AveragePing, MaxPing);
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
					format(string, sizeof string, "Игрок %s(ID: %d) забанен за CHEAT %s!", PlayerInfo[i][pName], i, string2);
					SendClientMessageToAll(COLOR_BORDO, string);
					Ban2(i);
				}
			}
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER && GetPlayerSpeed(i, false) > 350)
			{
				format(string, sizeof string, "Игрок %s(ID: %d) забанен за SpeedHack!", PlayerInfo[i][pName], i);
				SendClientMessageToAll(COLOR_BORDO, string);
				Ban2(i);
			}
			if(1538 <= GetPlayerAnimationIndex(i) <= 1544 && GetPlayerSpeed(i, true) > 50)
			{
				format(string, sizeof string, "Игрок %s(ID: %d) кикнут за FlyHack!", PlayerInfo[i][pName], i);
				SendClientMessageToAll(COLOR_BORDO, string);
				Kick2(i);
			}
			if(++PlayerInfo[i][pAFKTime] >= 3)
			{
				if(PlayerInfo[i][pAFKTime] - 3 >= 600)
				{
					format(string, sizeof string, "*** [ %s ] кикнут за длительное пребывание в АФК.", PlayerInfo[i][pName]);
					SendClientMessageToAll(COLOR_GRAY, string);
					Kick2(i);
				}
				else
				{
					format(string, sizeof string, "АФК [%d:%02d]", floatround((PlayerInfo[i][pAFKTime] - 3) / 60, floatround_tozero), (PlayerInfo[i][pAFKTime] - 3) % 60);
					SetPlayerChatBubble(i, string, -1, 30.0, 1500);
				}
			}
			if(PlayerInfo[i][pGodMode]) SetPlayerHealth(i, 99999);
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
					if(PlayerInfo[i][pMuteTime] <= 0) PlayerInfo[i][pMute] = false;
					format(string, sizeof string, "MuteTime: ~w~%02d:%02d", floatround(PlayerInfo[i][pMuteTime] / 60, floatround_tozero), PlayerInfo[i][pMuteTime] % 60);
					PlayerTextDrawSetString(i, PlayerInfo[i][pMutedTime], string);
					PlayerTextDrawShow(i, PlayerInfo[i][pMutedTime]);
				}
				else PlayerTextDrawHide(i, PlayerInfo[i][pMutedTime]);
				if(PlayerInfo[i][pJail])
				{
					PlayerInfo[i][pJailTime]--;
					if(PlayerInfo[i][pJailTime] <= 0) UnJail(i);
				}
				if(PlayerInfo[i][pPunish])
				{
					PlayerInfo[i][pPunishTime]--;
					if(PlayerInfo[i][pPunishTime] <= 0)
					{
						PlayerInfo[i][pPunish] = false;
						PlayerInfo[i][pPunishTime] = 0;
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
	new string[145];
	format(string, sizeof string, "RaceName: ~w~%s~n~~p~~h~Checkpoint: ~w~%d/%d~n~~b~~h~RaceTime: ~w~%s~n~~y~RacePosition: ~w~%d/%d~n~", RaceName, PlayerInfo[playerid][pCPProgess], TotalCP, TimeConvert(RaceTime), PlayerInfo[playerid][pRacePos], JoinCount);
	TextDrawSetString(PlayerInfo[playerid][pRaceInfo], string);
	TextDrawShowForPlayer(playerid, PlayerInfo[playerid][pRaceInfo]);
	return 1;
}

fpublic RaceCounter()
{
	if(RaceStarted)
	{
		RaceTime--;
		if(JoinCount < 2)
		{
			if(!RaceChecked) SendClientMessageToAll(COLOR_RED_RACE, "RACE: Гонка закончена... Не набралось достаточное количество участников.");
			else SendClientMessageToAll(COLOR_RED_RACE, "RACE: Гонка закончена... Все участники покинули гонку.");
			StopRace();
			return 1;
		}
		else RaceChecked = true;
		if(RaceTime < 1)
		{
			SendClientMessageToAll(COLOR_RED_RACE, "RACE: Гонка закончена... Время гонки истекло.");
			StopRace();
			return 1;
		}
	}
	return 1;
}

fpublic CountFunc()
{
	CountCmd--;
	if(CountCmd)
	{
		new string[32];
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
	StopObject(ObjElevator);
	StopObject(ObjElevatorDoors[0]);
	StopObject(ObjElevatorDoors[1]);
	MoveObject(ObjElevator, 1786.6781, -1303.4594, GetElevatorZCoordForFloor(floorid), ELEVATOR_SPEED);
	MoveObject(ObjElevatorDoors[0], X_DOOR_CLOSED, -1303.4594, GetDoorsZCoordForFloor(floorid), ELEVATOR_SPEED);
	MoveObject(ObjElevatorDoors[1], X_DOOR_CLOSED, -1303.4594, GetDoorsZCoordForFloor(floorid), ELEVATOR_SPEED);
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
	new reason[145], i = -1;
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
	ObjElevator = CreateObject(18755, 1786.6781, -1303.4594, GROUND_Z_COORD + ELEVATOR_OFFSET, 0.0, 0.0, 270.0);
	ObjElevatorDoors[0] = CreateObject(18757, X_DOOR_CLOSED, -1303.4594, GROUND_Z_COORD, 0.0, 0.0, 270.0);
	ObjElevatorDoors[1] = CreateObject(18756, X_DOOR_CLOSED, -1303.4594, GROUND_Z_COORD, 0.0, 0.0, 270.0);
	LabelElevator = Create3DTextLabel("Нажмите '~k~~CONVERSATION_YES~' для использования лифта", COLOR_ELEVATOR, 1784.9822, -1302.0426, 13.6491, 4.0, 0, 1);
	for(new i, string[145], Float:z; i < sizeof ObjFloorDoors; i++)
	{
		ObjFloorDoors[i][0] = CreateObject(18757, X_DOOR_CLOSED, -1303.171142, GetDoorsZCoordForFloor(i), 0.0, 0.0, 270.0);
		ObjFloorDoors[i][1] = CreateObject(18756, X_DOOR_CLOSED, -1303.171142, GetDoorsZCoordForFloor(i), 0.0, 0.0, 270.0);
		format(string, sizeof string, "%s\nНажмите '~k~~CONVERSATION_YES~' для вызова лифта", FloorNames[i]);
		if(!i) z = 13.4713;
		else z = 13.4713 + 8.7396 + ((i - 1) * 5.45155);
		LabelFloors[i] = Create3DTextLabel(string, COLOR_ELEVATOR, 1783.9799, -1300.7660, z, 10.5, 0, 1);
	}
	FloorOpenDoors(0);
	ElevatorOpenDoors();
	return 1;
}

ElevatorDestroy()
{
	DestroyObject(ObjElevator);
	DestroyObject(ObjElevatorDoors[0]);
	DestroyObject(ObjElevatorDoors[1]);
	Delete3DTextLabel(LabelElevator);
	for(new i = sizeof(ObjFloorDoors) - 1; i != -1; --i)
	{
		DestroyObject(ObjFloorDoors[i][0]);
		DestroyObject(ObjFloorDoors[i][1]);
		Delete3DTextLabel(LabelFloors[i]);
	}
	return 1;
}

ElevatorOpenDoors()
{
	new Float:x, Float:y, Float:z;
	GetObjectPos(ObjElevatorDoors[0], x, y, z);
	MoveObject(ObjElevatorDoors[0], X_DOOR_L_OPENED, y, z, DOORS_SPEED);
	MoveObject(ObjElevatorDoors[1], X_DOOR_R_OPENED, y, z, DOORS_SPEED);
	return 1;
}

ElevatorCloseDoors()
{
	if(ElevatorState == 2) return 0;
	new Float:x, Float:y, Float:z;
	GetObjectPos(ObjElevatorDoors[0], x, y, z);
	MoveObject(ObjElevatorDoors[0], X_DOOR_CLOSED, y, z, DOORS_SPEED);
	MoveObject(ObjElevatorDoors[1], X_DOOR_CLOSED, y, z, DOORS_SPEED);
	return 1;
}

FloorOpenDoors(floorid)
{
	MoveObject(ObjFloorDoors[floorid][0], X_DOOR_L_OPENED, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	MoveObject(ObjFloorDoors[floorid][1], X_DOOR_R_OPENED, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	PlaySoundForPlayersInRange(6401, 50.0, X_DOOR_CLOSED, -1303.1711, GetDoorsZCoordForFloor(floorid) + 5.0);
	return 1;
}

FloorCloseDoors(floorid)
{
	MoveObject(ObjFloorDoors[floorid][0], X_DOOR_CLOSED, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	MoveObject(ObjFloorDoors[floorid][1], X_DOOR_CLOSED, -1303.1711, GetDoorsZCoordForFloor(floorid), DOORS_SPEED);
	PlaySoundForPlayersInRange(6401, 50.0, X_DOOR_CLOSED, -1303.1711, GetDoorsZCoordForFloor(floorid) + 5.0);
	return 1;
}

ElevatorMoveToFloor(floorid)
{
	ElevatorState = 2;
	ElevatorFloor = floorid;
	MoveObject(ObjElevator, 1786.6781, -1303.4594, GetElevatorZCoordForFloor(floorid), 0.25);
	MoveObject(ObjElevatorDoors[0], X_DOOR_CLOSED, -1303.4594, GetDoorsZCoordForFloor(floorid), 0.25);
	MoveObject(ObjElevatorDoors[1], X_DOOR_CLOSED, -1303.4594, GetDoorsZCoordForFloor(floorid), 0.25);
	ElevatorBoostTmr = SetTimerEx("ElevatorBoost", 2000, 0, "i", floorid);
	Delete3DTextLabel(LabelElevator);
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
		if(!ElevatorState) ReadNextFloorInQueue();
		return 1;
	}
	return 0;
}

ResetElevatorQueue()
{
	for(new i = sizeof(ElevatorQueue) - 1; i != -1; --i)
	{
		ElevatorQueue[i] = -1;
		FloorRequestedBy[i] = INVALID_PLAYER_ID;
	}
	return 1;
}

IsFloorInQueue(floorid)
{
	for(new i = sizeof(ElevatorQueue) - 1; i != -1; --i)
	{
		if(ElevatorQueue[i] == floorid) return 1;
	}
	return 0;
}

ReadNextFloorInQueue()
{
	if(ElevatorState || ElevatorQueue[0] == -1) return 0;
	ElevatorCloseDoors();
	FloorCloseDoors(ElevatorFloor);
	return 1;
}

DidPlayerRequestElevator(playerid)
{
	for(new i = sizeof(FloorRequestedBy) - 1; i != -1; --i)
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
		new string[64];
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

LoadRace(racename[], playerid = INVALID_PLAYER_ID)
{
	new string[64];
	format(string, sizeof string, "/rRaceSystem/%s.RRACE", racename);
	if(!fexist(string))
	{
		if(playerid != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Гонка не существует!");
		return printf("Гонка \"%s\" не существует!", racename);
	}
	strmid(RaceName, racename, 0, strlen(racename), sizeof RaceName);
	new iniFile = ini_openFile(string), i;
	if(iniFile >= INI_OK)
	{
		ini_getInteger(iniFile, "vModel", RaceVehicle);
		ini_getInteger(iniFile, "rType", RaceType);
		ini_getInteger(iniFile, "TotalCP", TotalCP);
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
		for(i = 0; i < TotalCP; i++)
		{
			format(string, sizeof string, "CP_%d_PosX", i);
			ini_getFloat(iniFile, string, CPCoords[i][0]);
			format(string, sizeof string, "CP_%d_PosY", i);
			ini_getFloat(iniFile, string, CPCoords[i][1]);
			format(string, sizeof string, "CP_%d_PosZ", i);
			ini_getFloat(iniFile, string, CPCoords[i][2]);
			CPCoords[i][3] = 0;
		}
		ini_closeFile(iniFile);
	}
	JoinCount = 0;
	FinishCount = 0;
	TimeProgress = 0;
	PlayersCount[0] = 0;
	PlayersCount[1] = 0;
	CountAmount = COUNT_DOWN_TILL_RACE_START;
	RaceTime = MAX_RACE_TIME;
	RaceBusy = true;
	if(playerid != INVALID_PLAYER_ID)
	{
		PlayerInfo[playerid][pInRace] = true;
		SetupRaceForPlayer(playerid);
	}
	CountTmr = SetTimer("CountTillRace", 999, 1);
	return 1;
}

DeleteRace(racename[], playerid = INVALID_PLAYER_ID)
{
	new string[64];
	format(string, sizeof string, "/rRaceSystem/%s.RRACE", racename);
	if(!fexist(string))
	{
		if(playerid != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED_RACE, "RACE: Гонка не существует!");
		return printf("Гонка \"%s\" не существует!", racename);
	}
	fremove(string);
	SendClientMessage(playerid, COLOR_YELLOW, "RACE: Гонка удалена!");
	new iniFile = ini_openFile("/rRaceSystem/RaceNames/RaceNames.txt");
	if(iniFile >= INI_OK)
	{
		ini_getInteger(iniFile, "TotalRaces", TotalRaces);
		for(new i, krace = -1, rname[21]; i < TotalRaces; i++)
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
		ini_getInteger(iniFile, "TotalRaces", TotalRaces);
		for(new i, rname[21], string[64]; i < TotalRaces; i++)
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
	for(new i = GetPlayerPoolSize(); i != -1; --i)
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
	JoinCount = 0;
	FinishCount = 0;
	TimeProgress = 0;
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pInRace]) StopPlayerRace(i);
	}
	SendClientMessageToAll(COLOR_YELLOW, "RACE: Гонка завершена!");
	if(AutomaticRace)
	{
		LoadRaceNames();
		LoadRace(RaceNames[random(TotalRaces)]);
	}
	return 1;
}

StopPlayerRace(playerid)
{
	PlayerInfo[playerid][pCPProgess] = 0;
	PlayerInfo[playerid][pInRace] = false;
	DisablePlayerRaceCheckpoint(playerid);
	DestroyVehicle(PlayerInfo[playerid][pCreatedRaceVeh]);
	TextDrawHideForPlayer(playerid, PlayerInfo[playerid][pRaceInfo]);
	KillTimer(PlayerInfo[playerid][pInfoTmr]);
	return 1;
}

SetCP(playerid, PrevCP, NextCP, MaxCP, Type)
{
	if(NextCP == MaxCP) return SetPlayerRaceCheckpoint(playerid, Type + 1, CPCoords[PrevCP][0], CPCoords[PrevCP][1], CPCoords[PrevCP][2], CPCoords[NextCP][0], CPCoords[NextCP][1], CPCoords[NextCP][2], RACE_CHECKPOINT_SIZE);
	SetPlayerRaceCheckpoint(playerid, Type, CPCoords[PrevCP][0], CPCoords[PrevCP][1], CPCoords[PrevCP][2], CPCoords[NextCP][0], CPCoords[NextCP][1], CPCoords[NextCP][2], RACE_CHECKPOINT_SIZE);
	return 1;
}

TimeConvert(seconds)
{
	new minutes = floatround(seconds / 60);
	seconds -= minutes * 60;
	new tmp[16];
	format(tmp, sizeof tmp, "%d:%02d", minutes, seconds);
	return tmp;
}

ReturnVehicleID(vName[])
{
	for(new i = 211; i != -1; --i)
	{
		if(strfind(VehicleNames[i], vName, true) != -1) return i + 400;
	}
	return -1;
}

RegularCarDialog(playerid)
{
	switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
	{
		case 549: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[1], "Выбрать", "Назад");
		case 550: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[2], "Выбрать", "Назад");
		case 585, 603: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[3], "Выбрать", "Назад");
		case 410, 436: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[4], "Выбрать", "Назад");
		case 439, 458: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[5], "Выбрать", "Назад");
		case 492, 529, 551: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[6], "Выбрать", "Назад");
		case 489, 505: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[7], "Выбрать", "Назад");
		case 516: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[8], "Выбрать", "Назад");
		case 491, 517: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[9], "Выбрать", "Назад");
		case 418, 527, 580: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[10], "Выбрать", "Назад");
		case 420, 587: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[11], "Выбрать", "Назад");
		case 547: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[12], "Выбрать", "Назад");
		case 415: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[13], "Выбрать", "Назад");
		default: ShowPlayerDialog(playerid, DIALOG_TUNING_COMPONENTS, DIALOG_STYLE_LIST, "{FFFF00}Меню тюнинга", RegularCarStr[0], "Выбрать", "Назад");
	}
	return 1;
}

Punish(playerid)
{
	SendClientMessage(playerid, COLOR_YELLOW, "Вы были наказаны за попытку убийства на спавне!");
	SetPlayerPos(playerid, -1350.1162, 994.3682, 1024.0056);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 15);
	PlayerInfo[playerid][pPunish] = true;
	PlayerInfo[playerid][pPunishTime] = JAIL_FOR_SPAWN_KILL * 60;
	return 1;
}

UnJail(playerid)
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	SetPlayerPos(playerid, 1552.4484, -1674.9886, 16.1953);
	SetPlayerSkin(playerid, TeamSkins[PlayerInfo[playerid][pClass]]);
	if(PlayerInfo[playerid][pSkin] >= 0) SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	if(PlayerInfo[playerid][pGang] && GSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1] >= 0) SetPlayerSkin(playerid, GSkin[PlayerInfo[playerid][pGang]][PlayerInfo[playerid][pGangLvl] - 1]);
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
	for(new i = MAX_GANGS - 1, j, iniFile, string[64]; i != -1; --i)
	{
		for(j = sizeof(GSkin[]) - 1; j != -1; --j) GSkin[i][j] = -1;
		format(string, sizeof string, "Gangs/%d.ini", i);
		iniFile = ini_openFile(string);
		if(iniFile >= INI_OK)
		{
			ini_getString(iniFile, "Name", GName[i]);
			ini_getString(iniFile, "Color", GColor[i]);
			ini_getInteger(iniFile, "Check", GCheck[i]);
			ini_getInteger(iniFile, "Money", GMoney[i]);
			ini_getInteger(iniFile, "DMPoints", GDMPoints[i]);
			ini_getInteger(iniFile, "SpawnInt", GSpawnInt[i]);
			ini_getFloat(iniFile, "SpawnX", GSpawn[i][0]);
			ini_getFloat(iniFile, "SpawnY", GSpawn[i][1]);
			ini_getFloat(iniFile, "SpawnZ", GSpawn[i][2]);
			ini_getInteger(iniFile, "Skin1", GSkin[i][0]);
			ini_getInteger(iniFile, "Skin2", GSkin[i][1]);
			ini_getInteger(iniFile, "Skin3", GSkin[i][2]);
			ini_getInteger(iniFile, "Skin4", GSkin[i][3]);
			ini_getInteger(iniFile, "Skin5", GSkin[i][4]);
			ini_getInteger(iniFile, "Skin6", GSkin[i][5]);
			ini_getInteger(iniFile, "Tag", GTag[i]);
			ini_closeFile(iniFile);
			if(GSpawn[i][0] && GSpawn[i][1] && GSpawn[i][2])
			{
				format(string, sizeof string, "Респ банды .:: %s ::.", GName[i]);
				GLabel[i] = Create3DTextLabel(string, COLOR_LIME, GSpawn[i][0], GSpawn[i][1], GSpawn[i][2], 15.0, 0, 0);
				GPick[i] = CreatePickup(1559, 1, GSpawn[i][0], GSpawn[i][1], GSpawn[i][2], -1);
			}
			else
			{
				GLabel[i] = Text3D:-1;
				GPick[i] = -1;
			}
			Gang[i] = 1;
		}
	}
	return 1;
}

DestroyGang(gangid)
{
	new string[32], i;
	format(string, sizeof string, "Gangs/%d.ini", gangid);
	fremove(string);
	GCheck[gangid] = 0;
	GKills[gangid] = 0;
	GMoney[gangid] = 0;
	GDMPoints[gangid] = 0;
	DestroyPickup(GPick[gangid]);
	Delete3DTextLabel(GLabel[gangid]);
	for(i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == gangid)
		{
			PlayerInfo[i][pGang] = 0;
			PlayerInfo[i][pGangCheck] = 0;
			PlayerInfo[i][pGangLvl] = 0;
			SetPlayerHealth(i, 0.0);
		}
	}
	for(i = sizeof(GSkin[]) - 1; i != -1; --i) GSkin[gangid][i] = -1;
	for(i = sizeof(GSpawn[]) - 1; i != -1; --i) GSpawn[gangid][i] = 0.0;
	GLabel[gangid] = Text3D:-1;
	GColor[gangid][0] = EOS;
	GName[gangid][0] = EOS;
	GSpawnInt[gangid] = 0;
	GTag[gangid] = true;
	GPick[gangid] = -1;
	Gang[gangid] = 0;
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
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == gangid && PlayerInfo[i][pGangLvl] == 6) return i;
	}
	return INVALID_PLAYER_ID;
}

PlaySoundForAll(soundid, Float:x, Float:y, Float:z)
{
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i)) PlayerPlaySound(i, soundid, x, y, z);
	}
	return 1;
}

PlaySoundForPlayersInRange(soundid, Float:range, Float:x, Float:y, Float:z)
{
	for(new i = GetPlayerPoolSize(); i != -1; --i)
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

GetPlayerSpeed(playerid, bool:speed3d)
{
	new Float:pX, Float:pY, Float:pZ;
	if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid), pX, pY, pZ);
	else GetPlayerVelocity(playerid, pX, pY, pZ);
	if(speed3d) return floatround(VectorSize(pX, pY, pZ) * 179.28625);
	return floatround(VectorSize(pX, pY, 0.0) * 179.28625);
}

SendClientMessageToAdmins(color, message[])
{
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && IsPlayerAdminEx(i, 1)) SendClientMessage(i, color, message);
	}
	return 1;
}

SendClientMessageWithoutPlayer(playerid, color, message[])
{
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && i != playerid) SendClientMessage(i, color, message);
	}
	return 1;
}

SendClientMessageToGang(gangid, color, message[])
{
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pGang] == gangid) SendClientMessage(i, color, message);
	}
	return 1;
}

SendClientMessageToTeam(teamid, color, message[])
{
	for(new i = GetPlayerPoolSize(); i != -1; --i)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pTeam] == teamid) SendClientMessage(i, color, message);
	}
	return 1;
}

Camera(playerid, Float:X, Float:Y, Float:Z, Float:A, Mul)
{
	SetPlayerCameraLookAt(playerid, X, Y, Z);
	return SetPlayerCameraPos(playerid, X + (Mul * floatsin(-A, degrees)), Y + (Mul * floatcos(-A, degrees)), Z + 6);
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
	for(new i = strlen(text) - 1; i != -1; --i)
	{
		switch(text[i])
		{
			case 97..122, 224..255: text[i] -= 32;
			case 184: text[i] = 168;
		}
	}
	return 1;
}

UpperToLower(text[])
{
	for(new i = strlen(text) - 1; i != -1; --i)
	{
		switch(text[i])
		{
			case 65..90, 192..223: text[i] += 32;
			case 168: text[i] = 184;
		}
	}
	return 1;
}

IsNumeric(string[])
{
	for(new i, j = strlen(string); i < j; i++)
	{
		if(!('0' <= string[i] <= '9')) return 0;
	}
	return 1;
}

IsEmptyMessage(string[])
{
	for(new i; string[i] != 0x0; i++)
	{
		switch(string[i])
		{
			case 0x20: continue;
			default: return 0;
		}
	}
	return 1;
}

GetNumberOfPlayersOnThisIP(test_ip[])
{
	new ip_count;
	for(new i = GetPlayerPoolSize(), against_ip[16]; i != -1; --i)
	{
		if(IsPlayerConnected(i))
		{
			GetPlayerIp(i, against_ip, sizeof against_ip);
			if(!strcmp(against_ip, test_ip)) ip_count++;
		}
	}
	return ip_count;
}

ContainsAnyIP(string[])
{
	new digits, digitGroups;
	for(new pos; ; pos++)
	{
		switch(string[pos])
		{
			case 0: break;
			case '0'..'9': digits++;
			default:
			{
				if(digits >= 2)
				{
					digitGroups++;
					digits = 0;
				}
			}
		}
	}
	if(digits >= 2) digitGroups++;
	if(digitGroups >= 4) return 1;
	return 0;
}

strfuzzyfind(const string[], const sub[], pos = 0, &start = -1, &end = -1)
{
	new len = strlen(string), sublen = strlen(sub), s[2];
	s[0] = sub[0];
	pos -= 1;
	while(-1 != (pos = strfind(string, s, true, ++pos)))
	{
		for(new i = pos, j = 0; i < len; i++)
		{
			switch(string[i])
			{
				case 'a'..'z', 'A'..'Z', 'а'..'я', 'А'..'Я':
				{
					if(string[i] != sub[j++]) break;
					if(j == sublen)
					{
						start = pos;
						end = i;
						return pos;
					}
				}
			}
		}
	}
	return -1;
}

CheckDialogColor(text[], first, end)
{
	if(text[first] != '{' || text[end] != '}') return 0;
	for(new i = first + 1; i < end; i++)
	{
		switch(text[i])
		{
			case 'A'..'F', 'a'..'f', '0'..'9': continue;
			default: return 0;
		}
	}
	strdel(text, first, end + 1);
	return 1;
}

HexToInt(string[])
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
