//
//  CommonMacros.h
//  getsmart
//
//  Created by cable8mm on 2015. 7. 18..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#ifndef getsmart_CommonMacros_h
#define getsmart_CommonMacros_h

#if !defined(StringOrEmpty)
#define StringOrEmpty(A)  ({ __typeof__(A) __a = (A); __a ? __a : @""; })
#endif

#if !defined(NSStringIsNullOrEmpty)
#define NSStringIsNullOrEmpty(str) ({ NSString *_str=(str); ((_str==nil) || [_str isEqualToString:@""]);})
#endif

#endif
