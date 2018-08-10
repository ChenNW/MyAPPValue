//
//  ViewController.m
//  inAppValue2
//
//  Created by Cnw on 2018/7/24.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>
#define appId @"1151761409"
@interface ViewController ()<SKStoreProductViewControllerDelegate>

/**  */
@property(nonatomic ,strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:btn];
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self show];
    }];
    
}


-(void)dealloc
{
    [self.timer invalidate];
    
}
-(void)show{
    
//    ios10.0.3以后的方法
    
    if ([UIDevice currentDevice].systemVersion.floatValue >10.3 ) {
        
        [SKStoreReviewController requestReview];
        
    }else{
        
        NSLog(@"版本不支持");
        
    }
    
    
    
    
    //跳转到APP进行评分
    /**
    NSString * str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?action=write-review",appId];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:nil completionHandler:nil];
    */
    

/** 是在内部进行跳转评分
    SKStoreProductViewController * vc = [[SKStoreProductViewController alloc] init];
    vc.delegate = self;

    [self presentViewController:vc animated:YES completion:nil];
    [vc loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@"1151761409"} completionBlock:^(BOOL result, NSError * _Nullable error) {
        
        if (!error) {
            
            
            
        }
        
    }];
 
 */

}

-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    
    [viewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
