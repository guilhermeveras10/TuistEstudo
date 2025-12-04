import SwiftUI

public class AnimeViewStateFactory {
    public init() {}

    public func create(
        animes: [Anime]
    ) -> InvoicesV2ViewState {
        var grouped = groupedByYear(invoices)

        if typeElement == .future {
            for (year, invoiceList) in grouped {
                grouped[year] = invoiceList.reversed()
            }
        }

        let years = sortedYears(from: grouped, typeElement: typeElement)

        return .init(
            invoices: invoices,
            sortedYears: years,
            years: grouped,
            shouldShowFooter: invoices.count > Constants
                .minItensToScroll ? true : false
        )
    }
}
