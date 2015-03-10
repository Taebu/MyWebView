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

@property(nonatomic,strong)CLLocationManager *mgrLoc;

@end


@implementation ViewController
@synthesize latitude;
@synthesize longitude;
@synthesize locationManager;


- (CLLocationManager *)mgrLoc{
    if(_mgrLoc ==nil){
        _mgrLoc = [[CLLocationManager alloc] init];
        
        _mgrLoc.delegate = self;
    }
    return  _mgrLoc;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.locationManager startUpdatingLocation];
    [self.mgrLoc requestWhenInUseAuthorization];
    [self.mgrLoc startUpdatingLocation];

}
-(void)viewDidAppear:(BOOL)animated{
    
    self.modelUpdate = [[UpdateModel alloc]init];
    [self.modelUpdate updateToServer];
    self.modelUpdate.autoUpdate =TRUE;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)kk{
    NSString *baseURL = [NSString stringWithFormat:@"http://cashq.co.kr/m/?lat=%f&lng=%f&distance=%@",[self.latitude doubleValue],[self.longitude doubleValue],@"5000"];
    NSURL *myURL = [NSURL URLWithString:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    self.myWebView.scalesPageToFit = YES;
    
    [self.myWebView loadRequest:myRequest];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *loc = locations.lastObject;
    
    self.latitude = [NSNumber numberWithDouble:loc.coordinate.latitude];
    self.longitude = [NSNumber numberWithDouble:loc.coordinate.longitude];
    
    [self.mgrLoc stopUpdatingLocation];

    NSLog(@"%f",[self.latitude doubleValue]);
    NSLog(@"%f",[self.longitude doubleValue]);
    
    [self kk];
    
    
}
@end














