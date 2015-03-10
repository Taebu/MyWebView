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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.modelUpdate = [[UpdateModel alloc]init];
    
    [self.modelUpdate updateToServer];
    

    

    self.modelUpdate.autoUpdate =TRUE;
    [self kk];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)kk{
    NSString *baseURL = [NSString stringWithFormat:@"http://cashq.co.kr/m/?lat=%f&lng=%f&distance=%@",[latitude doubleValue],[longitude doubleValue],@"5000"];
    NSURL *myURL = [NSURL URLWithString:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    self.myWebView.scalesPageToFit = YES;
    
    [self.myWebView loadRequest:myRequest];
}
@end














