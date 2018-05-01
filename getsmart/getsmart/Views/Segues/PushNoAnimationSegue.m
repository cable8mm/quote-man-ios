//
//  PushNoAnimationSegue.m
//  getsmart
//
//  Created by cable8mm on 2015. 5. 26..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue
-(void) perform{
    [[[self sourceViewController] navigationController] pushViewController:[self   destinationViewController] animated:NO];
}
@end
