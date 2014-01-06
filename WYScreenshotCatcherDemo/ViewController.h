//
//  ViewController.h
//  WYScreenshotCatcherDemo
//
//  Created by William on 2014/1/6.
//  Copyright (c) 2014年 William. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYScreenshotCatcher.h"

@interface ViewController : UIViewController <WYScreenshotCatcherDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *ssImgView;

@end
