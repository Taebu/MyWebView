//
//  ViewController.m
//  MyWebview
//
//  Created by TaebuAir on 2014. 12. 10..
//  Copyright (c) 2014년 Taebu. All rights reserved.
//

#import "ViewController.h"
#import "UpdateModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.modelUpdate = [[UpdateModel alloc]init];
    
    [self.modelUpdate updateToServer];

    NSString *baseURL = [NSString stringWithFormat:@"http://cashq.co.kr/m/?lat=%f&lng=%f&distance=%@",
                         [self.modelUpdate.latitude doubleValue],
                         [self.modelUpdate.longitude doubleValue],
                         @"5000"];
  //  NSURL *myURL = [NSURL URLWithString:@"http://cashq.co.kr/m/?lat=27.333&lng=127.555&distance=5000"];

    NSURL *myURL = [NSURL URLWithString:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    self.myWebView.scalesPageToFit = YES;
    
    [self.myWebView loadRequest:myRequest];
    
    self.modelUpdate.autoUpdate =TRUE;
  
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














