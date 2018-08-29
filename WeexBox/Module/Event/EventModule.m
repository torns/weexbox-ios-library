//
//  EventModule.m
//  WeexBox
//
//  Created by Mario on 2018/8/18.
//  Copyright © 2018年 Ayg. All rights reserved.
//

#import "EventModule.h"

@implementation EventModule

WX_EXPORT_METHOD(@selector(register:callback:))
WX_EXPORT_METHOD(@selector(emit:))
WX_EXPORT_METHOD(@selector(unregister:))
WX_EXPORT_METHOD(@selector(unregisterAll:))

@end
