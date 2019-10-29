//
//  Home.m
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "Home.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"


@interface Home ()
{
    NSArray *imageUrlArray;
    UIActivityIndicatorView *spinner;
   
}


@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyAppDeviceToken"];
//    NSLog(@"device token in controller: %@ ", deviceToken);
//    self.txtx.text=deviceToken;
   

    
//    HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:HUD];
//    [HUD show:YES];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    spinner.transform = CGAffineTransformMakeScale(4.0, 4.0);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_slider.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
    
    [_imageview setUserInteractionEnabled:YES];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [_imageview addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [_imageview addGestureRecognizer:swipeRight];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];    // it shows
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
    _imageview.image = _imageData[index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    // [HUD show: YES];
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
    NSArray* results = [json objectForKey:@"status"];
    imageUrlArray = [results valueForKey:@"slider_image_path"];
    NSLog(@"images %@",imageUrlArray);
    
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    //dispatch_async(queue, ^{
    
        NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
        
            for (NSString *strImageUrl in self->imageUrlArray) {
            [arrayImages addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImageUrl]]]];
            
        }
        
        self->_imageData = arrayImages;
    
        self.currentImageIndex = 0;
        _imageview.image = [self->_imageData objectAtIndex:self.currentImageIndex];
        
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
    _imageview.image = [self->_imageData objectAtIndex:self.currentImageIndex];
    NSLog(@"==============================================");
    
}


@end
