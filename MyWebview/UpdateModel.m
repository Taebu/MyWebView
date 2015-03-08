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
}
-(instancetype)init{
    self=[super init];
    
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
 //   [self updateToServer];
}
@end
