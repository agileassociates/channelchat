//
//  Constants.swift
//  ChannelChat
//
//  Created by Johny Babylon on 2/23/19.
//  Copyright © 2019 Agile Associates. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

let BASE_URL = "https://channelchatapi.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"


// Segues

let TO_LOGIN = "LoginSegue"
let TO_CREATE = "CreateAccountSegue"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]


// Notifications

let NOTIFY_USER_DATA_DID_CHANGE = Notification.Name("notifyUserDataChanged")
let NOTIFY_CHANNELS_LOADED = Notification.Name("notifyChannelsLoaded")
let NOTIFY_CHANNEL_SELECTED = Notification.Name("notifyChannelSelected")
