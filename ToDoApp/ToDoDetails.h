//
//  ToDoDetails.h
//  EveryDo
//
//  Created by Katrina de Guzman on 2017-06-14.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//
#import <UIKit/UIKit.h>

@class ToDoDetails;

@class ToDo;

@protocol ToDoDetailsViewControllerDelegate <NSObject>
- (void)toDoDetailsViewControllerDidCancel:(ToDoDetails *)controller;
- (void)toDoDetailsViewController:(ToDoDetails *)controller didAddToDo:(ToDo *)task;
@end
@interface ToDoDetails : UITableViewController

@property (nonatomic, weak) id <ToDoDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end
