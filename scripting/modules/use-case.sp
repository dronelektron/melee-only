static bool g_meleeModeEnabled = false;

void UseCase_MeleeMode_Toggle(bool enabled) {
    if (g_meleeModeEnabled == enabled) {
        return;
    }

    g_meleeModeEnabled = enabled;

    if (enabled) {
        StripPlayers();
        RemoveDroppedWeapons();
        RemoveDroppedAmmoBoxes();
    }

    Command_DropAmmo_Toggle(enabled);
    Event_PlayerSpawn_Toggle(enabled);
    WeaponDrop_Toggle(enabled);
}

static void StripPlayers() {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            UseCase_StripPlayer(client);
        }
    }
}

void UseCase_StripPlayer(int client) {
    if (IsPlayerAlive(client)) {
        RemoveBullets(client);
        RemoveGrenades(client);
    }
}

static void RemoveBullets(int client) {
    Client_SetPrimaryClip(client, Slot_Primary, 0);
    Client_SetPrimaryAmmo(client, Slot_Primary, 0);
    Client_SetPrimaryClip(client, Slot_Secondary, 0);
    Client_SetPrimaryAmmo(client, Slot_Secondary, 0);
}

static void RemoveGrenades(int client) {
    if (Client_HasSmokeGrenade(client)) {
        Client_RemoveWeapon(client, Slot_Melee);
    }

    Client_RemoveWeapon(client, Slot_Grenade);
}

static void RemoveDroppedWeapons() {
    // Allies
    RemoveDroppedWeaponsByClassName("weapon_garand");
    RemoveDroppedWeaponsByClassName("weapon_thompson");
    RemoveDroppedWeaponsByClassName("weapon_bar");
    RemoveDroppedWeaponsByClassName("weapon_spring");
    RemoveDroppedWeaponsByClassName("weapon_30cal");
    RemoveDroppedWeaponsByClassName("weapon_bazooka");
    // Axis
    RemoveDroppedWeaponsByClassName("weapon_k98");
    RemoveDroppedWeaponsByClassName("weapon_mp40");
    RemoveDroppedWeaponsByClassName("weapon_mp44");
    RemoveDroppedWeaponsByClassName("weapon_k98_scoped");
    RemoveDroppedWeaponsByClassName("weapon_mg42");
    RemoveDroppedWeaponsByClassName("weapon_pschreck");
}

static void RemoveDroppedWeaponsByClassName(const char[] className) {
    int entity = INVALID_INDEX;

    while (FindWeapon(entity, className)) {
        if (Weapon_GetOwner(entity) == INVALID_INDEX) {
            RemoveEntity(entity);
        }
    }
}

static bool FindWeapon(int& entity, const char[] className) {
    entity = FindEntityByClassname(entity, className);

    return entity > INVALID_INDEX;
}

static void RemoveDroppedAmmoBoxes() {
    int entity = INVALID_INDEX;

    while (FindAmmoBox(entity)) {
        RemoveEntity(entity);
    }
}

static bool FindAmmoBox(int& entity) {
    entity = FindEntityByClassname(entity, "dod_ammo_box");

    return entity > INVALID_INDEX;
}

static void WeaponDrop_Toggle(bool enabled) {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            SdkHook_WeaponDrop_Toggle(client, enabled);
        }
    }
}
