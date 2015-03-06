//
//  ViewController.m
//  MyWebview
//
//  Created by TaebuAir on 2014. 12. 10..
//  Copyright (c) 2014년 Taebu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *myURL = [NSURL URLWithString:@"http://cashq.co.kr/m/"];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    self.myWebView.scalesPageToFit = YES;
    
    [self.myWebView loadRequest:myRequest];
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    NSLog(@"%f",locationManager.location.coordinate.latitude);
    NSLog(@"%f",locationManager.location.coordinate.longitude);
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














