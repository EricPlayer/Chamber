//
//  joinViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "joinViewController.h"
//#import "IQKeyboardManager.h"
//#import "IQDropDownTextField.h"
//#import "IQUIView+IQKeyboardToolbar.h"
//#import "IQUITextFieldView+Additions.h"
#import "Home.h"


@interface joinViewController ()<UIAlertViewDelegate> {
 
}


@end

@implementation joinViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txpicker.text=@"Associate";
    [_out_associate setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
    [_out_activeProfessional setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_activeBusiness setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateI setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateII setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    
    [_table_3.layer setBorderWidth: 1.0];
    [_table_3.layer setCornerRadius:8.0f];
    [_table_3.layer setMasksToBounds:YES];
    [_table_3.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [_table4.layer setBorderWidth: 1.0];
    [_table4.layer setCornerRadius:8.0f];
    [_table4.layer setMasksToBounds:YES];
    [_table4.layer setBorderColor:[[UIColor blackColor] CGColor]];
    self.txpicker.hidden=YES;
    
    
    
  // _tx_describe_bsn.delegate=self;
    
    
   // self.table1.hidden=YES;
    self.table_3.hidden=YES;
    self.table4.hidden=YES;
    
    
     [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background2.png"] forBarMetrics:UIBarMetricsDefault];
    
     [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
    self.pickerarray= @[@"Activite Business",@"Corporate I: 50 or more employees",@"Associate",@"Active Professional",@"Corporate II: fewer than 50 employees",];
    self.anualarray= @[@"Associate $30.00",@"Actve Professional $50.00",@"Active Business $70.00",@"Corporate II: fewer than 50 employees $100",@"Corporate I: 50 or more employees $ 250.00",];
    self.paymentarray= @[@"Pay by check",@"Online",];
    self.closelyarray= @[@"Accounting",@"Advertising/Marketing",@"Architecs",@"Attorney/Law Firms/LegalResources",@"Automotive",@"Auto Mfg",@"Banks/Credit Unions/Landers",@"Business consulting",@"Cleaning Services",@"Communication Mgmt",@"Computer/Technology service",@"Consultant",@"Contractors",@"Education",@"Employee Benefits",@"Engineering",@"Financial Services",@"Food Mfg/Dist.",@"General Members",@"Goverment",@"Grocery/Supermarkets",@"Healthcare",@"Human Resources",@"Import/Export",@"Industrial Supplies/Equipment",@"Insurance",@"Invetigations",@"Manufacturing",@"Media",@"Non-for-profit",@"Personal Care",@"Real State",@"Cell Repair/Wireless",@"Radio",@"Restaurants",@"Retail",];
    
    self.firstView.hidden = true;
    
    self.secondView.frame = CGRectMake(0, _selectView.frame.origin.y + _selectView.frame.size.height, _secondView.frame.size.width, _secondView.frame.size.height);
    self.thirdView.frame = CGRectMake(0, _secondView.frame.origin.y + _secondView.frame.size.height, _thirdView.frame.size.width, _thirdView.frame.size.height);
    self.fourthView.frame = CGRectMake(0, _thirdView.frame.origin.y + _thirdView.frame.size.height, _fourthView.frame.size.width, _fourthView.frame.size.height);
    self.fifthView.frame = CGRectMake(0, _fourthView.frame.origin.y + _fourthView.frame.size.height, _fifthView.frame.size.width, _fifthView.frame.size.height);
    self.buttonView.frame = CGRectMake(0, _fifthView.frame.origin.y + _fifthView.frame.size.height, _buttonView.frame.size.width, _buttonView.frame.size.height);
    
    self.txanualpicker.text = @"Associate $30.00";
    self.emailCheckState = @"NO";
    self.usmailCheckState = @"NO";
//    self.scrollView.frame = CGRectMake(0, 0, _scrollView.frame.size.width, _buttonView.frame.origin.y + _buttonView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView==self.table_3 ) {
        return 1;
    } else if (tableView==self.table4) {
        return 1;
    } else
        return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView==self.table_3){
        return [self.paymentarray count];
    } else
        return [self.closelyarray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //*******************************************************************************************************************
    static  NSString *simpaletableidentifier=@"SimpaleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpaletableidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpaletableidentifier];
    }
    if (tableView==self.table_3)
        cell.textLabel.text=[self.paymentarray objectAtIndex:indexPath.row];
    else if (tableView==self.table4)
        cell.textLabel.text=[self.closelyarray objectAtIndex:indexPath.row];
   
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     if (tableView==self.table_3){
        UITableViewCell *cell =[self.table_3 cellForRowAtIndexPath:indexPath];
        self.txpaymentpicker.text= cell.textLabel.text;
        self.table_3.hidden=YES;
        
    } else if (tableView==self.table4){
        UITableViewCell *cell =[self.table4 cellForRowAtIndexPath:indexPath];
        self.txcloselypicker.text=cell.textLabel.text;
        self.table4.hidden=YES;
    }
}

- (IBAction)submit_btn:(id)sender {
    if (![self isFormValid]) {
        
        return;
        
    }
    
    NSError *error;
    
    
    if (!error) {
        // call webservice for succes
        

    //Here YOUR URL
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/register_ios.php"]];
    
    
    //create the Method "GET" or "POST"
    [request setHTTPMethod:@"POST"];
    
    //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
    NSString *userUpdate =[NSString stringWithFormat:@"membership_type=%@&company_name=%@&attn=%@&company_address=%@&company_city=%@&company_state=%@&company_zip=%@&business_phone_no=%@&company_website=%@&company_email=%@&company_contacts=%@&individual_member_name=%@&individual_member_address=%@&individual_member_city=%@&individual_member_state=%@&individual_member_zip=%@&individual_member_home_phone=%@&individual_member_website=%@&individual_member_email=%@&place_of_employment=%@&place_of_employment_city=%@&place_of_employment_state=%@&place_of_employment_zip=%@&receive_info_email=%@&receive_info_fax=%@&receive_info_us_mail=%@&annual_membership_level=%@&payment=%@&check_enclosed_for=%@&member_cat_id=%@&business_description=%@&",_txpicker.text,_txcompany_name.text,_txattn.text,_txaddress.text,_txcity.text,_txstate.text,_txzip.text,_txbusiness_phone.text,_txwebsite.text,_txemail.text,_txcontacts.text,_tx_membe_name.text,_tx_member_address.text,_tx_member_city.text,_tx_member_state.text,_tx_member_zip.text,_tx_member_homephone.text,_tx_member_website.text,_tx_member_email.text,_tx_place_of_emp.text,_tx_placeofemp_city.text,_tx_placeofemp_state.text,_tx_placeofemp_zip.text,self.emailCheckState,@"No Use",self.usmailCheckState,_txanualpicker.text,_txpaymentpicker.text,_tx_receive_info_chech_enclosed.text,_txcloselypicker.text,_describe.text];
    
    
    
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
    if(resSrt) {
        NSLog(@"got response");
        
    } else {
        NSLog(@"faield to connect");
    }
        UIAlertView *signupalert = [[UIAlertView alloc]initWithTitle:@"Congratulations" message:@"Record Added Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [signupalert show];
       }
    Home *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                     instantiateViewControllerWithIdentifier:@"WebServiceViewController"];
    [self.navigationController pushViewController:wc animated:YES];
}




-(BOOL)isFormValid {
    
    NSString *emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegEx];
    
    if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txcompany_name.text.length==0 )  {
        [self showErrorMessage:@"Please enter company name"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txattn.text.length==0 ) {
        [self showErrorMessage:@"Please enter ATTN"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txaddress.text.length==0 ) {
       [self showErrorMessage:@"Please enter Address"];
       return NO;
   } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txcity.text.length==0 ) {
       [self showErrorMessage:@"Please enter City"];
       return NO;
   } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txstate.text.length==0 ) {
       [self showErrorMessage:@"Please enter state"];
       return NO;
   } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txzip.text.length==0 ) {
        [self showErrorMessage:@"Please enter Zip"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txbusiness_phone.text.length==0 ) {
        [self showErrorMessage:@"Please enter Business phone"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txwebsite.text.length==0 ) {
        [self showErrorMessage:@"Please enter Website"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && [emailTest evaluateWithObject: _txemail.text]==NO) {
        [self showErrorMessage:@"Please enter valid E-mail"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Active Business"] || [_txpicker.text isEqualToString:@"Corporate I: 50 or more employees"] || [_txpicker.text isEqualToString:@"Corporate II: fewer than 50 employees"] ) && _txcontacts.text.length==0 ) {
        [self showErrorMessage:@"Please enter Contacts"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_membe_name.text.length==0 ) {
        [self showErrorMessage:@"Please enter member name"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_member_address.text.length==0 ) {
        [self showErrorMessage:@"Please enter member address"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_member_city.text.length==0 ) {
        [self showErrorMessage:@"Please enter member city"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_member_state.text.length==0 ) {
        [self showErrorMessage:@"Please enter member state"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_member_zip.text.length==0 ) {
        [self showErrorMessage:@"Please enter member zip"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_member_homephone.text.length==0 ) {
        [self showErrorMessage:@"Please enter member home phone"];
        return NO;
    } /*else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_member_website.text.length==0 ) {
        [self showErrorMessage:@"Please enter member website"];
        return NO;
    }*/ else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && [emailTest evaluateWithObject: _tx_member_email.text]==NO) {
        [self showErrorMessage:@"Please enter member Valid Email_id"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_place_of_emp.text.length==0) {
        [self showErrorMessage:@"Please enter place of employment"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_placeofemp_city.text.length==0) {
        [self showErrorMessage:@"Please enter enter place of employment city"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_placeofemp_state.text.length==0) {
        [self showErrorMessage:@"Please enter enter place of employment state"];
        return NO;
    } else if (([_txpicker.text isEqualToString:@"Associate"] || [_txpicker.text isEqualToString:@"Active Professional"] ) && _tx_placeofemp_zip.text.length==0) {
        [self showErrorMessage:@"Please enter enter place of employment zip"];
        return NO;
    } else if (_txanualpicker.text && _txanualpicker.text.length==0) {
        [self showErrorMessage:@"Please select anual membership level "];
        return NO;
    } else if (_txpaymentpicker.text && _txpaymentpicker.text.length==0) {
        [self showErrorMessage:@"Please select payment"];
        return NO;
    } else if (_tx_receive_info_chech_enclosed.text && _tx_receive_info_chech_enclosed.text.length==0) {
        [self showErrorMessage:@"Please enter check enclosed for $ "];
        return NO;
    } else if (_txcloselypicker.text && _txcloselypicker.text.length==0) {
        [self showErrorMessage:@"Please select closely applies "];
        return NO;
    } else if (_describe.text && _describe.text.length==0) {
        [self showErrorMessage:@"Please enter briefly describe your business "];
        return NO;
    } else if ([self.emailCheckState isEqualToString:@"NO"] && [self.usmailCheckState isEqualToString:@"NO"]) {
        [self showErrorMessage:@"Please check one of information method from us "];
        return NO;
    }
    return YES;
}


-(void)showErrorMessage:(NSString *)message {
    
    UIAlertView *alertmessage = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertmessage show];
    
}



- (NSString *)urlEncodeValue:(NSString *)str {
    NSString *result = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8));
    return result;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

- (IBAction)tx_action1:(id)sender {
   
}

- (IBAction)tx_4:(id)sender {
    if (self.table4.hidden==YES) {
        self.table4.hidden=NO;
    }else{
        self.table4.hidden=YES;
    }
}

- (IBAction)tx3:(id)sender {
    if (self.table_3.hidden==YES) {
        self.table_3.hidden=NO;
    } else{
        self.table_3.hidden=YES;
    }
}

- (IBAction)rd_associate:(id)sender {
    self.firstView.hidden = false;
    self.secondView.hidden = false;
    self.thirdView.hidden = false;
    self.fourthView.hidden = false;
    self.fifthView.hidden = false;
    
    [_out_associate setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
    [_out_activeProfessional setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateI setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateII setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_activeBusiness setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    _txcompany_name.hidden = false;
    _compName.hidden = false;
    self.txpicker.text=@"Associate";
    
    self.firstView.hidden = true;
    
    self.secondView.frame = CGRectMake(0, _selectView.frame.origin.y + _selectView.frame.size.height, _secondView.frame.size.width, _secondView.frame.size.height);
    self.thirdView.frame = CGRectMake(0, _secondView.frame.origin.y + _secondView.frame.size.height, _thirdView.frame.size.width, _thirdView.frame.size.height);
    self.fourthView.frame = CGRectMake(0, _thirdView.frame.origin.y + _thirdView.frame.size.height, _fourthView.frame.size.width, _fourthView.frame.size.height);
    self.fifthView.frame = CGRectMake(0, _fourthView.frame.origin.y + _fourthView.frame.size.height, _fifthView.frame.size.width, _fifthView.frame.size.height);
    self.buttonView.frame = CGRectMake(0, _fifthView.frame.origin.y + _fifthView.frame.size.height, _buttonView.frame.size.width, _buttonView.frame.size.height);
    
    self.txanualpicker.text = @"Associate $30.00";
}

- (IBAction)rd_activeprofessional:(id)sender {
    self.firstView.hidden = false;
    self.secondView.hidden = false;
    self.thirdView.hidden = false;
    self.fourthView.hidden = false;
    self.fifthView.hidden = false;
    
    [_out_activeProfessional setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
    [_out_associate setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateI setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateII setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_activeBusiness setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    self.txpicker.text=@"Active Professional";
    
    self.firstView.hidden = true;
    
    self.secondView.frame = CGRectMake(0, _selectView.frame.origin.y + _selectView.frame.size.height, _secondView.frame.size.width, _secondView.frame.size.height);
    self.thirdView.frame = CGRectMake(0, _secondView.frame.origin.y + _secondView.frame.size.height, _thirdView.frame.size.width, _thirdView.frame.size.height);
    self.fourthView.frame = CGRectMake(0, _thirdView.frame.origin.y + _thirdView.frame.size.height, _fourthView.frame.size.width, _fourthView.frame.size.height);
    self.fifthView.frame = CGRectMake(0, _fourthView.frame.origin.y + _fourthView.frame.size.height, _fifthView.frame.size.width, _fifthView.frame.size.height);
    self.buttonView.frame = CGRectMake(0, _fifthView.frame.origin.y + _fifthView.frame.size.height, _buttonView.frame.size.width, _buttonView.frame.size.height);
    
    self.txanualpicker.text = @"Actve Professional $50.00";
}

- (IBAction)rd_activeBusiness:(id)sender {
    self.firstView.hidden = false;
    self.secondView.hidden = false;
    self.thirdView.hidden = false;
    self.fourthView.hidden = false;
    self.fifthView.hidden = false;
    
    [_out_activeProfessional setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_associate setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateI setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateII setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_activeBusiness setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
    self.txpicker.text=@"Active Business";
    
    self.secondView.hidden = true;
    self.thirdView.hidden = true;
    
    self.firstView.frame = CGRectMake(0, _selectView.frame.origin.y + _selectView.frame.size.height, _firstView.frame.size.width, _firstView.frame.size.height);
    self.fourthView.frame = CGRectMake(0, _firstView.frame.origin.y + _firstView.frame.size.height, _fourthView.frame.size.width, _fourthView.frame.size.height);
    self.fifthView.frame = CGRectMake(0, _fourthView.frame.origin.y + _fourthView.frame.size.height, _fifthView.frame.size.width, _fifthView.frame.size.height);
    self.buttonView.frame = CGRectMake(0, _fifthView.frame.origin.y + _fifthView.frame.size.height, _buttonView.frame.size.width, _buttonView.frame.size.height);
    
    self.txanualpicker.text = @"Active Business $70.00";
}

- (IBAction)rd_corporateII:(id)sender {
    self.firstView.hidden = false;
    self.secondView.hidden = false;
    self.thirdView.hidden = false;
    self.fourthView.hidden = false;
    self.fifthView.hidden = false;
    
    [_out_activeProfessional setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_associate setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateI setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateII setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
    [_out_activeBusiness setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    self.txpicker.text=@"Corporate II: fewer than 50 employees";
    
    self.secondView.hidden = true;
    self.thirdView.hidden = true;
    
    self.firstView.frame = CGRectMake(0, _selectView.frame.origin.y + _selectView.frame.size.height, _firstView.frame.size.width, _firstView.frame.size.height);
    self.fourthView.frame = CGRectMake(0, _firstView.frame.origin.y + _firstView.frame.size.height, _fourthView.frame.size.width, _fourthView.frame.size.height);
    self.fifthView.frame = CGRectMake(0, _fourthView.frame.origin.y + _fourthView.frame.size.height, _fifthView.frame.size.width, _fifthView.frame.size.height);
    self.buttonView.frame = CGRectMake(0, _fifthView.frame.origin.y + _fifthView.frame.size.height, _buttonView.frame.size.width, _buttonView.frame.size.height);
    
    self.txanualpicker.text = @"Corporate II: fewer than 50 employees $100";
}

- (IBAction)rd_corporateI:(id)sender {
    self.firstView.hidden = false;
    self.secondView.hidden = false;
    self.thirdView.hidden = false;
    self.fourthView.hidden = false;
    self.fifthView.hidden = false;
    
    [_out_activeProfessional setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_associate setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_corporateI setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
    [_out_corporateII setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    [_out_activeBusiness setBackgroundImage:[UIImage imageNamed:@"images-2.jpeg"] forState:UIControlStateNormal];
    self.txpicker.text=@"Corporate I: 50 or more employees";
    
    self.secondView.hidden = true;
    self.thirdView.hidden = true;
    
    self.firstView.frame = CGRectMake(0, _selectView.frame.origin.y + _selectView.frame.size.height, _firstView.frame.size.width, _firstView.frame.size.height);
    self.fourthView.frame = CGRectMake(0, _firstView.frame.origin.y + _firstView.frame.size.height, _fourthView.frame.size.width, _fourthView.frame.size.height);
    self.fifthView.frame = CGRectMake(0, _fourthView.frame.origin.y + _fourthView.frame.size.height, _fifthView.frame.size.width, _fifthView.frame.size.height);
    self.buttonView.frame = CGRectMake(0, _fifthView.frame.origin.y + _fifthView.frame.size.height, _buttonView.frame.size.width, _buttonView.frame.size.height);
    
    self.txanualpicker.text = @"Corporate I: 50 or more employees $ 250.00";
}

- (IBAction)checkEmail:(id)sender {
    if ([self.emailCheckState isEqualToString:@"NO"]) {
        self.emailCheckImg.image = [UIImage imageNamed:@"check"];
        self.emailCheckState = @"YES";
    } else {
        self.emailCheckImg.image = [UIImage imageNamed:@"unCheck"];
        self.emailCheckState = @"NO";
    }
    
}

- (IBAction)checkUSmail:(id)sender {
    if ([self.usmailCheckState isEqualToString:@"NO"]) {
        self.usmailCheckImg.image = [UIImage imageNamed:@"check"];
        self.usmailCheckState = @"YES";
    } else {
        self.usmailCheckImg.image = [UIImage imageNamed:@"unCheck"];
        self.usmailCheckState = @"NO";
    }
}
@end
