//
//  QuoteNewItemTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 30..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteAddItemTableViewController.h"
#import "CommonMacros.h"
#import "IQuotationProjectItem.h"

@interface QuoteAddItemTableViewController ()

@property (strong, nonatomic) IBOutlet UITextField *tf_item_code;
@property (strong, nonatomic) IBOutlet UITextField *tf_product_description;
@property (strong, nonatomic) IBOutlet UITextField *tf_quantity;
@property (strong, nonatomic) IBOutlet UITextField *tf_unit;
@property (strong, nonatomic) IBOutlet UITextField *tf_unit_price;
@property (strong, nonatomic) IBOutlet UITextField *tf_remark;
@property (strong, nonatomic) IBOutlet UISwitch *s_is_vat;

- (IBAction)editUnit:(id)sender;

@end

@implementation QuoteAddItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tf_item_code.text  = StringOrEmpty(self.iQuotationProjectItem.item_code);
    self.tf_product_description.text    = StringOrEmpty(self.iQuotationProjectItem.product_description);
    self.tf_quantity.text   = [self.iQuotationProjectItem.quantity stringValue];
    self.tf_unit.text   = StringOrEmpty(self.iQuotationProjectItem.unit);
    self.tf_unit_price.text = [self.iQuotationProjectItem.unit_price stringValue];
    self.tf_remark.text = StringOrEmpty(self.iQuotationProjectItem.remark);
    self.s_is_vat.on  = self.iQuotationProjectItem.is_vat;
}

-(void) viewWillDisappear:(BOOL)animated
{
    self.iQuotationProjectItem.item_code    = self.tf_item_code.text;
    self.iQuotationProjectItem.product_description    = self.tf_product_description.text;
    self.iQuotationProjectItem.quantity    = @([self.tf_quantity.text intValue]);
    self.iQuotationProjectItem.unit    = self.tf_unit.text;
    self.iQuotationProjectItem.unit_price    = @([self.tf_unit_price.text intValue]);
    self.iQuotationProjectItem.remark    = self.tf_remark.text;
    self.iQuotationProjectItem.is_vat    = self.s_is_vat.isOn;

    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

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

- (IBAction)editUnit:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"개" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                              }];
    UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"월" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 // showNewContact
                                                             }];
    UIAlertAction* action3 = [UIAlertAction actionWithTitle:@"MM" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        // showNewContact
                                                    }];
    UIAlertAction* manualAction = [UIAlertAction actionWithTitle:@"직접 입력하기" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        // showNewContact
                                                    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {}];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:manualAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
