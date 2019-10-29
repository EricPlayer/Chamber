//
//  officersViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "officersViewController.h"
#import "officers_viewcontrollerCell.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface officersViewController ()
{
    NSArray*namearray;
    NSArray* titlearray;
    NSArray* emailarray;
    NSArray*phonearray;
    NSArray*addressarray;
    NSArray*aboutarray;
    NSArray*imgarray;
    
    
}

@end

@implementation officersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background2.png"] forBarMetrics:UIBarMetricsDefault];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [HUD show:YES];
   
    
         
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com//ws/fetch_officers.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [response appendData:data];
    NSLog(@"error receving data %@",response);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    
    NSLog(@"Error in receiving data %@",error);
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
    NSArray *results = [json objectForKey:@"status"];
    namearray = [results valueForKey:@"name"];
    emailarray = [results valueForKey:@"email"];
    phonearray = [results valueForKey:@"phone"];
    addressarray = [results valueForKey:@"address"];
    titlearray = [results valueForKey:@"title"];
    aboutarray = [results valueForKey:@"about"];
    imgarray = [results valueForKey:@"img_url"];
    
    [self.tableview reloadData];
    [HUD hide: YES];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [namearray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableview cell");
    officers_viewcontrollerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ht"];
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
//    NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: [imgarray objectAtIndex:indexPath.row]]];
//    UIImage* image = [[UIImage alloc] initWithData:imageData];
//    cell.image.image =image;
    NSURL*url= [NSString stringWithFormat:@"%@",[imgarray objectAtIndex:indexPath.row]];
    
   // [cell.image setContentMode:UIViewContentModeScaleAspectFill];
    
    [cell.image setShowActivityIndicatorView:YES];
    
    [cell.image setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [cell.image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHolder.png"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];

    
    cell.name.text=[NSString stringWithFormat:@"%@",[namearray objectAtIndex:indexPath.row]];
    cell.title.text=[NSString stringWithFormat:@"%@",[titlearray objectAtIndex:indexPath.row]];
    cell.email.text=[NSString stringWithFormat:@"%@",[emailarray objectAtIndex:indexPath.row]];
    cell.phone.text=[NSString stringWithFormat:@"%@",[phonearray objectAtIndex:indexPath.row]];
    cell.address.text=[NSString stringWithFormat:@"%@",[addressarray objectAtIndex:indexPath.row]];
    cell.about.text=[NSString stringWithFormat:@"%@",[aboutarray objectAtIndex:indexPath.row]];
    
  
    return  cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView
                      cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
