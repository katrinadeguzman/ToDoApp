//
//  ViewController.h
//  EveryDo
//
//  Created by Katrina de Guzman on 2017-06-14.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoDetails.h"

@interface ViewController : UITableViewController <ToDoDetailsViewControllerDelegate>
@property(nonatomic, strong) NSMutableArray* tasks;

@end
