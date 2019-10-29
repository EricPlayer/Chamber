//
//  missionViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface missionViewController : UIViewController<NSURLConnectionDataDelegate>
{
    NSMutableData *response;
    MBProgressHUD*HUD;
}
@property (strong, nonatomic) IBOutlet UITextView *textmission;
@property (strong, nonatomic) IBOutlet UIView *navbar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@end
