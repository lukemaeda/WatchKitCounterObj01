//
//  ViewController.h
//  WatchKitCounterObj01
//
//  Created by MAEDAHAJIME on 2015/04/20.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

// 配列 カウントデータ
@property (strong, nonatomic) NSMutableArray *counterData;

// TableView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end


