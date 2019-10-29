//
//  submityour_opportunitiesViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 03/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface submityour_opportunitiesViewController : UIViewController<NSURLConnectionDataDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UITextField *txcompanyname;
@property (strong, nonatomic) IBOutlet UITextField *txname;
@property (strong, nonatomic) IBOutlet UITextField *txwebsite;
@property (strong, nonatomic) IBOutlet UITextField *txemail;
@property (strong, nonatomic) IBOutlet UITextField *txphone;
@property (strong, nonatomic) IBOutlet UITextField *txjobtitle;
@property (strong, nonatomic) IBOutlet UITextField *txdetail;
@property (strong, nonatomic) IBOutlet UITextField *txcomment;
- (IBAction)submit_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view_view;


@end
