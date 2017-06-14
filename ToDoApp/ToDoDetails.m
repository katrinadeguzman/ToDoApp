//
//  ToDoDetails.m
//  EveryDo
//
//  Created by Katrina de Guzman on 2017-06-14.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//


#import "ToDoDetails.h"
#import "ToDo.h"

@interface ToDoDetails ()

@end

@implementation ToDoDetails

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate toDoDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    ToDo *toDo = [[ToDo alloc] init];
    toDo.toDoName = self.nameTextField.text;
    toDo.toDoDescription = self.descriptionTextField.text;
    [self.delegate toDoDetailsViewController:self didAddToDo:toDo];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        [self.nameTextField becomeFirstResponder];
    }
    if (indexPath.section == 1)
    {
        [self.descriptionTextField becomeFirstResponder];
    }
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        NSLog(@"init ToDoDetailsViewController");
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc ToDoDetailsViewController");
}
@end
