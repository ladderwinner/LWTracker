import Foundation

struct Session: Codable {
    /// The number of sessions of the current user.
    /// api-key: _idvc
    let sessionsCount: Int
    
    /// The timestamp of the previous visit.
    /// Discussion: Should this be now for the first request?
    /// api-key: _viewts
    let lastVisit: Date
    
    /// The timestamp of the fist visit.
    /// Discussion: Should this be now for the first request?
    /// api-key: _idts
    let firstVisit: Date
}

extension Session {
    static func current(in lwUserDefaults: LWUserDefaults) -> Session {
        let firstVisit: Date
        var lwUserDefaults = lwUserDefaults
        if let existingFirstVisit = lwUserDefaults.firstVisit {
            firstVisit = existingFirstVisit
        } else {
            firstVisit = Date()
            lwUserDefaults.firstVisit = firstVisit
        }
        let sessionCount = lwUserDefaults.totalNumberOfVisits
        let lastVisit = lwUserDefaults.previousVisit ?? Date()
        return Session(sessionsCount: sessionCount, lastVisit: lastVisit, firstVisit: firstVisit)
    }
}
