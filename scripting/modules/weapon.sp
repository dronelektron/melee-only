int Weapon_GetPrimaryAmmoType(int weapon) {
    return GetEntProp(weapon, Prop_Send, "m_iPrimaryAmmoType");
}

void Weapon_SetPrimaryClip(int weapon, int clip) {
    SetEntProp(weapon, Prop_Send, "m_iClip1", clip);
}

int Weapon_GetOwner(int weapon) {
    return GetEntPropEnt(weapon, Prop_Send, "m_hOwnerEntity");
}
