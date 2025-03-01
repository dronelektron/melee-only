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

void Client_RemoveWeapon(int client, int slot) {
    int weapon = GetPlayerWeaponSlot(client, slot);

    if (weapon == INVALID_INDEX) {
        return;
    }

    RemovePlayerItem(client, weapon);
    RemoveEntity(weapon);
}

bool Client_HasSmokeGrenade(int client) {
    int weapon = GetPlayerWeaponSlot(client, Slot_Melee);

    if (weapon == INVALID_INDEX) {
        return false;
    }

    int ammoType = Weapon_GetPrimaryAmmoType(weapon);

    return ammoType > INVALID_INDEX;
}

static void SetAmmo(int client, int ammo, int ammoType) {
    SetEntProp(client, Prop_Send, "m_iAmmo", ammo, _, ammoType);
}
