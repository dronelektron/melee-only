void Command_Drop_Toggle(bool enabled) {
    if (enabled) {
        AddCommandListener(OnDrop, COMMAND_DROP);
        AddCommandListener(OnDrop, COMMAND_DROP_AMMO);
    } else {
        RemoveCommandListener(OnDrop, COMMAND_DROP);
        RemoveCommandListener(OnDrop, COMMAND_DROP_AMMO);
    }
}

static Action OnDrop(int client, const char[] command, int args) {
    return Plugin_Stop;
}
