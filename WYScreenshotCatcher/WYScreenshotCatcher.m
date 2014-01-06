//
//  WYScreenshotCatcher.m
//  ScreenshotTest
//
//  Created by William on 2014/1/5.
//  Copyright (c) 2014年 William. All rights reserved.
//

#import "WYScreenshotCatcher.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface WYScreenshotCatcher() {
    BOOL isWaitingscreenshotSaved;
}

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

@end


@implementation WYScreenshotCatcher

static WYScreenshotCatcher *instance = nil;
+ (instancetype)sharedCatcher {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[WYScreenshotCatcher alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.assetsLibrary = [[ALAssetsLibrary alloc] init];
        /* need this step to make notification works */
        [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                                          usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                          } failureBlock:^(NSError *error) {
                                          }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(screenshotTaken:)
                                                     name:UIApplicationUserDidTakeScreenshotNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(cameraRollHasChanged:)
                                                     name:ALAssetsLibraryChangedNotification
                                                   object:self.assetsLibrary];
        
        isWaitingscreenshotSaved = NO;
    }
    
    return self;
}

- (void)screenshotTaken:(NSNotification *)notification
{
    isWaitingscreenshotSaved = YES;
}

- (void)cameraRollHasChanged:(NSNotification *)notification
{
    if (isWaitingscreenshotSaved) {
        isWaitingscreenshotSaved = NO;
        [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if (group != nil) {
                [group setAssetsFilter:[ALAssetsFilter allPhotos]];
                [group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:[group numberOfAssets] - 1]
                                        options:0
                                     usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                         if (result) {
                                             UIImage *screenshot = [UIImage imageWithCGImage:[[result defaultRepresentation] fullResolutionImage]];
                                             if ([self.delegate respondsToSelector:@selector(screenshotCatcher:didCatchScreenshotImage:)]) {
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     [self.delegate screenshotCatcher:self didCatchScreenshotImage:screenshot];
                                                 });
                                             }
                                         }
                                     }];
            }
        } failureBlock:^(NSError *error) {
            if ([self.delegate respondsToSelector:@selector(screenshotCatcher:didFailToCatchScreenshotImageWithError:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.delegate screenshotCatcher:self didFailToCatchScreenshotImageWithError:error];
                });
            }
        }];
    }
}

@end
