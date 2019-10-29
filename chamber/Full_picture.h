//
//  Full_picture.h
//  chamber
//
//  Created by ankur kumawat on 09/09/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Full_picture : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *photoData;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
@property (weak, nonatomic) NSString *recipeImageName;
@property(nonatomic,retain) NSString * uid_value;

@property NSInteger currentIndex;
- (IBAction)close:(id)sender;
@end
