//
//  submityour_opportunitiesViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 03/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "submityour_opportunitiesViewController.h"
#import "IQKeyboardManager.h"
#import "IQDropDownTextField.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "IQUITextFieldView+Additions.h"

@interface submityour_opportunitiesViewController ()

@end

@implementation submityour_opportunitiesViewController

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
    
     [self.scroll setScrollEnabled:YES];
    
    
     [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background2.png"] forBarMetrics:UIBarMetricsDefault];
	// Do any additional setup after loading the view.
    [self.scroll setScrollEnabled:YES];
    [self.scroll setContentSize:CGSizeMake(320, 568)];
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
//        CGRect f = self.view_view.frame;
//        f.origin.y = -keyboardSize.height;
//        self.view_view.frame = f;
//    }];
//}
//
//-(void)keyboardWillHide:(NSNotification *)notification
//{
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect f = self.view_view.frame;
//        f.origin.y = 0.0f;
//        self.view_view.frame = f;
//    }];
//}

- (IBAction)submit_btn:(id)sender
{
    if (![self isFormValid]) {
        
        return;
        
    }
    
    NSError *error;
    
    
    if (!error)
    {
        // call webservice for succes
        

            
            //Here YOUR URL
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com//ws/apply_oppertunity_ios.php"]];
            
            
            //create the Method "GET" or "POST"
            [request setHTTPMethod:@"POST"];
            
            //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
            NSString *userUpdate =[NSString stringWithFormat:@"cname=%@&name=%@&website=%@&  email=%@&phone=%@&jobtitle=%@&detail=%@&comment=%@&",_txcompanyname.text,_txname.text,_txwebsite.text,_txemail.text,_txphone.text,_txjobtitle.text,_txdetail.text,_txcomment.text, nil];
            
            
            
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
            
        _txcompanyname.text=@"";
      _txname.text=@"";
       _txwebsite.text=@"";
       _txemail.text=@"";
       _txphone.text=@"";
        _txjobtitle.text=@"";
       _txdetail.text=@"";
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
    
    
    
    if (_txcompanyname.text && _txcompanyname.text.length==0)
    {
        [self showErrorMessage:@"Please enter company name"];
        return NO;
    }
    
    else if (_txname.text && _txname.text.length==0)
    {
        [self showErrorMessage:@"Please enter name"];
        return NO;
    }
    else if (_txwebsite.text && _txwebsite.text.length==0)
    {
        [self showErrorMessage:@"Please enter website"];
        return NO;
    }
   
    
    else if([emailTest evaluateWithObject: _txemail.text]==NO)
    {
        [self showErrorMessage:@"Please enter Valid Email_id"];
        return NO;
    }
    else if (_txphone.text && _txphone.text.length==0)
    {
        [self showErrorMessage:@"Please enter phone number"];
        return NO;
    }
    else if (_txjobtitle.text && _txjobtitle.text.length==0)
    {
        [self showErrorMessage:@"Please enter job title"];
        return NO;
    }
    else if (_txdetail.text && _txdetail.text.length==0)
    {
        [self showErrorMessage:@"Please enter details"];
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

//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [self.scroll setContentOffset:CGPointMake(0, 0)];
//    NSLog(@"textFieldShouldReturn");
//    
//    if (textField==_txcompanyname)
//    {
//        [_txname becomeFirstResponder];
//    }
//    else if (textField==_txname) {
//        [_txwebsite becomeFirstResponder];
//    }
//    else if (textField==_txwebsite) {
//        [_txemail becomeFirstResponder];
//    }
//    else if (textField==_txemail) {
//        [_txphone becomeFirstResponder];
//    }
//    else if (textField==_txphone) {
//        [_txjobtitle becomeFirstResponder];
//    }
//    else if (textField==_txjobtitle) {
//        [_txdetail becomeFirstResponder];
//    }
//    else if (textField==_txdetail) {
//        [_txcomment becomeFirstResponder];
//    }
//    
//    
//    else if (textField==_txcomment) {
//        [_txcomment resignFirstResponder];
//    }
//    return YES;
//}



- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8));
    return result;
}
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    NSLog(@"textFieldDidBeginEditing");
//    [self.scroll setContentOffset:CGPointMake(0, textField.center.y-20)];
//}

//-(BOOL)textFieldShouldBeginEditing: (UITextField *)textField
//
//{
//    UIToolbar * keyboardToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//    
//    keyboardToolBar.barStyle = UIBarStyleDefault;
//    [keyboardToolBar setItems: [NSArray arrayWithObjects:
//                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)],nil]];
//    textField.inputAccessoryView = keyboardToolBar;
//    return YES;
//}
//-(void)resignKeyboard {
//    [self.scroll setContentOffset:CGPointMake(0, 0)];
//    [_txcompanyname resignFirstResponder];
//    [_txname resignFirstResponder];
//    [_txwebsite resignFirstResponder];
//    [_txemail resignFirstResponder];
//    [_txphone resignFirstResponder];
//    [_txjobtitle resignFirstResponder];
//    [_txdetail resignFirstResponder];
//    [_txcomment resignFirstResponder];
//}
@end
