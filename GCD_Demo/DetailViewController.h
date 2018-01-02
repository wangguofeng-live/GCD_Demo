//
//  DetailViewController.h
//  GCD_Demo
//
//  Created by bdkj on 2018/1/2.
//  Copyright © 2018年 bdkj_wangguofeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMProtocol.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id<VMProtocol> viewModel;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

