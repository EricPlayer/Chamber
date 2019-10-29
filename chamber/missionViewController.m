//
//  missionViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "missionViewController.h"
#import "MBProgressHUD.h"

@interface missionViewController ()
{
    NSArray*textarray;
    
}

@end

@implementation missionViewController

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
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [HUD show:YES];

   
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background2.png"] forBarMetrics:UIBarMetricsDefault];

    
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_mission.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];

    _textmission.scrollEnabled = YES;
   self.textmission.editable = NO;
        
    
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
    [HUD show: YES];
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
    NSArray* results = [json objectForKey:@"status"];
    NSString*str = [results valueForKey:@"mission"];
    str = [str stringByAppendingString:@"<style>body{font-family:'Verdana'; font-size:'1px';}</style>"];
       NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithData: [str dataUsingEncoding:NSUnicodeStringEncoding]
                                            options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                            documentAttributes: nil
                                            error: nil
                                            ];
    self.textmission.attributedText = attributedString;
     [HUD hide: YES];
}




@end
