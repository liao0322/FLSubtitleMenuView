//
//  UIViewController+Push.m
//  FengLei
//
//  Created by 惊蛰 on 17/6/14.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import "UIViewController+Push.h"

@implementation UIViewController (Push)
-(void)pushClass:(NSString *)cla
{
    Class class=NSClassFromString(cla);
    UIViewController *vc=[[class alloc]init];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
