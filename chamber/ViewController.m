//
//  ViewController.m
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "ViewController.h"
#import "MemberTableViewCell.h"
#import "member_details.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface ViewController ()
{
    
    NSMutableData *response;
    NSMutableArray  *arrayForBool;
    NSMutableArray *business_details_array;
    NSMutableArray *names;
    NSMutableArray* titles;
    NSMutableArray*adrsary;
    NSMutableArray*phoneary;
    NSMutableArray*emailary;
    NSMutableArray*websiteary;
    NSMutableArray*sensary;
    NSMutableArray*desary;
    NSMutableArray*images;
   NSDictionary *passDict;
    NSString*ss;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [HUD show:YES];
    
    _tabel_view.estimatedRowHeight = 100.0;
    _tabel_view.rowHeight = UITableViewAutomaticDimension;

    
     [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    names = [NSMutableArray new];
    titles = [NSMutableArray new];
    adrsary=[NSMutableArray new];
    phoneary=[NSMutableArray new];
    emailary=[NSMutableArray new];
    websiteary=[NSMutableArray new];
    sensary=[NSMutableArray new];
    desary=[NSMutableArray new];
    images=[NSMutableArray new];

    
    arrayForBool=[[NSMutableArray alloc]init];
    
    [self.tabel_view setAllowsMultipleSelection:YES];
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_member.php"]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    if( connection )
    {
        
        response = [NSMutableData new];
        
    }
    
    
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response1
{
    [response setLength:0];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [response appendData:data];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"=========%@",json);
    
    NSArray *statuses = [json objectForKey:@"status"];
    names=[[NSMutableArray alloc]initWithArray:[statuses valueForKey:@"business_category_name"]];
    business_details_array=[[NSMutableArray alloc]initWithArray:[statuses valueForKey:@"business_details"]];
    
    
    
    for (int i=0; i<[names count]; i++) {
        [arrayForBool addObject:[NSNumber numberWithBool:NO]];
    }
    
    [self.tabel_view reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return names.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[arrayForBool objectAtIndex:section] boolValue]) {
        return [[business_details_array objectAtIndex:section] count];
    }
    else
        return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
     [HUD show: YES];
    UIView *sectionHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,70)];
    
    sectionHeaderView.backgroundColor=[UIColor grayColor];
    
    sectionHeaderView.tag=section;
    
    UIView *sectionsubHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,60)];
    
    sectionsubHeaderView.backgroundColor=[UIColor blueColor];
    
    UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,60, 60)];
    
    [arrow setImage:[UIImage imageNamed:@"arrowup.png"]];
    
    UILabel *Lbl=[[UILabel alloc]initWithFrame:CGRectMake(60, 0,tableView.frame.size.width-60, 60)];
    
    Lbl.text=[names objectAtIndex:section];
    
    Lbl.textColor=[UIColor whiteColor];
    
    [sectionsubHeaderView addSubview:arrow];
    
    [sectionsubHeaderView addSubview:Lbl];
    
    [sectionHeaderView addSubview:sectionsubHeaderView];
    
    UITapGestureRecognizer  *headerTapped   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped:)];
    
    [sectionHeaderView addGestureRecognizer:headerTapped];
    [HUD hide: YES];
    return  sectionHeaderView;
    
}

- (void)sectionHeaderTapped:(UITapGestureRecognizer *)gestureRecognizer
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecognizer.view.tag];
    if (indexPath.row == 0) {
        BOOL collapsed  = [[arrayForBool objectAtIndex:indexPath.section] boolValue];
        for (int i=0; i<[names count]; i++) {
            if (indexPath.section==i) {
                [arrayForBool replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:!collapsed]];
            }
        }
        [self.tabel_view reloadSections:[NSIndexSet indexSetWithIndex:gestureRecognizer.view.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ht"];
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    
    NSString*title_str=[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"name"] objectAtIndex:indexPath.row]];
    cell.title.text= title_str;
    [titles addObject:title_str];
    NSLog(@"get %@",titles);
    
    cell.email.text=[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"des"] objectAtIndex:indexPath.row]];
    //[emailary addObject:cell.email.text];
    
    cell.address_lbl.text=[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"address"] objectAtIndex:indexPath.row]];
    //[adrsary addObject:cell.address_lbl.text];
    
    cell.phone_lbl.text=[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"phone"] objectAtIndex:indexPath.row]];
   // [phoneary addObject:cell.phone_lbl.text];
    
    cell.web_lbl.text=[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"website"] objectAtIndex:indexPath.row]];
    //[websiteary addObject:cell.web_lbl.text];
    
    cell.sens_lbl.text=[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"member_since"] objectAtIndex:indexPath.row]];
    //[sensary addObject:cell.sens_lbl.text];
    
    cell.des_lbl.text=[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"des"] objectAtIndex:indexPath.row]];
    //[desary addObject:cell.des_lbl.text];
    
   // NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"img_url"] objectAtIndex:indexPath.row]]]];
    
   // UIImage* image = [[UIImage alloc] initWithData:imageData];
    
   // cell.image_view.image =image;
    //[images addObject:cell.image_view.image];
    NSURL*url= [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[[business_details_array objectAtIndex:indexPath.section] valueForKey:@"img_url"] objectAtIndex:indexPath.row]]];
    
    //[cell.image_view setContentMode:UIViewContentModeScaleAspectFill];
    
    [cell.image_view setShowActivityIndicatorView:YES];
    
    [cell.image_view setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [cell.image_view sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHolder.png"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
   
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [arrayForBool replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithBool:NO]];
    
    
    [self.tabel_view reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
    

    passDict=[[business_details_array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"gotoSeconVC" sender:self];


}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"gotoSeconVC"]) {
        member_details *vc=[segue destinationViewController];
        vc.myPreviousVCDict=passDict;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
    
}



@end
