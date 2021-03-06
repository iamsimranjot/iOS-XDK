//
//  LYRUIIdentityItemIBSetup.m
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 28.07.2017.
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

#import "LYRUIIdentityItemIBSetup.h"
#import "LYRUIIdentityItemView.h"
#import "LYRUIAvatarView.h"
#import <LayerKit/LayerKit.h>

@implementation LYRUIIdentityItemIBSetup

+ (void)prepareIdentityItemForInterfaceBuilder:(LYRUIIdentityItemView *)identityItem {
    identityItem.titleLabel.text = @"Full name";
    identityItem.detailLabel.text = @"23 mins ago";
    identityItem.subtitleLabel.text = @"<metadata>";
    
    LYRUIAvatarView *avatarView = [[LYRUIAvatarView alloc] init];
    avatarView.translatesAutoresizingMaskIntoConstraints = NO;
    avatarView.identities = @[[[LYRIdentity alloc] init]];
    avatarView.backgroundColor = [UIColor whiteColor];
    identityItem.accessoryView = avatarView;
    
    [identityItem setNeedsUpdateConstraints];
}

@end
