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
`- screenshotCatcher:didCatchScreenshotImage:`<br />
`- screenshotCatcher:didFailToCatchScreenshotImageWithError:`<br />

License
=======
WYScreenshotCatcher is available under the MIT license. See the LICENSE file for details.
