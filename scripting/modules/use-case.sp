static bool g_meleeModeEnabled = false;

void UseCase_MeleeMode_Toggle(bool enabled) {
    if (g_meleeModeEnabled == enabled) {
        return;
    }

    g_meleeModeEnabled = enabled;

    if (enabled) {
        StripPlayers();
    }
}

static void StripPlayers() {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            StripPlayer(client);
        }
    }
}

static void StripPlayer(int client) {
    if (IsPlayerAlive(client)) {
        RemoveBullets(client);
    }
}

static void RemoveBullets(int client) {
    Client_SetPrimaryClip(client, Slot_Primary, 0);
    Client_SetPrimaryAmmo(client, Slot_Primary, 0);
    Client_SetPrimaryClip(client, Slot_Secondary, 0);
    Client_SetPrimaryAmmo(client, Slot_Secondary, 0);
}
