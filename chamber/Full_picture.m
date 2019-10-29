//
//  Full_picture.m
//  chamber
//
//  Created by ankur kumawat on 09/09/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "Full_picture.h"

@interface Full_picture ()

@end

@implementation Full_picture

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"images ankur %@",_uid_value);
    // Do any additional setup after loading the view.
    
    NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
    
    for (NSString *strImageUrl in _photoData) {
        [arrayImages addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImageUrl]]]];
        
    }
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_uid_value]];
    _recipeImageView.image = [UIImage imageWithData:imageData];
    
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 6.0;
    self.scrollView.contentSize = self.recipeImageView.frame.size;
    self.scrollView.delegate = self;
    
    //swipe part/////////////////////////////////////////////////////////////
    [_recipeImageView setUserInteractionEnabled:YES];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [_recipeImageView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [_recipeImageView addGestureRecognizer:swipeRight];
}

-(void)swipeImage:(UISwipeGestureRecognizer*)recognizer
{
    NSInteger index = _currentIndex;
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        index++;
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        index--;
    }
    
    if (index >= 0 && index < ([_photoData count]))
    {
        _currentIndex = index;
        [self showImageAtIndex:_currentIndex];
    }
    else
    {
        NSLog(@"End! Can't move anymore!");
    }
    
}

-(void)showImageAtIndex:(NSInteger)index
{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_photoData[index]]];
    _recipeImageView.image = [UIImage imageWithData:imageData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.recipeImageView;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
}


@end
