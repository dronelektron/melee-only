static bool g_meleeModeEnabled = false;

void UseCase_MeleeMode_Toggle(bool enabled) {
    if (g_meleeModeEnabled == enabled) {
        return;
    }

    g_meleeModeEnabled = enabled;

    if (enabled) {
        PrintToServer("[DEBUG] Melee mode: enabled");
    } else {
        PrintToServer("[DEBUG] Melee mode: disabled");
    }
}
