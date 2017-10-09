//
//  ViewController.m
//  DYVideoListPlay
//
//  Created by huyangyang on 2017/9/23.
//  Copyright © 2017年 huyangyang. All rights reserved.
//

#import "MainViewController.h"
#import "DYPlayerScrollView.h"
#import <KSYMediaPlayer/KSYMediaPlayer.h>
#import "VideoDataModel.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<DYPlayerScrollViewDelegate>

@property (nonatomic , strong) KSYMoviePlayerController* player;
@property (nonatomic , strong) DYPlayerScrollView* playerScrollView;

@end

@implementation MainViewController

- (DYPlayerScrollView *)playerScrollView
{
  if (!_playerScrollView) {
    _playerScrollView = [[DYPlayerScrollView alloc] initWithFrame:self.view.frame];
    _playerScrollView.playerDelegate = self;
    _playerScrollView.index = self.index;
  }
  return _playerScrollView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor greenColor];
  [self initUI];
  [self initPlayer];
  
  
  NSMutableArray* tempAry = [NSMutableArray array];
  NSMutableArray* mutableAry = [NSMutableArray array];
  

  [VideoDataModel getHomePageVideoDataWithBlock:^(NSArray *dateAry, NSError *error) {
    [tempAry addObjectsFromArray:dateAry];
    
    for (VideoDataModel* model in tempAry) {
      VideoInfoModel * item = [[VideoInfoModel alloc] init];
      //    item = live;
      item.VideoAddress = model.video_url;
      item.coverImageAddress = model.cover_url;
      [mutableAry addObject:item];
    }
    [self.dataList addObjectsFromArray:mutableAry];
    
    [self.playerScrollView updateForLives:self.dataList withCurrentIndex:self.index];
    
  }];
}

-(void) initUI
{
  [self.playerScrollView updateForLives:self.dataList withCurrentIndex:self.index];
  self.playerScrollView.playerDelegate = self;
  [self.view addSubview:self.playerScrollView];
}

-(void) initPlayer
{
  [[NSNotificationCenter defaultCenter]addObserver:self
                                          selector:@selector(handlePlayerNotify:)
                                              name:(MPMoviePlayerFirstVideoFrameRenderedNotification)
                                            object:nil];
  [[NSNotificationCenter defaultCenter]addObserver:self
                                          selector:@selector(handlePlayerPreparedToPlayNotify:)
                                              name:(MPMediaPlaybackIsPreparedToPlayDidChangeNotification)
                                            object:nil];
  
  
  
//  MPMoviePlayerFirstVideoFrameRenderedNotification
}
-(void)handlePlayerPreparedToPlayNotify:(NSNotification*)notify{
  
  KSYMoviePlayerController* cor = notify.object;
  NSLog(@"handlePlayerPreparedToPlayNotify %ld  and y==%lf ",(long)cor.view.tag ,cor.view.frame.origin.y  );
  
  switch (cor.view.tag) {
    case 10001:
     {
       if (self.playerScrollView.upPerPlayer.view.frame.origin.y == SCREEN_HEIGHT) {
         [self.playerScrollView.upPerPlayer play];
         
       }
     }
      break;
    case 10002:
      {
        if (self.playerScrollView.middlePlayer.view.frame.origin.y == SCREEN_HEIGHT) {
          [self.playerScrollView.middlePlayer play];
        }
      }
      break;
    case 10003:
      {
        {
          if (self.playerScrollView.downPlayer.view.frame.origin.y == SCREEN_HEIGHT) {
            [self.playerScrollView.downPlayer play];
          }
        }
      }
      break;
      
    default:
      break;
  }
  
}

-(void)handlePlayerNotify:(NSNotification*)notify{
  
  KSYMoviePlayerController* cor = notify.object;
  NSLog(@"handlePlayerNotify  and y==%lf ",cor.view.frame.origin.y );
  switch (cor.view.tag) {
    case 10001:
    {
      if (self.playerScrollView.upPerPlayer.view.frame.origin.y == SCREEN_HEIGHT) {
        [self.playerScrollView.upPerPlayer.view setHidden:false];
      }
    }
      break;
    case 10002:
    {
      if (self.playerScrollView.middlePlayer.view.frame.origin.y == SCREEN_HEIGHT) {
        [self.playerScrollView.middlePlayer.view setHidden:false];
      }
    }
      break;
    case 10003:
    {
      {
        if (self.playerScrollView.downPlayer.view.frame.origin.y == SCREEN_HEIGHT) {
          [self.playerScrollView.downPlayer.view setHidden:false];
        }
      }
    }
      break;
      
    default:
      break;
  }
}

 - (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear: animated];
  [self.playerScrollView.middlePlayer play];
}


- (void)reloadPlayerWithLive:(VideoInfoModel *)live
{
  

//  [self.player reset:false];
//  [self.player.view setHidden:true];
//  [self.player setUrl:[NSURL URLWithString:live.VideoAddress]];
//  [self.player setShouldAutoplay:YES];
//  [self.player setBufferSizeMax:1];
//  [self.player setShouldLoop:YES];
//  self.player.view.backgroundColor = [UIColor clearColor];
//  [self.player prepareToPlay];

}


#pragma mark DYPlayerScrollViewDelegate

- (void)playerScrollView:(DYPlayerScrollView *)playerScrollView currentPlayerIndex:(NSInteger)index
{
  NSLog(@"current index from delegate:%ld  %s",(long)index,__FUNCTION__);
  if (self.index == index) {
    return;
  } else {
    [self reloadPlayerWithLive:self.dataList[index]];
    
    if (playerScrollView.upPerPlayer.view.frame.origin.y == SCREEN_HEIGHT) {
//      [playerScrollView.upPerPlayer prepareToPlay];
      
      [playerScrollView.upPerPlayer.view setHidden:true];
      if ([playerScrollView.upPerPlayer isPreparedToPlay]) {
        if (playerScrollView.upPerPlayer.currentPlaybackTime >  0.1) {
          [playerScrollView.upPerPlayer.view setHidden:false];
        }
        [playerScrollView.upPerPlayer play];
      }
      
      [playerScrollView.middlePlayer pause];
      [playerScrollView.downPlayer pause];
      [playerScrollView.downPlayer.view setHidden:true];
      [playerScrollView.middlePlayer.view setHidden:true];
    }
    
    if (playerScrollView.middlePlayer.view.frame.origin.y == SCREEN_HEIGHT) {
      [playerScrollView.middlePlayer.view setHidden:true];
      if ([playerScrollView.middlePlayer isPreparedToPlay]) {
        if (playerScrollView.middlePlayer.currentPlaybackTime >  0.1) {
          [playerScrollView.middlePlayer.view setHidden:false];
        }
        [playerScrollView.middlePlayer play];
      }
      [playerScrollView.upPerPlayer pause];
      [playerScrollView.downPlayer pause];
      [playerScrollView.downPlayer.view setHidden:true];
      [playerScrollView.upPerPlayer.view setHidden:true];
    }
    
    if (playerScrollView.downPlayer.view.frame.origin.y == SCREEN_HEIGHT) {
      [playerScrollView.downPlayer.view setHidden:true];
      if ([playerScrollView.downPlayer isPreparedToPlay]) {
        if (playerScrollView.downPlayer.currentPlaybackTime >  0.1) {
          [playerScrollView.downPlayer.view setHidden:false];
        }
        [playerScrollView.downPlayer play];
      }
      [playerScrollView.upPerPlayer pause];
      [playerScrollView.middlePlayer pause];
      
      [playerScrollView.upPerPlayer.view setHidden:true];
      [playerScrollView.middlePlayer.view setHidden:true];
    }
    
    self.index = index;
  }
  
}



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
