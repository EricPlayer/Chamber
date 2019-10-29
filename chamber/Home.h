//
//  Home.h
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;


@interface Home : UIViewController<NSURLConnectionDataDelegate>
{
    NSMutableData *response;
    MBProgressHUD *HUD;
    
    UIScrollView*scrollView;
    
}
@property (weak, nonatomic) IBOutlet UITextView *txtx;


@property (strong, nonatomic) NSArray *imageData;
@property NSInteger currentIndex;

@property NSInteger currentImageIndex;

@property (strong, nonatomic) IBOutlet UIScrollView *scroller;


@property (strong, nonatomic) IBOutlet UIImageView *imageview;

@property (strong, nonatomic) IBOutlet UINavigationItem *nav;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btn_1;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btn_2;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btn_3;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btn_4;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *active;
@property (strong, nonatomic) IBOutlet UIImageView *navigat;
@end
