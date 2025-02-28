void Event_PlayerSpawn_Toggle(bool enabled) {
    if (enabled) {
        HookEvent(EVENT_PLAYER_SPAWN, OnPlayerSpawn);
    } else {
        UnhookEvent(EVENT_PLAYER_SPAWN, OnPlayerSpawn);
    }
}

static void OnPlayerSpawn(Event event, const char[] name, bool dontBroadcast) {
    int userId = event.GetInt("userid");

    Frame_StripPlayer(userId);
}
