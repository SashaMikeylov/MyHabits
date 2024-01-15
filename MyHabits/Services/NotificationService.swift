//
//  NotificationService.swift
//  MyHabits
//
//  Created by Денис Кузьминов on 13.01.2024.
//

import Foundation
import UserNotifications

final class NotificationService {
    
    static let shared = NotificationService()
    private init() {}
    private let notificationService = UNUserNotificationCenter.current()
    
    //MARK: - Request
    
    func request() {
        notificationService.requestAuthorization(options: [.alert, .sound, ]) { isSucces, error in
            guard isSucces else {return }
            self.notificationService.getNotificationSettings { settings in
                guard settings.authorizationStatus == .authorized else {return}
            }
        }
    }
    
    //MARK: - Notify
    
    func notify(date: Date, nameOfHabbit: String, id: Int)
    {
        let content = UNMutableNotificationContent()
        content.title = "Проверьте вашу привычку"
        content.body = nameOfHabbit
        content.sound = UNNotificationSound.default
        
        // Получаю часы и минуты из Date
        
        var dateComponent = DateComponents()
        let calendar = Calendar.current
        print(calendar)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        print(hour, minute)
        dateComponent.hour = hour
        dateComponent.minute = minute
       
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let notificationId = "\(id)"
        let request = UNNotificationRequest(identifier: notificationId, content: content, trigger: trigger)
        
        notificationService.add(request) {error in
            print(error?.localizedDescription ?? "")
        }
    }
    
    //MARK: - Remove all notifications
    
    func removeAllNotifications() {
        notificationService.removeAllPendingNotificationRequests()
    }
    
    //MARK: - Remove notification with indetifier
    
    func removeNotification(indetifier: Int) {
        let notificationId = "\(indetifier)"
        notificationService.removePendingNotificationRequests(withIdentifiers: [notificationId])
    }
}
