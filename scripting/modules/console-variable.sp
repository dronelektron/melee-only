static ConVar g_meleeOnly;

void Variable_Create() {
    g_meleeOnly = CreateConVar("sm_meleeonly", "0", "Enable (1) or disable (0) melee mode");
    g_meleeOnly.AddChangeHook(OnMeleeMode);
}

static void OnMeleeMode(ConVar variable, const char[] oldValue, const char[] newValue) {
    bool enabled = variable.BoolValue;

    UseCase_MeleeMode_Toggle(enabled);
}
