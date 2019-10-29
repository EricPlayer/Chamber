//
//  MemberTableViewCell.h
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UIImageView *image_view;
@property (strong, nonatomic) IBOutlet UILabel *address_lbl;
@property (strong, nonatomic) IBOutlet UILabel *phone_lbl;
@property (strong, nonatomic) IBOutlet UILabel *web_lbl;
@property (strong, nonatomic) IBOutlet UILabel *sens_lbl;
@property (strong, nonatomic) IBOutlet UILabel *des_lbl;





@end
