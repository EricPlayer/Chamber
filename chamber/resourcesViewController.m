//
//  resourcesViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "resourcesViewController.h"
#import "resources_tableviewCell.h"

@interface resourcesViewController ()
{
    NSArray*namearry;
    NSArray*mailarry;
    NSArray*physicalarry;
    NSArray*phonearry;
    NSArray*faxarry;
    NSArray*emailarry;
    NSArray*websitearry;
}

@end

@implementation resourcesViewController


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
   
    
      _tableview.separatorColor = [UIColor yellowColor];

    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_resources.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
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
    namearry = [results valueForKey:@"title"];
    mailarry = [results valueForKey:@"mailing_address"];
    physicalarry = [results valueForKey:@"physical_address"];
    phonearry = [results valueForKey:@"phone"];
    faxarry = [results valueForKey:@"fax"];
    emailarry = [results valueForKey:@"email"];
   websitearry = [results valueForKey:@"website"];
   
    [self.tableview reloadData];
}

//table view

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return namearry .count;
    NSLog(@"name array count %d",namearry.count);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableview cell");
    resources_tableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"htrcell"];
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
  cell.title.text=[NSString stringWithFormat:@"%@",[namearry objectAtIndex:indexPath.row]];
    cell.title.lineBreakMode = NSLineBreakByWordWrapping;
    cell.title.numberOfLines = 0;
    
     cell.mailing.text=[NSString stringWithFormat:@"%@",[mailarry objectAtIndex:indexPath.row]];
   
    cell.mailing.lineBreakMode = NSLineBreakByWordWrapping;
    cell.mailing.numberOfLines = 0;

    
   
    cell.physical.text=[NSString stringWithFormat:@"%@",[physicalarry objectAtIndex:indexPath.row]];
    
  cell.phone.text=[NSString stringWithFormat:@"%@",[phonearry objectAtIndex:indexPath.row]];
    
   cell.fax.text=[NSString stringWithFormat:@"%@",[faxarry objectAtIndex:indexPath.row]];
    
    cell.email.text=[NSString stringWithFormat:@"%@",[emailarry objectAtIndex:indexPath.row]];
    
    cell.website.text=[NSString stringWithFormat:@"%@",[websitearry objectAtIndex:indexPath.row]];
    
    
    return cell;
    
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
