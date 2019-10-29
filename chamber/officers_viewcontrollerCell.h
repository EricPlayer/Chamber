//
//  officers_viewcontrollerCell.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 02/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface officers_viewcontrollerCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *about;
@property (strong, nonatomic) IBOutlet UIImageView *image;


@end
