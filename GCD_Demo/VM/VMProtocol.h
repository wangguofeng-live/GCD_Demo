//
//  VMProtocol.h
//  GCD_Demo
//
//  Created by bdkj on 2018/1/2.
//  Copyright © 2018年 bdkj_wangguofeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VMProtocol <NSObject>

@property (nonatomic,readonly)NSString *vmTitle;

- (void)testVM;

@end
