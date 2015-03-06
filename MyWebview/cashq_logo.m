//
//  cashq_logo.m
//  MyWebview
//
//  Created by TaebuAir on 2015. 3. 6..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//

#import "cashq_logo.h"

@implementation cashq_logo
@synthesize mytimer;
@synthesize locationManager;
@synthesize latitude;
@synthesize longitude;



//@interface cashq_logo ()

//@end

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if(self){
    
    }
    return self;
    
}

-(void)moveToNext{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
