//
//  ViewController.m
//  WYScreenshotCatcherDemo
//
//  Created by William on 2014/1/6.
//  Copyright (c) 2014年 William. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [WYScreenshotCatcher sharedCatcher].delegate = self;
}

- (void)screenshotCatcher:(WYScreenshotCatcher *)catcher didCatchScreenshotImage:(UIImage *)screenshotImage
{
    self.ssImgView.image = screenshotImage;
}

- (void)screenshotCatcher:(WYScreenshotCatcher *)catcher didFailToCatchScreenshotImageWithError:(NSError *)error
{
    NSLog(@"failed with error %@", error);
}

@end
