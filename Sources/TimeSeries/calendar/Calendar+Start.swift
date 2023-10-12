import Foundation

extension Calendar {
    func startOfYear(for date: Date) -> Date {
        let components = dateComponents([.year], from: date)
        return self.date(from: components)!
    }
}

extension Calendar {
    func startOfMonth(for date: Date) -> Date {
        let components = dateComponents([.year, .month], from: date)
        return self.date(from: components)!
    }
}

extension Calendar {
    func startOfHour(for date: Date) -> Date {
        let components = dateComponents([.year, .month, .day, .hour], from: date)
        return self.date(from: components)!
    }
}

extension Calendar {
    func startOfMinute(for date: Date) -> Date {
        let components = dateComponents([.year, .month, .day, .hour, .minute], from: date)
        return self.date(from: components)!
    }
}

extension Calendar {
    func startOfSecond(for date: Date) -> Date {
        let components = dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        return self.date(from: components)!
    }
}
