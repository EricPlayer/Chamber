//
//  CKDemoViewController.m
//  MBCalendarKit
//
//  Created by Moshe Berman on 4/17/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "CKDemoViewController.h"
#import "newfile.h"

#import "NSCalendarCategories.h"

#import "NSDate+Components.h"
#import "ViewController.h"

@interface CKDemoViewController () <CKCalendarViewDelegate, CKCalendarViewDataSource>
{
     NSString *title1;
    NSString *title2;
}
@property (nonatomic, strong) NSMutableDictionary *data;
@end

@implementation CKDemoViewController
@synthesize arr;

- (void)viewDidLoad
{
    [super viewDidLoad];
     NSLog(@"Array: %@",arr);
        UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 400, 60)];
        //do something like background color, title, etc you self
        [self.view addSubview:navbar];

    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    
        UINavigationItem *item = [[UINavigationItem alloc]
                                  init];
        navbar.items= @[item];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
        initWithTitle:@"〈 Back"style:UIBarButtonItemStyleBordered
        target:self action:@selector(backBtnClicked:)];
        item.leftBarButtonItem = backButton;
     self.navigationItem.leftBarButtonItem=backButton;

     /*
     *  Create a dictionary for the data source
     */
    
    self.data = [[NSMutableDictionary alloc] init];
    
    /**
     *  Wire up the data source and delegate.
     */
    
    [self setDataSource:self];
    [self setDelegate:self];
    
    /**
     *  Create some events.
     */
    
      //An event for the new MBCalendarKit release.
//    NSString *title = NSLocalizedString(@"Release MBCalendarKit 2.2.4", @"");
//    NSDate *date = [NSDate dateWithDay:28 month:07 year:2016];
//    CKCalendarEvent *releaseUpdatedCalendarKit = [CKCalendarEvent eventWithTitle:title andDate:date andInfo:nil];
//    
//    //  An event for the new Hunger Games movie.
//    NSString *title2 = NSLocalizedString(@"The Hunger Games: Mockingjay, Part 1", @"");
//    NSDate *date2 = [NSDate dateWithDay:21 month:11 year:2014];
//    CKCalendarEvent *mockingJay = [CKCalendarEvent eventWithTitle:title2 andDate:date2 andInfo:nil];
//
//    //  Integrate MBCalendarKit
//    NSString *integrationTitle = NSLocalizedString(@"Integrate MBCalendarKit", @"");
//    NSDate *integrationDate = date2;
//    CKCalendarEvent *integrationEvent = [CKCalendarEvent eventWithTitle:integrationTitle andDate:integrationDate andInfo:nil];
//    
//    //  An event for the new MBCalendarKit release.
//    NSString *title3 = NSLocalizedString(@"Fix bug where events don't show up immediately.", @"");
//    NSDate *date3 = [NSDate dateWithDay:29 month:11 year:2014];
//    CKCalendarEvent *fixBug = [CKCalendarEvent eventWithTitle:title3 andDate:date3 andInfo:nil];
//    
//    
//    /**
//     *  Add the events to the data source.
//     *
//     *  The key is the date that the array of events appears on.
//     */
//    
//    self.data[date] = @[releaseUpdatedCalendarKit];
//    self.data[date2] = @[mockingJay, integrationEvent];
//    self.data[date3] = @[fixBug];
}
-(void)backBtnClicked:(id)sender
{
  
     [self dismissViewControllerAnimated:YES completion:nil];

}

- (void) viewWillAppear: (BOOL)animated{
    
    NSLog(@"Array: %@",arr);
    NSArray *title = [[arr valueForKey:@"event"]valueForKey:@"event_title"];
    
    NSLog(@"event name fetch %@",title);
    
    
    NSArray *date =[[arr valueForKey:@"event"]valueForKey:@"event_date"];
    
    
    NSLog(@"event fetch %@",date);
    NSData *img =[[arr valueForKey:@"event"]valueForKey:@"img"];
    
    NSArray *des =[[arr valueForKey:@"event"]valueForKey:@"event_detail"];
    NSArray *evnt_ary =[[arr valueForKey:@"event"]valueForKey:@"event_name"];
    NSArray *timeary =[[arr valueForKey:@"event"]valueForKey:@"event_time"];
  
   // NSString *title1;
   
    NSDate *date1;
    CKCalendarEvent *releaseUpdatedCalendarKit;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSError*eror=nil;
    
  // NSData *data = [NSKeyedArchiver archivedDataWithRootObject:img];
    
    NSLog(@"image %@",img);
    for (int i = 0; i < [date count]; i++){
        title1 = NSLocalizedString(title[i], @"");
        
        date1 = [dateFormatter dateFromString:date[i]];
       
        
        
        releaseUpdatedCalendarKit = [CKCalendarEvent eventWithTitle:title1 andDate:date1 andInfo:nil];
        NSLog(@"Event: %@ , %@",title1,date1);
        
        self.data[date1] = @[releaseUpdatedCalendarKit];
    }
    



}

- (void)viewDidAppear:(BOOL)animated
{
    /**
     * Here's an example of setting min/max dates.
     */
    
    /*
     NSDate *min = [NSDate dateWithDay:1 month:4 year:2014];
     NSDate *max = [NSDate dateWithDay:31 month:12 year:2015];
     
     [[self calendarView] setMaximumDate:max];
     [[self calendarView] setMinimumDate:min];
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CKCalendarViewDataSource

- (NSArray *)calendarView:(CKCalendarView *)calendarView eventsForDate:(NSDate *)date
{
    return [self data][date];
}

#pragma mark - CKCalendarViewDelegate

// Called before/after the selected date changes
- (void)calendarView:(CKCalendarView *)CalendarView willSelectDate:(NSDate *)date
{
    
    

    
}

- (void)calendarView:(CKCalendarView *)CalendarView didSelectDate:(NSDate *)date
{
    
}

//  A row is selected in the events table. (Use to push a detail view or whatever.)
- (void)calendarView:(CKCalendarView *)CalendarView didSelectEvent:(CKCalendarEvent *)event
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    newfile*destVC = [[newfile alloc] init];
   // destVC.pure=arr;
    destVC.pure = event.title;
    
    destVC.puredate = [dateFormatter stringFromDate:event.date];
   [self presentViewController:destVC animated:YES completion:nil];
  

}


// Loop through each item in List array of Events.plist

@end
