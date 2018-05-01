//
//  CorpInfoTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 23..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "SenderInfoTableViewController.h"
#import "User.h"

@interface SenderInfoTableViewController ()
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *tel;
@property (strong, nonatomic) IBOutlet UITextField *fax;
@property (strong, nonatomic) IBOutlet UITextField *name_of_company;
@property (strong, nonatomic) IBOutlet UITextField *cel;
@property (strong, nonatomic) IBOutlet UITextField *website;


- (IBAction)save:(id)sender;

@end

@implementation SenderInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.name.text = [User get:@"User.name"];
    self.tel.text = [User get:@"User.tel"];
    self.fax.text = [User get:@"User.fax"];
    self.name_of_company.text = [User get:@"User.name_of_company"];
    self.cel.text = [User get:@"User.cel"];
    self.website.text = [User get:@"User.website"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

- (IBAction)save:(id)sender {
    [User save:@"User.name" val:self.name.text];
    [User save:@"User.tel" val:self.tel.text];
    [User save:@"User.fax" val:self.fax.text];
    [User save:@"User.name_of_company" val:self.name_of_company.text];
    [User save:@"User.cel" val:self.cel.text];
    [User save:@"User.website" val:self.website.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
