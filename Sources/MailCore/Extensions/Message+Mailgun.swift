//
//  Message+Mailgun.swift
//  MailCore
//
//  Created by Ondrej Rafaj on 19/03/2018.
//

import Foundation
import Vapor
import Mailgun


extension Mailer.Message {
    
    /// Message as a Mailgun content
    func asMailgunContent() -> Mailgun.Message {
        let fromString: String
        
        if let name = from.name {
            fromString = "\(name) <\(from.email)>"
        } else {
            fromString = from.email
        }
        
        return Mailgun.Message(
            from: fromString,
            to: to,
            cc: cc?.joined(separator: ","),
            bcc: bcc?.joined(separator: ","),
            subject: subject,
            text: text,
            html: html
        )
    }
    
}
