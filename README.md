# ByFly GTA: SA GangWar

**This gamemode in Russian.**

Недолго думая я взялся делать мод в жанре TDM: копию мода того сервера, на котором я начинал играть.  
Рад представить вам возрождение мода ByFly GTA: SA GangWar.

## Важные примечания
1. Сервер на файлах
2. ЛАМО (двуручное оружие) запрещено
3. Никаких систем доната, vip, покупок админки и прочего

## Особенности
* **12 стандартных банд**  
Грув, Балласы, Ацтеки, Нанги, Вагосы, Копы, Мафия, Байкеры, Триады, Админы, Армия, Клан бандит  
За админов можно входить только имея админку
* **Транспорт на респавнах банд и по штату**  
Огромное количество совершенно разного транспорта во всех населённых пунктах  
Некоторый доступен только определённым бандам
* **Гангзоны у каждой банды с возможностью захвата**  
Территорию можно захватить, убив членов вражеской банды несколько раз. Таким же образом зону можно и отвоевать
* **Пикапы с оружием, здоровьем и бронёй по карте**  
Ещё кое-где присутствует JetPack. ЛАМО-оружие не встречается
* **Гонки с возможностью создания своих из игры**  
Также возможность автоматического запуска новой гонки по окончанию предыдущей  
Результаты гонок сохраняются. Победителям награда в виде денег и гоночных очков
* **DM-зоны (8 штук)**  
8-я зона отличается от предыдущих: игра ведётся на снайперках и убить можно с 2-х выстрелов
* **Создаваемые игроками банды**  
С обширным списком возможностей: от назначения скинов для рангов, до включения/выключения тега банды в чате  
Баги с "перемешиванием" банд у оффлайн игроков исправлены
* **Система PvP с 5-ю аренами**  
С возможностью выбора оружия, ставки, наличия брони и т.д.
* **Управление авто на клавиши num (капот, багажник, фары и т.д.)**  
Также присутствуют и аналогичные команды для управления, тюнинга и т.д.
* **Телепорты в аэропортах ЛС, СФ, ЛВ**  
Из любого аэропорта доступно меню с множеством телепортов
* **Лифт в одном из небоскрёбов в ЛС**  
Собственно, взял его основу из стандартного скрипта ls_elevator
* **Рабочее колесо обозрения на пирсе ЛС**  
Тоже из стандартных. Команды для запуска отсутствуют, работает без них
* **Воздушный шар, тоже на причале в ЛС**  
После его запуска облетает по заданным координатам, после чего возвращается назад
* **Система мин (при наступании взрываются)**  
Работают только пешком. При выходе игрока мина удаляется
* **Простенький спидометр**  
Простенький, ничего лишнего :)

В целом, подойдёт для основы.  
По коду: стиль везде практически одинаков, с табуляцией проблем нет.  
Новичкам, думаю, будет понятен.

## Места
* Парковка со спортивными авто (/stuntpr)
* Китайский ресторан (/china)
* Bloodring (/bloodring)
* BigJump зона (/sjump)
* SexShop (/sadomazo)
* Drag зона (/drag)
* Vip-остров (/vip)

## Античиты
Самые основные на мой взгляд:
* Anti-Dialog Crasher
* Anti-Bullet Crasher
* Anti-Advertising
* Anti-Weapon Hack
* Anti-Tuning Hack
* Anti-Dialog Hack
* Anti-High ping
* Anti-Money Hack
* Anti-Spawn kill
* Anti-Rcon Hack
* Anti-SpeedHack
* Anti-SandBox
* Anti-FlyHack
* Anti-DriveBy
* Anti-C bug
* Anti-Swear
* Anti-Flood

## Скриншоты
* [Система PVP](https://imgur.com/a/nWwTe)
* [Система гонок](https://imgur.com/a/TYsF0)
* [Система банд](https://imgur.com/a/6mwan)
* [Система DM-зон](https://imgur.com/a/yFi0P)
* [Система захвата территорий](https://imgur.com/a/abV9o)
* [Другое](https://imgur.com/a/FMTuu)

## Обзор
[Обзор модов #9 | ByFly GTA SA GangWar](https://youtube.com/watch?v=OO5IgK_6q_w)

## Зависимости
Для работы мода требуются:
1. [mxINI](https://github.com/Open-GTO/mxINI)
2. [GetVehicleColor](https://pastebin.com/CS5X1C96)

Все нужные библиотеки в архиве с модом.

## Установка
1. Распакуйте скачанный архив из "[Releases](https://github.com/NexiusTailer/ByFly-GTA-SA-GangWar/releases)" секции
2. В server.crg измените значение maxplayers на нужное вам количество игроков
3. В GangWar.pwn (в самом начале) измените значение MAX_PLAYERS на нужное вам количество игроков
4. Запустите сервер, зайдите на него и зарегистрируйтесь, потом выйдите
5. В scriptfiles\Users\[ваш никнейм].ini измените значение Admin на 10

## Благодарности
Magic_York за советы и помощь  
Magic_York, Andrew_York, TheHero, HeavenX, Eduard_Stream, Zoopi, Unisheld, KailloN за помощь в тесте

## Использовались работы
* Vip Island by SiNoK
* [Mine](https://sampforum.blast.hk/showthread.php?tid=247928) by Apec
* [rRace](https://sampforum.blast.hk/showthread.php?tid=143764) by Ryder
* [Hot air balloon](https://sampforum.blast.hk/showthread.php?tid=293843) by adri1
* [Teleport menu](https://sampforum.blast.hk/showthread.php?tid=250248) by captainjohn
* [Chow's Chinese Restaurant](https://sampforum.blast.hk/showthread.php?tid=246223) by GrimmjowJJ
* GangSystem by \_TeraN\_(ZakMage), modifed by Jekson and ARH[I]VIRUS
* [Ultimate Vehicle Tuning Filescript](https://sampforum.blast.hk/showthread.php?tid=253908) by Antonio144
* [L Admin](https://sampforum.blast.hk/showthread.php?tid=19819) by LethaL

За основу был взят мод [Los Santos Gang Wars](https://sampforum.blast.hk/showthread.php?tid=17866) by LethaL
