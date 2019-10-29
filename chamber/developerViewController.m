//
//  developerViewController.m
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 14/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import "developerViewController.h"

@interface developerViewController ()
{
    NSArray*textarray;
    
}

@end

@implementation developerViewController

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
    
    
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_developer.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
    
    _developertext.scrollEnabled = YES;
    self.developertext.editable = NO;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
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
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
    NSArray* results = [json objectForKey:@"status"];
    NSString*str = [results valueForKey:@"des"];
    str = [str stringByAppendingString:@"<style>body{font-family:'Verdana'; font-size:'1px';}</style>"];
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithData: [str dataUsingEncoding:NSUnicodeStringEncoding]options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
        documentAttributes: nil
        error: nil
        ];
    self.developertext.attributedText = attributedString;
    
//    NSArray* results = [json objectForKey:@"status"];
//    textarray = [results valueForKey:@"des"];
//    self.developertext.text = [self convertHtmlPlainText:[results valueForKey:@"des"]];
}

-(NSString*)convertHtmlPlainText:(NSString*)HTMLString
{
    NSData *HTMLData = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithData:HTMLData options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:NULL error:NULL];
    NSString *plainString = attrString.string;
    return plainString;
}

@end
