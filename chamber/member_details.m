//
//  member_details.m
//  chamber
//
//  Created by SSMAC100 on 30/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "member_details.h"
#import "MBProgressHUD.h"

@interface member_details ()
{
    NSString*phone;
    NSString*website;
    NSString*email;
    NSString*bus_name;
    NSString*mem_lbl;
    NSString*description_lbl;
    NSString*address;
}

@end


@implementation member_details

- (void)viewDidLoad {
    
    [super viewDidLoad];
     [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
   
    //self.buss_name_lbl.text=self.hello;
  
    NSLog(@"array data %@",self.myPreviousVCDict);
    
     bus_name = [self.myPreviousVCDict valueForKey:@"name"] ;
    self.buss_name_lbl.text=bus_name;
   
    address = [self.myPreviousVCDict valueForKey:@"address"] ;
    self.address_lbl.text=address;
    
   
    //self.phone_lbl.text=[self.myPreviousVCDict valueForKey:@"phone"];
    phone = [self.myPreviousVCDict valueForKey:@"phone"] ;
    [_phone_outlet setTitle:phone forState:UIControlStateNormal] ;
    
   // self.email_lbl.text=[self.myPreviousVCDict valueForKey:@"email"];
    email = [self.myPreviousVCDict valueForKey:@"email"];
    [_email_outlet setTitle:email forState:UIControlStateNormal] ;
   
    //self.website_lbl.text=[self.myPreviousVCDict valueForKey:@"website"];
    website = [self.myPreviousVCDict valueForKey:@"website"];

    [_website_outlet setTitle:website forState:UIControlStateNormal] ;
   
    mem_lbl = [self.myPreviousVCDict valueForKey:@"member_since"] ;
    self.mem_lbl.text=mem_lbl;
   
    description_lbl = [self.myPreviousVCDict valueForKey:@"des"] ;

    self.dec_lbl.text=description_lbl;
    
    //self.imageview_lbl.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.myPreviousVCDict valueForKey:@"img_url"]]]];
    

    
    
      
   // Do any additional setup after loading the view.
     self.map_view.delegate = self;
   // NSString *location = @"200 E Main St #800 - Suite 127 - Fort Wayne, IN 46861 \r\nALSO: P.O. Box 11852 Fort Wayne IN 46861-1852";
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString: self.address_lbl.text
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         
                         MKCoordinateRegion region = _map_view.region;
                         region.center = placemark.region.center;
                         //                         region.span.longitudeDelta /= 8.0;
                         //                         region.span.latitudeDelta /= 8.0;
                         region = MKCoordinateRegionMakeWithDistance(placemark.coordinate, 5000, 5000);
                         [_map_view setRegion:region animated:YES];
                         [_map_view addAnnotation:placemark];
                     }
                 }
     ];

}
- (void)viewDidAppear:(BOOL)animated{
    
//    UIActivityIndicatorView *spinner=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    spinner.frame = _imageview_lbl.frame;
//    spinner.hidesWhenStopped=YES;
//    [self.view addSubview:spinner];
//    [spinner startAnimating];
    UIActivityIndicatorView *loadingActivity = [[UIActivityIndicatorView alloc]
                                                initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingActivity startAnimating];
    
    loadingActivity.frame = _imageview_lbl.frame;
    UIView* parent = [_imageview_lbl superview];
    [parent addSubview:loadingActivity];
    [parent bringSubviewToFront:loadingActivity];
    loadingActivity.color= [UIColor blackColor];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        NSData *storeImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.myPreviousVCDict valueForKey:@"img_url"]]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [loadingActivity stopAnimating];
            self.imageview_lbl.image = [UIImage imageWithData:storeImageData];
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)phone_action:(id)sender {
    NSLog(@"call");
    NSString *phoneNumber = [@"tel://" stringByAppendingString:phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}
- (IBAction)email_action:(id)sender {
     NSLog(@"email");
    // Email Subject
    NSString *emailTitle = @" ";
    // Email Content
    NSString *messageBody = @" "; // Change the message body to HTML
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:email];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];

}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)website_action:(id)sender {
     NSLog(@"web");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:website]];
}
@end
