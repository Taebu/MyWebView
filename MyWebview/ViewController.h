//
//  ViewController.h
//  MyWebview
//
//  Created by TaebuAir on 2014. 12. 10..
//  Copyright (c) 2014년 Taebu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController
<CLLocationManagerDelegate>{
    
//    IBOutlet __weak UIWebView *myWebView;
    CLLocationManager *locationManager;
}

@property (nonatomic,weak) IBOutlet UIWebView *myWebView;
@property (nonatomic,strong)CLLocationManager *locationManager;

@end

