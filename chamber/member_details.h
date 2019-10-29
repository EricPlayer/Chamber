//
//  member_details.h
//  chamber
//
//  Created by SSMAC100 on 30/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>
@class MBProgressHUD;

@interface member_details : UIViewController<MFMailComposeViewControllerDelegate>
{
    MBProgressHUD*HUD;
}
@property (weak, nonatomic) IBOutlet MKMapView *map_view;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (id)initWithCoordinates:(CLLocationCoordinate2D)location
                placeName:(NSString *)placeName
              description:(NSString *)description;


@property(strong,nonatomic)NSDictionary *myPreviousVCDict;
@property(nonatomic,retain) NSString * hello;
@property(nonatomic,retain) NSString * adrs;
@property(nonatomic,retain) NSString * phone;
@property(nonatomic,retain) NSString * email;
@property(nonatomic,retain) NSString * website;
@property(nonatomic,retain) NSString * sens;
@property(nonatomic,retain) NSString * des;
@property(nonatomic,retain) NSString * image;

@property (weak, nonatomic) IBOutlet UILabel *buss_name_lbl;
@property (weak, nonatomic) IBOutlet UILabel *address_lbl;
@property (weak, nonatomic) IBOutlet UILabel *phone_lbl;
@property (weak, nonatomic) IBOutlet UILabel *email_lbl;
@property (weak, nonatomic) IBOutlet UILabel *website_lbl;
@property (weak, nonatomic) IBOutlet UILabel *mem_lbl;
@property (weak, nonatomic) IBOutlet UILabel *dec_lbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageview_lbl;
@property (strong, nonatomic) IBOutlet UIButton *phone_outlet;
- (IBAction)phone_action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *email_outlet;
- (IBAction)email_action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *website_outlet;

- (IBAction)website_action:(id)sender;




@end

