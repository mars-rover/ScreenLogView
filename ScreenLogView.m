//
//  ScreenLogView.m
//  Created by 0xabc on 15/7/7.
//  Copyright © 2015年 0xabc. All rights reserved.
//

#import "ScreenLogView.h"
#import <mach/mach.h>

@implementation ScreenLogView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.alpha = 0.6f;
        self.userInteractionEnabled = NO;
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor redColor];
        self.font = [UIFont systemFontOfSize:12.0f];
        [self updateMemoryInfo];
    }
    return self;
}

- (double)availableMemory {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0;
}

- (double)appUsedMemory {
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}

- (void)autoUpdateWithFrequency:(NSTimeInterval)ti {
    [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(updateMemoryInfo) userInfo:nil repeats:YES];
}

- (void)updateMemoryInfo {
    NSString *str = [NSString stringWithFormat:@"程序已经使用／可用内存: %.1fM/%.1fM",[self appUsedMemory], [self availableMemory]];
    self.text = str;
}

@end

