//
//  DYPlayerScrollView.h
//  DYVideoListPlay
//
//  Created by huyangyang on 2017/9/23.
//  Copyright © 2017年 huyangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KSYMediaPlayer/KSYMediaPlayer.h>

@protocol DYPlayerScrollViewDelegate;

@interface DYPlayerScrollView : UIScrollView

@property (nonatomic, weak) id<DYPlayerScrollViewDelegate> playerDelegate;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) KSYMoviePlayerController *upPerPlayer, *middlePlayer, *downPlayer;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)updateForLives:(NSMutableArray *)livesArray withCurrentIndex:(NSInteger) index;

@end


@protocol DYPlayerScrollViewDelegate <NSObject>

- (void)playerScrollView:(DYPlayerScrollView *)playerScrollView currentPlayerIndex:(NSInteger)index;

@end
