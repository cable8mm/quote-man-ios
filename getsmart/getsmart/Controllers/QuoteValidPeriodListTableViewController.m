//
//  QuoteValidPeriodListTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteValidPeriodListTableViewController.h"

@interface QuoteValidPeriodListTableViewController ()
@property (nonatomic, strong) NSArray *validPeriods;
@property (nonatomic) int selectKey;
@end

@implementation QuoteValidPeriodListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.validPeriods   = @[@1, @7, @14, @15, @30, @60, @90, @180];
    
    int i;
    for (i=0; i < [self.validPeriods count]; i++) {
        NSNumber *day   = self.validPeriods[i];
        if ([self.iQuotation.validity isEqualToNumber:day]) {
            self.selectKey  = i;
            break;
        }
    }
    
    NSAssert(0 <= i && i < [self.validPeriods count], @"선택할 수 있는 기간이 존재하지 않음.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.validPeriods count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ValidPeriodCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSNumber *validPeriod   = self.validPeriods[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@일", validPeriod];
    cell.accessoryType  = self.selectKey == indexPath.row ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectKey  = (int)indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) setSelectKey:(int)selectKey {
    NSIndexPath *originPath = [NSIndexPath indexPathForRow:_selectKey inSection:0];
    [self.tableView cellForRowAtIndexPath:originPath].accessoryType = UITableViewCellAccessoryNone;
    _selectKey  = selectKey;
    self.iQuotation.validity   = self.validPeriods[selectKey];
    NSIndexPath *destPath = [NSIndexPath indexPathForRow:_selectKey inSection:0];
    [self.tableView cellForRowAtIndexPath:destPath].accessoryType = UITableViewCellAccessoryCheckmark;
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

@end
