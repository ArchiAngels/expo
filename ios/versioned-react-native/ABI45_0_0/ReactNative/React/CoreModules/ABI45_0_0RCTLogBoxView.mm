/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ABI45_0_0RCTLogBoxView.h"

#import <ABI45_0_0React/ABI45_0_0RCTLog.h>
#import <ABI45_0_0React/ABI45_0_0RCTSurface.h>

@implementation ABI45_0_0RCTLogBoxView {
  ABI45_0_0RCTSurface *_surface;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame:frame])) {
    self.windowLevel = UIWindowLevelStatusBar - 1;
    self.backgroundColor = [UIColor clearColor];
  }
  return self;
}

- (void)createRootViewController:(UIView *)view
{
  UIViewController *_rootViewController = [UIViewController new];
  _rootViewController.view = view;
  _rootViewController.view.backgroundColor = [UIColor clearColor];
  _rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
  self.rootViewController = _rootViewController;
}

- (instancetype)initWithFrame:(CGRect)frame bridge:(ABI45_0_0RCTBridge *)bridge
{
  if ((self = [super initWithFrame:frame])) {
    self.windowLevel = UIWindowLevelStatusBar - 1;
    self.backgroundColor = [UIColor clearColor];

    _surface = [[ABI45_0_0RCTSurface alloc] initWithBridge:bridge moduleName:@"LogBox" initialProperties:@{}];

    [_surface start];
    [_surface setSize:frame.size];

    if (![_surface synchronouslyWaitForStage:ABI45_0_0RCTSurfaceStageSurfaceDidInitialMounting timeout:1]) {
      ABI45_0_0RCTLogInfo(@"Failed to mount LogBox within 1s");
    }

    [self createRootViewController:(UIView *)_surface.view];
  }
  return self;
}

- (void)dealloc
{
  [ABI45_0_0RCTSharedApplication().delegate.window makeKeyWindow];
}

- (void)show
{
  [self becomeFirstResponder];
  [self makeKeyAndVisible];
}

@end
