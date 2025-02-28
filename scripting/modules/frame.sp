void Frame_StripPlayer(int userId) {
    RequestFrame(OnStripPlayer, userId);
}

static void OnStripPlayer(int userId) {
    int client = GetClientOfUserId(userId);

    if (client > INVALID_CLIENT) {
        UseCase_StripPlayer(client);
    }
}
