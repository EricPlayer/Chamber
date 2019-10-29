//
//  resourcesViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resourcesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,NSURLConnectionDataDelegate>
{
   
    NSMutableData *response;
   
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;





@end
