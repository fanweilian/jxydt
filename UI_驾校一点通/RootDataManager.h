//
//  RootDataManager.h
//  UI_驾校一点通
//
//  Created by fanweilian on 15/10/1.
//  Copyright (c) 2015年 凡为连. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootDataManager : NSObject
+(instancetype)sharedManager;
-(NSArray*)allMainDataModels;
-(NSArray *)detailModelsForPid:(NSString *)pid;
-(NSArray *)detailMOdelsforSid:(NSString *)sid;

@end
