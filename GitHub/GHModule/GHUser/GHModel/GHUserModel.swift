//
//  GHUserModel.swift
//  GitHub
//
//  Created by nachuan on 2016/10/25.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit
import ObjectMapper

class GHUserModel: Mappable {
    var siteAdmin: Bool!
    var rank: Int!
    var userID: Int!
    var publicRepos: Int!
    var followers: Int!
    var following: Int!
    var myID: Double!
    var categoryLocation: String?
    var categoryLanguage: String?
    var login: String?
    var avatarURL: String?
    var gravatarID: String?
    var URL: String?
    var htmlURL: String?
    var followersURL: String?
    var followingURL: String?
    var gistsURL: String?
    var starredURL: String?
    var subscriptionsURL: String?
    var orginizationsURL: String?
    var reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: String?
    var score: String?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var createdAt: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        siteAdmin <- map["site_admin"]
        login <- map["login"]
        avatarURL <- map["avatar_url"]
        gravatarID <- map["gravatar_id"]
        URL <- map["url"]
        htmlURL <- map["html_url"]
        followersURL <- map["followers_url"]
        followingURL <- map["following_url"]
        gistsURL <- map["gists_url"]
        starredURL <- map["starred_url"]
        subscriptionsURL <- map["subscriptions_url"]
        orginizationsURL <- map["originizations_url"]
        reposURL <- map["repos_url"]
        eventsURL <- map["events_url"]
        receivedEventsURL <- map["received_events_url"]
        type <- map["type"]
        score <- map["score"]
    }
    
   
}
