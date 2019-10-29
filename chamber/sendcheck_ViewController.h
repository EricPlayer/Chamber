//
//  sendcheck_ViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 03/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sendcheck_ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIButton *submit;
- (IBAction)submit_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tx_name;
@property (weak, nonatomic) IBOutlet UITextField *tx_email;
@property (weak, nonatomic) IBOutlet UITextField *tx_phone;
@property (weak, nonatomic) IBOutlet UITextField *tx_address;
@property (weak, nonatomic) IBOutlet UITextField *tx_payment;
@property (weak, nonatomic) IBOutlet UITextField *tx_des;

@end
