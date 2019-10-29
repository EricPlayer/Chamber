//
//  ViewController.h
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,NSURLConnectionDataDelegate>
{
    MBProgressHUD*HUD;
}



@property (weak, nonatomic) IBOutlet UITableView *tabel_view;
@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;

@property (weak, nonatomic) IBOutlet UILabel *txtitle_lb;
- (IBAction)next:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tx_1;


@end

