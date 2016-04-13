//
//  TopScrollView.m
//  网易首页
//
//  Created by City--Online on 15/9/1.
//  Copyright (c) 2015年 City--Online. All rights reserved.
//

#import "TopScrollView.h"
#import "PDFUIFormatMacros.h"

@interface TopScrollView ()
{
    UIView *lineView;
    UIView *bottomLineView;
}
@end

@implementation TopScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andItems:(NSArray*)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        _selectedIndex = 0;
        int width = kWidthForLeft;
        _buttonArray = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < titleArray.count; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor clearColor];
            button.titleLabel.font = [UIFont systemFontOfSize:kTopButtonFont];
            if (i == _selectedIndex) {
                [button setTitleColor:PDFColorGreen forState:UIControlStateNormal];
            }
            else{
                [button setTitleColor:PDFColorTextDetailDefault forState:UIControlStateNormal];
            }
            NSString *title = [titleArray objectAtIndex:i];
            [button setTitle:title forState:UIControlStateNormal];
            button.tag = kButtonTagStart+i;
            //            CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:KTopButtonFont] constrainedToSize:CGSizeMake(MAXFLOAT, 30) lineBreakMode:NSLineBreakByWordWrapping];
            float titlewidth= kJIAN_GE_HEIGHT;//[self width:title heightOfFatherView:kJIAN_GE_HEIGHT textFont:[UIFont systemFontOfSize:kTopButtonFont]];
            
            
            button.frame = CGRectMake(width, 0, titlewidth, frame.size.height);
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [_buttonArray addObject:button];
            width += titlewidth/*+kJIAN_GE_HEIGHT*/;
            
        }
        self.contentSize = CGSizeMake(width, self.frame.size.height);
        self.showsHorizontalScrollIndicator = NO;
        
        bottomLineView=[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
//        bottomLineView.backgroundColor=YZPColorDividingLineOutdide;
//        bottomLineView.backgroundColor=[UIColor redColor];
        [self addSubview:bottomLineView];
        
        CGRect rc  = [self viewWithTag:_selectedIndex+kButtonTagStart].frame;
        lineView = [[UIView alloc]initWithFrame:CGRectMake(rc.origin.x, self.frame.size.height - 2, rc.size.width, 2)];
        lineView.backgroundColor = PDFColorGreen;
        [self addSubview:lineView];
    }
    return self;
    
    
    
}

-(void)onClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    if (_selectedIndex != btn.tag - kButtonTagStart)
    {
        [self selectIndex:(int)(btn.tag - kButtonTagStart) withFlag:YES];
    }
    
}

-(void)selectIndex:(int)index withFlag:(BOOL)flag
{
    for (UIButton *button in _buttonArray)
    {
        if (button.tag ==index + kButtonTagStart) {
            [button setTitleColor:PDFColorGreen forState:UIControlStateNormal];
        }
        else{
            [button setTitleColor:PDFColorTextDetailDefault forState:UIControlStateNormal];
        }
    }
    if (_selectedIndex != index)
    {
        
        _selectedIndex =  index;
        CGRect lineRC  = [self viewWithTag:_selectedIndex+kButtonTagStart].frame;
        [UIView animateWithDuration:0.2
                         animations:^{
                             lineView.frame = CGRectMake(lineRC.origin.x, self.frame.size.height - 2, lineRC.size.width, 2);
                         }];
    
        
        if ( _topViewDelegate!= nil && [_topViewDelegate respondsToSelector:@selector(barSelectedIndexChanged:)])
        {
            if (flag) {
                [_topViewDelegate barSelectedIndexChanged:_selectedIndex];
            }
            
        }
        
        if (lineRC.origin.x - self.contentOffset.x > SCREEN_WIDTH  * 2  / 3)
        {
            //int index = _selectedIndex;
            if (_selectedIndex + 2 <= _buttonArray.count)
            {
                index = _selectedIndex + 2;
            }
            else if (_selectedIndex + 1 < _buttonArray.count)
            {
                index = _selectedIndex + 1;
            }
            CGRect rc = [self viewWithTag:index +kButtonTagStart].frame;
            rc.origin.x += kWidthForRight;
            [self scrollRectToVisible:rc animated:YES];
        }
        else if ( lineRC.origin.x - self.contentOffset.x < SCREEN_WIDTH / 3)
        {
            //int index = _selectedIndex;
            if (_selectedIndex - 2 >= 0)
            {
                index = _selectedIndex - 2;
            }
            else if (_selectedIndex - 1 >= 0)
            {
                index = _selectedIndex - 1;
            }
            CGRect rc = [self viewWithTag:index +kButtonTagStart].frame;
            rc.origin.x -= kWidthForRight;
            [self scrollRectToVisible:rc animated:YES];
        }
    }
    
}

-(CGFloat)width:(NSString *)contentString heightOfFatherView:(CGFloat)height textFont:(UIFont *)font{
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    CGSize size = [contentString sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)];
    return size.width ;
#else
    NSDictionary *attributesDic = @{NSFontAttributeName:font};
    CGSize size = [contentString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil].size;
    return size.width;
#endif
}


@end
