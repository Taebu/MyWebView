//
//  ViewController.h
//  MyWebview
//
//  Created by TaebuAir on 2014. 12. 10..
//  Copyright (c) 2014년 Taebu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<UIWebViewDelegate,
CLLocationManagerDelegate,
MKReverseGeocoderDelegate,
UIActionSheetDelegate,
UIAlertViewDelegate>{
    //    IBOutlet __weak UIWebView *myWebView;
    CLLocationManager *locationManager;
    MKReverseGeocoder *geocoder;
    UIWebView *webView;

    NSNumber *latitude;
    NSNumber *longitude;
}

@property (nonatomic,weak) IBOutlet UIWebView *myWebView;

@property (nonatomic,strong)UpdateModel *modelUpdate;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@end

@interface UIWebView (WebUI)
- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(CGRect *)frame;
@end

