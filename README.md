WYScreenshotCatcher
===================

WYScreenshotCatcher captures full-size screenshot image for you when users take screenshots in your app manually.

Installation
============
Link against `AssetsLibrary.framework`<br />
Copy `WYScreenshotCatcher.h`/`WYScreenshotCatcher.m`<br />

Usage
=====
Make your view controller conforms WYScreenshotCatcherDelegate protocol like<br />
`@interface ViewController : UIViewController <WYScreenshotCatcherDelegate>`<br />

Implement protocol methods<br />
`- (void)screenshotCatcher:(WYScreenshotCatcher *)catcher didCatchScreenshotImage:(UIImage *)screenshotImage`
`- (void)screenshotCatcher:(WYScreenshotCatcher *)catcher didFailToCatchScreenshotImageWithError:(NSError *)error`

License
=======
WYScreenshotCatcher is available under the MIT license. See the LICENSE file for details.
