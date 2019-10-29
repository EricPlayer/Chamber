//
//  developerViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 14/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface developerViewController : UIViewController<NSURLConnectionDataDelegate>
{
    NSMutableData *response;
}

@property (strong, nonatomic) IBOutlet UITextView *developertext;

@end
