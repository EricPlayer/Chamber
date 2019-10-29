//
//  SecondHome.h
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CKDemoViewController.h"
@class MBProgressHUD;

@interface SecondHome : UIViewController<NSURLConnectionDataDelegate>
{
    NSMutableData *response;
    NSMutableData * resp;
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) NSArray *imageData;
@property NSInteger currentIndex;
@property NSInteger currentImageIndex;

@property (strong, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *backbtn;
- (IBAction)back_btn:(id)sender;
- (IBAction)developer:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigat;
- (IBAction)event:(id)sender;
- (IBAction)donate:(id)sender;

@end
