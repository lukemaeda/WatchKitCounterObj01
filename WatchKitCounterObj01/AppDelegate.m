//
//  AppDelegate.m
//  WatchKitCounterObj01
//
//  Created by MAEDAHAJIME on 2015/04/20.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSMutableArray *tempCounterData;
@end

@implementation AppDelegate

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply {
    
    NSString *counterValue = [userInfo objectForKey:@"counterValue"];
    
    // インスタンスの生成 key:"response" value（値）:counterValue
    NSDictionary *replyDict = @{@"response": counterValue};
    
    // counter値をWatchKit App に返す
    reply(replyDict);
    
    // テーブル配列（tempCounterData）のカウントデータが0ならば
    if (!self.tempCounterData) {
        // テーブル配列（tempCounterData）の生成
        self.tempCounterData = [[NSMutableArray alloc] init];
    }
    
    // カウントデータを配列に追加
    [self.tempCounterData addObject:counterValue];
    
    // 新しいカウント値を追加し、TableViewをリロードする
    AppDelegate *tmpDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // ViewControllerとDelegateとの接続
    ViewController *vc = (ViewController *)((UINavigationController*)tmpDelegate.window.rootViewController).visibleViewController;
    
    // ViewControllerのcounterDataにテーブル配列（tempCounterData）を転送
    vc.counterData = self.tempCounterData;
    // 配列操作のあとは、Table Viewをリロード
    [vc.mainTableView reloadData];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

@end

