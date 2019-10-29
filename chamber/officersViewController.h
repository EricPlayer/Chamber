//
//  officersViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface officersViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,NSURLConnectionDataDelegate>
{
   NSMutableData *response;
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
