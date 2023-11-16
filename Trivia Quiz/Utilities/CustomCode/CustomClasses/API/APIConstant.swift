//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//


import Foundation

/// This is the Structure for API
internal struct API {
    
    // MARK: - API URL
    
    /// Structure for URL. This will have the API end point for the server.
    struct URL {
        
        /// Live Server Base URL
        ///
        ///     API.URL.live
        ///
        public static let live                                  = "https://opentdb.com/api.php?"
        
        /// Development Server Base URL - Bhikhu
        ///
        ///      API.URL.staging
        ///
        public static let staging                               = "https://opentdb.com/api.php?"
        
        /// development Server Base URL
        ///
        ///      API.URL.development
        ///
        public static let development                            = "https://opentdb.com/api.php?"
        
        
        /// development Dynamic Url Fallback  URL
        ///
        ///      API.URL.liveimageUrl
        ///
        public static let liveimageUrl                           = "https://opentdb.com/api.php?"
        
        public static let developmentimageUrl                     = "https://opentdb.com/api.php?"
        
        
        
        
        
        
#if DEBUG
        // Development version
        static let BASE_URL                                      = API.URL.live
        static let BASE_IMG_URL                                      = API.URL.liveimageUrl
        
#elseif STAGING
        // Staging version
        static let BASE_URL                                      = API.URL.live
        static let BASE_IMG_URL                                      = API.URL.liveimageUrl
        
#elseif RELEASE
        // APPSTORE version
        static let BASE_URL                                      = API.URL.live
        static let BASE_IMG_URL                                      = API.URL.liveimageUrl
        
#else
        // APPSTORE version
        static let BASE_URL                                      = API.URL.live
        static let BASE_IMG_URL                                      = API.URL.liveimageUrl
#endif
        
    }
    
    // MARK: - Basic Response keys
    
    /// Structure for API Response Keys. This will use to get the data or anything based on the key from the repsonse. Do not directly use the key rather define here and use it.
    struct Response {
        
        
        static let data                                     = "data"
        
        static let error                                    = "error"
        
        static let message                                  = "message"
        
        static let status                                  = "status"
        
        static let meta                                     = "meta"
        
        static let extraMeta                                = "extra_meta"
        
        static let errors                                = "errors"
        
    }
    
    struct Key {
        static let amount                                     = "amount"
        static let category                                     = "category"
        static let difficulty                                     = "difficulty"
        static let type                                     = "type"
    }
    
}
