//
//  RootDataManager.m
//  UI_驾校一点通
//
//  Created by fanweilian on 15/10/1.
//  Copyright (c) 2015年 凡为连. All rights reserved.
//

#import "RootDataManager.h"
#import "FMDatabase.h"
#import "RootDataModel.h"
#import "SecondDataModel.h"
#import "ThirdDataModel.h"
@interface RootDataManager ()
{

    FMDatabase *_database;
}

@end

@implementation RootDataManager


-(void)dealloc{

    [_database release];_database=nil;
    [super dealloc];
    
}
+(instancetype)sharedManager{
    static RootDataManager *manager=nil;
    if (manager==nil) {
        manager=[[self alloc]init];
        
    }
    return manager;
    
}
-(instancetype)init{
    if (self=[super init]) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite"];
        _database=[[FMDatabase alloc]initWithPath:path];
        
    }
    if (![_database open]) {
        NSLog(@"打开数据库失败:%@",[_database  lastErrorMessage]);
        
    }
    return  self;
    
}
-(NSArray *)allMainDataModels{
    NSString *selectSQL=@"select * from firstlevel";
    NSMutableArray *array=[NSMutableArray array];
    
    FMResultSet *set=[_database executeQuery:selectSQL];
    while ([set next]) {
        RootDataModel *model=[[RootDataModel alloc]init];
        model.pid=[set stringForColumn:@"pid"];
        model.pname=[set stringForColumn:@"pname"];
        [array addObject:model];
        [model release];
    }
    return array;
    
}

-(NSArray *)detailModelsForPid:(NSString *)pid{
    NSString *selectSQL=@"select sid,sname from secondlevel where pid=?";
    NSMutableArray *array=[NSMutableArray array];
    FMResultSet *set=[_database executeQuery:selectSQL,pid];
    while ([set next]) {
        SecondDataModel *modle=[[SecondDataModel alloc]init];
        modle.sid=[set stringForColumn:@"sid"];
        modle.sname=[set stringForColumn:@"sname"];
        [array addObject:modle];
        [modle release];
    }
    return array;
    
}
-(NSArray *)detailMOdelsforSid:(NSString *)sid{

    NSString *selectSQL=@"select serial, mquestion,mdesc,manswer,mimage,mtype from leaflevel where sid=?";
    NSMutableArray *array=[NSMutableArray array];
    FMResultSet *set=[_database executeQuery:selectSQL,sid];
    while ([set next]) {
        ThirdDataModel *model=[[ThirdDataModel alloc]init];
        model.mdesc=[set stringForColumn:@"mdesc"];
        model.serial=[set stringForColumn:@"serial"];
        model.mquestion=[set stringForColumn:@"mquestion"];
        model.manswer=[set stringForColumn:@"manswer"];
        model.mimage=[set stringForColumn:@"mimage"];
        model.mtype=[set stringForColumn:@"mtype"];
        [array addObject:model];
    
        
    }
    return  array;
}
@end
