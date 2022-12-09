import SwiftUI

struct ContentView: View {
		var body: some View {
				NavigationView {
						ScrollView {
								VStack(alignment: .leading, spacing: 24) {
										// MARK: title
										Text("Overview")
												.font(.title2)
												.bold()
										
										// MARK: Chart
										ChartView()
										
										// MARK: Recent transaction list
										RecentTransactionList()
								} .padding()
										.frame(maxWidth: .infinity)
						}
						.background(Color.background)
						.navigationBarTitleDisplayMode(.inline)
						.toolbar {
								// MARK: Notification Icon
								ToolbarItem {
										Image(systemName: "bell.badge")
												.symbolRenderingMode(.palette)
												.foregroundStyle(Color.icon, .primary)
								}
						}
				}
				.navigationViewStyle(.stack)
				.accentColor(.primary)
		}
}

struct ContentView_Previews: PreviewProvider {
		static let transactionListVM: TransactionListViewModel = {
				let transactionListVM = TransactionListViewModel()
				transactionListVM.transactions = [transactionPreviewData]
				return transactionListVM
		}()

		static var previews: some View {
				Group {
						ContentView()
						ContentView()
								.preferredColorScheme(.dark)
				}
						.environmentObject(transactionListVM)
		}
}
