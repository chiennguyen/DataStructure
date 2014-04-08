//
//  LinkList.h
//  DataStructure
//
//  Created by CHIEN NGUYEN on 4/8/14.
//  Copyright (c) 2014 CHIEN NGUYEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkList : NSObject


-(void)addBegin:(id)data;
-(void)addEnd:(id)data;
-(void)addAt:(int)location setData:(id)data;

-(BOOL)deleteNodeData:(id)data;
-(BOOL)deleteNodeAtLocation:(int)location;

-(void)reverseList;

-(int)count;

@end
