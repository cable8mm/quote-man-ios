//
//  QuoteListTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 5. 26..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteListTableViewController.h"
#import "AppDelegate.h"
#import "QuoteCell.h"

@interface QuoteListTableViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSArray *quotes;
@end

@implementation QuoteListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.quotes = @[@"모든 견적서", @"즐겨찾기"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    AppDelegate *appDelegate    = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext   = [appDelegate managedObjectContext];
    
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 74.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
//    return [self.quotes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *data = @[
                        @{@"title":@"CI 디자인, 간판 디자인"
                        ,@"receiver":@"(주)베리드 / 엄건영"
                        ,@"sent_datetime":@"2015.9.10 오후 2:31"
                        ,@"total_price":@"₩5,470,000"
                        ,@"status":@"작성 중"}
                        ,@{@"title":@"웹사이트 디자인"
                          ,@"receiver":@"(주)한국회관 / 이삼구"
                          ,@"sent_datetime":@"2015.9.7 오후 2:23"
                          ,@"total_price":@"₩2,000,000"
                          ,@"status":@"작성 중"}
                        ,@{@"title":@"명함 디자인, 명함 인쇄"
                           ,@"receiver":@"올레 모바일"
                           ,@"sent_datetime":@"2015.9.5 오후 5:12"
                           ,@"total_price":@"₩20,000"
                           ,@"status":@"작성 완료"}
                        ,@{@"title":@"어망 3m 100개"
                           ,@"receiver":@"해창어망 / 이긍철"
                           ,@"sent_datetime":@"2015.9.2 오전 10:56"
                           ,@"total_price":@"₩20,000"
                           ,@"status":@"작성 중"}
                        ,@{@"title":@"전단지 1000장, 명함 200장"
                          ,@"receiver":@"(주)베리드 / 엄건영"
                          ,@"sent_datetime":@"2015.9.9 오후 6:31"
                          ,@"total_price":@"₩150,000"
                          ,@"status":@"결제 요청 중"}
                        ,@{@"title":@"퍼즐 이벤트"
                           ,@"receiver":@"(주)정보통신진흥원 / 박상철"
                           ,@"sent_datetime":@"2015.9.7 오후 5:23"
                           ,@"total_price":@"₩500,000"
                           ,@"status":@"결제 완료"}
                        ,@{@"title":@"페이스북 이벤트"
                           ,@"receiver":@"(주)올레 모바일 / 김철호"
                           ,@"sent_datetime":@"2015.9.5 오후 2:12"
                           ,@"total_price":@"₩500,000"
                           ,@"status":@"결제 완료"}
                        ,@{@"title":@"어망 3m 100개"
                           ,@"receiver":@"해창어망 / 이긍철"
                           ,@"sent_datetime":@"2015.9.2 오전 10:56"
                           ,@"total_price":@"₩20,000"
                           ,@"status":@"결제 요청 중"}
                       ];
    QuoteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuoteCell" forIndexPath:indexPath];
    NSUInteger dataKey = indexPath.section * 4 + indexPath.row;
    NSDictionary *dicData = data[dataKey];
    cell.title.text  = dicData[@"title"];
    cell.receiver.text  = dicData[@"receiver"];
    cell.sent_datetime.text  = dicData[@"sent_datetime"];
    cell.total_price.text  = dicData[@"total_price"];
    cell.status.text  = dicData[@"status"];
//    cell.textLabel.text = @"To : 한국회관 (120-12-39283)";
//    cell.detailTextLabel.text = @"발송 전";
    
//    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    Client *client = (Client *)[self.fetchedResultsController objectAtIndexPath:indexPath];
//    cell.textLabel.text = client.name;
//    cell.detailTextLabel.text = client.name_of_company;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0 ? @"발송 전" : @"발송 완료";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    
    // Set up the fetched results controller if needed.
    if (_fetchedResultsController == nil) {
        // Create the fetch request for the entity.
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        // Edit the entity name as appropriate.
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Clients" inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        // Edit the sort key as appropriate.
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        
        [fetchRequest setSortDescriptors:sortDescriptors];
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"ClientList"];
        aFetchedResultsController.delegate = self;
        self.fetchedResultsController = aFetchedResultsController;
    }
    
    return _fetchedResultsController;
}

/**
 Delegate methods of NSFetchedResultsController to respond to additions, removals and so on.
 */
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    if (type == NSFetchedResultsChangeInsert) {
        [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    if (type == NSFetchedResultsChangeDelete) {
        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
    // The fetch controller has sent all current change notifications,
    // so tell the table view to process all updates.
    [self.tableView endUpdates];
}


@end
