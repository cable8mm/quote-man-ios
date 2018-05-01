//
//  ClientDetailTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 7. 12..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "ClientDetailTableViewController.h"
#import "Client.h"

@interface ClientDetailTableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *name_of_company;

@property (strong, nonatomic) IBOutlet UILabel *tel;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UITextView *address;
@property (strong, nonatomic) IBOutlet UITextView *memo;

@end

@implementation ClientDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title  = self.client.name;
    self.name.text = self.client.name;
    self.name_of_company.text    = self.client.name_of_company;
    self.tel.text   = self.client.tel;
    self.address.text = self.client.address;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
