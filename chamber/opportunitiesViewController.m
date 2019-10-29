//
//  opportunitiesViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "opportunitiesViewController.h"
#import "opportunities_viewcontrollerCell.h"
#import "MBProgressHUD.h"

@interface opportunitiesViewController ()
{
    NSArray*companyarray;
    NSArray*jobarray;
    NSArray*detailsarray;
}

@end

@implementation opportunitiesViewController

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
    

    
  
   
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_opportunities.php"]];
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
    NSLog(@"==%@",results);
    companyarray = [results valueForKey:@"company_name"];
    jobarray = [results valueForKey:@"job"];
    detailsarray = [results valueForKey:@"company_detail"];
    
    [self.tableview reloadData];
    [HUD hide: YES];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [companyarray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableview cell");
    opportunities_viewcontrollerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hello"];
    /*if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }*/
    
    cell.company.text=[NSString stringWithFormat:@"%@",[companyarray objectAtIndex:indexPath.row]];
    cell.job.text=[NSString stringWithFormat:@"%@",[jobarray objectAtIndex:indexPath.row]];
    cell.detail.text=[NSString stringWithFormat:@"%@",[detailsarray objectAtIndex:indexPath.row]];
 
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
