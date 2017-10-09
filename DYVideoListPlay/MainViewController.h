//
//  ViewController.h
//  DYVideoListPlay
//
//  Created by huyangyang on 2017/9/23.
//  Copyright © 2017年 huyangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoInfoModel.h"
@interface MainViewController : UIViewController

@property (nonatomic, strong) VideoInfoModel *live;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, assign) NSInteger index;

@end

