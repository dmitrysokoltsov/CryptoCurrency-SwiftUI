import Foundation

    //MARK: Formater extation for coin currency

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    //MARK: Formater extation for coin price Change Percentage
    
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
