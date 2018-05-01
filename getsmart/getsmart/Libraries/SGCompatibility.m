//
//  SGCompatibility.m
//  getsmart
//
//  Created by cable8mm on 2015. 8. 31..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import "SGCompatibility.h"

@implementation SGCompatibility
+(void) alert:(NSString*)title message:(NSString*)message vc:()vc {
    if (NSClassFromString(@"UIAlertController")) {
        UIAlertController * alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction
                                     actionWithTitle:@"확인"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction *action) {
                                         // 취소버튼 클릭시 하고싶은거 coding
                                     }];
        [alertController addAction:doneAction];
        [vc presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"확인", nil] show];
}
@end
