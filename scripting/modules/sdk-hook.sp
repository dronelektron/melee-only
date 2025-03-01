void SdkHook_WeaponDrop_Toggle(int client, bool enabled) {
    if (enabled) {
        SDKHook(client, SDKHook_WeaponDrop, OnWeaponDrop);
    } else {
        SDKUnhook(client, SDKHook_WeaponDrop, OnWeaponDrop);
    }
}

static Action OnWeaponDrop(int client, int weapon) {
    return Plugin_Handled;
}
