//
//  cashq_logo.h
//  MyWebview
//
//  Created by TaebuAir on 2015. 3. 6..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface cashq_logo : UIViewController<CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
    NSTimer *mytimer;
    NSString *latitude;
    NSString *longitude;
}
@property (nonatomic, retain) NSTimer *mytimer;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;
@end
