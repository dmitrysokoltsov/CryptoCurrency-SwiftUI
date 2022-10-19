import Foundation

extension Double {
    
    ///Converts a Double into a Cuurrency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234,56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    ///```

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    ///Formater extation for coin price Change Percentage
    ///```
    ///Convert 1.23456 to 12.34%
    ///```
    
    private var percentageFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func formattedCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func forrmattedPercentage() -> String {
        return (percentageFormatter.string(for: self) ?? "0") + "%"
    }
}
