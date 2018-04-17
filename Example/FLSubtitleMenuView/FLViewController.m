//
//  FLViewController.m
//  FLSubtitleMenuView
//
//  Created by liao0322 on 04/17/2018.
//  Copyright (c) 2018 liao0322. All rights reserved.
//

#import "FLViewController.h"
#import "FLTagSelectDropDownView.h"
#import "FLSubtitleMenuView.h"
#import "FLSubtitleModel.h"


@interface FLViewController ()

@end

@implementation FLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    FLSubtitleModel *model1 = [FLSubtitleModel modelWithSubtitle:@"今日" imageName:nil];
    FLSubtitleModel *model2 = [FLSubtitleModel modelWithSubtitle:@"近7天" imageName:nil];
    FLSubtitleModel *model3 = [FLSubtitleModel modelWithSubtitle:@"近30天" imageName:nil];
    FLSubtitleModel *model4 = [FLSubtitleModel modelWithSubtitle:nil imageName:@"sort_choose"];
    
    FLSubtitleMenuView *menuView = [[FLSubtitleMenuView alloc] initWithSubtitles:@[model1, model2, model3, model4]];
    menuView.frame = CGRectMake(0, 60, CGRectGetWidth(self.view.frame), 40);
    [menuView setTopSeparatorLineHidden:YES];
    menuView.buttonClickedBlock = ^(NSString *text) {
        NSLog(@"%@", text);
        
    };
    
    [self.view addSubview:menuView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
