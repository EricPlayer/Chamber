//
//  photoViewController.h
//  chamber
//
//  Created by SSMAC100 on 29/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface photoViewController : UIViewController<UICollectionViewDelegateFlowLayout>
{
     MBProgressHUD *HUD;
}
@property (weak, nonatomic) IBOutlet UILabel *lbl_id;

@property(nonatomic,retain) NSString * uid_value;

@property (weak, nonatomic) IBOutlet UICollectionView *collection_view;
@property (weak, nonatomic) IBOutlet UITableView *table;


@end
