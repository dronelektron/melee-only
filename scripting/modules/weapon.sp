int Weapon_GetPrimaryAmmoType(int weapon) {
    return GetEntProp(weapon, Prop_Send, "m_iPrimaryAmmoType");
}

void Weapon_SetPrimaryClip(int weapon, int clip) {
    SetEntProp(weapon, Prop_Send, "m_iClip1", clip);
}
