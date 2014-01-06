//
//  WYScreenshotCatcher.h
//  ScreenshotTest
//
//  Created by William Yang on 2014/1/5.
//  Copyright (c) 2014年 William Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYScreenshotCatcher;
@protocol WYScreenshotCatcherDelegate <NSObject>

@required
- (void)screenshotCatcher:(WYScreenshotCatcher *)catcher didCatchScreenshotImage:(UIImage *)screenshotImage;
- (void)screenshotCatcher:(WYScreenshotCatcher *)catcher didFailToCatchScreenshotImageWithError:(NSError *)error;

@end

@interface WYScreenshotCatcher : NSObject

+ (instancetype)sharedCatcher;

@property (nonatomic, weak) id<WYScreenshotCatcherDelegate> delegate;

@end
