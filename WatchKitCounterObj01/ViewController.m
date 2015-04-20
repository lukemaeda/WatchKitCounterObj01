//
//  ViewController.m
//  WatchKitCounterObj01
//
//  Created by MAEDAHAJIME on 2015/04/20.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Table Viewをリロード
    [self.mainTableView reloadData];
}

// テーブルのセルの数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // セルの数
    return self.counterData.count;
}

// 指定されたインデックスパスのセルを作成する
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // セルIdentifierを取得
    static NSString *cellIdentifier = @"CounterCell";
    // セルを参照
    UITableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Delegateからの配列カウントデータを取得
    NSString *counterValueString = [self.counterData objectAtIndex:indexPath.row];
    
    // テキストラベル　カウント数表示
    cell.textLabel.text = counterValueString;
    
    return cell;
}

@end

