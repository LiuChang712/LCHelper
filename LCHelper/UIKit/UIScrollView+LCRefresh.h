//
//  UIScrollView+LCRefresh.h
//  LCHelperDemo
//
//  Created by 刘畅 on 2019/4/16.
//  Copyright © 2019 LiuChang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LCSrartRefreshingBlock)(void);

typedef enum : NSUInteger {
    LCRefreshStylePulling,       // 松开后才会刷新，默认
    LCRefreshStyleDidChange,     // 只要超出范围就会刷新
} LCRefreshStyle;


@interface UIScrollView (LCRefresh)

/**
 *  刷新类型
 */
@property(nonatomic, assign) LCRefreshStyle lc_refreshStyle;


/**
 *  刷新控件类型 default is UIActivityIndicatorViewStyleWhite
 */
@property(nonatomic, assign) UIActivityIndicatorViewStyle lc_refreshActivityIndicatorStyle;

/**
 *  是否需要头部刷新
 */
@property(nonatomic, assign) BOOL lc_headerRefreshHidden;

/**
 *  是否需要底部刷新
 */
@property(nonatomic, assign) BOOL lc_footerRefreshHidden;

/**
 *  是否正在刷新
 */
@property(nonatomic, readonly) BOOL lc_refreshing;

/**
 *  开始头部刷新
 */
-(void)lc_startHeaderRefreshing;

/**
 *  开始底部刷新
 */
-(void)lc_startFooterRefreshing;

/**
 *  取消所有刷新
 */
-(void)lc_endRefreshing;

/**
 *  添加头部刷新
 *  completionHander: 完成回调
 */
-(void)lc_addHeaderRefreshing:(LCSrartRefreshingBlock)completionHander;

/**
 *  添加底部刷新
 *  completionHander: 完成回调
 */
-(void)lc_addFooterRefreshing:(LCSrartRefreshingBlock)completionHander;

@end


