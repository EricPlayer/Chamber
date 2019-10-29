//
//  joinViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface joinViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,NSURLConnectionDataDelegate,UITextFieldDelegate,UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)rd_associate:(id)sender;
- (IBAction)rd_activeprofessional:(id)sender;
- (IBAction)rd_activeBusiness:(id)sender;
- (IBAction)rd_corporateII:(id)sender;
- (IBAction)rd_corporateI:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *out_associate;
@property (strong, nonatomic) IBOutlet UIButton *out_activeProfessional;
@property (strong, nonatomic) IBOutlet UIButton *out_activeBusiness;
@property (strong, nonatomic) IBOutlet UIButton *out_corporateII;
@property (strong, nonatomic) IBOutlet UIButton *out_corporateI;

@property (weak, nonatomic) IBOutlet UITextField *txcompany_name;
@property (weak, nonatomic) IBOutlet UITextField *txattn;
@property (weak, nonatomic) IBOutlet UITextField *txaddress;
@property (weak, nonatomic) IBOutlet UITextField *txcity;
@property (weak, nonatomic) IBOutlet UITextField *txstate;
@property (weak, nonatomic) IBOutlet UITextField *txzip;
@property (weak, nonatomic) IBOutlet UITextField *txbusiness_phone;
@property (weak, nonatomic) IBOutlet UITextField *txwebsite;
@property (weak, nonatomic) IBOutlet UITextField *txemail;
@property (weak, nonatomic) IBOutlet UITextField *txcontacts;

@property (weak, nonatomic) IBOutlet UITextField *tx_membe_name;
@property (weak, nonatomic) IBOutlet UITextField *tx_member_address;
@property (weak, nonatomic) IBOutlet UITextField *tx_member_city;
@property (weak, nonatomic) IBOutlet UITextField *tx_member_state;
@property (weak, nonatomic) IBOutlet UITextField *tx_member_zip;
@property (weak, nonatomic) IBOutlet UITextField *tx_member_homephone;
@property (weak, nonatomic) IBOutlet UITextField *tx_member_website;
@property (weak, nonatomic) IBOutlet UITextField *tx_member_email;

@property (weak, nonatomic) IBOutlet UITextField *tx_place_of_emp;
@property (weak, nonatomic) IBOutlet UITextField *tx_placeofemp_city;
@property (weak, nonatomic) IBOutlet UITextField *tx_placeofemp_state;
@property (weak, nonatomic) IBOutlet UITextField *tx_placeofemp_zip;

@property (weak, nonatomic) IBOutlet UITextField *tx_receive_info_email;
@property (weak, nonatomic) IBOutlet UITextField *tx_receive_info_fax;
@property (weak, nonatomic) IBOutlet UITextField *tx_receive_info_usemail;
@property (weak, nonatomic) IBOutlet UITextField *tx_receive_info_chech_enclosed;
@property (weak, nonatomic) IBOutlet UITextView *describe;
- (IBAction)submit_btn:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *table_3;
@property (weak, nonatomic) IBOutlet UITableView *table4;


@property (weak, nonatomic) IBOutlet UITextField *txpicker;

@property (nonatomic, strong) NSArray *pickerarray;
@property (nonatomic, strong) NSArray *anualarray;
@property (nonatomic, strong) NSArray *paymentarray;
@property (nonatomic, strong) NSArray *closelyarray;

@property (weak, nonatomic) IBOutlet UILabel *txanualpicker;
@property (weak, nonatomic) IBOutlet UITextField *txpaymentpicker;
@property (weak, nonatomic) IBOutlet UITextField *txcloselypicker;

@property (weak, nonatomic) IBOutlet UILabel *compName;

@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;
@property (weak, nonatomic) IBOutlet UIView *fourthView;
@property (weak, nonatomic) IBOutlet UIView *fifthView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@property (weak, nonatomic) IBOutlet UIButton *emailCheckBtn;
@property (weak, nonatomic) IBOutlet UIButton *usmailCheckBtn;

@property (weak, nonatomic) IBOutlet UIImageView *emailCheckImg;
@property (weak, nonatomic) IBOutlet UIImageView *usmailCheckImg;

- (IBAction)checkEmail:(id)sender;
- (IBAction)checkUSmail:(id)sender;

@property (nonatomic, assign) NSString *emailCheckState;
@property (nonatomic, assign) NSString *usmailCheckState;
@end
