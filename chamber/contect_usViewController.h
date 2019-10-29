//
//  contect_usViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>


@interface contect_usViewController : UIViewController<NSURLConnectionDataDelegate,MKAnnotation,UITextFieldDelegate,UITextViewDelegate, MFMailComposeViewControllerDelegate>
{
    NSMutableData *response;
}
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location
                placeName:(NSString *)placeName
              description:(NSString *)description;



@property (weak, nonatomic) IBOutlet UITextField *tx_phone;

@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UITextField *txname;
@property (strong, nonatomic) IBOutlet UITextField *txemail;

@property (strong, nonatomic) IBOutlet UITextField *txcomment;
- (IBAction)submit:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *address_lbl;
@property (strong, nonatomic) IBOutlet UILabel *phone_lbl;
@property (strong, nonatomic) IBOutlet UILabel *email_lbl;
@property (weak, nonatomic) IBOutlet UIView *view_view;
- (IBAction)phone_action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *phone_outlet;
@property (strong, nonatomic) IBOutlet UIButton *email_outlet;
- (IBAction)email_action:(id)sender;




@end
