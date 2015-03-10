//
//  ViewController.m
//  MyWebview
//
//  Created by TaebuAir on 2014. 12. 10..
//  Copyright (c) 2014년 Taebu. All rights reserved.
//

#import "UpdateModel.h"
#import "ViewController.h"
@interface ViewController()
@end

@implementation ViewController
@synthesize webView;
@synthesize latitude;
@synthesize longitude;
#pragma mark - View lifecycle

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *request_Url = [[request URL] absoluteString];
    
    NSString *autoYn = [[NSUserDefaults standardUserDefaults] objectForKey:@"autoYn"];
    NSRange range3 = [request_Url rangeOfString:@"wd114.co.kr/m/search.php"];
    NSRange range5 = [request_Url rangeOfString:@"tel:"];
    
    if(range3.location == NSNotFound && range5.location == NSNotFound){
        NSRange checkUrl = [request_Url rangeOfString:@"wd114.co.kr/m/"];
        if(checkUrl.location == NSNotFound){
            return YES;
        }
        
        if ([autoYn isEqualToString:@"Y"]) {
            NSRange range = [request_Url rangeOfString:@"&lng="];
            if(range.location == NSNotFound){
                
                NSString *distance = [[NSUserDefaults standardUserDefaults] objectForKey:@"distance"];
                NSString *strURL;
                
                if([[request_Url substringWithRange:NSMakeRange([request_Url length]-4, 4)] isEqualToString:@".php"]){
                    strURL = [request_Url stringByAppendingFormat:@"?lat=%@&lng=%@&distance=%@", latitude, longitude, distance];
                }else{
                    strURL = [request_Url stringByAppendingFormat:@"&lat=%@&lng=%@&distance=%@", latitude, longitude, distance];
                }
                NSRange range7 = [request_Url rangeOfString:@"wd114.co.kr/m/view.php"];
                NSRange range8 = [request_Url rangeOfString:@"&androYn=Y"];
                if(range7.location != NSNotFound && range8.location == NSNotFound){
                    strURL = [strURL stringByAppendingFormat:@"&androYn=Y"];
                }
                
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:strURL]]];
                return NO;
            }
        }else{
            NSRange range7 = [request_Url rangeOfString:@"wd114.co.kr/m/view.php"];
            NSRange range8 = [request_Url rangeOfString:@"&androYn=Y"];
            if(range7.location != NSNotFound && range8.location == NSNotFound){
                request_Url = [request_Url stringByAppendingFormat:@"&androYn=Y"];
                
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request_Url]]];
                return NO;
            }
        }
    }
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.modelUpdate = [[UpdateModel alloc]init];
    
    [self.modelUpdate updateToServer];
    

    

    self.modelUpdate.autoUpdate =TRUE;
    [self kk:];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)kk:(NSNumber *)lat:(NSNumber *)lng{
    NSString *baseURL = [NSString stringWithFormat:@"http://cashq.co.kr/m/?lat=%f&lng=%f&distance=%@",[lat doubleValue],[lng doubleValue],@"5000"];
    NSURL *myURL = [NSURL URLWithString:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    self.myWebView.scalesPageToFit = YES;
    
    [self.myWebView loadRequest:myRequest];
}
@end














