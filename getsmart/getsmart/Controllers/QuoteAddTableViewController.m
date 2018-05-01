//
//  NewQuoteTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 18..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#define SECTION_COUNT  5   // 헤더, 견적서 순서, 추가항목, 지불조건, 특이사항. 여기에 프로젝트를 추가하면 총 섹션 수가 됨.

#import "QuoteAddTableViewController.h"
#import "User.h"
#import "QuoteReceiverInfoTableViewController.h"
#import "QuoteSenderInfoTableViewController.h"
#import "QuoteValidPeriodListTableViewController.h"
#import "QuoteAddItemTableViewController.h"
#import "QuoteMemoViewController.h"
#import "QuoteGeneralTableViewController.h"
#import "Quotation.h"
#import "AppDelegate.h"

#import "FullViewCell.h"
#import "FullInputCell.h"
#import "AdditionItemCell.h"
#import "WhitePlusCell.h"
#import "RedPlusCell.h"
#import "FullInputSwitchCell.h"
#import "CommonMacros.h"

#import "ProjectItem.h"
#import "Project.h"

#import "IQuotation.h"
#import "IQuotationSender.h"
#import "IQuotationReceiver.h"
#import "IQuotationProject.h"
#import "IQuotationProjectItem.h"
#import "IQuotationAdditionItem.h"

#import "SGCompatibility.h"

typedef enum {
    kHeader,            // 헤더
    kProject,           // 프로젝트
    kProjectOrder,      // 프로젝트 순서
    kAddProject,        // 프로젝트 추가 버튼
    kAddition,          // 추가 항목
    kTermsOfPayment,    // 지불 조건
    kRemark             // 특이 사항
} SectionName;

typedef enum {
    kProjectTitle,            // 헤더
    kProjectItem,           // 프로젝트
    kProjectAddItem      // 프로젝트 순서
} ProjectItemName;

typedef enum {
    kProjectOrderList,   // 프로젝트 리스트
    kProjectOrderAdd     // 프로젝트 추가
} ProjectOrderName;

typedef enum {
    kProjectAdditionList,   // 프로젝트 리스트
    kProjectAdditionAdd     // 프로젝트 추가
} ProjectAdditionName;

@interface QuoteAddTableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *senderName;
@property (strong, nonatomic) IBOutlet UILabel *receiverName;
@property (strong, nonatomic) IBOutlet UILabel *validPeriodLabel;

@property (strong, nonatomic) IBOutlet UITextView *moreDetail;

@property (strong, nonatomic) IQuotation *iQuotation;
@property (strong, nonatomic) NSString *moreDetailString;
@property (nonatomic) NSUInteger totalSectionCount;

- (IBAction)close:(id)sender;
- (IBAction)save:(id)sender;

@end

@implementation QuoteAddTableViewController

#pragma Setters

- (NSUInteger) projectSection:(NSUInteger)section {
    return section - 1;   // 헤더가 있기 때문
}

- (NSUInteger) projectRow:(NSUInteger)row {
    return row - 1;   // 타이틀이 있기 때문
}

- (NSUInteger) totalSectionCount {
    NSUInteger projectCount = [self.iQuotation getProjectCount];
    return SECTION_COUNT+projectCount;
}

- (void)setMoreDetailString:(NSString *)moreDetailString {
    _moreDetailString   = moreDetailString;
    self.moreDetail.text = _moreDetailString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iQuotation = [[IQuotation alloc] initWithDefault];
    
    self.moreDetailString   = @"";

    NSMutableDictionary *aProjectItem   = [NSMutableDictionary dictionary];
    aProjectItem[@"project_description"]    = @"새로운 아이템";
    aProjectItem[@"quantity"]   = @10;
    aProjectItem[@"unit"]   = @"개";
    aProjectItem[@"row"]    = @0;
    
    NSMutableDictionary *aProject   = [NSMutableDictionary dictionary];
    aProject[@"title"]  = @"새로운 견적";
    aProject[@"project_items"]  = [NSMutableArray array];
    [aProject[@"project_items"] addObject:aProjectItem];
    
    NSMutableArray *projects    = [NSMutableArray array];
    [projects addObject:aProject];
    
    [self.iQuotation.sender importFromUser];
    
    self.tableView.editing  = YES;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.section == 1 && indexPath.row == 0) || (indexPath.section == 2 && indexPath.row == 0)) {
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.receiverName.text  = StringOrEmpty(self.quotation.receiver_name);
    self.validPeriodLabel.text  = [NSString stringWithFormat:@"견적일로 부터 %@일", self.quotation.validity];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.totalSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self isSame:section with:kHeader]) {   // 헤더
        return 3;
    }
    
    if ([self isSame:section with:kProject]) {   // 프로젝트
        NSUInteger aProjectSection = [self projectSection:section];
        IQuotationProject *iQuotationProject = [self.iQuotation getProject:aProjectSection];
        return [iQuotationProject getItemCount]+2;   // 제목과 추가 버튼
    }

    if ([self isSame:section with:kProjectOrder]) {   // 프로젝트 순서
        return [self.iQuotation getProjectCount]+1;
    }
    
    if ([self isSame:section with:kAddition]) {   // 추가 항목
        return [self.iQuotation getAdditionItemCount]+1;
    }

    if ([self isSame:section with:kTermsOfPayment]) {   // 지불 조건
        return 3;
    }

    if ([self isSame:section with:kRemark]) {
        return 1;
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...    
    if ([self isSame:indexPath.section with:kHeader]) {
        switch (indexPath.row) {
            case 0:
            {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicRightCell" forIndexPath:indexPath];
                cell.textLabel.text = @"수신자 정보";
                cell.detailTextLabel.text   = StringOrEmpty(self.iQuotation.receiver.receiver_name);
                return cell;
            }
                break;
            case 1:
            {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicRightCell" forIndexPath:indexPath];
                cell.textLabel.text = @"발송자 정보";
                cell.detailTextLabel.text   =  StringOrEmpty(self.iQuotation.sender.sender_name);
                return cell;
            }
                break;
            case 2:
            {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicRightCell" forIndexPath:indexPath];
                cell.textLabel.text = @"견적 유효 기간";
                cell.detailTextLabel.text   = [NSString stringWithFormat:@"견적일로 부터 %@일", self.iQuotation.validity];
                return cell;
            }
                break;
            default:
                break;
        }
    }
    
    if ([self isSame:indexPath.section with:kProject]) {
        NSUInteger aProjectSection = [self projectSection:indexPath.section];
        IQuotationProject *iQuotationProject = self.iQuotation.projects[aProjectSection];
        
        if ([self isProjectSame:indexPath with:kProjectTitle]) {
            FullInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FullInputCell" forIndexPath:indexPath];
            cell.textField.placeholder  = @"견적 제목";
            cell.textField.text         = StringOrEmpty(iQuotationProject.title);
            cell.accessoryType  = UITableViewCellAccessoryDetailButton;
            return cell;
        }

        if ([self isProjectSame:indexPath with:kProjectItem]) {
            NSUInteger aProjectItemRow = [self projectRow:indexPath.row];
            IQuotationProjectItem *aProjectItem = [iQuotationProject getProjectItem:aProjectItemRow];

            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectItemCell" forIndexPath:indexPath];
            cell.textLabel.text = StringOrEmpty(aProjectItem.product_description);
            cell.detailTextLabel.text   = [NSString stringWithFormat:@"%@%@", aProjectItem.quantity, aProjectItem.unit];
            return cell;
        }

        if ([self isProjectSame:indexPath with:kProjectAddItem]) {
            WhitePlusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WhitePlusCell" forIndexPath:indexPath];
            return cell;
        }

//        if (0 < indexPath.row && indexPath.row <= [aProject[@"project_items"] count]) {
//            int aProjectItemRow = (int)indexPath.row - 1;
//            NSMutableDictionary *aProjectItem = aProject[@"project_items"][aProjectItemRow];
//            
//            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectItemCell" forIndexPath:indexPath];
//            cell.textLabel.text = StringOrEmpty(aProjectItem[@"project_description"]);
//            cell.detailTextLabel.text   = [NSString stringWithFormat:@"%@%@", aProjectItem[@"quantity"], aProjectItem[@"unit"]];
//            return cell;
//        }
//        
//        if (indexPath.row == [aProject[@"project_items"] count] + 1) {
//            WhitePlusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WhitePlusCell" forIndexPath:indexPath];
//            return cell;
//        }
    }

    if ([self isSame:indexPath.section with:kProjectOrder]) {
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RedPlusCell" forIndexPath:indexPath];
            return cell;
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
            NSString *projectTitle  = [self.iQuotation getProjectTitle:indexPath.row];
            cell.textLabel.text = projectTitle;
            return cell;
        }
    }
    
    if ([self isSame:indexPath.section with:kAddProject]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RedPlusCell" forIndexPath:indexPath];
        return cell;
    }
    
    if ([self isSame:indexPath.section with:kAddition]) {
        if ([self isProjectAdditionSame:indexPath with:kProjectAdditionList]) {
            IQuotationAdditionItem *aIQuotationAdditionItem = [self.iQuotation getAdditionItem:indexPath.row];
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicRightCell" forIndexPath:indexPath];
            cell.textLabel.text = aIQuotationAdditionItem.title;
            cell.detailTextLabel.text   = [aIQuotationAdditionItem.price stringValue];
            return cell;
        }
        
        if ([self isProjectAdditionSame:indexPath with:kProjectAdditionAdd]) {
            WhitePlusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WhitePlusCell" forIndexPath:indexPath];
            return cell;
        }
//        if (indexPath.row == 0) {
//            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicRightCell" forIndexPath:indexPath];
//            cell.textLabel.text = @"재경비";
//            cell.detailTextLabel.text   = @"100000";
//            return cell;
//        }
//        if (indexPath.row == 1) {
//            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicRightCell" forIndexPath:indexPath];
//            cell.textLabel.text = @"할인";
//            cell.detailTextLabel.text   = @"-100000";
//            return cell;
//        }
//        if (indexPath.row == 2) {
//            WhitePlusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WhitePlusCell" forIndexPath:indexPath];
//            return cell;
//        }
    }

    if ([self isSame:indexPath.section with:kTermsOfPayment]) {
        if (indexPath.row == 0) {
            AdditionItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdditionItemCell" forIndexPath:indexPath];
            cell.titleLabel.text  = @"계약금";
            return cell;
        }
        if (indexPath.row == 1) {
            AdditionItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdditionItemCell" forIndexPath:indexPath];
            cell.titleLabel.text  = @"중도금";
            return cell;
        }
        if (indexPath.row == 2) {
            AdditionItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdditionItemCell" forIndexPath:indexPath];
            cell.titleLabel.text  = @"잔금";
            return cell;
        }
    }
    
    if ([self isSame:indexPath.section with:kRemark]) {
        FullViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FullViewCell" forIndexPath:indexPath];
        cell.textView.text   = self.iQuotation.remark;
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicRightCell" forIndexPath:indexPath];
    cell.textLabel.text = @"이 셀은 정의되지 않음";
    return cell;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return YES;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
//    if ([self isSame:sourceIndexPath.section with:kProject]) {
        if (sourceIndexPath.section != proposedDestinationIndexPath.section) {
            NSInteger row = 1;
            if (sourceIndexPath.section < proposedDestinationIndexPath.section) {
                row = [tableView numberOfRowsInSection:sourceIndexPath.section] - 2;
            }
            return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
        }
//        if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
//            // 아이템 섹션의 경우 0과 마지막 row에는 가면 안됨.
//            NSInteger row = 1;
//            // 원래 row가 목적 row보다 밑에 있으면
//            if (proposedDestinationIndexPath.row == [tableView numberOfRowsInSection:sourceIndexPath.section] - 1) {
//                row = [tableView numberOfRowsInSection:sourceIndexPath.section] - 2;
//                return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
//            }
//            if (proposedDestinationIndexPath.row == 0) {
//                row = 1;
//                return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
//            }
//            return proposedDestinationIndexPath;
//        }
//    }
//    
//    if ([self isSame:sourceIndexPath.section with:kAddition]) {
//        if (sourceIndexPath.section != proposedDestinationIndexPath.section) {
//            NSInteger row = 0;
//            if (sourceIndexPath.section < proposedDestinationIndexPath.section) {
//                row = [tableView numberOfRowsInSection:sourceIndexPath.section] - 2;
//            }
//            return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
//        }
//        if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
//            // 아이템 섹션의 경우 0과 마지막 row에는 가면 안됨.
//            NSInteger row = 1;
//            // 원래 row가 목적 row보다 밑에 있으면
//            if (proposedDestinationIndexPath.row == [tableView numberOfRowsInSection:sourceIndexPath.section] - 1) {
//                row = [tableView numberOfRowsInSection:sourceIndexPath.section] - 2;
//                return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
//            }
//            return proposedDestinationIndexPath;
//        }
//    }
    
    return sourceIndexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isSame:indexPath.section with:kHeader]) {
        switch (indexPath.row) {
            case 0: // 수신자 정보
            {
                [self performSegueWithIdentifier:@"showReceiverInfo" sender:self];
                return;
            }
                break;
            case 1: // 발송자 정보
            {
                [self performSegueWithIdentifier:@"showSenderInfo" sender:self];
                return;
            }
                break;
            case 2: // 견적 유효 기간
            {
                [self performSegueWithIdentifier:@"showValidPeriods" sender:self];
                return;
            }
                break;
            default:
            {
                NSAssert(NO, @"QuoteAddTableViewController didSelectRowAtIndexPath");
            }
                break;
        }
    }
    
    // 항목 추가
    if ([self isProjectSame:indexPath with:kProjectAddItem]) {
        NSUInteger projectSection   = [self projectSection:indexPath.section];
        [self.iQuotation addProjectItem:projectSection];
        NSArray *paths = [NSArray arrayWithObject:indexPath];
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationRight];
        [self.tableView endUpdates];
    }
    
    // 견적 추가
    if ([self isProjectOrderSame:indexPath with:kProjectOrderAdd]) {
        [self.iQuotation addProject];
        [self.tableView reloadData];
        //        [self.tableView insertSections:[NSIndexSet indexSetWithIndex:self.totalSectionCount-1] withRowAnimation:UITableViewRowAnimationTop];
    }
    
    if ([self isSame:indexPath.section with:kAddition]) {
        if (indexPath.row < [tableView numberOfRowsInSection:indexPath.section] - 1) {
            [self performSegueWithIdentifier:@"showAddition" sender:self];
        }
    }
    
    // 추가 항목 추가
    if ([self isProjectAdditionSame:indexPath with:kProjectAdditionAdd]) {
        [self.iQuotation addAdditionItem];
        [self.tableView reloadData];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([self isSame:section with:kProjectOrder]) {
        return @"견적 순서";
    }
    if ([self isSame:section with:kAddition]) {
        return @"추가 항목";
    }
    if ([self isSame:section with:kTermsOfPayment]) {
        return @"지불 조건";
    }
    if ([self isSame:section with:kRemark]) {
        return @"특기 사항";
    }
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if ([self isSame:section with:kProject]) {
        return @"예를 들어서 명함과 로고의 견적이라면 '명함', '로고' 두 개의 프로젝트를 만드세요.";
    }
    if ([self isSame:section with:kAddition]) {
        return @"재경비, 일반관리비, 이윤, 할인 등을 추가하세요.";
    }
    if ([self isSame:section with:kTermsOfPayment]) {
        return @"지불 조건 : 지불 조건은 계약금 50%, 잔금 50% 입니다.";
    }
    if ([self isSame:section with:kRemark]) {
        return @"견적에 관한 추가 내용을 적어 주세요. 적지 않아도 무방합니다.";
    }
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isSame:indexPath.section with:kRemark]) {
        return 160.;
    }
    
    return 44.0;
}

- (BOOL) isProjectAdditionSame:(NSIndexPath*)indexPath with:(ProjectAdditionName)aProjectAddition {
    if ([self isSame:indexPath.section with:kAddition]) {
        NSUInteger projectAdditionCount   = [self.iQuotation getProjectAdditionCount];
        if (aProjectAddition == kProjectAdditionList && indexPath.row < projectAdditionCount) {
            return YES;
        }
        if (aProjectAddition == kProjectAdditionAdd && indexPath.row == projectAdditionCount) {
            return YES;
        }
        return NO;
    }
    return NO;
}

- (BOOL) isProjectOrderSame:(NSIndexPath*)indexPath with:(ProjectOrderName)aProjectOrder {
    if ([self isSame:indexPath.section with:kProjectOrder]) {
        NSUInteger projectCount   = [self.iQuotation getProjectCount];
        if (aProjectOrder == kProjectOrderList && indexPath.row < projectCount) {
            NSLog(@"kProjectOrderList");
            return YES;
        }
        if (aProjectOrder == kProjectOrderAdd && indexPath.row == projectCount) {
            NSLog(@"kProjectOrderAdd");
            return YES;
        }
        return NO;
    }
    return NO;
}

- (BOOL) isProjectSame:(NSIndexPath*)indexPath with:(ProjectItemName)aProjectItem {
    if ([self isSame:indexPath.section with:kProject]) {
        NSUInteger projectSection = [self projectSection:indexPath.section];
        IQuotationProject *aProject   = self.iQuotation.projects[projectSection];
        NSUInteger projectItemCount = [aProject.projectItems count];
        if (aProjectItem == kProjectTitle && indexPath.row == 0) {
            return YES;
        }
        if (aProjectItem == kProjectItem && 0 < indexPath.row && indexPath.row < projectItemCount + 1) {
            return YES;
        }
        if (aProjectItem == kProjectAddItem && indexPath.row == projectItemCount+1) {
            return YES;
        }
        return NO;
    }
    return NO;
}

- (BOOL) isSame:(NSInteger)section with:(SectionName)aSection {
    if (aSection == kHeader && section == 0) {
        return YES;
    }
    
    if (aSection == kProject && section > 0 && section < self.totalSectionCount - 4) {
        return YES;
    }

    if (aSection == kProjectOrder && section == self.totalSectionCount - 4) {
        return YES;
    }

//    if (aSection == kAddProject && section == self.totalSectionCount - 4) {
//        return YES;
//    }
    
    if (aSection == kAddition && section == self.totalSectionCount - 3) {
        return YES;
    }
    
    if (aSection == kTermsOfPayment && section == self.totalSectionCount - 2) {
        return YES;
    }
    
    if (aSection == kRemark && section == self.totalSectionCount - 1) {
        return YES;
    }
    
    return NO;
}

// Override to support conditional editing of the table view.

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isSame:indexPath.section with:kProject]) {
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            return UITableViewCellEditingStyleInsert;
        } else {
            return UITableViewCellEditingStyleDelete;
        }
    }
    
    if ([self isSame:indexPath.section with:kAddition]) {
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            return UITableViewCellEditingStyleInsert;
        } else {
            return UITableViewCellEditingStyleDelete;
        }
    }
    
    if ([self isSame:indexPath.section with:kProjectOrder]) {
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            return UITableViewCellEditingStyleInsert;
        } else {
            return UITableViewCellEditingStyleDelete;
        }
    }
    
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isSame:indexPath.section with:kHeader]) {
        return NO;
    }

    if ([self isSame:indexPath.section with:kProject]) {
        if (indexPath.row == 0) {
            return NO;
        }
        return YES;
    }

    if ([self isSame:indexPath.section with:kAddition]) {
        return YES;
    }

    if ([self isSame:indexPath.section with:kProjectOrder]) {
        return YES;
    }

    if ([self isSame:indexPath.section with:kTermsOfPayment]) {
        return NO;
    }
    
    if ([self isSame:indexPath.section with:kRemark]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isSame:indexPath.section with:kAddition]) {
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
            return NO;
        }
        return YES;
    }
    
    if ([self isProjectSame:indexPath with:kProjectItem]) {
        return YES;
    }
    
    if ([self isProjectOrderSame:indexPath with:kProjectOrderList]) {
        return YES;
    }
    
    return NO;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
}

- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection {
    
}

//- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}
//
//- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

//- (BOOL)tableView:(UITableView *)tableview canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self isSame:indexPath.section with:kAddProject]) {
//        return YES;
//    }
//
//    return NO;
//}

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showReceiverInfo"]) {
        QuoteReceiverInfoTableViewController *vc = [segue destinationViewController];
        vc.iQuotationReceiver = self.iQuotation.receiver;
    }
    
    if ([[segue identifier] isEqualToString:@"showSenderInfo"]) {
        QuoteSenderInfoTableViewController *vc  = [segue destinationViewController];
        vc.iQuotationSender   = self.iQuotation.sender;
    }

    if ([[segue identifier] isEqualToString:@"showValidPeriods"]) {
        QuoteValidPeriodListTableViewController *vc  = [segue destinationViewController];
        vc.iQuotation   = self.iQuotation;
    }

    if ([[segue identifier] isEqualToString:@"showItem"]) {
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSUInteger projectRow   = [self projectSection:indexPath.section];
        NSUInteger projectItemRow   = [self projectRow:indexPath.row];
        QuoteAddItemTableViewController *vc  = [segue destinationViewController];
        IQuotationProject *iQuotationProject = [self.iQuotation getProject:projectRow];
        vc.iQuotationProjectItem   = [iQuotationProject getProjectItem:projectItemRow];
    }

    if ([[segue identifier] isEqualToString:@"showAddition"]) {
        QuoteGeneralTableViewController *vc  = [segue destinationViewController];
        //        vc.delegate   = self;
    }
    
    if ([[segue identifier] isEqualToString:@"showQuoteMemo"]) {
        UINavigationController *nc = [segue destinationViewController];
        QuoteMemoViewController *vc = (QuoteMemoViewController*)nc.topViewController;
        vc.delegate = self;
    }

    if ([[segue identifier] isEqualToString:@"showGeneral1"]) {
        QuoteGeneralTableViewController *vc = [segue destinationViewController];
        vc.delegate = self;
        vc.key  = 0;
    }
    if ([[segue identifier] isEqualToString:@"showGeneral2"]) {
        QuoteGeneralTableViewController *vc = [segue destinationViewController];
        vc.delegate = self;
        vc.key  = 1;
    }
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    // validate
    IQuotationValidateCode code = [self.iQuotation validate];
    
    if (code == kIQuotationValidateCodeOK) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
 
    if (code == kIQuotationValidateCodeReceiverRequired) {
        [SGCompatibility alert:@"오류" message:@"수신자 정보를 넣어주세요." vc:self];
    }

    if (code == kIQuotationValidateCodeSenderRequired) {
        [SGCompatibility alert:@"오류" message:@"발송자 정보를 넣어주세요." vc:self];
    }
}
@end
