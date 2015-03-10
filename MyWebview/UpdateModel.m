//
//  UpdateModel.m
//  MyWebview
//
//  Created by TaebuAir on 2015. 3. 7..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "UpdateModel.h"
#import "ViewController.h"

@interface UpdateModel()<CLLocationManagerDelegate>

@property(nonatomic,strong)CLLocationManager *mgrLoc;

@end

@implementation UpdateModel

- (CLLocationManager *)mgrLoc{
    if(_mgrLoc ==nil){
        _mgrLoc = [[CLLocationManager alloc] init];
        
        _mgrLoc.delegate = self;
    }
    return  _mgrLoc;
}

-(void)updateToServer{
    
    ViewController *detailViewController = [[ViewController alloc] init];
        detailViewController.latitude = self.latitude;
        detailViewController.longitude =self.longitude;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [self.latitude doubleValue];
    coordinate.longitude = [self.longitude doubleValue];
    NSLog(@"%f, %f", coordinate.longitude, coordinate.latitude);
    
}
-(instancetype)init{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"실패" message:@"위치값을 가져오지 못했습니다." delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    [alert show];
    
    self=[super init];
    
    [self.mgrLoc requestWhenInUseAuthorization];
    [self.mgrLoc startUpdatingLocation];
    
    alert = [[UIAlertView alloc] initWithTitle:@"실패" message:@"3.8" delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    [alert show];
    if(self){
        self.deviceIdentifier = [[[UIDevice currentDevice] identifierForVendor]UUIDString];
        self.latitude = self.latitude;
        self.longitude = self.longitude;
        self.message = @"MTB ::: hahah !!!";
        
    }
    return self;
}






- (void)setAutoUpdate:(BOOL)autoUpdate{
    _autoUpdate = autoUpdate;
    
    if(_autoUpdate ==TRUE){
        [self.mgrLoc requestWhenInUseAuthorization];
        [self.mgrLoc startUpdatingLocation];
    }else{
        [self.mgrLoc stopUpdatingLocation];
    }
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *loc = locations.lastObject;
    
    self.latitude = [NSNumber numberWithDouble:loc.coordinate.latitude];
    self.longitude = [NSNumber numberWithDouble:loc.coordinate.longitude];
    
    
    NSLog(@"%f",[self.latitude doubleValue]);
    NSLog(@"%f",[self.longitude doubleValue]);
    [self.mgrLoc stopUpdatingLocation];
    [self updateToServer];
}
@end
