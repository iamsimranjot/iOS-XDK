//
//  LYRUIMessageViewedAnalyticsEvent+Private.h
//  Layer-XDK-UI-iOS
//
//  Created by Klemen Verdnik on 13/8/2018.
//  Copyright (c) 2018 Layer. All rights reserved.
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

#import <LayerKit/LayerKit.h>
#import "LYRUIMessageViewedAnalyticsEvent.h"

NS_ASSUME_NONNULL_BEGIN     // {

@interface LYRUIMessageViewedAnalyticsEvent (Private)

+ (instancetype)messageViewedAnalyticsEventWithMessage:(LYRMessage *)message;

@end

NS_ASSUME_NONNULL_END       // }
