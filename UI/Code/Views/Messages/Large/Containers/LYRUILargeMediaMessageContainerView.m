//
//  LYRUILargeMediaMessageContainerView.m
//  Layer-XDK-UI-iOS
//
//  Created by Klemen Verdnik on 7/3/18.
//  Copyright (c) 2017 Layer. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "LYRUILargeMediaMessageContainerView.h"

@implementation LYRUILargeMediaMessageContainerView

- (instancetype)initWithConfiguration:(LYRUIConfiguration *)configuration {
    self = [super initWithConfiguration:configuration];
    if (self) {
        _playbackControlView = [[LYRUIPlaybackControlView alloc] initWithConfiguration:configuration];
        [self lyr_largeMediaMessageCommonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _playbackControlView = [[LYRUIPlaybackControlView alloc] initWithCoder:aDecoder];
        [self lyr_largeMediaMessageCommonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _playbackControlView = [[LYRUIPlaybackControlView alloc] initWithFrame:frame];
        [self lyr_largeMediaMessageCommonInit];
    }
    return self;
}

- (void)lyr_largeMediaMessageCommonInit {
    [self addSubview:_playbackControlView];
}

- (void)setLayerConfiguration:(LYRUIConfiguration *)layerConfiguration {
    [super setLayerConfiguration:layerConfiguration];
    self.playbackControlView.layerConfiguration = layerConfiguration;
}

@end
