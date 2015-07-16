//
//  ScreenLogView.h
//  Created by 0xabc on 15/7/7.
//  Copyright © 2015年 0xabc. All rights reserved.
//

/*
 //usage
 ScreenLogView *lv = [[ScreenLogView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 22)];
 [self.view addSubview:lv];
 // or [self.window bringSubviewToFront:lv];
 [lv autoUpdateWithFrequency:1.0];
 */

#import <UIKit/UIKit.h>

@interface ScreenLogView : UILabel
- (void)autoUpdateWithFrequency:(NSTimeInterval)ti;
@end
