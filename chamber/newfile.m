//
//  newfile.m
//  proj
//
//  Created by SSMAC100 on 23/07/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "newfile.h"
#import "UIImageView+WebCache.h"

@interface newfile ()
{
    NSArray* imgary;
    NSArray* event_name;
    NSArray* event_title;
    NSArray* event_date;
    NSArray* event_time;
    NSArray* event_detail;
}

@end

@implementation newfile

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"pill %@",_pure);
    NSLog(@"pill %@",_puredate);
    
    
    
    // Do any additional setup after loading the view.
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/event_ios.php"]];
    
    
    //create the Method "GET" or "POST"
    [request setHTTPMethod:@"POST"];
    
    //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
    NSString *userUpdate =[NSString stringWithFormat:@"date=%@&",_puredate, nil];
    
    
    
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
    NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
    
    //This is for Response
    NSLog(@"got response==%@", resSrt);
    NSArray *results = [json objectForKey:@"status"];
    imgary = [results valueForKey:@"img"];
    NSLog(@"your image %@",imgary);
    event_name = [results valueForKey:@"event_name"];
    NSLog(@"your event_name %@",event_name);
    event_title = [results valueForKey:@"event_title"];
    NSLog(@"your event_title %@",event_title);
    event_date = [results valueForKey:@"event_date"];
    NSLog(@"your event_date %@",event_date);
    event_time = [results valueForKey:@"event_time"];
    NSLog(@"your event_time %@",event_time);
    event_detail = [results valueForKey:@"event_detail"];
    NSLog(@"your event_detail %@",event_detail);
    
    //  [self.table reloadData];
    
    
    if(resSrt)
    {
        NSLog(@"got response");
        
    }
    
    else
    {
        NSLog(@"faield to connect");
    }

    // Do any additional setup after loading the view from its nib.
    self.lbl1.text= event_title;
    self.lbl2.text= event_detail;
    self.lbl3.text= event_name;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated{

    UIActivityIndicatorView *spinner=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
   // spinner.center=CGPointMake(200, 200);
    spinner.center = _img1.center;
    spinner.transform = CGAffineTransformMakeScale(2.0, 2.0);
    
    spinner.hidesWhenStopped=YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        NSData *storeImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgary]];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [spinner stopAnimating];
            self.img1.image = [UIImage imageWithData:storeImageData];
        });
    });
}
- (IBAction)back_btn:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
