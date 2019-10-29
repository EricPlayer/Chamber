//
//  newfile.h
//  proj
//
//  Created by SSMAC100 on 23/07/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newfile : UIViewController
@property (strong,nonatomic) NSArray *pure;
@property (strong,nonatomic) NSArray *puredate;

@property (weak, nonatomic) IBOutlet UILabel *lbl1;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UILabel *lbl2;
@property (weak, nonatomic) IBOutlet UILabel *lbl3;

- (IBAction)back_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
