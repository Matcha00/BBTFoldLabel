//
//  BBTFoldLabelConfig.h
//  BBTFoldLabel
//
//  Created by Matcha00 on 2020/1/8.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BBTFoldLabelStyle) {
    BBTFoldLabelStyleCut = 0,                       //!<    最后一行样式为最多5个字符拼接...
    BBTFoldLabelStyleNoCut                          //!<   返回最后一行所有字数
};
