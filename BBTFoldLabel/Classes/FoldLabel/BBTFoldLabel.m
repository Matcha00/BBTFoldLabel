//
//  BBTFoldLabel.m
//  BBTFoldLabel
//
//  Created by Matcha00 on 2019/10/31.
//

#import "BBTFoldLabel.h"
#import <YYText.h>
#import "NSAttributedString+BBTFoldLabel.h"
@implementation BBTFoldLabel

#pragma mark - Init Methods

- (void)dealloc {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark - Properties
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = BBTFont_Regular(15);
        _contentLabel.textColor = WKC_HEXRGBCOLOR(0x444444);
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return _contentLabel;
}
- (UIButton *)foldButton {
    if (!_foldButton) {
        _foldButton = [[UIButton alloc]init];
        [_foldButton addTarget:self action:@selector(foldButtonClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_foldButton setTitleColor:WKC_HEXRGBCOLOR(0x805040) forState:UIControlStateNormal];
        _foldButton.titleLabel.font = BBTFont_Regular(15);
        [_foldButton sizeToFit];
        [self addSubview:_foldButton];
    }
    return _foldButton;
}
#pragma mark - Layout Subviews
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self bringSubviewToFront:self.foldButton];
    self.contentLabel.width = self.width;
}
#pragma mark - Public Methods
/** 设置内容. */
- (void)setContentString:(NSString *)contentString {
    _contentString = contentString;
    [self updateContentString:contentString];
    [self.foldButton setNeedsLayout];
}
+ (CGFloat)getFoldLabelHeightAttributedString:(NSAttributedString *)attributedString foldLineNum:(NSInteger)foldLineNum contentWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, MAXFLOAT);
    CGFloat height = 0;
    NSInteger numberOfLines = 0;
    CGRect rect = [attributedString attributedSubstringBoundingRectWithSize:size maxNumberOfLines:foldLineNum numberOfLines:&numberOfLines];
    height += rect.size.height;
    return height;
}
#pragma mark - Private Methods
- (void)foldButtonClickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.unfold = sender.selected;
    [self updateContentString:self.contentString];
}

/** 设置内容内边距 */
- (void)setContenetLabelEdgeInsets:(UIEdgeInsets *)contenetLabelEdgeInsets {
    _contenetLabelEdgeInsets = contenetLabelEdgeInsets;
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(contenetLabelEdgeInsets);
    }];
    [self updateContentString:self.contentString];
}


/** 更新展开与否文字. */
- (void)updateContentString:(NSString *)contentString {
    if (!self.unfold) {
        self.contentLabel.numberOfLines = self.foldLineNum;
        [self setFoldStringWithNumberOfLines:self.foldLineNum];
    }else {
        self.contentLabel.numberOfLines = 0;
        if ([contentString isKindOfClass:[NSAttributedString class]]) {
            self.contentLabel.attributedText = (NSAttributedString *)contentString;
        }else {
            self.contentLabel.attributedText = [self contentAttributedString:contentString];
        }
        [self.contentLabel sizeToFit];
    }
}
/** 设置折叠行文字. */
- (void)setFoldStringWithNumberOfLines:(NSInteger)foldLineNum {
    CGSize size = CGSizeMake(self.contentWidth, MAXFLOAT);
    NSInteger numberOfLines = 0;
    if ([self.contentString isKindOfClass:[NSAttributedString class]]) {
        self.contentLabel.attributedText = [self.contentString attributedSubstringWithBoundingSize:size maxNumberOfLines:foldLineNum numberOfLines:&numberOfLines];
    }else {
        self.contentLabel.attributedText = [[self contentAttributedString:self.contentString] attributedSubstringWithBoundingSize:size maxNumberOfLines:foldLineNum numberOfLines:&numberOfLines];
    }
    [self.contentLabel sizeToFit];
    if (numberOfLines > foldLineNum) {
        self.foldButton.hidden = NO;
    }else {
        self.foldButton.hidden = YES;
    }
}
- (NSAttributedString *)contentAttributedString:(NSString *)originStr {
    if (originStr == nil) {return [[NSAttributedString alloc] initWithString:@""];}
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:originStr];
    attributedText.yy_font = self.contentLabel.font;
    attributedText.yy_color = self.contentLabel.textColor;
    return attributedText;
}
#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Helper Methods


@end

