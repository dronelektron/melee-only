void Command_DropAmmo_Toggle(bool enabled) {
    if (enabled) {
        AddCommandListener(OnDropAmmo, COMMAND_DROP_AMMO);
    } else {
        RemoveCommandListener(OnDropAmmo, COMMAND_DROP_AMMO);
    }
}

static Action OnDropAmmo(int client, const char[] command, int args) {
    return Plugin_Stop;
}
