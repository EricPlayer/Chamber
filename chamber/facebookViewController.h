//
//  facebookViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface facebookViewController : UIViewController
{
    MBProgressHUD*HUD;
}
@property (strong, nonatomic) IBOutlet UIWebView *webview;

@end
