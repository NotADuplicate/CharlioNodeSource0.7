if (ballApproachPath != -1 && path_exists(ballApproachPath)) {
    path_delete(ballApproachPath);
}
if (navigationPath != -1 && path_exists(navigationPath)) {
    path_delete(navigationPath);
}
