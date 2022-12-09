import SwiftUI

@main
struct ExpenseTrackerApp: App {
		@StateObject var transactionListVM = TransactionListViewModel()
		var body: some Scene {
				WindowGroup {
						ContentView()
								.environmentObject(transactionListVM)
				}
		}
}
