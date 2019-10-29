//
//  photoViewController.m
//  chamber
//
//  Created by SSMAC100 on 29/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "photoViewController.h"
#import "TableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Full_picture.h"
#import "MBProgressHUD.h"

@interface photoViewController ()
{
    NSArray*imgary;
    UIImageView *recipeImageView;
    //UIImageView *recipeImageView,*fullview;
}

@end

@implementation photoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background2.png"] forBarMetrics:UIBarMetricsDefault];
  
  //  HUD = [[MBProgressHUD alloc] initWithView:self.view];
  //  [self.view addSubview:HUD];
  //  [HUD show:YES];

    self.lbl_id.text=self.uid_value;
    NSLog(@"uid %@",self.uid_value);
    // Do any additional setup after loading the view.
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_picture_ios.php"]];
    
    
    //create the Method "GET" or "POST"
    [request setHTTPMethod:@"POST"];
    
    //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
    NSString *userUpdate =[NSString stringWithFormat:@"id=%@&",_uid_value, nil];
    
    
    
    //Check The Value what we passed
     NSLog(@"the data Details is =%@", userUpdate);
    
    //Convert the String to Data
    NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
    
    //Apply the data to the body
    [request setHTTPBody:data1];
    
    //Create the response and Error
    NSError *err;
    NSURLResponse *response;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&err];
    NSLog(@"json %@",json);
    
    if (json.count>0)
    {
        NSArray *results = [json objectForKey:@"status"];
        
        NSLog(@"results == %@",results);
        
        if ([ results isKindOfClass:[NSArray class]])
        {
           // date_ary= results;
            imgary= [results valueForKey:@"pic_url"];
            NSLog(@"images %@",imgary);
            
            //[self.table_view reloadData];
        }
        else
        {
            // show the alert and navigate to previous page
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        // show the alert and navigate to previous page
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imgary.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    NSDictionary *getValues =  imgary [indexPath.row];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
 //   NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: [imgary objectAtIndex:indexPath.row]]];
  //  UIImage* image = [[UIImage alloc] initWithData:imageData];
  //  recipeImageView.image =image;
  //  [HUD hide: YES];
    
    NSURL*url= [NSString stringWithFormat:@"%@",[imgary objectAtIndex:indexPath.row]];
    
    recipeImageView = (UIImageView *)[cell viewWithTag:100];
    
       [recipeImageView setShowActivityIndicatorView:YES];
    
    [recipeImageView setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [recipeImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHolder.png"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
  
   
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collection_view.frame.size.width / 3 - 5, self.collection_view.frame.size.width / 3 - 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return  7.5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

/*
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: mycollectionView.frame.width / 4, height: mycollectionView.frame.width / 4)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetails"])
    {
       
        NSArray *indexPaths = [self.collection_view indexPathsForSelectedItems];
        Full_picture *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths firstObject];
        destViewController.uid_value = [imgary objectAtIndex:indexPath.row];
        destViewController.photoData = imgary;
        destViewController.currentIndex = indexPath.row;
        [self.collection_view deselectItemAtIndexPath:indexPath animated:NO];
    }
}



@end
