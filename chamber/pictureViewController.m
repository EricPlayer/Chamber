//
//  pictureViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "pictureViewController.h"
#import "picture_viewcontrollerCell.h"
#import "photoViewController.h"
#import "UIImageView+WebCache.h"

@interface pictureViewController ()
{
    NSArray*picarray;
    NSArray*titlearray;
    NSArray*idarray;
   
}

@end

@implementation pictureViewController

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
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_gallery.php"]];
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
    
    //NSLog(@"Error in receiving data %@",error);
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
    NSArray *results = [json objectForKey:@"status"];
    picarray = [results valueForKey:@"img_url"];
    titlearray = [results valueForKey:@"title"];
   // NSLog(@"my title is%@",titlearray);
    idarray=[results valueForKey:@"id"];
    //NSLog(@"my galary id is%@",idarray);
    [self.tableview reloadData];
}

 
	// Do any additional setup after loading the view, typically from a nib.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [picarray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"tableview cell");
    picture_viewcontrollerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"htr"];
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
//     NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: [picarray objectAtIndex:indexPath.row]]];
//     UIImage* image = [[UIImage alloc] initWithData:imageData];
//    cell.picture.image =image;
    NSURL*url= [NSString stringWithFormat:@"%@",[picarray objectAtIndex:indexPath.row]];
    
    //[cell.picture setContentMode:UIViewContentModeScaleAspectFill];
    
    [cell.picture setShowActivityIndicatorView:YES];
    
    [cell.picture setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [cell.picture sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHolder.png"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    
    //return  cell;
    
    cell.titlelbl.text=[NSString stringWithFormat:@"%@",[titlearray objectAtIndex:indexPath.row]];
    
    
    
    return  cell;
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
        photoViewController *destViewController = segue.destinationViewController;
        destViewController.uid_value = [idarray objectAtIndex:indexPath.row];
    }
}
@end
