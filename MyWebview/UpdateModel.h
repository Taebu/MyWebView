//
//  UpdateModel.h
//  MyWebview
//
//  Created by TaebuAir on 2015. 3. 7..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpdateModel : NSObject

@property (nonatomic,strong) NSString *deviceIdentifier;
@property (nonatomic,strong) NSString *message;
@property (nonatomic,strong) NSNumber *latitude;
@property (nonatomic,strong) NSNumber *longitude;

@property (nonatomic,assign, getter=isAutoUpdate) BOOL autoUpdate;

- (void) updateToServer;

@end
