//
//  ToDo.h
//  EveryDo
//
//  Created by Katrina de Guzman on 2017-06-14.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, copy) NSString* toDoName;
@property (nonatomic, copy) NSString* toDoDescription;
@property (nonatomic, assign) BOOL isCompleted;


@end
