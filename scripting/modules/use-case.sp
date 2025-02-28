static bool g_meleeModeEnabled = false;

void UseCase_MeleeMode_Toggle(bool enabled) {
    if (g_meleeModeEnabled == enabled) {
        return;
    }

    g_meleeModeEnabled = enabled;

    if (enabled) {
        StripPlayers();
        RemoveDroppedAmmoBoxes();
    }

    Command_Drop_Toggle(enabled);
    Event_PlayerSpawn_Toggle(enabled);
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
    Client_RemoveWeapon(client, Slot_Grenade);

    if (HasMelee(client)) {
        return;
    }

    Client_RemoveWeapon(client, Slot_Melee); // Smoke grenade
}

static bool HasMelee(int client) {
    int weapon = GetPlayerWeaponSlot(client, Slot_Melee);

    if (weapon == INVALID_INDEX) {
        return false;
    }

    int ammoType = Weapon_GetPrimaryAmmoType(weapon);

    return ammoType == INVALID_INDEX;
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
