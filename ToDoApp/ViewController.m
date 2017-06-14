#import "ViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoCell *cell = (ToDoCell *)[tableView dequeueReusableCellWithIdentifier:@"ToDoCell"];
    
    ToDo *task = (self.tasks)[indexPath.row];
    cell.descriptionLabel.text = task.toDoDescription;
    
    if(task.isCompleted == NO)
    {
        cell.nameLabel.text = task.toDoName;
    }
    else{
        NSString* strike = [[NSString alloc]initWithString:task.toDoName];
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:strike];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@1
                                range:NSMakeRange(0, [attributeString length])];
        cell.nameLabel.attributedText = attributeString;
        
    }
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if (indexPath.section == 0) {
            [self.tasks removeObjectAtIndex:indexPath.row];
        }
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - ToDoDetailsViewControllerDelegate

- (void)toDoDetailsViewControllerDidCancel:(ToDoDetails *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)toDoDetailsViewControllerDidSave:(ToDoDetails *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddToDo"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        ToDoDetails *toDoDetailsViewController = [navigationController viewControllers][0];
        toDoDetailsViewController.delegate = self;
    }
}
- (void)toDoDetailsViewController:(ToDoDetails *)controller didAddToDo:(ToDo *)task
{
    [self.tasks addObject:task];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.tasks count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
