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
    
    NSURL *myURL = [NSURL URLWithString:@"http://cashq.co.kr/m/?latitude=37.6372&longitude=126.775&distance=5000"];
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














