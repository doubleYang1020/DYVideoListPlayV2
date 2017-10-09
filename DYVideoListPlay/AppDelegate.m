//
//  AppDelegate.m
//  DYVideoListPlay
//
//  Created by huyangyang on 2017/9/23.
//  Copyright © 2017年 huyangyang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "VideoInfoModel.h"
#import "VideoDataModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  
  self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
  
  self.window.backgroundColor = [UIColor clearColor];
  
  [self.window makeKeyAndVisible];
  
  MainViewController *mainCor = [[MainViewController alloc]init];
  
  NSMutableArray* mutableAry = [NSMutableArray array];
  NSArray* videoAry = [NSArray arrayWithObjects:
                       @"http://ksy.fffffive.com/mda-hinp1ik37b0rt1mj/mda-hinp1ik37b0rt1mj.mp4",
                       @"http://ksy.fffffive.com/mda-himtqzs2un1u8x2v/mda-himtqzs2un1u8x2v.mp4",
                       @"http://ksy.fffffive.com/mda-hiw5zixc1ghpgrhn/mda-hiw5zixc1ghpgrhn.mp4",
                       @"http://ksy.fffffive.com/mda-hiw61ic7i4qkcvmx/mda-hiw61ic7i4qkcvmx.mp4",
                       @"http://ksy.fffffive.com/mda-hihvysind8etz7ga/mda-hihvysind8etz7ga.mp4",
                       @"http://ksy.fffffive.com/mda-hiw60i3kczgum0av/mda-hiw60i3kczgum0av.mp4",
                       @"http://ksy.fffffive.com/mda-hidnzn5r61qwhxp4/mda-hidnzn5r61qwhxp4.mp4",
                       @"http://ksy.fffffive.com/mda-he1zy3rky0rwrf60/mda-he1zy3rky0rwrf60.mp4",
                       @"http://ksy.fffffive.com/mda-hh6cxd0dqjqcszcj/mda-hh6cxd0dqjqcszcj.mp4",
                       @"http://ksy.fffffive.com/mda-hifsrhtqjn8jxeha/mda-hifsrhtqjn8jxeha.mp4",
                       @"http://ksy.fffffive.com/mda-hics799vjrg0w5az/mda-hics799vjrg0w5az.mp4",
                       @"http://ksy.fffffive.com/mda-hfshah045smezhtf/mda-hfshah045smezhtf.mp4",
                       @"http://ksy.fffffive.com/mda-hh4mbturm902j7wi/mda-hh4mbturm902j7wi.mp4",
                       @"http://ksy.fffffive.com/mda-hiwxzficjivwmsch/mda-hiwxzficjivwmsch.mp4",
                       @"http://ksy.fffffive.com/mda-hhug2p7hfbhnv40r/mda-hhug2p7hfbhnv40r.mp4",
                       @"http://ksy.fffffive.com/mda-hieuuaei6cufye2c/mda-hieuuaei6cufye2c.mp4",
                       @"http://ksy.fffffive.com/mda-hibhufepe5m1tfw1/mda-hibhufepe5m1tfw1.mp4",
                       @"http://ksy.fffffive.com/mda-hhzeh4c05ivmtiv7/mda-hhzeh4c05ivmtiv7.mp4",
                       @"http://ksy.fffffive.com/mda-hfrigfn2y9jvzm72/mda-hfrigfn2y9jvzm72.mp4",
                       @"http://ksy.fffffive.com/mda-himek207gvvqg3wq/mda-himek207gvvqg3wq.mp4",
                       nil];

  
  NSArray* imageAry = [NSArray arrayWithObjects:
                       @"http://ksy.fffffive.com/mda-hinp1ik37b0rt1mj/mda-hinp1ik37b0rt1mj.jpg",
                       @"http://ksy.fffffive.com/mda-himtqzs2un1u8x2v/mda-himtqzs2un1u8x2v.jpg",
                       @"http://ksy.fffffive.com/mda-hiw5zixc1ghpgrhn/mda-hiw5zixc1ghpgrhn.jpg",
                       @"http://ksy.fffffive.com/mda-hiw61ic7i4qkcvmx/mda-hiw61ic7i4qkcvmx.jpg",
                       @"http://ksy.fffffive.com/mda-hihvysind8etz7ga/mda-hihvysind8etz7ga.jpg",
                       @"http://ksy.fffffive.com/mda-hiw60i3kczgum0av/mda-hiw60i3kczgum0av.jpg",
                       @"http://ksy.fffffive.com/mda-hidnzn5r61qwhxp4/mda-hidnzn5r61qwhxp4.jpg",
                       @"http://ksy.fffffive.com/mda-he1zy3rky0rwrf60/mda-he1zy3rky0rwrf60.jpg",
                       @"http://ksy.fffffive.com/mda-hh6cxd0dqjqcszcj/mda-hh6cxd0dqjqcszcj.jpg",
                       @"http://ksy.fffffive.com/mda-hifsrhtqjn8jxeha/mda-hifsrhtqjn8jxeha.jpg",
                       @"http://ksy.fffffive.com/mda-hics799vjrg0w5az/mda-hics799vjrg0w5az.jpg",
                       @"http://ksy.fffffive.com/mda-hfshah045smezhtf/mda-hfshah045smezhtf.jpg",
                       @"http://ksy.fffffive.com/mda-hh4mbturm902j7wi/mda-hh4mbturm902j7wi.jpg",
                       @"http://ksy.fffffive.com/mda-hiwxzficjivwmsch/mda-hiwxzficjivwmsch.jpg",
                       @"http://ksy.fffffive.com/mda-hhug2p7hfbhnv40r/mda-hhug2p7hfbhnv40r.jpg",
                       @"http://ksy.fffffive.com/mda-hieuuaei6cufye2c/mda-hieuuaei6cufye2c.jpg",
                       @"http://ksy.fffffive.com/mda-hibhufepe5m1tfw1/mda-hibhufepe5m1tfw1.jpg",
                       @"http://ksy.fffffive.com/mda-hhzeh4c05ivmtiv7/mda-hhzeh4c05ivmtiv7.jpg",
                       @"http://ksy.fffffive.com/mda-hfrigfn2y9jvzm72/mda-hfrigfn2y9jvzm72.jpg",
                       @"http://ksy.fffffive.com/mda-himek207gvvqg3wq/mda-himek207gvvqg3wq.jpg",
                       nil];
  
//  NSArray* videoAry = [NSArray arrayWithObjects:
//                       @"http://v6-dy.ixigua.com/video/m/2208ba139633c7144839488478d01c2a86e11514e1a0000847103cab212/?Expires=1506161669&AWSAccessKeyId=qh0h9TdcEMoS2oPj7aKX&Signature=2yKxpdrNTBBSAx1%2B8XE0Sy%2BrprM%3D",
//                       @"http://v6-dy.ixigua.com/video/m/22004bf7d68b9f74af1accbb6c7afb1d34d114ac9b00004261f3f0bfeb/?Expires=1506162148&AWSAccessKeyId=qh0h9TdcEMoS2oPj7aKX&Signature=ltAKTIF%2FT9Os69Gapdtg0mUrT8o%3D",
//                       @"http://v3-tt.ixigua.com/92ed2887743bc6bcd545daf02c345284/59c62809/video/m/2200c3319536b5e404e943443085c42b563115118fc00000f2ccfbe0749/#mp4",
//                       @"http://v3-tt.ixigua.com/f6dc20875a700432c309e0bebbda1c31/59c6283b/video/m/220d3d7095e29ad4bcba0e1cef7e9d93724114c47f00007a749902a394/#mp4",
//                       @"http://v1-dy.ixigua.com/43ac280ba9cfce06f7a2ee4480f72fcb/59c62860/video/m/220ba90da381b704f0083263247b0dc436711516214000006c5c57cf6ce/#mp4",
//                       @"http://v3-tt.ixigua.com/d4155f34f904a0a56fc153a09920ad7f/59c628cb/video/m/22034c33cfacc6c420dbe1abdb92289be3d11511a0e0000bb80ac12be94/#mp4",
//                       @"http://v6-dy.ixigua.com/video/m/2209ac598e326f24f9e83ebbf43e3481f261149fa60000434136098e33/?Expires=1506162432&AWSAccessKeyId=qh0h9TdcEMoS2oPj7aKX&Signature=80RPrzl1Lk5QnisMZZ5M6pBD%2Bhg%3D",
//                       @"http://v1-dy.ixigua.com/4c60408ce67362106dd408b7d75db2fc/59c62916/video/m/220a10ea8a3832b44fc90aedd21980da531115156240000941e88aac5ae/#mp4",
//                       @"http://v9-dy.ixigua.com/e5e78dad462e705ef8ca4f832f82e0fa/59c62933/video/m/2203fcb0e43497046e6b891e7370147c0001149fe10000075243e8ebd2/#mp4",
//                       @"http://v3-tt.ixigua.com/e664afd245ca6bb557f50a32d2fa5c70/59c62954/video/m/2207b32ddf995374cf0931e54bc46b5604b11499f7000059de57ab9a97/#mp4",
//                       nil];
//
//  NSArray* imageAry = [NSArray arrayWithObjects:
//                       @"https://p3.pstatp.com/large/3aeb00041a4106da3e7f.jpg",
//                       @"https://p3.pstatp.com/large/2cfd0015063b0fa65dd1.jpg",
//                       @"https://p9.pstatp.com/large/38a9000012e004635def.jpg",
//                       @"https://p3.pstatp.com/large/30d4000e6ca16a84cb64.jpg",
//                       @"https://p1.pstatp.com/large/3b850000b69799104585.jpg",
//                       @"https://p3.pstatp.com/large/38aa000b12ada33d9ef0.jpg",
//                       @"https://p1.pstatp.com/large/2bb4000fed99d1e87987.jpg",
//                       @"https://p1.pstatp.com/large/3aed000216a7d792d88f.jpg",
//                       @"https://p3.pstatp.com/large/2ba0000f29969e199723.jpg",
//                       @"https://p3.pstatp.com/large/2d4f000fca37d3cba51e.jpg",
//                       nil];
  for (int i = 0; i < 20 ; i ++) {
    VideoInfoModel * item = [[VideoInfoModel alloc] init];
    //    item = live;
    item.VideoAddress = videoAry[i];
    item.coverImageAddress = imageAry[i];
    [mutableAry addObject:item];

  }
  

  
  mainCor.dataList = mutableAry;
  mainCor.live = mutableAry[0];
  mainCor.index = 0;
  self.window.rootViewController = mainCor;
  
  return YES;

}


- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
