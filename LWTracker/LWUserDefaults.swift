import Foundation

/// LWUserDefaults is a wrapper for the UserDefaults with properties
/// mapping onto values stored in the UserDefaults.
/// All getter and setter are sideeffect free and automatically syncronize
/// after writing.
internal struct LWUserDefaults {
    let userDefaults: UserDefaults

    init(suiteName: String?) {
        userDefaults = UserDefaults(suiteName: suiteName)!
    }
    
    var totalNumberOfVisits: Int {
        get {
            return userDefaults.integer(forKey: LWUserDefaults.Key.totalNumberOfVisits)
        }
        set {
            userDefaults.set(newValue, forKey: LWUserDefaults.Key.totalNumberOfVisits)
            userDefaults.synchronize()
        }
    }
    
    var firstVisit: Date? {
        get {
            return userDefaults.object(forKey: LWUserDefaults.Key.firstVistsTimestamp) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: LWUserDefaults.Key.firstVistsTimestamp)
            userDefaults.synchronize()
        }
    }
    
    var previousVisit: Date? {
        get {
            return userDefaults.object(forKey: LWUserDefaults.Key.previousVistsTimestamp) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: LWUserDefaults.Key.previousVistsTimestamp)
            userDefaults.synchronize()
        }
    }
    
    var currentVisit: Date? {
        get {
            return userDefaults.object(forKey: LWUserDefaults.Key.currentVisitTimestamp) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: LWUserDefaults.Key.currentVisitTimestamp)
            userDefaults.synchronize()
        }
    }
    
    var optOut: Bool {
        get {
            return userDefaults.bool(forKey: LWUserDefaults.Key.optOut)
        }
        set {
            userDefaults.set(newValue, forKey: LWUserDefaults.Key.optOut)
            userDefaults.synchronize()
        }
    }
    
    var clientId: String? {
        get {
            return userDefaults.string(forKey: LWUserDefaults.Key.clientID)
        }
        set {
            userDefaults.setValue(newValue, forKey: LWUserDefaults.Key.clientID)
            userDefaults.synchronize()
        }
    }
    
    var forcedVisitorId: String? {
        get {
            return userDefaults.string(forKey: LWUserDefaults.Key.forcedVisitorID)
        }
        set {
            userDefaults.setValue(newValue, forKey: LWUserDefaults.Key.forcedVisitorID)
            userDefaults.synchronize()
        }
    }
    
    var visitorUserId: String? {
        get {
            return userDefaults.string(forKey: LWUserDefaults.Key.visitorUserID);
        }
        set {
            userDefaults.setValue(newValue, forKey: LWUserDefaults.Key.visitorUserID);
            userDefaults.synchronize()
        }
    }
    
    var lastOrder: Date? {
        get {
            return userDefaults.object(forKey: LWUserDefaults.Key.lastOrder) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: LWUserDefaults.Key.lastOrder)
        }
    }
}

extension LWUserDefaults {
    public mutating func copy(from userDefaults: UserDefaults) {
        totalNumberOfVisits = UserDefaults.standard.integer(forKey: LWUserDefaults.Key.totalNumberOfVisits)
        firstVisit = UserDefaults.standard.object(forKey: LWUserDefaults.Key.firstVistsTimestamp) as? Date
        previousVisit = UserDefaults.standard.object(forKey: LWUserDefaults.Key.previousVistsTimestamp) as? Date
        currentVisit = UserDefaults.standard.object(forKey: LWUserDefaults.Key.currentVisitTimestamp) as? Date
        optOut = UserDefaults.standard.bool(forKey: LWUserDefaults.Key.optOut)
        clientId = UserDefaults.standard.string(forKey: LWUserDefaults.Key.clientID)
        forcedVisitorId = UserDefaults.standard.string(forKey: LWUserDefaults.Key.forcedVisitorID)
        visitorUserId = UserDefaults.standard.string(forKey: LWUserDefaults.Key.visitorUserID)
        lastOrder = UserDefaults.standard.object(forKey: LWUserDefaults.Key.lastOrder) as? Date
    }
}

extension LWUserDefaults {
    internal struct Key {
        static let totalNumberOfVisits = "LWTotalNumberOfVistsKey"
        static let currentVisitTimestamp = "LWCurrentVisitTimestampKey"
        static let previousVistsTimestamp = "LWPreviousVistsTimestampKey"
        static let firstVistsTimestamp = "LWFirstVistsTimestampKey"
        
        // Note:    To be compatible with previous versions, the clientID key retains its old value,
        //          even though it is now a misnomer since adding visitorUserID makes it a bit confusing.
        static let clientID = "LWVisitorIDKey"
        static let forcedVisitorID = "LWForcedVisitorIDKey"
        static let visitorUserID = "LWVisitorUserIDKey"
        static let optOut = "LWOptOutKey"
        static let lastOrder = "LWLastOrderDateKey"
    }
}
