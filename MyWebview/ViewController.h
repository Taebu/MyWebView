//
//  ViewController.h
//  MyWebview
//
//  Created by TaebuAir on 2014. 12. 10..
//  Copyright (c) 2014년 Taebu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UpdateModel;

@interface ViewController : UIViewController{
    
    //    IBOutlet __weak UIWebView *myWebView;
    
}

@property (nonatomic,weak) IBOutlet UIWebView *myWebView;

@property (nonatomic,strong)UpdateModel *modelUpdate;

@end

