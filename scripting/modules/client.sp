void Client_SetPrimaryClip(int client, int slot, int clip) {
    int weapon = GetPlayerWeaponSlot(client, slot);

    if (weapon == INVALID_INDEX) {
        return;
    }

    Weapon_SetPrimaryClip(weapon, clip);
}

void Client_SetPrimaryAmmo(int client, int slot, int ammo) {
    int weapon = GetPlayerWeaponSlot(client, slot);

    if (weapon == INVALID_INDEX) {
        return;
    }

    int ammoType = Weapon_GetPrimaryAmmoType(weapon);

    SetAmmo(client, ammo, ammoType);
}

static void SetAmmo(int client, int ammo, int ammoType) {
    SetEntProp(client, Prop_Send, "m_iAmmo", ammo, _, ammoType);
}
