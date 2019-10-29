//
//  contect_usViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "contect_usViewController.h"
#import "IQKeyboardManager.h"
#import "IQDropDownTextField.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "IQUITextFieldView+Additions.h"

@interface contect_usViewController ()
{
    NSArray*addressarray;
    NSString*phonearray;
    NSString*emailarray;
    NSArray*latarray;
    NSArray*longarray;
   
}

@end

@implementation contect_usViewController
@synthesize map;
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;



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
    
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_contact_us.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
    
    self.map.delegate = self;
	   
 
    NSString *location = @"200 E Main St #800 - Suite 127 - Fort Wayne, IN 46861 \r\nALSO: P.O. Box 11852 Fort Wayne IN 46861-1852";
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:location
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         
                         MKCoordinateRegion region = map.region;
                         region.center = placemark.region.center;
//                         region.span.longitudeDelta /= 8.0;
//                         region.span.latitudeDelta /= 8.0;
region = MKCoordinateRegionMakeWithDistance(placemark.coordinate, 5000, 5000);
                         [map setRegion:region animated:YES];
                         [map addAnnotation:placemark];
                     }
                 }
     ];
      }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)viewWillAppear:(BOOL)animated {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
//}
//
//#pragma mark - keyboard movements
//- (void)keyboardWillShow:(NSNotification *)notification
//{
//    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect f = self.view.frame;
//        f.origin.y = -keyboardSize.height;
//        self.view.frame = f;
//    }];
//}
//
//-(void)keyboardWillHide:(NSNotification *)notification
//{
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect f = self.view.frame;
//        f.origin.y = 0.0f;
//        self.view.frame = f;
//    }];
//}

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
    addressarray = [results valueForKey:@"address"];
    emailarray = [results valueForKey:@"email"];
    phonearray = [results valueForKey:@"phone"];
    latarray = [results valueForKey:@"letitutes"];
    longarray = [results valueForKey:@"logititus"];
    
    
    
    self.address_lbl.text= [NSString stringWithFormat:@"%@",addressarray];
    NSLog(@"address %@",addressarray);
   // self.phone_lbl.text= [NSString stringWithFormat:@"%@",phonearray];
   [_phone_outlet setTitle:[NSString stringWithFormat:@"%@",phonearray] forState:UIControlStateNormal] ;
  //  self.email_lbl.text= [NSString stringWithFormat:@"%@",emailarray];
    [_email_outlet setTitle:[NSString stringWithFormat:@"%@",emailarray] forState:UIControlStateNormal] ;
    
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
    [self.map setRegion:[self.map regionThatFits:region] animated:YES];
    
}
- (IBAction)submit:(id)sender {
    
    if (![self isFormValid]) {
        
        return;
        
    }
    
    NSError *error;
    
    
    if (!error)
    {
        // call webservice for succes
        
        
            //Here YOUR URL
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/contact_ios.php"]];
        
        
            //create the Method "GET" or "POST"
            [request setHTTPMethod:@"POST"];
        
            //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
            NSString *userUpdate =[NSString stringWithFormat:@"name=%@&email=%@&phone=%@&  comment=%@&",_txname.text,_txemail.text,_tx_phone.text,_txcomment.text,nil];
        
        
        
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
        
            NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
            
            //This is for Response
            NSLog(@"got response==%@", resSrt);
            if(resSrt)
            {
                NSLog(@"got response");
                
            }
            else
            {
                NSLog(@"faield to connect");
            }
        _txname.text=@"";
        _txemail.text=@"";
        _tx_phone.text=@"";
        _txcomment.text=@"";


        UIAlertController *alertController = [UIAlertController
        alertControllerWithTitle:@"Congratulations" message:@"Record Added Successfully"
        preferredStyle:UIAlertControllerStyleAlert];
        
//        UIAlertAction *cancelAction = [UIAlertAction
//                                       actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
//                                       style:UIAlertActionStyleCancel
//                                       handler:^(UIAlertAction *action)
//                                       {
//                                           NSLog(@"Cancel action");
//                                       }];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"OK action");
                                       [self.navigationController popViewControllerAnimated:YES];
                                   }];
        
        //[alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
   
}


-(BOOL)isFormValid
{
    
    NSString *emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegEx];
    
    
    
    if (_txname.text && _txname.text.length==0)
    {
        [self showErrorMessage:@"Please enter name"];
        return NO;
    }
    
    else if (_tx_phone.text && _tx_phone.text.length!=10)
    {
        [self showErrorMessage:@"Please enter valid phone number"];
        return NO;
    }
    
    else if([emailTest evaluateWithObject: _txemail.text]==NO)
    {
        [self showErrorMessage:@"Please enter Valid Email_id"];
        return NO;
    }
    else if (_txcomment.text && _txcomment.text.length==0)
    {
        [self showErrorMessage:@"Please enter comment"];
        return NO;
    }
        return YES;
}

-(void)showErrorMessage:(NSString *)message
{
    
    UIAlertView *alertmessage = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertmessage show];
    
}


- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8));
    return result;
}


//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//
//{
//    [self.txcomment resignFirstResponder];
//    [self.tx_phone resignFirstResponder];
//    [self.txemail resignFirstResponder];
//    [self.txname resignFirstResponder];
//    
//    
//    
//    return YES;
//}


- (IBAction)phone_action:(id)sender {
    NSString *phoneNumber = [@"tel://" stringByAppendingString:phonearray];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}
- (IBAction)email_action:(id)sender {
    // Email Subject
    NSString *emailTitle = @" ";
    // Email Content
    NSString *messageBody = @" "; // Change the message body to HTML
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:emailarray];
    
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
@end
