//
//  SecondHome.m
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "SecondHome.h"
#import "UIImageView+WebCache.h"
#import "CKDemoViewController.h"
#import "MBProgressHUD.h"

@interface SecondHome ()
{
    NSArray*picarray;
    NSArray*date;
    NSArray*title;
    NSArray *imageUrlArray;
    NSMutableArray*des;
    NSArray*evnt_ary;
    NSArray*timeary;
    
    UIActivityIndicatorView *spinner;
}

@end

@implementation SecondHome


- (void)viewDidLoad {
    [super viewDidLoad];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinner.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    spinner.transform = CGAffineTransformMakeScale(4.0, 4.0);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background2.png"] forBarMetrics:UIBarMetricsDefault];
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_event.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
    
    [_mainView setUserInteractionEnabled:YES];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [_mainView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [_mainView addGestureRecognizer:swipeRight];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [response appendData:data];
    NSLog(@"error receving data %@",response);
}

-(void)swipeImage:(UISwipeGestureRecognizer*)recognizer
{
    NSInteger index = _currentImageIndex;
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        index++;
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        index--;
    }
    
    if (index >= 0 && index < ([_imageData count]))
    {
        _currentImageIndex = index;
        [self showImageAtIndex:index];
    }
    else
    {
        NSLog(@"End! Can't move anymore!");
    }
    
    
}

-(void)showImageAtIndex:(NSInteger)index
{
    _img.image = _imageData[index];
    [_label setText:[des objectAtIndex:index]];
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
    title = results;
    
    date =[[results valueForKey:@"event"]valueForKey:@"event_date"];
    NSLog(@"date %@",date);
    
    
    imageUrlArray =[[results valueForKey:@"slider"]valueForKey:@"imageurl"];
    NSLog(@"event name fetch %@",imageUrlArray);
    
    des =[[results valueForKey:@"slider"]valueForKey:@"title"];
    NSLog(@"event name fetch %@",des);
    
    
    NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
    
    for (NSString *strImageUrl in imageUrlArray) {
        [arrayImages addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImageUrl]]]];
    }
    
    self->_imageData = arrayImages;
    
    self.currentImageIndex = 0;
    _img.image = [self->_imageData objectAtIndex:self.currentImageIndex];
    [_label setText:[des objectAtIndex:0]];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:5
                                                  target:self
                                                selector:@selector(displayNextImage)
                                                userInfo:nil
                                                 repeats:YES];
    
    
    
    [self->spinner stopAnimating];
}

- (void)displayNextImage
{
    self.currentImageIndex = (self.currentImageIndex + 1) % self->_imageData.count;
    NSLog(@"Current Image Index %d", self.currentImageIndex);
    _img.image = [self->_imageData objectAtIndex:self.currentImageIndex];
    [_label setText:[des objectAtIndex:self.currentImageIndex]];
    NSLog(@"==============================================");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)event:(id)sender
{
    CKDemoViewController *destVC = [[CKDemoViewController alloc] init];
    destVC.arr = title;
    [self presentViewController:destVC animated:YES completion:nil];
    //    [self.navigationController pushViewController:[[CKDemoViewController alloc] init] animated:YES];
}

- (IBAction)donate:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/donation/"]];
}
@end
