//
//  picture_viewcontrollerCell.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 02/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface picture_viewcontrollerCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *picture;
@property (strong, nonatomic) IBOutlet UILabel *titlelbl;
@property (weak, nonatomic) IBOutlet UILabel *photo_lbl;

@end
