# ScreenLogView
usage
ScreenLogView *lv = [[ScreenLogView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 22)];
[self.view addSubview:lv];
// or [self.window bringSubviewToFront:lv];
[lv autoUpdateWithFrequency:1.0];
