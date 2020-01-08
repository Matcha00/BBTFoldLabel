//
//  BBTViewController.m
//  BBTFoldLabel
//
//  Created by Matcha00 on 10/31/2019.
//  Copyright (c) 2019 Matcha00. All rights reserved.
//

#import "BBTViewController.h"
#import <BBTFoldLabel.h>
#import <Masonry.h>
#import <NSAttributedString+BBTFoldLabel.h>
#import <NSAttributedString+YYText.h>
@interface BBTViewController ()

@end

@implementation BBTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BBTFoldLabel *foldLabel = [[BBTFoldLabel alloc]init];
    [foldLabel.foldButton setTitle:@"全文" forState:UIControlStateNormal];
    [foldLabel.foldButton setTitle:@"折叠" forState:UIControlStateSelected];
    foldLabel.foldLineNum = 5;
    foldLabel.unfold = NO;
    foldLabel.contentWidth = 200;
    foldLabel.foldLabelStyle = BBTFoldLabelStyleNoCut;
    foldLabel.contentString = @"作为妈妈，想为孩子选一件颜值与功能并存、既保暖又轻盈的羽绒服，讲究真的很多。\n  作为设计师，我想要尽力给孩子们更好的，想要孩子们能有更舒适的穿着体验。\n 一件小小的羽绒服，到底能付出多少创新和技术，到底能承载多少温暖和关爱？\n [95%鹅绒填充] \n 羽绒服，最重要的部分就是填充物，绒含量越高，越保暖。欧利娜利不满足于90%";
    [foldLabel.foldButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(31);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(foldLabel.contentLabel.mas_bottom);
        make.right.mas_equalTo(foldLabel.contentLabel.mas_right);
    }];
    [self.view addSubview:foldLabel];
    [foldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(200);
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(200);
    }];
    [self contentAttributedString:@"贷款将罚款登记后方可劳动法哈萨克老地方哈克贷款将罚款登记后合适的ido；解决激将法来看到了负担2打；‘打底裤一二三四五六七八九十十一解决激将法来看到了负担2打；‘打底裤一二三四五六七八九十十一"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSAttributedString *)contentAttributedString:(NSString *)originStr {
    if (originStr == nil) {return [[NSAttributedString alloc] initWithString:@""];}
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:originStr];
    attributedText.yy_font = [UIFont systemFontOfSize:15];
    attributedText.yy_color = [UIColor redColor];
    NSInteger numberOfLines = 0;
//    NSLog(@"%@", NSStringFromCGRect([attributedText attributedSubstringBoundingRectWithSize:CGSizeMake(200, MAXFLOAT) maxNumberOfLines:4 numberOfLines:&numberOfLines]));
    return attributedText;
}
@end
