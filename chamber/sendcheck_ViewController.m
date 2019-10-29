//
//  sendcheck_ViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 03/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "sendcheck_ViewController.h"

@interface sendcheck_ViewController ()

@end

@implementation sendcheck_ViewController

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
   
    [self.scroll setScrollEnabled:YES];
    [self.scroll setContentSize:CGSizeMake(320, 900)];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit_btn:(id)sender {
    
    if (![self isFormValid]) {
        
        return;
        
    }
    
    NSError *error;
    
    
    if (!error)
    {
        // call webservice for succes

    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/check_details_ios.php"]];
    
    
    //create the Method "GET" or "POST"
    [request setHTTPMethod:@"POST"];
    
    //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
    NSString *userUpdate =[NSString stringWithFormat:@"name=%@&email=%@&phone=%@&  address=%@&amount=%@&des=%@&",_tx_name.text,_tx_email.text,_tx_phone.text,_tx_address.text,_tx_payment.text,_tx_des.text, nil];
    
    
    
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
    
    
    
        UIAlertView *signupalert = [[UIAlertView alloc]initWithTitle:@"Congratulations" message:@"Record Added Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [signupalert show];
}
}

-(BOOL)isFormValid
{
    
    NSString *emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegEx];
    
    
    
    if (_tx_name.text && _tx_name.text.length==0)
    {
        [self showErrorMessage:@"Please enter name"];
        return NO;
    }
    
    else if (_tx_phone.text && _tx_phone.text.length!=10)
    {
        [self showErrorMessage:@"Please enter valid phone number"];
        return NO;
    }
    
    else if([emailTest evaluateWithObject: _tx_email.text]==NO)
    {
        [self showErrorMessage:@"Please enter Valid Email_id"];
        return NO;
    }
    else if (_tx_address.text && _tx_address.text.length==0)
    {
        [self showErrorMessage:@"Please enter address"];
        return NO;
    }
    else if (_tx_payment.text && _tx_payment.text.length==0)
    {
        [self showErrorMessage:@"Please enter payment"];
        return NO;
    }
    else if (_tx_des.text && _tx_des.text.length==0)
    {
        [self showErrorMessage:@"Please enter description"];
        return NO;
    }
   
    return YES;
}

-(void)showErrorMessage:(NSString *)message
{
    
    UIAlertView *alertmessage = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertmessage show];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    [_tx_name resignFirstResponder];
    [_tx_email resignFirstResponder];
    [_tx_phone resignFirstResponder];
    [_tx_address resignFirstResponder];
    [_tx_payment resignFirstResponder];
    [_tx_des resignFirstResponder];
    
    
    return YES;
}



@end
