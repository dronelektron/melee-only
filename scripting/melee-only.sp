#include <sourcemod>
#include <sdktools>

#include "melee-only/console-command"
#include "melee-only/event"
#include "melee-only/use-case"
#include "melee-only/weapon"

#include "modules/client.sp"
#include "modules/console-command.sp"
#include "modules/console-variable.sp"
#include "modules/event.sp"
#include "modules/frame.sp"
#include "modules/use-case.sp"
#include "modules/weapon.sp"

public Plugin myinfo = {
    name = "Melee only",
    author = "Dron-elektron",
    description = "Allows you to enable melee mode",
    version = "1.0.0",
    url = "https://github.com/dronelektron/melee-only"
};

public void OnPluginStart() {
    Variable_Create();
}
