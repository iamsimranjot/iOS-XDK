//
//  LYRUIMessageListTypingIndicatorsControlling.h
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 01.02.2018.
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

#import <Foundation/Foundation.h>
@class LYRUIMessageListView;
@class LYRConversation;
@class LYRUITypingIndicator;

@protocol LYRUIMessageListTypingIndicatorsControlling <NSObject>

@property (nonatomic, weak) LYRUIMessageListView *messageListView;

@property (nonatomic, readonly) BOOL typingIndicatorPresented;

@property (nonatomic, strong, readonly) LYRUITypingIndicator *typingIndicator;

- (void)registerForNotificationsInConversation:(LYRConversation *)conversation;

- (void)removeNotificationsObserver;

@end
